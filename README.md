# Strategy

*a game for CSCE 443, built in [LOVE](http://www.love2d.org)*

## Members

* Michael Kosler
* Wally Tung
* Christopher Trask
* Stefan Levy

## Design

### Game play

A turn-based strategy game. There are no bases, rather each side receives a pre-determined company of units into each battle.
Each company will have a single king unit; the battle will end only when that single unit is taken.

The units will have rock-paper-scissors style strength and weaknesses. For example, helicopters have a strength over infantrymen.
This does not necessarily mean that helicopters will instantly defeat the infantrymen, but their attack value will be multiplied
against those units.

Each battle, which the players have full control over, will affect an overall map by pushing back and forth a line of demarcation.
The overall objective is to capture the oppositions capital.

### Art

The aesthetics will be as abstract as possible. The overall story is that of a computer virus infecting a computer, and the
computer fighting back. The game will be in 2D, inspired by the Advance Wars games.

## Breakdown of Tasks

### Stefan 

* Levels;
* Art;
* Sound;

### Christopher

* GUI;
* Networking;
* Overall Map;

### Wally

* Units;
* Input;

### Michael

* AI;
* Combat Rules;
* Framework;

## Milestones

* 10/9:  Members learn Lua/LOVE;
* 10/23: Single map with moveable units;
* 11/6:  Basic prototype (able to complete a single battle)
* 11/20: Networking, GUI, general polish;
* 11/27: Completed game, ready for play testing;

## Units

There are five total units, shared between both teams (i.e., both teams have the same unit types; the only differentiation is a palette swap).
These units are **light infantry**, **heavy infantry**, **light vehicles**, **heavy vehicles**, and **helicopters**.

Below is a table describing the advantages and disadvantages units have against one another.

### Attacking

| Attacking      | Light Infantry | Heavy Infantry | Light Vehicle | Heavy Vehicle | Helicopter | Commander |
| -------------- |:--------------:|:--------------:|:-------------:|:-------------:|:----------:|:---------:|
| Light Infantry | X              | +              | X             | -             | X          | X         |
| Heavy Infantry | X              | X              | +             | X             | -          | X         |
| Light Vehicle  | X              | X              | X             | -             | +          | X         |
| Heavy Vehicle  | X              | X              | +             | X             | -          | X         |
| Helicopter     | -              | X              | -             | +             | X          | X         |
| Commander      | 0              | 0              | 0             | 0             | 0          | 0         |

### Defending

| Defending      | Light Infantry | Heavy Infantry | Light Vehicle | Heavy Vehicle | Helicopter | Commander |
| -------------- |:--------------:|:--------------:|:-------------:|:-------------:|:----------:|:---------:|
| Light Infantry | X              | X              | X             | X             | +          | N\A       |
| Heavy Infantry | -              | X              | X             | X             | X          | N\A       |
| Light Vehicle  | X              | -              | X             | -             | +          | N\A       |
| Heavy Vehicle  | +              | X              | +             | X             | -          | N\A       |
| Helicopter     | X              | +              | -             | +             | X          | N\A       |
| Commander      | X              | X              | X             | X             | X          | N\A       |

### Commander Unit 

* Has Health( not a one hit kill )
* Cannot Attack( but can retaliate )
* Slowest Unit in the Game

## Combat

A battle commences when a player signals an attack on their turn. Units will copy over their status to the battle, i.e. how much
health they currently have, if they have any terrain modifiers, etc.

Once the attack is confirmed, the screen switches to a dedicated
battle screen. In the battle screen, health will be displayed, as well as which units attacked (located on the left side of the screen)
and which units defended (located on the right side of the screen).

The attacking unit first sends its attack, modified by the attacking table. The attackers damage will be applied to the defender immediately.
If the defender reaches zero health during this step, the combat is immediately over.

If the defender survives the initial attack stage, the defender will retaliate, modified by the defending table. Then the combat stage ends, and
units current health will be applied to their battle map unit. If either unit has zero health, they are removed from the map.

### Critical chance (non-integer damage)

If some unit would deal non-integer damage to another unit, rather than deal integer damage, the unit has a chance to deal the ceiling of the
damage based on how much over the floor of the damage they are.

    damageDealt = random() < (damage - floor(damage)) ? ceil(damage) : floor(damage);

For example, if, after all modifiers have been resolved, Unit A were to deal 3.25 damage to Unit B, then Unit A will have a 25% chance to deal 4
damage to Unit B, and a 75% chance to deal 3 damage to Unit B.

## Levels (Battle Maps)

There will be four or five pre-built maps where a battle can take place, designed to provide interesting choke points, but not
give an advantage to either player. Since there is a possibility to have local multiplayer, there is no fog of war.

All maps will be the same size.

### Electrical Circuit Theme

We plan to design these maps to look similar to a diagram of complex electrical circuits. We would use things like insulators, capacitors, and etc. 
as terrain types. This should lend to a simplistic sytle while still being able to look good. 

### Win state
 
One side has lost the battle if:

* They have lost the commander unit
* The commander is the only unit that remains

## Overworld (Overall Map)

The overall map is a simple grid of nodes with a distribution of strategic locations that, when captured by a side, give advantages to the
controlling player.

The overworld will be procedurally generated, ruled by providing a opening balance between each side.

### Resources

* gain more power the longer they are held by a single player( up to a cap, hopefully this will reduce back and forth fights over a single node )

## Ideas

If we have any ideas for features we would or could add into the game at some point, but were not in the original design, place them below.
