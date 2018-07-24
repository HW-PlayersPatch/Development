Note: All proposed changes are suggestions/ideas, until deemed final.


# Build 8 Change List




## ToDo
- After reviewing weapons, add missile/weapon changes to this list
- Review old props, and pull in any useful explanations/info.




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

#### Motherships
- Rotation speed +100% (to aid in positioning motherships around asteriod patches)




### Hiigaran and Vaygr
- Balanced dock repair times for fighters and corvettes (addressed a bug that caused squadrons to dock extremely fast. hw2 ships now repair closer to their hw2c rate.)

#### Resource Collectors
- Upgraded Health 5000->4000 -20% (to match hw2c)
- Kamakazi damage 100%->60% -40% (to prevent instantly killing other collectors)
  - Minor: (cheap hw2 collectors could even kill expensive hw1 collectors)

#### Scouts
- Sensors range -19% (scouting was too hard to deny)

#### Minelayer Corvettes
- Cost 800->400 -50% (buff, hw1 are 275)

#### Destroyers
- Maybe b9: Health 85k->90k +6% (+13% over v2.1, closer to hw2c when upgraded, by popular demand)

#### Sensor Distortion Probes
- Health 400->800 +100%




### Hiigaran 
#### Gunship Corvettes
- b9?: Minor: Damage vs hw2 fighters -12% (slightly over-performing)

#### Defense Field Frigates
- Health 20k->25k +25% (since this ship can't be upgraded, Taiidan Field Frigate is 26k)
- Rotation speed +59% (to match flak frigates, and be able to better micro them)




### Vaygr
#### Hyperspace Platforms
- Build Time 45->20sec (these took too long to setup)
- Speed 650->600 -8% (to match hw2c as they should not be faster than a probe)

#### Missile Corvettes
- Maybe Skip: Damage vs hw1 fighters +110% (gives vaygr a way to kill defense fighters)

#### Command Corvettes
- Build time 30->45sec +50% (slows down the replenishment of these powerful units)
- Attack/accuracy bonus range -51% (forces these ships to be on the front line so they can be countered)

#### Resource Collectors
- Resource capacity 208->200 -4% (Now matches Hiigaran to better balance harvesting. Vaygr still start with one extra collector to make up for their Flagship's long collector drop off route. Vaygr harvesting is up ~5% from hw2c, and down ~2% from v2.1. Harvesting for all four races is within 1% of each other.)




### Kushan and Taiidan
- Overhauled Kushan and Taiidan. These races were rushed into HWR at release, repeatedly band-aided, and were never implimented well. All costs, build times, speeds, health, abilities, etc are now consistently translated into the HWR engine. Kushan and Taiidan now feel much more like hw1 classic, while still being balanced against Hiigaran and Vaygr.
	- Minor: Note, most hw1 changes are to be closer to hw1c, while balancing vs hw2 races.
- Note: No changes to research have been made, however plans are in the works for the next update.
- Removed hidden armour modifiers from all ships other than frigates. Relic only applied these to frigates, however Gearbox used them sporadically.
- Balanced dock repair times for corvettes (now repair 4.5 times faster to balance vs hw2)
- Accuracy reduction abilities are now painted orange in the tactical overlay

#### Resource Collectors
- Harvesting for all four races is now within 1% of each other. Harvesting is also now better balanced on maps with different RU layouts.
- Cost 600->500 -17%
- Build Time 50->40sec -20%
- Health 6000->5000 -17% (to balance vs hw2, Hiigaran/Vaygr went from 5000->4000)
- Speed 110->206 +87%
- Resource capacity 500->250 -50%
- Kamakazi damage 80%->60% -25% (to prevent instantly killing other collectors)

#### Resource Controller
- Health 25k->30k +20%, Armour -11% (Effective Health 27500->30000 +9%)
- Speed 100->190 +90%
- Rotation Speed +100%

#### Scouts
- Build Time 10->8sec -20%
- Sensors range -27% (scouting was too hard to deny)
- Speed burst ability duration 50->30secs -40%
- Speed burst top speed -4%

#### Interceptors
- Build Time 7->9sec +29% (closer to hw1c, was funny to have interceptors build faster than scouts)

#### Bombers
- Cost 120->130 +8%

#### Defenders
- Health 360->400 +11%, Armour -11% (effective health unchanged)
- Build Time 9->7sec -22%

#### Repair Corvettes
- Build Time 20->16sec -20%
- Speed 255->320 +25% (to be able to heal the fastest corvette)
- Rotation Speed +31%
- Armour -25% (Effective Health 1440->1200 -17%)

#### Light Corvettes
- Speed 285->305 +7%

#### Multi-Gun Corvettes
- Speed 275->320 +16%
- Rotation Speed +76%

#### Heavy Corvettes
- Speed 245->290 +18%

#### Multi-Gun Corvettes
- Health 1100->1400 +27%

#### Minelayer Corvettes
- Build Time: 25->35sec +40% (closer to hw1c, and to balance vs hw2 races at 45sec)
- Speed: 246->255 +4%
- Health: 900->1800 +100%, Armour -25% (Effective Health 1080->1800 +67%)

#### Support Frigates
- Cost 800->600 -25%
- Build Time 85->65sec -24%
- Health 26000->21000 -19%

#### Assault Frigates
- Cost 800->700 -13%
- Build Time 68->60sec -12%
- Rotation Speed +33%
- Now prioritize attacking corvettes over frigates.

#### Ion Frigates
- Cost 900->800 -11%
- Build Time 73->60sec -18%

#### Destroyers
- Cost 2500->2250 -10%
- Build Time 145->125 -14%

#### Missile Destroyers
- Cost 2000->2500 +25%
- Build Time 160->145sec -9%
- Health 65k->101k +55%
- Now count againt the destroyer unit cap like hw1c. Normal unit caps allow for six destroyers, two of which can be missile destroyers.

#### Carriers
- Cost 3000->3500 +17% (with a frigate module Hiigaran is 3800 and Vaygr is 3100)
- Build time 210->165sec -21% (it was a huge blow to lose a carrier, since they took so long to build)
- Health 105k->120k +14%

#### Motherships
- Multiplayer: Health 280k->420k +50%, Armour -18% (Effective Health 322k->420k +30%, to match an upgraded Hiigaran Mothership)
- Campaign: Health 210k->250k +19%, Armour -18% (effective health 247k->250k +1%)

#### Research Ships
- Build Time 50->45sec -10% (the first hub now builds as fast as the rest)
- Speed 155->175 +13%

#### Proximity Sensors
- Speed 350->450 +29%

#### Sensors Array
- Speed 155->175 +13%
- Sensors range +8%

#### Gravity Wells
- Cost 800->1000 +25%
- Health 18k->11k -39%, Armour +17% (Effective Health 14400->11000 -24%)
- Minor: Accuracy debuff range -20% (to match GW ability range, missed change in 2.205)

#### Cloak Generators
- Speed 165->206 +25%
- Rotation Speed +36%
- Armour +17% (Effective Health 7500->9000 +17%)
- Ability duration 100->120sec +20% (to match hw2 races, and be closer to hw1c)
- Ability range +100% (to match hw2 races)




### Kushan

#### Cloaked Fighters
- Cloak ability now lasts indefinitely (same as hw1c)

#### Multi-Gun Corvettes
- Minor: Build Time restored to 22sec (was accidently set to 25sec in build 7)

#### Drone Frigate
- Build Time 77->70sec -9%
- Speed 166->206 +24%
- Health 25500->27500 +8%
- Drone ability now lasts indefinitely and drones deploy 70% faster (same as hw1c)




### Taiidan

#### Defense Fighters
- Built Time 18->15sec -17%
- Health 135->300 +122%, Armour +17% (Effective Health 108->300 +178%)
- Attack style is now closer to hw1c. Their laser weapon has been adjusted to be more consistent, and it now prioritizes mines over missiles.
- Added an accuracy reduction within the field of -1% (similar to Field Frigates)
- Minor: 
  - Added 'set-speed vs', so ships have greater accuracy vs them when they're idle.
  - Range -40%
  - Fire rate nerfed 300%
  - Damage vs missiles and mines +100%
    - 1 hit for small missiles
    - 2 hits for torps and HMF/DD/BC.
    - 3 hits for mines
	
#### Assault Frigates
- Fixed a gun alignment bug, which caused 2 of their 4 guns to always miss small targets.

#### Field Frigates
- Build Time 77->70sec -9%
- Speed 166->206 +24%
- Rotation Speed +40%
- Health 26000->30000 +15%
	- Minor: Armour -4%
- Damage/Accuracy reduction within field -5% to -7%