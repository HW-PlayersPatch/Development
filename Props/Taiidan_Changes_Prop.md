# Taiidan

Taiidan (and Kushan even more so) are currently struggling to face up against the HW2 races on medium to large maps. This mostly boils down to insurmountable production differences, but also a few critical gaps in their unit coverage options. To mitigate the HW2 macro advantage, HW1 is forced to rush or play a perfect harrassment game. These changes hopefully open more options up for Taiidan (similar changes to Kushan), while retaining their identity as an agressive race.

## Buffs

### Assault Frigates
*Assault frigates are a Taiidan player's best solution to corvettes. You might be thinking that they barely handle these units, and you'd be right. Neither HW1 race has viable options for handling vette cloud spam:*
* *Heavy corvettes are widly outclassed in this role due to higher build times, costs, research times, move speed and lack of squadron replenishment mechanics*
* *Assault frigates are **laughably** innaccurate. Occasionally you will get an extremely lucky series of rolls, however assault frigates routinely fail to hit corvettes for periods lasting as long as a full minute. They pair decently with gravwell generators, which bumps up their accuracy somewhat. Despite this, assaults are lacking in this role due to higher build times, costs, research times, move speed, lack of docking (obviously), and being forced to rely on an additional supporting unit to cover a unit type they are supposed to specialise in. As if this wasn't enough, many corvette builds transition extremely well into fighters or frigates, and both HW2 races have vettes which kill frigates much more efficiently than assaults kill corvettes.*
* *Missile destroyers are without a doubt the best anti-corvette unit available for any race in a staged fight... however they have enourmous cumulative research times (and costs), as well as high build times. To top it off, they are fragile enough that they lose the matchup against pulsars if unsupported, and lasers in general. Finally, they move too slowly to keep up with any harrassment or backstabs. They pair up very well with gravwells, however this is yet another layer of cost and time required to handle a low-tech/cost unit class.*

*Overall, vettes are a nightmare for HW1 players to deal with; this buff is a tentative step towards fixing this issue.*
* **Accuracy multiplier vs corvettes up:** 
* (*`tai_assaultgun1.wepn; tai_assaultgun2.wepn`*):
  * vs `Corvette`: `0.8 => 0.912 (+14%)`
  * vs `Corvette_hw1`: `0.8 => 0.912 (+14%)`
* (*`tai_assaultbomb.wepn`*):
  * vs `Corvette`: `0.55 => 0.627 (+14%)`
  * vs `Corvette_hw1`: `0.42 => 0.627 (+49%)`
* **Accuracy multiplier vs collectors up:**
* (*`tai_assaultgun1.wepn; tai_assaultgun2.wepn`*):
  * vs `Resource`: `0.89 => 1.0 (+6%)`
* (*`tai_assaultbomb.wepn`*):
  * vs `Resource`: `1.0 => 3.0 (+200%)` Due to how accuracy works, 100% accuracy for a weapon does not equate to 100% of shots hit.
* **Damage multiplier vs collectors up a lot:** Assault frigates currently struggle to provide any value beyond fighting corvettes - making them decent collector killers is a natural fit for the unit, and for HW1 in general.
* (*`tai_assaultgun1.wepn; tai_assaultgun2.wepn`*):
  * vs `ResArmour`: `0.6 => 1.5 (+150%)`
* (*`tai_assaultbomb.wepn`*):
  * vs `ResArmour`: `0.2 => 1.2 (+500%)`

### Heavy Corvettes
*Heavy vettes are currently trapped in the 'I used this once and it really sucked' tier of units. Their infastructure stats are way out of tune for what the unit actually provides. However, this unit is receiving a (small) nerf vs its vette accuracy, in tandem with these buffs. This is to solidify its role as an anti-**frigate** unit rather than a competetor with the assault frigate for its role.*
* **Damage multiplier vs frigates up:** `0.55 => 1.0 (+81%)` (*`hvcorvette1.wepn; hvcorvette2.wepn`*) This causes heavies to be worth about 0.3 torpedo frigates which reflects their cost and build time.

### Repair Corvettes
*Not bad, however their main role (fast response repairer) is sabotaged by a lackluster speed stat. Repair vettes will often fail to move into range with a friendly vette / whatever before its already dead. In the case of vettes, they can often strafe or move away faster than the repair vette can follow.*
* **Max speed up:** `255 => 290 (+14%)`
* **Rotation accel time down:** `0.6 => 0.3 (-50%)`
* **Rotation brake time down:** `0.3 => 0.2 (-33%)`
### Multigun Corvettes
*Outclassed by light vettes on all fronts, multiguns should come into the fore with the light vette nerf (below). However, even when uncontested in fighter sniping, the speed and especially agility of multiguns leaves a lot to be desired, especially considering their target unit class.*
* **Max speed up:** `275 => 290 (+6%)`
* **Max rotation speed up a lot:** `97 => 170 (+75%)` Contrast to gunships: `163`. Multiguns need to turn to face their targets due to their attack script (stationary pivot vs circling)
* **Rotation accel time down:** `1.65 => 0.65 (-61%)` Contrast to gunships: `0.6`
* **Rotation brake time down:** `0.825 => 0.4 (-51%)`
### Resource Controllers
*Outclassed heavily by its HW2 counterpart, with just one dropoff, no hull defence, and glacial movement speed / agility, and more expensive to boot. HW1 refineries need some love.*
* **Build time down slightly:** `60 => 55 (-8%)`
* **Max speed up:** `100 => 150 (+50%)`
* **Max rotation speed up:** `18 => 36 (+100%)`
* **Max HP up:** `25000 => 30000 (+20%)`
* **Regen time down:** `1500 => 900 (-40%)`
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Neutral => Passive`
### Field Frigates
*Similar reasoning to the agility buff to [Hiigaran field frigates](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Hiigaran_Changes_Prop.md#defence-field-frigates), Taiidan field frigates are simply too slow to react accordingly to the threats they are designed to handle (light munitions).*
* **Max speed up:** `166 => 210 (+26%)`
* **Max rotation speed up:** `25 => 30 (+20%)`
* **Rotation accel time down:** `0.75 => 0.5 (-33%)`
### Bombers
*Doing fine, but doing surprisingly low damage to collectors.*
* **Damage multiplier vs collectors slightly up:** `0.2 => 0.3 (+50%)` (*`hw1_bomber.wepn`*)
### Cloak Generators 
*Moving far too slowly to perform clutch carrier cloaks or to keep pace with frigates. Similar reasoning to the buffs to the field frigates. Cloak generators are also remarkably fragile.*
* **Max speed up:** `165 => 230 (+39%)`
* **Max rotation speed up:"** `22 => 30 (+36%)`
* **Rotation accel time down:** `0.75 => 0.5 (-33%)`
* **Max HP up:** `9000 => 14000 (+55%)`
### Probes
*No reason not to.*
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Neutral => Passive`



## Nerfs

### Light Corvettes
*Far too versatile. Currently an outstanding anti-fight unit, light vettes also do great work against collectors and even other corvettes. This is not identical to the Kushan nerf since the Taiidan light has two guns instead of one.*
* **Damage multiplier vs fighters slightly down:**
* (*`tai_ltcorvette.wepn`*) 
  * vs `Unarmoured`: `1.0 => 0.8 (-20%)` 
  * vs `Unarmoured_hw1`: `1.0 => 0.8 (-20%)`
* **Damage multiplier vs corvettes slightly down:**
* (*`tai_ltcorvette.wepn`*)
  * vs `LightArmour`: `0.5 => 0.4 (-20%)` 
  * vs `LightArmour_hw1`: `0.5 => 0.4 (-20%)`
### Heavy Corvettes
*No need to overlap the anti-corvette role with functioning assault frigates. Still decent.*
* **Damage multiplier vs corvettes slightly down:** `0.275 => 0.25 (-9%)`
### Minelayer Corvettes
*Compared to its 'never build' HW2 counterparts, the HW1 minelayer is much cheaper, faster building and more accessible. Its stats are a little worse and it can't clear mines, but ints fill this role anyway.*
* **Build time slightly up:** `25 => 30`
