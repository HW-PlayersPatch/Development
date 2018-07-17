Note: All proposed changes are suggestions/ideas, until deemed final.


# Build 8 Change List
Note: This list is mostly from about June 1st and needs lots of updates.


## Investigate
- Did these changes actually happen?
- Mission 02: Turanic Missile Corvettes now capturable


## Gameplay and UI Options
- No changes


## HWR Bugs Fixes and Improvements
- Added an Observer mode to spectate multiplayer matches.
- Added an AI Attack Damage adjuster to multiplayer and player vs cpu. This can be used to increase the AI's attack damage for a more challenging game.
- Addressed HWR's major Cross Race Docking Bug. Fighters and corvettes will now only dock with ships from their own race. Previously, regenerated Hiigaran/Vaygr ships would be unable to launch from Kushan/Taiidan Repair Corvettes, Support Frigates, and Resource Controllers leading to really bad lag and multiple glitches.
- Kushan Ion Cannon Frigates are now pronounced correctly as 'Cannon', previously they were being pronounced as 'Cannit'.
- Fixed a gun alignment bug on the Taiidan Assault Frigates, which caused 2 of their 4 guns to always miss small targets.



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
- Tweaked corvette penetration vs fighters, as Light Corvettes were over-performing.

### Hiigaran and Vaygr
- Hiigaran/Vaygr Scout sensors range down 18% (scouting is too easy in hwr)
- Hiigaran/Vaygr Minelayer cost 800->400 (buff, hw1 are 275)
- Hiigaran/Vaygr Resource Collector upgraded health down 20% (5000->4000 to match hw2c)
### Hiigaran
- 

### Vaygr
- Vaygr resource collectors ru capacity 208->200 (to balance harvesting with Hiigaran. Vaygr still starts with one extra collector to make up for their Flagship's poor harvesting.)
- Vaygr Hyperspace Platform build time 45->30sec (buff)

### Kushan and Taiidan
- Kushan/Taiidan Resource Collector build time 50->45sec, speed up 87% (speed is now relatively closer to hw1c. Harvesting has been adjusted for the speed change. Harvesting for all four races is within 1% of each other after 20minutes of harvesting. Harvesting is also now better balanced on maps with different RU layouts.)
- Kushan/Taiidan Resource Collector health down 17% (6000->5000, Hiigaran/Vaygr went from 5000->4000)
- Kushan/Taiidan Resource Controller speed 100->165 (relatively closer to hw1c)
- Kushan/Taiidan Scout sensors range down 27%, speed burst ability duration reduced from 50secs to 30secs, and top speed reduced 4%. (was too hard to deny hw1 scouting)
- Kushan Cloaked Fighter ability duration increased from 60 to 240sec, recharge 20 to 60sec (closer to hw1c).
- Taiidan Defense Fighters attack style is now closer to hw1c. Their laser weapon has been adjusted to be more consistent, and it now prioritizes mines over missiles.
- Kushan/Taiidan Repair Corvette speed up 12% (relatively closer to hw1c)
- Kushan/Taiidan Light Corvette speed up 4% (relatively closer to hw1c)
- Kushan/Taiidan Heavy Corvette speed up 18% (relatively closer to hw1c)
- Kushan/Taiidan Multigun Corvette speed up 11% (relatively closer to hw1c)
- Kushan/Taiidan Assault Frigate accuracy vs corvettes up 13% (slight buff)
- Kushan Drone Frigate speed up 24% (relatively closer to hw1c)
- Kushan Drone Frigate drone deploy time reduced by 70%, and drones now remain deployed indefinitely until you recall them (like hw1c)
- Taiidan Defense Field Frigate speed up 24% (relatively closer to hw1c)
- Kushan/Taiidan Carrier build time down 21%, 210 to 165 seconds (it was a huge blow to lose a carrier, since they took so long to build).
- Kushan/Taiidan Carrier costs up 17% 3000->3500ru (to balance the build time buff, with a frigate module Hiigaran is 3800 and Vaygr is 3100).
- Kushan/Taiidan Missile Destroyers now count againt the destroyer unit cap. Normal unit caps allow for six destroyers, two of which can be missile destroyers. (like hw1c)
- Kushan/Taiidan Cloak Generator armour/effective health up 20%, speed up 24% (relatively closer to hw1c).
- Kushan/Taiidan Cloak Generator ability duration increased from 100 to 120sec (to match hw2 races, and be closer to hw1c).




# Finer Details
## Gameplay and UI Options
- .


## HWR Bugs Fixes and Improvements
- Expert Taiidan AI now harvests resources at the same rate as the other races. (it was 10% higher for some odd reason)
- Improved compatibility for mods.
⋅- Created a playerspatch_util.lua file, separate from scar_util.lua


## Campaign
- .


## Balance
- All Resource Collectors kamakazi damage down to prevent instantly killing other collectors (cheap hw2 collectors could even kill expensive hw1 collectors)
- Fixed a typo with the Kushan Multi-Gun Corvette build time. It was set to 25sec instead of 22sec by accident. (2.3 build 7? mistake)
- Hiigaran Gunship Corvette penetration vs hw2 fighters down 12% (re-did all anti fighter corvs to match december 2nd 2017 intended balance, which i somehow skrewed a bit maily with light corvs)
- Vaygr Missile Corvette, penetration vs hw1 fighters up 110% (gives vaygr a way to kill defense fighters)
- Kushan/Taiidan Defender penetration up 20% vs hw1 fighters, and 100% vs hw1 corvettes.
- Taiidan Defense Fighters 
⋅- Added 'set-speed vs', so ships have 2x accuracy vs them when they're idle.
⋅- Nerfed range by 40%
⋅- Nerfed fire rate by 100%
⋅- Accuracy down from 68% to 50%
⋅- Increased damage vs missiles and mines by 100%
⋅⋅- 1 hit for small missiles
⋅⋅- 2 hits for torps and HMF/DD/BC.
⋅⋅- 3 hits for mines
- Kushan/Taiidan Light Corvettes were over-performing, so corvette penetration vs fighters was lowered.
- Kushan/Taiidan Light Corvette penetration vs fighters down 17% (down 25% vs hw2 fighters)
- Kushan/Taiidan Multi-Gun Corvette penetation vs hw2 fighters down 28%
- Taiidan Multi-Gun Corvette bullet speed down 12% (to match kushan)
- Kushan/Taiidan Missile Destroyer damage vs hw2 corvettes down 20% (now performs similar vs hw1 and hw2 corvettes).
