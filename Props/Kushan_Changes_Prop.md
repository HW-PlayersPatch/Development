# Kushan

Kushan are sitting in the same position as [Taiidan](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#taiidan), but *even worse*. This is due to severely underperforming race-specific units: updates here to cloaked fighters and drone frigates aim to bring both these units out of the 'never used' tier.

## Buffs

### Assault Frigates
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#assault-frigates) happening to Taiidan assaults.*
*Overall, vettes are a nightmare for HW1 players to deal with; this buff is a tentative step towards fixing this issue.*
* **Max rotation speed up:** `30 => 40 (+33%)` Assaults often cannot use their plasma bombs at all as they are constantly trying to bring this weapon to bear against circling vettes
* **Rotation acceleration time down:** `0.7 => 0.5 (-28%)`
* **Rotation brake time down:** `0.4 => 0.3 => (-25%)`
* **Accuracy multiplier vs corvettes up:** 
* (*`kus_assaultgun.wepn`*):
  * vs `Corvette`: `0.8 => 0.912 (+14%)`
  * vs `Corvette_hw1`: `0.8 => 0.912 (+14%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `Corvette`: `0.55 => 0.627 (+14%)`
  * vs `Corvette_hw1`: `0.42 => 0.627 (+49%)`
* **Damage multiplier vs corvette up slightly:**
* (*`kus_assaultgun.wepn`*):
  * vs `LightArmour`: `0.5 => 0.6 (+20%)`
  * vs `LightArmour_hw1`: `0.5 => 0.6 (+20%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `LightArmour`: `1.25 => 1.3 (+4%)
  * vs `LightArmour_hw1`: `1.05 => 1.3` (+24%)
* **Accuracy multiplier vs collectors up:**
* (*`kus_assaultgun.wepn`*):
  * vs `Resource`: `0.89 => 1.0 (+6%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `Resource`: `1.0 => 3.0 (+200%)` Due to how accuracy works, 100% accuracy for a weapon does not equate to 100% of shots hit.
* **Damage multiplier vs collectors up a lot:** Assault frigates currently struggle to provide any value beyond fighting corvettes - making them decent collector killers is a natural fit for the unit, and for HW1 in general.
* (*`kus_assaultgun.wepn`*):
  * vs `ResArmour`: `0.6 => 1.5 (+150%)`
* (*`kus_assaultbomb.wepn`*):
  * vs `ResArmour`: `0.2 => 1.2 (+500%)`
* **Plasma weapon firing cone increased:** `30 => 40 (+33%)` (*`kus_assaultbomb.wepn`*)

### Heavy Corvettes
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#heavy-corvettes) happening to Taiidan heavies.*
* **Damage multiplier vs frigates up:** `1.1 => 1.99 (+81%)` (*`kus_hvcorvette1.wepn; kus_hvcorvette2.wepn`*) This causes heavies to be worth about 0.3 torpedo frigates which reflects their cost and build time. Kushan heavy vettes fire half the shots of their Taiidan counterparts, so their weapons are twice as powerful.
  
### Repair Corvettes
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#repair-corvettes) happening to Taiidan repair vettes (minus the changes to turret arc).*
* **Max speed up:** `255 => 290 (+14%)`
* **Rotation accel time down:** `0.6 => 0.3 (-50%)`
* **Rotation brake time down:** `0.3 => 0.2 (-33%)`
* **Evasive tactics no longer reduce weapon damage:** `0.9 => 1.0 (+9%)` Reducing weapon DPS means the healing weapon's output is also reduced.

### Support Frigates
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#support-frigates) happening to Taiidan support frigates.*
* **'Damage' multiplier vs frigates up:** `1.0 => 1.5 (+50%)` (*`kus_supportgunheal.wepn`*) More like anti-damage, this is a buff to the healing factor against frigates
* **Range for repair beam up:** `1000 => 1250 (+25%)`

### Multigun Corvettes
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#multigun-corvettes) happening to Taiidan multiguns.*
* **Max speed up:** `275 => 290 (+6%)`
* **Max rotation speed up a lot:** `97 => 170 (+75%)` Contrast to gunships: `163`. Multiguns need to turn to face their targets due to their attack script (stationary pivot vs circling)
* **Rotation accel time down:** `1.65 => 0.65 (-61%)` Contrast to gunships: `0.6`
* **Rotation brake time down:** `0.825 => 0.4 (-51%)`
* **Attack range up:** `1600 => 1800 (+13%)` (*`kus_multigun1.wepn; kus_multigun2.wepn`*)

### Resource Collectors
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#resource-collectors) happening to Taiidan collectors.*
* **Max HP up:** `6000 => 7000 (+17%)`

### Resource Controllers
*See the [note for the same change](https://github.com/HW-PlayersPatch/2.3/blob/master/Props/Taiidan_Changes_Prop.md#resource-controllers) happening to Taiidan resource controllers.*
* **Build time down slightly:** `60 => 55 (-8%)`
* **Max speed up:** `100 => 150 (+50%)`
* **Max rotation speed up:** `18 => 36 (+100%)`
* **Max HP up:** `25000 => 30000 (+20%)`
* **Regen time down:** `1500 => 900 (-40%)`
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`

### Bombers
*Doing fine, but doing surprisingly low damage to collectors.*
* **Damage multiplier vs collectors slightly up:** `0.23 => 0.3 (+30%)` (*`hw1_bomber.wepn`*)

### Cloak Generators 
*Moving far too slowly to perform clutch carrier cloaks or to keep pace with frigates. Similar reasoning to the buffs to the field frigates. Cloak generators are also remarkably fragile.*
* **Max speed up:** `165 => 230 (+39%)`
* **Max strafe speed up:** `165 => 230 (+39%)`
* **Max rotation speed up:"** `22 => 30 (+36%)`
* **Rotation accel time down:** `0.75 => 0.5 (-33%)`
* **Start moving sooner when turning:** `40 => 60 (+50%)` This value (`accelerationAngle`) defines a forwards facing cone which the ships target destination must lie within *before* it will begin accelerating
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`
* **Max HP up:** `9000 => 14000 (+55%)`

### Probes
*No reason not to.*
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`
* **Reduced aggressive tactic multiplier to engine acceleration:** `1.10 => 0.90 (-18%)` This and the following multipliers were swapped up for some reason.
* **Increased evasive tactic multiplier to engine acceleration:** `0.90 => 1.10 (+22%)`
* **Reduced aggressive tactic multiplier to thruster acceleration:** `1.10 => 0.90 (-18%)`
* **Increased evasive tactic multiplier to thruster acceleration:** `0.90 => 1.10 (+22%)`
* **Reduced aggressive tactic multiplier to rotation acceleration:** `1.10 => 0.90 (-18%)`
* **Increased evasive tactic multiplier to rotation acceleration:** `0.90 => 1.10 (+22%)`

### Proximity Detector
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`

### Defenders
*Defenders are currently garbage; their price tag is okay, but their survivability and killing efficienty is just awful. This unit is designed to hold key objectives against fighters, but is currently a minor annoyance at best. Throw in the unit cap to ensure they're always outnumbered, add in the difficulty docking, and you realise there is no current reason to ever make this unit. These changes aim at making this unit a reliable fighter killer:*
* **Max HP up:** `360 => 400 (+11%)`
* **Unit caps raised 1.25x:**
  * `12 => 15` in `small`
  * `20 => 25` in `normal`
  * `25 => 32` in `large`
  * `30 => 38` in `huge`
  * `60 => 75` in `vast`
* **Projectile speed up:** `1200 => 1300 (+8%)` (*`kus_defender.wepn`*) To match it's Taiidan counterpart
* **Accuracy vs fighters up:**
* (*`kus_defender.wepn`*)
  * vs `Fighter`: `0.7 => 0.95 (+26%)
  * vs `Fighter_hw1`: `0.7 => 0.95 (+26%)`

### Cloaked Fighters
*Cloaked fighters struggle to find a place in the game - their stats **would** let them be something akin to super-interceptors, however their costs and unit cap means they struggle to find a place here. These changes instead emphasise the guerilla aspects of cloaked fighters, making them a true harrassment tool to be feared.*
* **Unit caps raised by 1.5x:**
  * `12 => 18` in `small`
  * `20 => 30` in `normal`
  * `25 => 38` in `large`
  * `30 => 45` in `huge`
  * `60 => 90` in `vast`
* **Build time lowered slightly:** `15 => 13 (-13%)`
* **Weapon damage range removed:** `[10, 15] => [15, 15] (effective +25%)` (*`kus_cloakedfighter.wepn`*)
* **Damage multiplier vs collectors up slightly:** `1.1 => 1.3 (+18%)` (*`kus_cloakedfighter.wepn`*)
* **Damage multiplier vs subsystems up:** `1.25 => 3.0 (+140%)` (*`kus_cloakedfighter.wepn`*)
* **Regeneration added:** `0 => 240` The only strike with inherent regeneration. Cloaked fighters will regenerate completely in 4 minutes.
* **Max speed up slightly:** `430 => 440 (+2%)`
* **Max strafe speed up:** `430*0.77 => 440 (+33%)`

### Drone Frigates
*Drone frigates are widely regarded as the worst frigate in the game. Even way back when I played classic campaign I never made these things. QOL upgrades along with slightly reduced deployment time are first steps for this unit.*
* **Drone deployment speed decreased:** `<need cloaked>`
* **Drones never expire:** `<need cloaked>`
* **Build time decreased a lot:** `77 => 45 (-42%)` Contrast with Hiigaran flaks: `50`, Vaygr assaults: `45`, keep in mind HW1 has no imp. manufacturing upgrade.
* **Max speed up:** `166 => 230 (+39%)`

### Research Ship & all 5 Auxiliary Hubs
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`
* **Reduced aggressive tactic multiplier to engine acceleration:** `1.10 => 0.90 (-18%)` This and the following multipliers were swapped up for some reason.
* **Increased evasive tactic multiplier to engine acceleration:** `0.90 => 1.10 (+22%)`
* **Reduced aggressive tactic multiplier to thruster acceleration:** `1.10 => 0.90 (-18%)`
* **Increased evasive tactic multiplier to thruster acceleration:** `0.90 => 1.10 (+22%)`
* **Reduced aggressive tactic multiplier to rotation acceleration:** `1.10 => 0.90 (-18%)`
* **Increased evasive tactic multiplier to rotation acceleration:** `0.90 => 1.10 (+22%)`


## Nerfs

### Scouts
*Part of a larger problem in HWR, scouts are currently waypointable to provide extremely hard to kill vision for a low cost and low attention investment.*
* **Primary sensor radius down (blue sphere in manager):** `9000 => 6500 (-27%)`
* **Secondary sensor radius down (works the same, but invisible):** `11000 => 8030 (-27%)` 11000 is almost as high as a probe (`12000`) - way too high.

### Light Corvettes
*Far too versatile. Currently an outstanding anti-fight unit, light vettes also do great work against collectors and even other corvettes. This is not identical to the Kushan nerf since the Taiidan light has two guns instead of one.*
* **Damage multiplier vs fighters slightly down:**
* (*`kus_ltcorvette.wepn`*) 
  * vs `Unarmoured`: `1.2 => 0.96 (-20%)` 
  * vs `Unarmoured_hw1`: `1.2 => 0.96 (-20%)`
* **Damage multiplier vs corvettes slightly down:**
* (*`kus_ltcorvette.wepn`*)
  * vs `LightArmour`: `0.5 => 0.4 (-20%)` 
  * vs `LightArmour_hw1`: `0.5 => 0.4 (-20%)`
  
### Heavy Corvettes
*No need to overlap the anti-corvette role with functioning assault frigates. Still decent.*
* **Damage multiplier vs corvettes slightly down:** 
* (*`kus_hvcorvette1.wepn; kus_hvcorvette2.wepn`*)
  * vs `LightArmour`: `0.5 => 0.45 (-10%)`
  * vs `LightArmour_hw1`: `0.55 => 0.45 (-18%)`

### Minelayer Corvettes
*Compared to its 'never build' HW2 counterparts, the HW1 minelayer is much cheaper, faster building and more accessible. Its stats are a little worse and it can't clear mines, but ints can easily fill this role anyway.*
* **Build time slightly up:** `25 => 30 (+20%)`
* **Removed nonsensical evasive stance hit to engine acceleration:** `0.8 => 1.0 (+25%)` Still a small buff over the base game
* **Removed nonsensical evasive stance hit to thruster acceleration:** `0.8 => 1.0 (+25%)` Still a small buff over the base game
