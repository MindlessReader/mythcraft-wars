# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Mythcraft Wars is a Minecraft datapack for a team-based PvP conquest game. Two teams compete across 7 cities and 4 skill locations through quests, city conquest, and leveling. The game runs configurable timed quests (default: 10 quests, 5 min each), then a configurable endgame where victory points from city ownership determine the winner.

- **Pack format:** 94 (Minecraft 1.21.11)
- **Namespace:** `mythcraft` (custom), `minecraft` (vanilla hooks only)
- **Linter:** SpyglassMC, configured via `.spyglassrc.json` for game version 1.21.11

## Architecture

### Configuration System

Default config values live in `config.mcfunction`. On load, `start.mcfunction` conditionally initializes: `execute unless data storage mythcraft:config cities run function mythcraft:config` — so config persists across reloads and is only set on first run.

Config fields in `mythcraft:config` storage:

- **City display names:** `cities.City1.name` through `City7.name`
- **City VP values:** `cities.CityN.vpValue`
- **Teleport coordinates:** `cities.CityN.teleport.{x,y,z,yaw,pitch}`, `skillLocations.X.teleport.{x,y,z,yaw,pitch}`
- **Skill location display names:** `skillLocations.Attack.name`, `.Defense.name`, `.Magic.name`, `.Special.name`
- **Team display names/colors:** `teams.Team1.name`, `.color`
- **Team armor trims:** `teams.TeamN.trimMaterial`, `.trimPattern`, `.trimPatternHead`
- **Tiebreak city:** `tiebreakCity`
- **Game timing:** `game.questCount`, `game.questDuration`, `game.betweenQuestDelay`, `game.preGameDuration`, `game.endgameDuration`, `game.vpQuestCount`
- **Troop config per city:** `cities.CityN.troopCap`, `.bossCap`, `.regularPool` (string list), `.bossPool` (string list)
- **Troop config per skill:** `skillLocations.X.troopCap`, `.regularPool` (string list)
- **Regen timing:** `game.regenCheckInterval` (60s), `game.regenInterval` (20s), `game.skillRegenInterval` (20s)

Display text uses the "resolve into temp, call helper with macros" pattern: values are read from `mythcraft:config` into `mythcraft:temp` storage via `data modify`, then passed to helper functions via `function ... with storage mythcraft:temp` so they become `$(paramName)` macro parameters. This avoids `{nbt:...,storage:...,interpret:true}` which does not work reliably for bossbars, titles, or entity CustomName.

### In-Game Config Editor

All config fields are editable in-game via `/function mythcraft:config/open`. Uses inline SNBT dialogs (`config/` directory): `edit/*` reads current values into `mythcraft:temp`, `show/*` constructs the dialog with macros, `apply/*` writes inputs back. `refresh.mcfunction` re-applies display settings; `reset.mcfunction` restores defaults.

Cities and skill locations use the **menu → individual editor** pattern: a navigation menu (`show/cities_menu`, `show/skills_menu`) lists items, clicking one opens an individual editor (`edit/city`, `edit/skill`) with name input, Teleport Config button, and Save/Back. Teleport editing uses `mythcraft:nav` storage for back-navigation context since it can be reached from either editor type.

### Game Flow
`start.mcfunction` (on load) → `config.mcfunction` (conditional, first run only) → `startgame.mcfunction` → N quest cycles via `quests/startquest` → `beginendgame` → `endgame` (victory calculation). All timing (quest count, duration, delays, endgame) driven by `game.*` config values.

The tick loop (`tick.mcfunction`) handles: player rekit on death, spell cooldown ticking, troop activation/deactivation by player proximity, buff reapplication, and trigger detection for the player menu and teleport systems.

### Core Subsystems

| Subsystem | Directory | Purpose |
|-----------|-----------|---------|
| **Config** | `config.mcfunction`, `config/`, `setup/` | World-level configuration, in-game dialog editor, and team/sidebar setup helpers |
| **Conquest** | `conquer.mcfunction`, `kill/city/` | City capture via troop depletion (troopCount + bossCount = 0); dual advancements per city (regular/boss) |
| **Quests** | `quests/`, `schedule/` | Configurable randomized quests (conquer or kill type) with VP/buff/item rewards; `schedule/` has macro helpers for dynamic `schedule` commands |
| **Leveling** | `leveling/` | Dual progression: team-wide skill levels (0-5) at 4 skill locations + per-player character level (1-5) from kill XP |
| **Spells** | `spells/` | Seeking Breath spell (area_effect_cloud projectile), unlocked by Magic skill |
| **Respawn** | `respawn/` | Dynamic troop spawning from configurable pools; two marker types (regular/boss); scoreboard-based population tracking with load validation; time-based regen with quiet period |
| **Equipment** | `kill/giveequipment/`, `rekit.mcfunction`, `rekit/` | City-specific bonuses + level-scaled gear via `item_modifier/` JSONs |
| **Markers** | `markers/` | Admin tools for placing spawn markers (2 types: `spawnmarker_regular`, `spawnmarker_boss`); migration function for old typed markers |
| **Compass** | `compass/` | Lodestone compass that reveals nearest enemy troop; shift+right-click opens player menu |
| **Player Menu** | `menu/` | Dialog showing game state (skills, character, quests) with class selection and teleport buttons |
| **Quest History** | `quests/logresult*` | Logs each quest result to `mythcraft:questhistory` storage for display in the player menu |
| **Totem** | `totem/` | Assassin chargeable totem: scoreboard-backed charge with durability visual, right-click activation via `using_item` advancement, death save detection in tick |
| **Parry** | `parry/` | Bastion perfect parry: timed shield block reflects damage to attacker; `using_item` detects shield raise, `entity_hurt_player` detects block; scoreboard-based window + cooldown |
| **Mortar** | `mortar/` | Bastion mortar shot: sneak-load crossbow to fire team-colored firework rockets with vanilla damage; leaves Jump Boost field at impact; dynamic arrow refund via item entity data copy; `shot_crossbow` advancement triggers tracker; ride+orphan detection for impact; cooldown-based |
| **Debug** | `debug/`, `tick.mcfunction` | Two player tags: `debugMode` enables `say`-based event logging (visible in server logs); `godMode` enables one-hit strength + troop grace period bypass (tick-driven, separate to avoid log spam) |

### Teams and Cities

- **Teams:** Team1 (default: Druids/green/emerald trim), Team2 (default: Royals/blue/lapis trim), Unaligned (initial state)
- **7 Cities** (IDs 1-7): City1-City7 (default names: Celak, Kings-Port, Athens, Delphi, Povertane, Amnis, Fronteria)
- **4 Skill Locations** (IDs 8-11): Attack, Defense, Magic, Special (default names: Colosseum, Fort Reference, Thoth University, Athena Library)
- **City ownership:** `cityOwnership` scoreboard (0=Unaligned, 1=Team1, 2=Team2)

### Scoreboard Conventions

- Team skill levels: `levelAttack`, `levelDefense`, `levelMagic`, `levelSpecial`
- Team XP: `xpAttack`, `xpDefense`, etc. (fake player names: `Team1`, `Team2`)
- City state: `cityOwnership`; troop population: `troopCount`, `bossCount`, `troopCap`, `bossCap` (per-city fake players); regen: `regenActive` (0/1), `troopCountLastChecked`, `bossCountLastChecked`
- Quest state tracked on a `QuestTracker` entity: `questType` (1=conquer, 2=kill), `questRewardType` (1=item, 2=buff, 3=VP), `endGame` (0=not started, 1=endgame running, 2=game over)
- Player menu triggers: `openMenu` (1=main, 2=class select, 3=quest history), `teleportLocation` (1-7=cities, 8-11=skill locations)
- Character level: `characterLevel` (per-player, 1-5), `characterXP`, `characterXPThresholds` (fake players `CharLvl2`-`CharLvl5`), `characterXPReward` (fake players `TroopKill`=1, `PlayerKill`=3)
- Skill XP rewards: `skillXPReward` (fake player `TroopKill`=1) for team-level skill progression
- Player death triggers rekit via `needsRekit` scoreboard checked in tick
- Assassin totem charge: `totemCharge` (per-player, persists through death; reset on class change). Temp objectives: `_totemMax`, `_totemDmg`. Stealth timer: `totemInvisTimer` (ticks remaining of armor/totem invisibility)
- Bastion parry: `parryWindow` (ticks remaining in perfect parry window), `parryCooldown` (ticks remaining on cooldown). Temp: `_shieldTick` (blocking this tick), `_wasBlocking` (was blocking last tick)
- Bastion mortar shot: `mortarCooldown` (per-player, ticks until next mortar shot available; 200 ticks = 10s), `_crossbowLoaded` (per-player, tracks whether hotbar.1 crossbow has charged_projectiles), `_mortarLoaded` (per-player, flag that mortar is loaded). Per-entity (markers): `mortarCharLevel` (character level for field scaling), `mortarFieldLife` (field lifetime countdown; starts 200)

### Key Patterns

- **Advancement-driven events:** Kill advancements (`advancement/kill/`) trigger mcfunctions, then are revoked for reuse
- **Item modifiers:** `item_modifier/*.json` files scale equipment by skill level (sharpness, protection) and character level (lunge, density, quick_charge); some use score-based scaling, others use discrete conditional breakpoints
- **Character leveling:** Per-player progression (levels 1-5) from troop/player kills. Affects armor/toughness attributes (per-class via `setattributes`), gear material tiers (iron→diamond at level 3, diamond→netherite at level 5), weapon enchantments, and assassin totem max charge. `checklevel` runs after each kill XP gain; `onlevelup` applies in-place upgrades
- **Troop slowness:** All troops spawn with Slowness IX (immobile); cleared when a team player is within 10 blocks
- **Dynamic troop spawning:** Two marker types (`spawnmarker_regular`, `spawnmarker_boss`); troop type chosen randomly from per-city configurable pools; `$function .../spawn/$(troopType)` dispatches pool string directly to function filename. Scoreboard counts (`troopCount`/`bossCount`) are "floating memory" — updated immediately on kills/regen regardless of chunk load; entity sync deferred until load validation passes (marker count == config cap). Full spawns (`spawnall`) iterate markers directly; incremental spawns (`spawn_loop`) prefer unoccupied markers (tag `_availableSpawn`, remove if troop within 2 blocks, fallback to random). Conquest triggers when both counts reach 0. Friendly fire replaces killed troop with random-from-pool (no count change). Regen: `regen_check` activates after quiet period (configurable interval); `regen_tick` increments one count per city per tick (regulars first, then bosses); kills directly deactivate regen via `decrement_count`. Skill locations use `regen_skill_tick` (no quiet period). `respawn_pass` (every 5s) syncs entities to scoreboards via `sync_city`/`sync_skill` with load validation gate
- **Lookup functions:** `lookup/` maps numeric IDs to city/location names for parameterized operations
- **Config-driven display:** City/team/skill location names resolved from `mythcraft:config` into `mythcraft:temp`, then passed as macro params to helper functions (never use `interpret:true` or nbt storage refs in display contexts)
- **Armor trims from config:** `rekit/applyarmor.mcfunction` reads trim material/pattern from storage macros
- **Sidebar coloring:** `setup/sidebar_color` chain joins display names to teams for colored sidebar entries
- **Inline SNBT dialogs:** All dialogs constructed inline via `dialog show @s {...}` in mcfunctions — dialog JSON registry files don't load from datapacks
- **`\u0024` escape trick:** In dialog `show/*.mcfunction` files, dialog template `$(key)` refs use `\u0024(key)` to survive mcfunction macro resolution
- **Player menu via compass:** `compass/use.mcfunction` checks `execute if predicate mythcraft:is_sneaking` at top — if crouching, opens menu and returns early; otherwise falls through to normal troop-tracking behavior
- **Trigger-based dialog buttons:** Player menu buttons use `/trigger` commands (not `/function`) so non-op players can use them; triggers are enabled and detected in `tick.mcfunction`
- **Quest history logging:** `quests/endquest` calls `logresult` which appends a formatted entry to `mythcraft:questhistory log[]` array; displayed via recursive loop (`menu/questhistory_loop` → `questhistory_loadentry` → `questhistory_addentry`) that builds a text component array in `mythcraft:temp historyBody`, supporting any quest count
- **Schedule macro helpers:** `schedule/` directory contains one-line macro functions (`$schedule function mythcraft:X $(duration)s`) since `schedule` requires literal time values — bridges config-driven durations to schedule commands
- **Predicate files:** `predicate/is_sneaking.json` for detecting player sneaking state (NBT `Crouching` is unreliable; use `entity_properties` predicates instead)
- **Perfect parry:** Bastion-only. Two advancement triggers: `using_item` on shield (fires every tick while held, `_shieldTick`/`_wasBlocking` tracking detects first tick of new block → sets `parryWindow=10`), and `entity_hurt_player` with `blocked:true` (checks `parryWindow` for perfect vs normal parry). Perfect parry: damage + Slowness II (3s) on nearest enemy within 5 blocks, Resistance I (1s) self. Normal parry: lesser damage only. Damage scales with character level (3-5 hearts perfect, 1.5-2.5 hearts normal). Shared 50-tick (2.5s) cooldown via `parryCooldown`. Sound cue (`experience_orb.pickup`) when cooldown expires. Class-gated in handler functions (`playerClass=3`). Targeting uses tag-based approach: `parryTarget` tag applied to enemy players (`@a`) and troops (`@e[tag=cityTroop]`) within 5 blocks matching `team=!$(myTeam)`, then nearest tagged entity is damaged via `minecraft:thorns` type. Non-`$` lines must be used for commands without `$(...)` macros in macro functions. Resets on class change and game start.
- **Chargeable totem:** Assassin-only. Scoreboard `totemCharge` is authoritative; totem `damage`/`max_damage` components are visual (durability bar). `totem/update` syncs display from scoreboard. Right-click detected via `using_item` advancement on totem with `consumable` component (same pattern as compass). `totem_charged`/`totem_uncharged` item modifiers toggle `death_protection` + glint. Death save detected via luck amplifier 99 marker effect in `death_protection.death_effects`, checked by `predicate/totem_death_save.json` in tick. Tick also validates charged totems held by wrong players (non-assassins or insufficient charge) via `totem/validate`. Activation (25% charge) grants Speed 2 (30s) to team + Invisibility (15s) + stealth visuals. Death save grants same personal effects + Resistance 2 + Absorption 2 + Regen 1. Stealth hides armor via `equippable.asset_id:"mythcraft:invisible"` and totem via `item_model:"mythcraft:invisible"` (requires resource pack). `totemInvisTimer` scoreboard drives 15s stealth duration; `end_stealth` restores visuals, `cancel_invis` handles rekit/class switch cleanup
- **Debug mode:** Two tags: `debugMode` enables `say [DEBUG] ...` messages at key game events (game start, quest start/end, conquest, endgame start, winner); `godMode` enables Strength 100 (one-hit kills) + troop Resistance clear (grace period bypass) in tick. Kept separate because `godMode` tick effects produce log spam in verbose mode. Debug `say` commands gated with `execute if entity @a[tag=debugMode]`; macro variants use `$execute if entity @a[tag=debugMode] run say ...`. Helper: `debug/quest_start.mcfunction` (macro function for quest detail logging). `say` appears in server logs unlike `tellraw` which is client-only.
- **Mortar shot:** Bastion-only. Tick detects sneak-loading: crossbow in hotbar.1 transitions unloaded → loaded while sneaking + off cooldown → `override_load`. Dynamic arrow refund: copy `charged_projectiles[0]` to storage, summon item entity with PickupDelay:0/Motion:[0,0,0]/Age:-32768, set Item data before pickup (auto-stacks). Item modifiers `mortar_load_team1`/`team2` replace arrow with team-colored firework (star count scales with characterLevel: 1/2/3). State tracking: `_crossbowLoaded` tracks hotbar.1 load state, `_mortarLoaded` flag prevents re-trigger, both reset on fire. `shot_crossbow` advancement → `on_shoot` tags nearest firework + spawns tracker marker. Tracker rides firework as passenger; tick orphan detection (tag all trackers `_orphaned`, un-orphan from fireworks' passengers, orphaned → `on_impact`). Impact spawns mortarField marker with 200-tick lifetime. Field tick: team-colored entity_effect particles + Jump Boost to team (level-scaled radius/amplifier). 200-tick (10s) cooldown via `mortarCooldown`. Resets on class change and game start.

## Conventions

### SNBT Format (1.21.11 / Format 94)
- Text components use SNBT objects, not JSON strings: `{text:"Hello",color:"red"}` not `{"text":"Hello","color":"red"}`
- No `levels:` wrapper on enchantments: `enchantments={"minecraft:sharpness":5}`
- Attribute names without `generic.` prefix: `minecraft:max_health`, `minecraft:movement_speed`
- Equipment uses `equipment:{mainhand:{...},head:{...}}` format (not `HandItems`/`ArmorItems`)
- `custom_name` instead of `item_name`; no wrapping quotes on text component values
- `tooltip_display={hidden_components:[...]}` instead of `show_in_tooltip` or `hide_additional_tooltip`
- `consumable` component for food effects (not `food.effects`)

### File Naming
- City functions use generic IDs: `city1`, `city2`, ..., `city7`
- Skill location functions use generic names: `attack`, `defense`, `magic`, `special`
- Scoreboard objectives use camelCase with generic names: `levelAttack`, `xpDefense`
- Team internal names: `Team1`, `Team2` (display names from config)
