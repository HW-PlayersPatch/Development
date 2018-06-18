Note: All changes are work in progress suggestions/ideas, until deemed final.

# Features and Bugfixes

## New features

### Global

#### WeaponAccuracy Modifer Colour
*Now a fancy shade of orange, instead of default aubergine.*
* **Colour change:** `{1, 0, 1, 1} => {1, 0.48, 0, 1}`

### Multiplayer

#### Observer Race (Spectator mode)
*Stealing this.*
* **Added a new playable race: Observer.**
*Observers spawn in with a single tiny corvette with map-spanning sensor range, insanely high HP and lightning fast movespeed. This allows for players to spectate without needing to jump away and scuttle.*

#### AI Attack Damage Multiplier
* **Added a dropdown in game settings menu which allows AI-controlled ships to do bonus damage:**
  * `100% (default)`
  * `200%`
  * `300%`

## Fixes

### Global

#### Broken docks causing huge lag
* **HW2 can now only dock with their own race:** 
* `.dontDockWithOtherRaceShips`: `0 => 1`

#### Pronunciation lessons for Karen
*Now says 'cannon' instead of 'cannet'.*
* **Soundclip updated for ion cannon production completion event**

#### Taiidan Expert AI harvesting
*Unknown how this could even happen.*
* **Now matches other races (10% decrease)**

### Campaign

#### Ships no longer randomly going passive
*Fixed a rules of engagement bug that caused many Turanic, Kadeshi, Junkyard, and Keeper ships to sometimes stop attacking unexpectedly and behave passively.*
* **Default tactics change:** `Offensive => Defensive` Offensive is not a valid tactic since 2.0. Defensive tactics are standard for most ships (attack if self or nearby ally is attacked)

#### Homeworld 1 campaign bugfixes
* **Captured Turanic Ion Arrays and Kadeshi Multibeams can now be retired immediately**
* **Mission 02: Turanic Missile Corvettes now capturable**

#### Homeworld 2 campaign bugfixes
* **Mission 05: lowered the Vaygr captial ship health upgrade to be closer to classic (this was unintentionally altered in the 2.0 patch)**
* **Mission 13: lowered the Vaygr corvette, frigate, and captial ship health upgrades to be closer to classic (these were unintentionally altered in the 2.0 patch)**
* **Hiigaran research costs and times closer to multiplayer values**
