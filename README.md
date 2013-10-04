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
