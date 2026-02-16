---
name: test-game
description: Run automated gameplay tests on the Mythcraft Wars datapack via the Minecraft server
disable-model-invocation: true
argument-hint: "[quick|full|reload-only] [verbose] [do-tp]"
---

# Mythcraft Wars Automated Game Test

Run an automated game of Mythcraft Wars via RCON, simulating combat and verifying each phase works correctly. Checks logs at every step for errors.

## Arguments: $ARGUMENTS

Parse arguments from above. Recognized tokens (case-insensitive, order-independent):

| Token | Effect |
|-------|--------|
| `quick` | Override config: 3 quests, 120s duration, 30s delays, 30s pregame/endgame, 2 VP quests |
| `full` | Override config: 10 quests, 120s duration, 30s delays, 30s pregame/endgame, 6 VP quests |
| `reload-only` | Just reload and check for errors, then stop |
| `verbose` | Read ALL log levels (info/warn/error/fatal) instead of just warn/error/fatal |
| `do-tp` | Teleport player to each location before combat via `teleportLocation` scoreboard |

If none of `quick`, `full`, or `reload-only` is specified, use existing config as-is.

## Important Behavioral Notes

### Teleport via scoreboard (no trigger needed)
To teleport, just set the scoreboard directly — do NOT call `trigger` afterward:
```
run_command("scoreboard players set <player> teleportLocation <locationId>")
```
The tick loop detects the non-zero score and handles the teleport automatically.

### No delays needed between kills
The MCP round-trip latency provides enough delay. Kill troops back-to-back without sleep commands.

### Sprint timing: always check state after sprinting
After any `tick sprint`, the game may have advanced further than expected (e.g., through the between-quest delay into the next quest, or through the endgame to game over). **Always read scoreboard state after a sprint** to determine what phase you're in, rather than assuming.

### `tellraw` is invisible to logs
Quest announcements, winner messages, and other `tellraw` output do NOT appear in server logs. Only `say`/server broadcasts are logged. Verify quest outcomes via scoreboards and `mythcraft:questhistory` storage, not by searching logs for chat messages.

### `questWinner` timing for early conquer wins
When a conquer quest is won during gameplay, `conquerquestattackreward` sets `questWinner` to the team ID (1 or 2). It stays at that value until `endquest` fires at the originally scheduled time, which resets it to -1 and returns early. So reading `questWinner` between conquest and `endquest` shows the correct winner; reading after `endquest` shows -1. This is expected.

### `endGame` state values
- `endGame = 0`: game not started or in quest phase
- `endGame = 1`: endgame countdown is running
- `endGame = 2`: game is fully over (VP calculated, winner announced)

After sprinting through endgame, check for `endGame = 2` to confirm the game concluded. Do NOT re-sprint if `endGame = 2`.

## Log Checking Convention

After every major action, check logs:
- Default: `read_log` with `sinceLastRead: true` (levels: warn, error, fatal)
- Verbose mode: `read_log` with `sinceLastRead: true, levels: ["info", "warn", "error", "fatal"]`

Any log entry referencing the `mythcraft` namespace at WARN/ERROR/FATAL level is a **test failure**. Note it and continue.

## Phase 1: Pre-Flight

1. **Check server**: Use `get_server_status`. If not running, report failure and stop.
2. **Reload datapack**: Use the `reload` MCP tool. Examine returned WARN/ERROR/FATAL entries for any `mythcraft` errors.
3. **Verify player online**: `run_command("list")`. Extract player name from output — you'll need it for damage commands. If no players, report failure and stop.
4. **Drain old log entries**: `read_log` with `sinceLastRead: true` to clear the buffer so subsequent reads only show new entries.

If mode is `reload-only`, output a report and **stop here**.

## Phase 2: Config Setup

**Skip this phase entirely if using default mode (no `quick`/`full` argument).**

For `quick` or `full` mode:

1. **Save current config** for restoration later:
   ```
   run_command("data get storage mythcraft:config game")
   ```
   Parse and remember the original values from the output.

2. **Set test timings**:
   - `quick`:
     ```
     run_command("data modify storage mythcraft:config game.questCount set value 3")
     run_command("data modify storage mythcraft:config game.questDuration set value 120")
     run_command("data modify storage mythcraft:config game.betweenQuestDelay set value 30")
     run_command("data modify storage mythcraft:config game.preGameDuration set value 30")
     run_command("data modify storage mythcraft:config game.endgameDuration set value 30")
     run_command("data modify storage mythcraft:config game.vpQuestCount set value 2")
     ```
   - `full`:
     ```
     run_command("data modify storage mythcraft:config game.questCount set value 10")
     run_command("data modify storage mythcraft:config game.questDuration set value 120")
     run_command("data modify storage mythcraft:config game.betweenQuestDelay set value 30")
     run_command("data modify storage mythcraft:config game.preGameDuration set value 30")
     run_command("data modify storage mythcraft:config game.endgameDuration set value 30")
     run_command("data modify storage mythcraft:config game.vpQuestCount set value 6")
     ```

## Phase 3: Game Start

1. **Put player on Team1**: `run_command("team join Team1 <player>")`
2. **Creative mode**: `run_command("gamemode creative <player>")`
3. **Manage debug tags**:
   - `run_command("tag <player> add debugMode")` — enables `[DEBUG] say` messages at game events (visible in server logs)
   - **Check if player has `godMode`**: `run_command("execute if entity <player>[tag=godMode] run say _godMode_was_on")`. Remember the result.
   - **Remove `godMode`** if present: `run_command("tag <player> remove godMode")` — prevents Strength/Resistance tick effects from spamming verbose logs. The test skill kills troops directly via `damage` commands so godMode is unnecessary.
4. **Start the game**: `run_command("function mythcraft:startgame")`
4. **Check logs** for errors.
5. **Verify initial state**:
   ```
   run_command("scoreboard players get QuestTracker questsRemaining")  — should match questCount
   run_command("scoreboard players get QuestTracker endGame")          — should be 0
   ```
6. **Sprint through pregame**: Read `questTimer`, convert remaining seconds to ticks (*20), then:
   ```
   run_command("tick sprint <ticks>")
   ```
   Wait 3 seconds for the server to process.
7. **Check state** — the first quest should have started (`questType` should be 1 or 2, `questWinner` should be 0).

## Phase 4: Quest Cycle

Repeat for each quest (track how many have been processed vs `questsRemaining`):

### Team Switching Strategy

Alternate which team wins throughout the test to exercise both code paths:
- **Conquer quests:** Only one team invades (kills troops). To have Team1 win, be on Team1 and kill. To have Team2 win, switch to Team2 and kill. For unaligned cities, whoever gets the last kill conquers. Alternate which team conquers across quests.
- **Kill quests:** Both teams accumulate kills. Switch teams mid-quest to create a competitive split (e.g., get 3 kills as Team1, then switch to Team2 and get 4 kills → Team2 should win). This tests both teams' kill counting and winner determination.

### 4a. Read Quest State

```
run_command("scoreboard players get QuestTracker questType")        — 1=conquer, 2=kill
run_command("scoreboard players get QuestTracker questLocation")    — 3-7=cities, 8-11=skills
run_command("scoreboard players get QuestTracker questRewardType")  — 1=item, 2=buff, 3=VP
run_command("scoreboard players get QuestTracker questWinner")      — should be 0 (active)
```

Record these values for verification later.

### 4b. Simulate Combat

**For Conquer quests (questType=1, questLocation 3-7):**

The quest targets a city. Location 3 = City3, 4 = City4, ..., 7 = City7.

1. Check current ownership: `run_command("scoreboard players get CityN cityOwnership")` (0=unaligned, 1=Team1, 2=Team2)
2. Check conquer threshold: `run_command("scoreboard players get CityN cityConquerValue")`
3. **Decide which team wins this quest** (alternate per strategy). Join that team.
   - If the city is owned by your team, you can't conquer it — switch to the other team instead.
   - If unowned, either team can conquer.
4. If `do-tp`: teleport to the city location:
   ```
   run_command("scoreboard players set <player> teleportLocation <questLocation>")
   ```
5. **Kill troops** one at a time until conquest threshold is met. No delays needed between kills. Use your current team to determine the selector:
   - As Team1: `run_command("damage @e[tag=cityTroop,tag=CityN,team=!Team1,limit=1,sort=nearest] 1000 minecraft:player_attack by <player>")`
   - As Team2: `run_command("damage @e[tag=cityTroop,tag=CityN,team=!Team2,limit=1,sort=nearest] 1000 minecraft:player_attack by <player>")`
6. After each kill, check progress: `run_command("scoreboard players get CityN cityConquerProgress")`
7. Once progress >= conquerValue, conquest triggers automatically, ending the conquer quest early.
8. **Verify**: `run_command("scoreboard players get QuestTracker questWinner")` — should be the conquering team's ID (1 or 2). Note: may show -1 if `endquest` already fired (see behavioral notes).
9. If troops run out before threshold is met (damage command returns "No entity was found"), note this as a potential issue — troops may not have spawned.

**For Kill quests (questType=2, questLocation 8-11):**

The quest targets a skill location. Location 8=Attack, 9=Defense, 10=Magic, 11=Special. Map to tags: `Attack`, `Defense`, `Magic`, `Special`.

1. If `do-tp`: teleport to the skill location:
   ```
   run_command("scoreboard players set <player> teleportLocation <questLocation>")
   ```
2. **Create a competitive scenario** by switching teams mid-quest:
   - Start as Team1, kill 3 troops → Team1 gets 3 kills
   - Switch to Team2: `run_command("team join Team2 <player>")`
   - Kill 4 troops → Team2 gets 4 kills
   - Expected winner: Team2 (more kills when timer expires)
   Alternate which team gets more kills across kill quests.
   ```
   run_command("damage @e[tag=cityTroop,tag=<LocationTag>,limit=1,sort=nearest] 1000 minecraft:player_attack by <player>")
   ```
3. Verify kills registered: `run_command("scoreboard players get Team1 questKills")` and `run_command("scoreboard players get Team2 questKills")`
4. Kill quests are won by whichever team has more kills when the timer expires — need to sprint to quest end.

### 4c. Sprint to Quest End

After combat is done:

1. Read remaining time: `run_command("scoreboard players get QuestTracker questTimer")`
2. If timer > 0, convert to ticks and sprint: `run_command("tick sprint <seconds * 20>")`
3. Wait 3 seconds for the server to process.

**For conquer quests that ended early** (questWinner already set), the quest has already ended and the between-quest timer is running. Sprint just the between-quest delay amount (e.g., 200 ticks for 10s delay) rather than the full remaining questTimer.

### 4d. Post-Sprint State Check

**After every sprint, determine what phase you're in before proceeding.** The sprint may have advanced past the between-quest delay into the next quest, or even past the endgame.

1. **Check logs** for errors.
2. **Check endGame**: If `endGame >= 1`, skip to Phase 5 (endgame has started or finished).
3. **Check questsRemaining** and **questWinner**:
   - `questWinner = 0` + active `questType` (1 or 2) → next quest has already started, go to 4a
   - `questWinner = -1` → between-quest gap, sprint a bit more to reach the next quest
4. **Verify quest history**: `run_command("data get storage mythcraft:questhistory log")` — should have entries matching completed quests.
5. **If reward was VP (type 3)**: Check `victoryPoints` for both teams.

Repeat from 4a for the next quest.

## Phase 5: Endgame

After all quests complete, the between-quest delay leads to `beginendgame`:

1. **Check endGame state:**
   - If `endGame = 0`: still in between-quest delay. Sprint remaining timer ticks, wait 3 seconds, re-check.
   - If `endGame = 1`: endgame countdown is running. Read `questTimer`, sprint through it.
   - If `endGame = 2`: game is already over. Skip to VP verification.
2. Wait 3 seconds after sprint.
3. **Verify game over**: `run_command("scoreboard players get QuestTracker endGame")` — must be `2`.
   - If still `1`, the sprint wasn't long enough. Read `questTimer` and sprint again.
   - **Do NOT sprint if endGame = 2** — the game is already over.
4. **Check logs** for errors.
5. **Verify VP calculation**:
   ```
   run_command("scoreboard players get Team1 victoryPoints")
   run_command("scoreboard players get Team2 victoryPoints")
   ```
   Cross-reference with city ownership. VP values per city: City1=2, City2=2, City3-7=1 each. Tiebreak city is City3 (+1 VP to its owner if scores are tied before city VP is added).
6. **Verify `questTimer = 0`** — confirms clean game-over state.

## Phase 6: Cleanup

1. **Restore config** (only if `quick` or `full` mode was used):
   ```
   run_command("data modify storage mythcraft:config game.questCount set value <original>")
   run_command("data modify storage mythcraft:config game.questDuration set value <original>")
   run_command("data modify storage mythcraft:config game.betweenQuestDelay set value <original>")
   run_command("data modify storage mythcraft:config game.preGameDuration set value <original>")
   run_command("data modify storage mythcraft:config game.endgameDuration set value <original>")
   run_command("data modify storage mythcraft:config game.vpQuestCount set value <original>")
   ```
2. **Restore debug tags**:
   - `run_command("tag <player> remove debugMode")`
   - **If player had `godMode` before the test**, restore it: `run_command("tag <player> add godMode")`
3. **Clear strength effect** (in case godMode was active before): `run_command("effect clear <player> minecraft:strength")`
4. **Normalize tick rate**: `run_command("tick rate 20")`

## Phase 7: Test Report

Output a structured report:

```
## Mythcraft Wars Test Report — [mode] mode

### Pre-Flight
- Datapack reload: PASS/FAIL (list errors if any)
- Player online: PASS/FAIL

### Game Start
- startgame executed: PASS/FAIL
- Initial scores correct: PASS/FAIL

### Quest Cycle (N quests tested)
For each quest:
- Quest N: type=[conquer/kill], location=[CityN/Attack/etc], reward=[item/buff/VP]
  - Team used: Team1/Team2 (or split for kill quests)
  - Combat simulation: PASS/FAIL
  - Quest winner determined: PASS/FAIL (winner: TeamN / Tie)
  - Reward granted: PASS/FAIL (details from quest history)
  - No errors in logs: PASS/FAIL

### Endgame
- Endgame triggered: PASS/FAIL (endGame=1)
- Game over confirmed: PASS/FAIL (endGame=2, questTimer=0)
- VP calculation correct: PASS/FAIL (Team1=X, Team2=Y, expected=...)
- Winner: TeamN

### Error Summary
- Total warnings: N
- Total errors: N
- Critical failures: [list]

### Overall: PASS / FAIL
```

## Error Handling

- If any `run_command` returns an unexpected error, log it as a failure and continue to the next step — do not abort the entire test.
- If troops are not found for combat simulation (`No entity was found`), note it and move on. Troops may not have spawned at that location.
- After every `tick sprint`, wait at least 3 seconds before the next command for the server to settle.
- If a scoreboard read shows an unexpected value, wait 2 seconds and retry once before marking as failure.
- If the server becomes unresponsive after a sprint, try `get_server_status` and report the failure.

## Reference: Location Mappings

| questLocation | City/Skill | Tag | teleportLocation ID |
|---------------|-----------|-----|---------------------|
| 1 | City1 | City1 | 1 |
| 2 | City2 | City2 | 2 |
| 3 | City3 | City3 | 3 |
| 4 | City4 | City4 | 4 |
| 5 | City5 | City5 | 5 |
| 6 | City6 | City6 | 6 |
| 7 | City7 | City7 | 7 |
| 8 | Attack | Attack | 8 |
| 9 | Defense | Defense | 9 |
| 10 | Magic | Magic | 10 |
| 11 | Special | Special | 11 |

Note: Conquer quests only target cities 3-7 (City3-City7). Kill quests only target locations 8-11.
