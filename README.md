# FEUP-PFL
## Group Information
- **Group Designation:** DROPPER_6
- **Student Number and Full Name of Group Members:**
  - up202108852 - Inês Martin Soares
  - up202109256 - Patrícia Palmira de Sousa

## Installation and Execution

### Linux Environment

To run the Dropper game on a Linux environment, follow these steps:

1. **Install SICStus Prolog 4.8:**

   - Download SICStus Prolog 4.8 from [[official website link](https://sicstus.sics.se/download4.html)].
   - Follow the installation instructions for your Linux distribution.

2. **Clone the Dropper Game Repository:**

   ```bash
   git clone [repository_url]

3. **Navigate to the Game Directory:**

   ```bash
   cd dropper-game
   
5. **Run the Game:**

   ```bash
   sicstus -l game.pl
   ```
   This will start the Dropper game in the SICStus Prolog interpreter.


### Windows Environment

To run the Dropper game on a Windows environment, follow these steps:

1. **Install SICStus Prolog 4.8:**

   - Download SICStus Prolog 4.8 from [[official website link](https://sicstus.sics.se/download4.html)].
   - Follow the installation instructions for your Windows distribution.

2. **Clone the Dropper Game Repository:**

   ```bash
   git clone [repository_url]

3. **Navigate to the Game Directory:**

   ```bash
   cd dropper-game
   
5. **Run the Game:**
   - Open the SICStus Prolog interpreter.
   - Load the game by typing:
    
   ```bash
   ['game.pl'].
   ```
  This will load the Dropper game.
  ```bash
  start_game.
  ```
  This will start the Dropper game.

  ## Description of the Game

  The Dropper game is a strategic board game played on an 8x8 grid. The objective of the game is to have the largest group of stones on the board when no more Free moves are possible.

**Game Rules:**

- **Player Setup:**
  - Two players take turns: Player 1 and Player 2.
  - The game is played on an 8x8 board (though it can be played on different-sized boards).
  - Player 1 places 1 stone at their discretion on the empty board.

- **Player 2's Turn (1Drop - 1Free Protocol):**
  - Player 2 places 2 stones in 2 moves: 1 Drop and 1 Free.
  - **Drop Move:** Player 2 selects an opponent's stone and moves it to an adjacent free square (diagonally or orthogonally adjacent).
  - **Free Move:** After the Drop move, Player 2 places their own stone in a free square that has no stones adjacent diagonally or orthogonally.

- **Continuing Play:**
  - Players alternate turns, following the 1Drop - 1Free protocol, until it's no longer possible to place Free moves. Afterward, they proceed only with Drop moves.

- **Scoring:**
  - When placement possibilities are exhausted, the game is scored by counting the sizes of groups for each player.
  - A "group" can consist of a single stone or a set of stones of the same color adjacent orthogonally.
  - The player with the largest group wins. In case of a tie, the size of the second-largest group is counted, and so on.

The Dropper game combines strategic thinking and tactical maneuvers to outmaneuver your opponent and create larger stone groups on the board.

**More Information:**
- [[Official Game Website Link](https://boardgamegeek.com/boardgame/384171/dropper)]
