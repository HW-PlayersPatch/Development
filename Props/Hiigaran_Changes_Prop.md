# Hiigaran

Hiigaran are currently struggling to find diversity in their overarching playstyle.
Some of these issues stem from outclassed units, but many early rushes and game-long harrassment options have been knocked heavily in terms of viability. This is due to iterative indirect nerfs to their harrassment options.

Several buffs are included to open up these options to Hiigaran again, and also to diversify their roster.
**Nerfs to utility are affecting all races.**

## Buffs

### Minelayers
*Currently in the 'never used' tier of units, minelayers are currently held back not by their stats or DPS, but their infastructure (and their own) cost and build times. Minelayers have great potential as a backstab unit, these changes are designed to make them easier to deploy during normal build cycles.*
* **Cost down:** `800 => 600 (-25%)`
* **Build time down:** `45 => 40 (-9%)`
### Minelayer Research
* **Cost down:** `750 => 600 (-20%)`
* **Research time down:** `40 => 30 (-25%)`
### Torpedo Frigates
*Currently consigned to killing collectors only, torpedo frigates are fine by the numbers: however some minimal micro from your opponent will leave you wishing you never built a frigate facility. HW2 collectors and most vettes can **outrun** torpedo missiles.*
* **Missile speed up:** To allow missiles to catch corvettes and collectors reliably.
### Defence Field Frigates
*Already slow to build and expensive, this is one unit which should reward quick reactions. Currently defence fields struggle to keep up with the action due to low movespeeds and sloooow turning speeds. Upping these values rewards an attentive user.*
* **Max speed up:** `177 => 210 (+18%)`
* **Max rotation speed:** `22 => 30 (36%)`
* **Rotation accel time:** `0.75 => 0.5 (-33%)`
### Destroyers
*Destroyers are currently not worth the build time; even their relatively high HP value is offset by a 165 second build time: ion cannons build *more than three times faster*, from easier to build (and more plentiful) queues, and whats worse: four ions are already a match for the HP a destroyer represents. Factor in other options such as ion platforms, battlecruisers and pulsars, and destroyers are simply outclassed on all fronts. Rather than compete with these other units and try to overlap their roles, these changes attempt to buff destroyers while keeping their identity unique.*
* **Build time down:** `165 => 140 (-17%)` Still outclassed for DPS by more dedicated options, however a lowered build time allows for a faster return on investment regarding represented HP.
* **Regeneration time down:** `1074 => 900 (-19%)` High HP with a relatively low DPS *at high range* puts destroyers in an interesting (and mostly unique) position. A group of 2 or more destroyers is able to handle frigates and other destroyers extremely effectively if kited correctly (imagine a cycle of destroyers moving forwards and backwards). Upping their regeneration allows them identify themselves in this role, and provides value to the unit without forcing them to overlap into a DPS role already occupied by so many other units.
* **Damage multiplier vs collectors up:** `0.7 => 1.0 (+42%)` (*`hgn_kineticburstcannondestroyer.wepn`*) Destroyers are currently underperforming against collectors. Jumping a destroyer at an angle / through a gap in inhibs in order to snipe collectors is an old style which is currently never used. This is *partly* because of their other issues, however collectors (especially upgraded HW2 collectors) are shrugging off the damage coming from a super-capital ship too easily.
### Interceptors
*Doing fine, however struggling to follow up a clear sky with good econ damage*
* **Damage multiplier vs collectors slightly up:** `0.33 => 0.5 (+51%)` (*`hgn_kineticautogun.wepn`*) Unscouted int rushes should hurt. Being flanked should hurt.
### Bombers
*Same as ints*
* **Damage multiplier vs collectors slightly up:** `0.2 => 0.3 (+50%)` (*`hgn_antishipbomblauncher.wepn`*) Same as ints, minus the rush?
### Probes
*No reason not to.*
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Neutral => Passive`



## Nerfs

### Pulsar Corvettes
*Currently the focal point of Hiigaran play (in part due to corvettes being so amazing in general now), pulsars have too much power in too many scenarios. Distributing some of this power to torpedoes and destroyers is a healthier solution*
* **Damage multiplier vs frigates *(Medium armour)* slightly down:** `1.5 => 1.35 (-10%)` (*`hgn_pulsar.wepn`*) Hiigaran have many options for dealing with frigates - most of them are designed for this role and are simply underpowered. Pulsars should not act as a bandaid for underperforming partners.
* **Damage multiplier vs collectors down:** `0.59 => 0.4 (-32%)` (*`hgn_pulsar.wepn`*) There is no reason for pulsars to perform this well against collectors. They are already outperforming most other vettes (except missiles) in this role whilst also outperforming most other vettes in most other roles. Generalist units are fine, but not to this extent.
### Scouts
*Part of a larger problem in HWR, scouts are currently waypointable to provide extremely hard to kill vision for a low cost and low attention investment.*
* **Primary sensor radius down (blue sphere in manager):** `9000 => 6500 (-27%)`
* **Secondary sensor radius down (works the same, but invisible):** `11000 => 8030 (-27%)` 11000 is almost as high as a probe (`12000`) - way too high.
### Mobile Refineries
*Losing refineries due to poor scouting/defence is currently a minor annoyance at best. Incentivising refinery snipes on smaller maps leads to less linear gameplay.*
* **Cost up:** `800 => 1000 (+25%)`
### Mobile Refinery Armor Upgrade
*In the same vein as the price hike for building refineries, the cost of upgrading this unit is stunningly low. This is currently a 'why not?' upgrade.*
* **Cost up:** `400 => 1000 (+150%)`
* **Research time up:** `60 => 90 (+50%)`
### Resource Collector Armor Upgrade
*Collectors are currently shrugging off harrassment damage with no problems - harrassment is an attention-intensive option for the harrasser, so it should be for the harrassed also. Tanky workers mean the defender has far less to worry about, and the harrasser will find their return-on-investment depressingly low. Fighters in particular trade quite poorly against even a single layer of hull defence.*
* **Cost up:** `800 => 1100 (+38%)`
* **Research time up:** `90 => 100 (+11%)`
