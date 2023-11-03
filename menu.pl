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
    initial_state(BoardSize, GameState), % Mudar de acordo com o nosso jogo.
    pl1VSpl2(GameState, 1).


