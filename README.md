# 20 Seconds To Mars

## Video game made with Godot 4.6 (GDScript). Work in progress.

## Concept

You have 20 seconds to reach Mars, but your spaceship is not fast enough to make it in time. Between runs you can pick minigames that grant advantages, such as:

Boosting the ship's speed \
Slowing down time 

Choose which minigames to play, win their benefits and try to get to Mars before the clock runs out.

## Architecture
GameController/ - global game controller (autoload)
StateMachine/ - state machine that drives the game flow
MiniGames/ - the minigames the player can choose
UserInterface/ - UI scenes and scripts
main_game.tscn / main_game.gd - main scene

## How to run
Install Godot 4.6 (Forward Plus renderer). \
Clone the repository: \
   git clone https://github.com/rubenm101096-cmyk/20SecondsToMars.git \
Open Godot, choose Import, and select project.godot.
Press F5 to play. The project runs at 1920x1080.

## Status
In development. Minigames, art and balance are still being added.

## Author
Rubén Martínez - GitHub
