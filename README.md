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
   
2. **Run the Game:**

   ```bash
   ?- [game].
   ```
   This will start the Dropper game in the SICStus Prolog interpreter.


### Windows Environment

To run the Dropper game on a Windows environment, follow these steps:

1. **Install SICStus Prolog 4.8:**

   - Download SICStus Prolog 4.8 from [[official website link](https://sicstus.sics.se/download4.html)].
   - Follow the installation instructions for your Windows distribution.
   
2. **Run the Game:**
   The steps to carry out the execution:
  - open the SICStus interpreter;
  - consult (`File` in the upper right corner -> `Consult` -> choose the file) the `game.pl` file;
  - after that, run SICStus.

    ```bash
    ?- play.
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


## Logic of the game
The game state is made up of:
  - The current state of the board, which is represented as a matrix where each cell in the matrix represents a square on the board. Each square on the board is undifferentiated in terms of color, as color is not relevant to the game.
  - Each player is identified by the use of the characters 'x' and 'o'. Player 'x' is Player 1, while player 'o' is Player 2.

### Estado Inicial (8x8)
```
[
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
] 
```

### Estado Intermédio (8x8)
```
[
    [' ', ' ', ' ', ' ', 'o', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', 'x', ' ', ' ', ' '],
    [' ', ' ', ' ', 'o', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', 'x', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', 'x', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
] 
```

### Estado Final (8x8)
```
[
    ['x', 'o', 'o', 'o', 'x', 'o', 'x', 'x'],
    ['x', 'x', 'o', 'o', 'x', 'o', 'x', 'x'],
    ['x', 'x', 'x', 'o', 'x', 'o', 'x', 'x'],
    ['x', 'x', 'x', 'x', 'o', 'o', 'x', 'o'],
    ['x', 'o', 'x', 'o', 'o', 'o', 'o', 'x'],
    ['x', 'x', 'x', 'o', 'o', 'o', 'x', 'x'],
    ['o', 'x', 'o', 'o', 'o', 'o', 'x', 'o'],
    ['o', 'o', 'o', 'o', 'o', 'o', 'x', 'o']
] 
```

## How to Choose a Game Mode

To select a game mode, you simply need to enter the number corresponding to the desired mode followed by a period and press Enter. There are three available game modes:

1. Player vs. Player
2. Player vs. Computer
3. Computer vs. Computer

Once you choose a mode, you'll be prompted to select the size of the board's side. The board size is arbitrary, with no upper limit, as long as it's an odd number. Keep in mind that larger board sizes will result in longer game durations.

## Game Modes

1. **Player vs. Player**: In this mode, after selecting the board size, the game begins. Player 1 takes the first turn, followed by Player 2, in alternating fashion until the game's conclusion.

2. **Player vs. Computer**: After choosing the board size, you can select the opponent's difficulty level:

   - **Level 1**: The computer makes random moves.
   - **Level 2**: The computer selects the best moves.

   Player 1 starts the game (Player 1 being the human player, and Player 2 being the computer player). The turn-based cycle continues until the game's end.

3. **Computer vs. Computer**: After choosing the board size, you can select the game mode for both computers:

   - **Level 1**: Both computers make random moves.
   - **Level 2**: Both computers select the best moves.

When starting a game, a board with the chosen size is displayed. Depending on whether it's the player's turn or the computer's turn, a dialogue requesting the player's input or a dialogue displaying the computer's move is presented.

The game's current state is visualized using the `display_game(+GameState)` function, which displays the current state of the board.

```prolog
display_game(GameState) :-
    boardSize(BoardSize),
    Size is 3*BoardSize+BoardSize-1,
    nl, writeColumnNumbers(1), nl,
    write(' '),
    writeCharNTimes(Size, '_'), nl,
    drawBoard(GameState, 1), !.
```

Use is also made of the initial_state predicate, which, upon receiving the size of the board, returns the initial state of the game.

```prolog
initial_state(Size, GameState) :-
    \+ divisible(Size, 2),
    retractall(boardSize(_)),
    assert(boardSize(Size)),
    getGameState(Size, GameState, [], Size), !.
```

## Execution of a Move Process

The process of executing a move is accomplished through the "move" and "valid_moves" predicates. The "valid_moves" predicate receives a list of valid moves for a given position and a specific type of piece, and its functionality is further explained in the "List of Valid Moves" section below.
On the other hand, the "move" predicate places the player's piece at the position specified in "Move," while also storing essential information such as the state of the new board, the position where the piece is inserted in the new board state, and the identity of the next player responsible for making a move.

```prolog
move(GameState, Move, NewGameState) :-
    list_nth(Move, 0, Player),
    list_nth(Move, 1, X),
    list_nth(Move, 2, Y),
    placeStone(GameState, Player, X, Y, NewGameState).
```

## Game over
