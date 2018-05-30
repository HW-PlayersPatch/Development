# Vaygr

Generally reckoned to be the best race on large maps, Vaygr gameplay is currently consigned to a linear `SCOUT -> MACRO -> BUILD -> PUSH` playstyle. In this domain they are certainly top dog, to the point where the other races stuggle to prevent the macro machine from running out of control.

In addition to nerfing and adding weak points to the unstoppable macro engine, theses changes also attempt to open up more variety in Vaygr play - not just units, but playstyles as well.

**Nerfs to utility are affecting all races.**

## Buffs

### Hyperspace Gates
*A 'never used' unit, the hyperspace gate struggles to offer any tangeble advantages in comparison to close production or regular jumps - not only are gates time-intensive to build (1m30s to build a pair), the cost of opening a gate isn't negligable (especially with rolling build queues in HWR, stockpiling 1000 RUs can be quite an annoyance). In addition, the gates themselves can be blocked by inhibs (simply inherent to HS), and are easily sniped.*
* **Build time down:** `45 => 30 (-33%)`
* **Cost to link:** `1000 => 800 (-20%)`
* **Base HP:** `18500 => 21000 (+14%)`
### Minelayer Corvettes
*A 'never used' unit, the minelayer is capable of higher DPS than any other strikecraft. However, the slow build times and inconvenience of having to research an extra vette type of dubious effectiveness means minelayers are never on the table (that, and they clash with laser vettes somewhat). Minelayers have great potential as a backstab unit, these changes are designed to make them easier to deploy during normal build cycles.*
* **Cost down:** `800 => 600 (-25%)` Laser vettes are 650 per squadron in comparison
* **Build time down:** `45 => 40 (-9%)` 
### Destroyers
*Straddling the line between 'never used' and 'sometimes okay?', Vaygr destroyers are certainly more viable than their Hiigaran counterparts, however they are still somewhat less desirable than their HW1 counterparts. Moreover, they are much worse in their role than HMFs (who are so spammable they represent more HP AND more DPS per unit time in a typical game) and especially laser corvettes, who are immune / highly resistant to most frigates and completely wipe them off the map in turn. Rather than compete with these other units and try to overlap their roles, these changes attempt to buff destroyers while keeping their identity unique.*
* **Regeneration time down:** `1074 => 900 (-19%)` High HP with a relatively low DPS at high range puts destroyers in an interesting (and mostly unique) position. A group of 2 or more destroyers is able to handle frigates and other destroyers extremely effectively if kited correctly (imagine a cycle of destroyers moving forwards and backwards). Upping their regeneration allows them identify themselves in this role, and provides value to the unit without forcing them to overlap into a DPS role already occupied by so many other units.
### Assault Craft
*Doing fine, however struggling to follow up a clear sky with good econ damage*
* **Damage multiplier vs collectors slightly up:** `0.33 => 0.5 (+51%)` (*`vgr_flechettecannon.wepn`*) Unscouted int rushes should hurt. Being flanked should hurt.
### Bombers
*Same as ints*
* **Damage multiplier vs collectors slightly up:** `0.17 => 0.3 (+76%)` (*`vgr_antishipbomblauncher.wepn`*) Same as ints, minus the rush?
### All Probes
*No reason not to.*
* **Default stance change:** `Neutral => Evasive` Provides a small boost to maneuverability
* **Default tactics change:** `Defensive => Passive`



## Nerfs

### Improved Manufacturing (Carriers)
*One of the most oppressive aspects of facing a Vaygr player is attempting to keep up with their production. Vaygr have the fastest building and cheapest carriers in the game, which is a core tenet of their playstyle - however, the decision of 'carrier or not to carrier' is largely answered for the Vaygr player by the presence of a cheap, easy-access upgrade which they can use to superdrive their production even further. Since Vaygr will almost always have **more** carriers, this upgrade will naturally effect more ships. This, in tandem with its easy access, is too overbearing to deal with. (FYI, all imp. manufacturing upgrades are a 1.3x multiplier)*
* **Cost up:** `1500 => 2000 (+33%)`
* **Research time up:** `100 => 120 (+20%)`
### Missile Corvettes
*Missile corvettes utterly wipe collectors off the face of the galaxy. No unit even comes close to their collector kill speed. Combined with their high survivability, missile vettes are **slightly** too good in this role.*
* **Damage multiplier vs collectors slightly down:** `1.0 => 0.9` (*`vgr_concussionmissilelauncher.wepn`*)
### Scouts
*Part of a larger problem in HWR, scouts are currently waypointable to provide extremely hard to kill vision for a low cost and low attention investment.*
* **Primary sensor radius down (blue sphere in manager):** `8000 => 6500 (-18%)`
* **Secondary sensor radius down (works the same, but invisible):** `11000 => 8030 (-27%)` 11000 is almost as high as a probe (`12000`) - way too high.
### EMP
*Vaygr scouts have access to a the superior EMP - so superior, that other races have to behave extremely cautiously around a Vaygr swarm, to the point where it forces a lot of actions on the opponents end in comparison to the Vaygr player's end. This is fine by itself, however:*
* *EMP is cheap enough to the point where its a guaranteed factor in a non-rush game*
* *Vaygr swarm performs well enough without it*
* *Vaygr are already superior in other unit classes*
* *It introduces extra volatility into an already volatile game*

*Removing EMP or changing its mechanics would be short sighted - this is a still a skill-based ability which should reward a player for correct positioning and timing, however it is simply too oppressive, especially for races trying to prevent Vaygr macro from spiralling out of control. Instead of changing EMP itself, some peripheral factors are changing, such as scout EMP shielding (so they stun themselves more easily, making EMP have an associated risk for its reward).*
* **Cost up:** `1500 => 2000 (+33%)` Having unrivalled dominance in fighter battles should come with a price tag.
* **Research time up:** `70 => 90 (+29%)` It should also be pre-meditated.
### Mobile Refineries
*Losing refineries due to poor scouting/defence is currently a minor annoyance at best. Incentivising refinery snipes on smaller maps leads to less linear gameplay.*
* **Cost up:** `800 => 1000 (+25%)`
### Utility Armor Upgrade
*Collectors are currently shrugging off harrassment damage with no problems - harrassment is an attention-intensive option for the harrasser, so it should be for the harrassed also. Tanky workers mean the defender has far less to worry about, and the harrasser will find their return-on-investment depressingly low. Fighters in particular trade quite poorly against even a single layer of hull defence. Vaygr in particular should be weak to economic harrass, as their core strength is overwhelming their opponent with a superior economy - opponents should be able to exploit a sloppy Vaygr player's lack of defence.*
* **Cost up:** `1200 => 2100 (+75%)` Equals Hiign combined: `1100` collector, `1000` refinery
* **Research time up:** `120 => 180 (+50%)` 10s less than Hiign combined: `100` collector, `90` refinery
