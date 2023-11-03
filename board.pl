% Functions for the board.

/*--- writeCharNTimes function to write Char N times (without line break) ---*/

writeCharNTimes(N, Char) :-
    N > 0,
    write(Char),
    New is N - 1,
    writeCharNTimes(New, Char).

/*--- drawRow function to format and write a row of the board ---*/

drawRow([Elem | Row]) :-
    format('| ~w ', [Elem]),
    drawRow(Row).

drawRow([]) :-
    write('|'), nl.

/*--- drawBoard function to write the complete board ---*/

drawBoard([Row | GameState]) :-
    drawRow(Row),
    write('|___' repeated 8),  % separation line
    drawBoard(GameState).

/*--- getEmptyRow function to create an empty row of 8 cells ---*/

getEmptyRow([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']).

/*--- getGameState function to create an initially empty 8x8 board ---*/

getGameState(GameState) :-
    replicate(8, EmptyRow, GameState).

replicate(0, _, []).
replicate(N, X, [X | Xs]) :-
    N > 0,
    N1 is N - 1,
    replicate(N1, X, Xs).

