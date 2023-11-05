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

drawBoard(GameState) :-
    drawBoard(GameState, 1).

drawBoard([Row|GameState], Count) :-
    drawRow(Row, Count),
    NewCount is Count + 1,
    drawBoard(GameState, NewCount).

drawBoard([], _).

/*--- receives the board size (minimum 8) and populates GameState ---*/

getGameState(Size, GameState) :-
    Size >= 8,  
    getGameState(Size, GameState, [], Size).

getGameState(_, Aux, Aux, 0).

getGameState(Size, GameState, Aux, Counter) :-
    Counter > 0,
    replicate(Size, ' ', Row),
    append(Aux, [Row], NewAux),
    NewCounter is Counter - 1,
    getGameState(Size, GameState, NewAux, NewCounter).

