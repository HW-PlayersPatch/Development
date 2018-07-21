Note: All proposed changes are suggestions/ideas, until deemed final.


# Build 8 Change List


## Key
- Minor: minor change
- b9: change that may need to wait for build 9
- Skip: put these on a 'maybe later' idea list.


## ToDo
- After reviewing weapons, add missile/weapon changes to this list
- Add rationale to most changes.


## Gameplay and UI Options
- No changes


## HWR Bugs Fixes and Improvements
- Added an Observer mode to spectate multiplayer matches.
- Added an AI Attack Damage adjuster to multiplayer and player vs cpu. This can be used to increase the AI's attack damage for a more challenging game.
- Addressed HWR's major Cross Race Docking Bug. Fighters and corvettes will now only dock with ships from their own race. Previously, regenerated Hiigaran/Vaygr ships would be unable to launch from Kushan/Taiidan Repair Corvettes, Support Frigates, and Resource Controllers leading to major lag and multiple glitches.
- Kushan Ion Cannon Frigates are now pronounced correctly as 'Cannon', previously they were being pronounced as 'Cannit'.
- Minor: Expert Taiidan AI now harvests resources at the same rate as the other races. (it was 10% higher for some odd reason)
- Minor: Improved compatibility for mods. (Created a playerspatch_util.lua file, separate from scar_util.lua)


## Campaign
- Fixed a rules of engagement bug that caused many Turanic, Kadeshi, Junkyard, and Keeper ships to sometimes stop attacking unexpectedly and behave passively.
- In Homeworld 1, Kushan mothership health is higher to match multiplayer. This helps when the enemy ignores your fleet and tries to focus down your mothership.
- In Homeworld 1, captured Turanic Ion Array Frigates and Kadeshi Multi-beam Frigates can now be retired immediately.
- In Homeworld 1 Mission 2, captured Turanic Heavy Corvettes can now be repaired.
- In Homeworld 2, applied some Hiigaran research cost/build time changes from the 2.0, 2.1, and 2.205 patches. These changes were made in multiplayer, but were accidently missed in the campaign. The campaign research stats now better match multiplayer.
- In Homeworld 2, the base health of Vaygr missile platforms, destroyers, cruisers, and flagships have been slightly tweaked to align with multiplayer.
- In Homeworld 2 Mission 5, lowered the Vaygr captial ship health upgrade to be closer to hw2c. (this was unintentionally altered in the 2.0 patch)
- In Homeworld 2 Mission 13, lowered the Vaygr corvette, frigate, and captial ship health upgrades to be closer to hw2c. (these were unintentionally altered in the 2.0 patch)




## Balance




### All Races
#### General
- Removed evasive stance bonuses from non-combat/utility ships (evasive stance re-routes power from weapons to engines, however this is not possible on non-combat ships and had no effect in the classic games)
- Minor: Resource collectors default stance restored to normal (like v2.1, now that evasive bonuses have been removed from utility ships)



### Hiigaran and Vaygr
- Balanced dock repair times for fighters and corvettes (addressed a bug that caused squadrons to dock extremely fast. hw2 ships now repair at their hw2c rate.)

#### Resource Collectors
- Upgraded Health 5000->4000 -20% (to match hw2c)
- Kamakazi damage 100%->60% -40% (to prevent instantly killing other collectors)
  - Minor: (cheap hw2 collectors could even kill expensive hw1 collectors)

#### Scouts
- b9: Sensors range -19% (scouting is too hard to deny in HWR)

#### Destroyers
- Regeneration rate +31% (slight buff)

#### Minelayer Corvettes
- Cost 800->400 -50% (buff, hw1 are 275)

#### Motherships
- Rotation speed +100%

#### Sensor Distortion Probes
- Health 400->800 +100%




### Hiigaran 

#### Marine Frigates
- Health 20k->25k +25% (buff, this ship can't be upgraded)

#### Defense Field Frigates
- Health 20k->25k +25% (buff, this ship can't be upgraded)
- Rotation speed +59% (buff)




### Vaygr
#### Hyperspace Platforms
- Build Time 45->20 (buff)
- Speed 650->600 -8% (should not be faster than a probe)

#### Minelayer Corvettes
- Ratation speed +23% (buff)

#### Command Corvettes
- Build time 30->45 +50% (nerf)
- Ability range -51% (nerf)

#### Resource Collectors
- Resource capacity 208->200 -4% (Now matches Hiigaran to better balance harvesting. Vaygr still start with one extra collector to make up for their Flagship's long collector drop off route.)






### Kushan and Taiidan
- Balanced dock repair times for fighters and corvettes (Fighters repair 6% slower and corvettes repair 60% faster to balance vs hw2)

#### Resource Collectors
- Build Time 50->45 -10%
- Health 6000->5000 -17% (to balance vs hw2, Hiigaran/Vaygr went from 5000->4000)
- Speed 110->206 +87% (relatively closer to hw1c)
- Resource capacity 500->300ru -40% (Harvesting has been adjusted for the speed change. Harvesting for all four races is within 1% of each other after 20minutes of harvesting. Harvesting is also now better balanced on maps with different RU layouts.)
- Kamakazi damage 80%->60% -25% (to prevent instantly killing other collectors)

#### Resource Controller
- Effective Health 27500->30000 +9% (Base Health 25k->30k +20%, ArmourDamage 0.9->1 +11%)
- Speed 100->165 +65%
- Rotation Speed +100%

#### Scouts
- b9: Sensors range -27%
- b9: Speed burst ability duration 50->30secs -40% (was too hard to deny scouting)
- b9: Speed burst top speed -4%

#### Defenders
- Build Time 9->7sec -22% (buff)
- b9: Removed the hidden armour bonus, and adjusted effective health to be the same as before.

#### Repair Corvettes
- Speed 255->290 +14%

#### Light Corvettes
- Speed 285->305 +7%

#### Multi-Gun Corvettes
- Speed 275->320 +16%
- Rotation Speed +76%

#### Heavy Corvettes
- Speed 245->290 +18%

#### Minelayer Corvettes
- Build Time: 25-30 +20% (nerf)
- Speed: 246->255 +4%
- b9: Removed the hidden armour bonus, and adjusted effective health to be the same as before.

#### Assault Frigates
- Rotation speed +33%

#### Missile Destroyers
- Now count againt the destroyer unit cap like hw1c. Normal unit caps allow for six destroyers, two of which can be missile destroyers.

#### Motherships
- Rotation speed +100%

#### Carriers
- Cost 3000->3500 +17% (to balance the build time buff, with a frigate module Hiigaran is 3800 and Vaygr is 3100)
- Build time 210->165 -21% (it was a huge blow to lose a carrier, since they took so long to build)

#### Cloak Generators
- Speed 165->206 +25% (relatively closer to hw1c)
- Rotation Speed +36%
- Effective health 7500->9000 +17% (ArmourDamage 1.2->1 -17%)
- Ability duration 100->120sec + 20% (to match hw2 races, and be closer to hw1c)
- Ability range +100% (to match hw2 races)

#### Gravity Wells
- Minor: Accuracy debuff range -20% (to match GW ability range, missed change in 2.205)


### Kushan

#### Cloaked Fighters
- b9: Build time 15->13sec -13%
- Cloak ability now lasts indefinitely like hw1c (still un-cloaks when in combat)

#### Multi-Gun Corvettes
- Minor: Build Time restored to 22 seconds (was accidently set to 25sec in build 7)

#### Drone Frigate
- Speed 166->206 +24% (relatively closer to hw1c)
- Drone ability now lasts indefinitely and drones deploy 70% faster (like hw1c)


### Taiidan

#### Defense Fighters
- Attack style is now closer to hw1c. Their laser weapon has been adjusted to be more consistent, and it now prioritizes mines over missiles.
- Minor: 
  - Added 'set-speed vs', so ships have 2x accuracy vs them when they're idle.
  - Range -40%
  - Fire rate nerfed 100%
  - Accuracy 68%->50% -26%
  - Damage vs missiles and mines +100%
    - 1 hit for small missiles
    - 2 hits for torps and HMF/DD/BC.
    - 3 hits for mines
- Added a Accuracy reduction within the field of -7%
	
#### Assault Frigates
- Fixed a gun alignment bug, which caused 2 of their 4 guns to always miss small targets.

#### Field Frigates
- Speed 166->206 +24%
- Rotation Speed +40%
- Damage/Accuracy reduction within field -5% to -15%






























### Pending Weapon Changes
- Tweaked corvette penetration vs fighters, as Light Corvettes were over-performing.

- Minor: Hiigaran Gunship Corvette penetration vs hw2 fighters down 12% (re-did all anti fighter corvs to match december 2nd 2017 intended balance, which i somehow skrewed a bit maily with light corvs)
- Vaygr Missile Corvette, penetration vs hw1 fighters up 110% (gives vaygr a way to kill defense fighters)

- Minor: Kushan/Taiidan Defender penetration up 20% vs hw1 fighters, and 100% vs hw1 corvettes.
- Minor: Kushan/Taiidan Light Corvettes were over-performing, so corvette penetration vs fighters was lowered.
- Minor: Kushan/Taiidan Light Corvette penetration vs fighters down 17% (down 25% vs hw2 fighters)
- Minor: Kushan/Taiidan Multi-Gun Corvette penetation vs hw2 fighters down 28%
- Minor: Taiidan Multi-Gun Corvette bullet speed down 12% (to match kushan)
- Kushan/Taiidan Assault Frigate accuracy vs corvettes up 13% (slight buff)
- Minor: Kushan/Taiidan Missile Destroyer damage vs hw2 corvettes down 20% (now performs similar vs hw1 and hw2 corvettes).