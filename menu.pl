% Functions for the main menu of the game and logo.

% Write Game Logo.

writeGameBanner:-
    write('        _____                                         '),nl,
    write('       |  __ \ ___   _____  _____  _____  ____  ___   '),nl,
    write('       | |  | |  __\|  _  ||  _  ||  _  || ___||  __\ '),nl,
    write('       | |__| | |   | |_| || |_| || |_| || __| | |    '),nl,
    write('       |_____/|_|   |_____|| ____|| ____||____||_|    '),nl,
    write('                           |_|    |_|                 ').

% Main Menu.

menuPlay(1):-
    write('Let\'s begin! \n'),
    getBoardSizeInput(BoardSize),
    initial_state(BoardSize, GameState),
    pl1Vspl2(GameState, 1).

menuPlay(2):-
    write('Let\'s begin! \n'),
    getBoardSizeInput(BoardSize),
    getComputerLevelInput(Level),
    initial_state(BoardSize, GameState),
    personVsComputer(GameState, 1, Level).

menuPlay(3):-
    write('Let\'s begin! \n'),
    getBoardSizeInput(BoardSize),
    getComputerLevelInput(Level),
    initial_state(BoardSize, GameState),
    computerVsComputer(GameState, 1, Level).

menuPlay(0):-
    write('Leaving so soon :(\nWe\'ll miss you, goodbye...').

menuPlay(_):-
    write('\nInvalid choice. \nPlease choose a valid option.\n'),
    play.


/*getBoardSizeInput -> pede que o user coloque o tamanho do tabuleiro */
getBoardSizeInput(BoardSize):-
    write('Choose the board size: '),
    read(Size),
    (
        (   \+number(Size),
            nl, write('Sorry, you need to write a number!'), nl,
            getBoardSizeInput(BoardSize)
        );

        (
            number(Size),
            format('You have chosen ~w as your board size! Now, let\'s play!\n', [Size]),
            BoardSize is Size
        ) 
    ).

