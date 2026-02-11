# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Mythcraft Wars is a Minecraft datapack for a team-based PvP conquest game. Two teams compete across 7 cities and 4 skill locations through quests, city conquest, and leveling. The game runs 10 timed quests (5 min each), then a 5-minute endgame where victory points from city ownership determine the winner.

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

Display text uses the "resolve into temp, call helper with macros" pattern: values are read from `mythcraft:config` into `mythcraft:temp` storage via `data modify`, then passed to helper functions via `function ... with storage mythcraft:temp` so they become `$(paramName)` macro parameters. This avoids `{nbt:...,storage:...,interpret:true}` which does not work reliably for bossbars, titles, or entity CustomName.

### In-Game Config Editor

All config fields are editable in-game via `/function mythcraft:config/open`. Uses inline SNBT dialogs (`config/` directory): `edit/*` reads current values into `mythcraft:temp`, `show/*` constructs the dialog with macros, `apply/*` writes inputs back. `refresh.mcfunction` re-applies display settings; `reset.mcfunction` restores defaults.

Cities and skill locations use the **menu → individual editor** pattern: a navigation menu (`show/cities_menu`, `show/skills_menu`) lists items, clicking one opens an individual editor (`edit/city`, `edit/skill`) with name input, Teleport Config button, and Save/Back. Teleport editing uses `mythcraft:nav` storage for back-navigation context since it can be reached from either editor type.

### Game Flow
`start.mcfunction` (on load) → `config.mcfunction` (conditional, first run only) → `startgame.mcfunction` → 10 quest cycles via `quests/startquest` → `beginendgame` → `endgame` (victory calculation)

The tick loop (`tick.mcfunction`) handles: player rekit on death, spell cooldown ticking, troop activation/deactivation by player proximity, buff reapplication, and trigger detection for the player menu and teleport systems.

### Core Subsystems

| Subsystem | Directory | Purpose |
|-----------|-----------|---------|
| **Config** | `config.mcfunction`, `config/`, `setup/` | World-level configuration, in-game dialog editor, and team/sidebar setup helpers |
| **Conquest** | `conquer.mcfunction`, `kill/city/` | City capture via troop kills; threshold = marker count |
| **Quests** | `quests/` | 10 randomized quests (conquer or kill type) with VP/buff/item rewards |
| **Leveling** | `leveling/` | 4 skill locations, 5 levels each; team-wide progression via item modifiers |
| **Spells** | `spells/` | Seeking Breath spell (area_effect_cloud projectile), unlocked by Magic skill |
| **Respawn** | `respawn/` | Troop spawning from markers; callback pattern for async marker loading |
| **Equipment** | `kill/giveequipment/`, `rekit.mcfunction`, `rekit/` | City-specific bonuses + level-scaled gear via `item_modifier/` JSONs |
| **Markers** | `markers/` | Admin tools for placing/configuring city spawn points |
| **Compass** | `compass/` | Lodestone compass that reveals nearest enemy troop; shift+right-click opens player menu |
| **Player Menu** | `menu/` | Dialog showing game state (skills, character, quests) with class selection and teleport buttons |
| **Quest History** | `quests/logresult*` | Logs each quest result to `mythcraft:questhistory` storage for display in the player menu |

### Teams and Cities

- **Teams:** Team1 (default: Druids/green/emerald trim), Team2 (default: Royals/blue/lapis trim), Unaligned (initial state)
- **7 Cities** (IDs 1-7): City1-City7 (default names: Celak, Kings-Port, Athens, Delphi, Povertane, Amnis, Fronteria)
- **4 Skill Locations** (IDs 8-11): Attack, Defense, Magic, Special (default names: Colosseum, Fort Reference, Thoth University, Athena Library)
- **City ownership:** `cityOwnership` scoreboard (0=Unaligned, 1=Team1, 2=Team2)

### Scoreboard Conventions

- Team skill levels: `levelAttack`, `levelDefense`, `levelMagic`, `levelSpecial`
- Team XP: `xpAttack`, `xpDefense`, etc. (fake player names: `Team1`, `Team2`)
- City state: `cityOwnership`, `cityConquerProgress`, `cityConquerValue`
- Quest state tracked on a `QuestTracker` entity: `questType` (1=conquer, 2=kill), `questRewardType` (1=item, 2=buff, 3=VP)
- Player menu triggers: `openMenu` (1=main, 2=class select, 3=quest history), `teleportLocation` (1-7=cities, 8-11=skill locations)
- Player death triggers rekit via `needsRekit` scoreboard checked in tick

### Key Patterns

- **Advancement-driven events:** Kill advancements (`advancement/kill/`) trigger mcfunctions, then are revoked for reuse
- **Item modifiers:** `item_modifier/*.json` files scale equipment stats by skill level using `set_components`
- **Troop slowness:** All troops spawn with Slowness IX (immobile); cleared when a team player is within 10 blocks
- **Callback respawn:** `respawn/attemptrespawn` uses scheduled callbacks with 15s delays to wait for marker entities to load
- **Lookup functions:** `lookup/` maps numeric IDs to city/location names for parameterized operations
- **Config-driven display:** City/team/skill location names resolved from `mythcraft:config` into `mythcraft:temp`, then passed as macro params to helper functions (never use `interpret:true` or nbt storage refs in display contexts)
- **Armor trims from config:** `rekit/applyarmor.mcfunction` reads trim material/pattern from storage macros
- **Sidebar coloring:** `setup/sidebar_color` chain joins display names to teams for colored sidebar entries
- **Inline SNBT dialogs:** All dialogs constructed inline via `dialog show @s {...}` in mcfunctions — dialog JSON registry files don't load from datapacks
- **`\u0024` escape trick:** In dialog `show/*.mcfunction` files, dialog template `$(key)` refs use `\u0024(key)` to survive mcfunction macro resolution
- **Player menu via compass:** `compass/use.mcfunction` checks `execute if predicate mythcraft:is_sneaking` at top — if crouching, opens menu and returns early; otherwise falls through to normal troop-tracking behavior
- **Trigger-based dialog buttons:** Player menu buttons use `/trigger` commands (not `/function`) so non-op players can use them; triggers are enabled and detected in `tick.mcfunction`
- **Quest history logging:** `quests/endquest` calls `logresult` which appends a formatted string to `mythcraft:questhistory log[]` array; displayed in the quest history dialog via index-based reads into macro params
- **Predicate files:** `predicate/is_sneaking.json` for detecting player sneaking state (NBT `Crouching` is unreliable; use `entity_properties` predicates instead)

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
