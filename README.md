***

# 🚢 Battleship Board Game — Formal Methods (B-Method) Specification

**By Banula Perera**  
`IIT: 20212085` · `UOW: W1871527`  
*BSc (Hons) Software Engineering, Informatic Institute of Technology & University of Westminster*  
*Submission: December 2024*

***

## Overview

This repository presents a fully-specified **Battleship Board Game** developed using the B-Method formal approach.  
The project demonstrates the modeling, verification, and visualization for a canonical turn-based Battleship game, representing a rigorous example of how formal methods yield robust, error-resistant system designs.

Key objectives:
- Model all rules, turns, game state, and visual output for two players.
- Ensure correctness through invariants, typed sets, and guarded operations.
- Support animation and state exploration in [ProB Animator/Model Checker](https://www3.hhu.de/stups/prob/index.php/Main_Page).

***

## ✨ Features

- **Formal B-Method Specification** of all gameplay logic and rules.
- **Animation Function**: Visualizes board state (players, ships, shots, hits/misses) for easy simulation in ProB.
- **Safe Turn-Based Logic**: Alternates correctly and checks all boundary/precondition conditions.
- **Game State Tracking**: Full lifecycle from fleet deployment to victory and reset.
- **Customizable Visuals**: Set image resources for each game element.
- **Robust Error Handling**: Explicit feedback on invalid actions—no ambiguous or undefined states.

***

## 🧠 Core Concepts

### Sets & Constants

- `PLAYERS` — `{Player_1, Player_2}`
- `MESSAGE` — feedback after operations such as `Success`, `Failure_Ship_Already_Exists`
- `GAME_STATES` — `{Ongoing, Player_1_Win, Player_2_Win, Both_players_need_to_deploy_their_fleet}`
- `SHOOTING_REPORT` — `{hit, miss, Shot_Already_Taken}`
- `grid` — fixed 10x10 setup (from constant in Shared Machine)
- `num_of_battleships` — player fleet limit (3 per player)

***

## 🏗️ Machine Structure

- **MACHINE**: `Battleship_Board_Game`
- **SEES**: `Shared` (imports sets/constants)
- **VARIABLES**: Tracks battle positions, shots, turn, fleets after deployment, etc.
- **INVARIANTS**: Guarantees every variable is within meaningful, legal bounds—core to formal verification.

***

## 🔒 State Invariants & Safety

Ensures:
- All ship/shooting/fleet positions always remain within grid.
- Each player never exceeds ship limits.
- Turns alternate only between valid players.
- All actions only happen in legal/valid game states (e.g., can't shoot before deploying).
- Game does not progress to the next state without fully satisfying preconditions.

***

## ⚡ Key Operations

| Operation                  | Description                                                    |
|----------------------------|----------------------------------------------------------------|
| `deployFleet`              | Place a ship for a player, transition state if both are ready. |
| `playerShoots`             | Make a shot, automatically checks for hit/miss/victory.        |
| `shipLocations`            | Query remaining ship coordinates for a given player.           |
| `shipsLeft`                | Count all remaining ships on board.                            |
| `shotsTaken`               | Count shots made by a player.                                  |
| `gameStatus`               | Output the current game/lifecycle state.                       |
| `restart`                  | Completely reset game back to initial conditions.              |

All operations are controlled by precise **PRE** (guard) conditions to prevent illegal actions.

***

## 🎮 Visualization & Animation

Graphical elements are supported through the `ANIMATION_FUNCTION`, which maps each cell ([row, col]) and status (empty, ship, shot, hit, walls, etc.) to an image.

**Sample definitions:**
```b
ANIMATION_IMG0 == "images/ocean.png";
ANIMATION_IMG1 == "images/wall.png";
ANIMATION_IMG2 == "images/player_1.png";
ANIMATION_IMG3 == "images/player_2.png";
ANIMATION_IMG4 == "images/ship.png";
ANIMATION_IMG5 == "images/shoot.png";
ANIMATION_IMG6 == "images/hit.png";
ANIMATION_IMG7 == "images/vs.png";
```
Set up your images to match these filenames for smooth animation in ProB.

***

## 🚀 How to Use

1. **Install ProB** ([download](https://www3.hhu.de/stups/prob/index.php/Main_Page))
2. **Load the `Battleship_Board_Game` and `Shared` machine files**.
3. **Animate**:
   - Deploy fleets for two players using `deployFleet`.
   - Take turns shooting using `playerShoots`.
   - Query visible state, counts, and winner using provided query operations.
   - Use `restart` to start a new match instantly without reloading.
   - Observe board via `ANIMATION_FUNCTION` for real-time visual feedback in the ProB animation view.

***

## 🏅 Credits & Licensing

- **Project Owner:** Banula Perera
- **Institutions:** IIT & UoW — Software Engineering BSc Final Project
- **Year:** 2024
- All rights reserved. For academic and demonstrational usage—please cite appropriately.

***

> *For researchers, educators, and students:  
> This project illustrates how formal methods (the B-Method) enable complete, reliable, and maintainable modeling of complex real-world logic—fit for both learning and extension.*

---
