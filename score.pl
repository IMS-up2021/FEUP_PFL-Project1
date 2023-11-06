/* Here is for the Computer moves*/

/* Receives ListOfMoves and the current game state (GameState). For each Move, calculate the NewGameState Value (obtained after executing the Move) */

getListOfScores(_, [], []).

getListOfScores(GameState, [Move | ListOfMoves], [Value | ListOfScores]) :-
    nth_element(Move, 0, Player),
    move(GameState, Move, NewGameState),
    value(NewGameState, Player, Value),
    getListOfScores(GameState, ListOfMoves, ListOfScores).


/* Receives a list of Values ​​(ListOfScores) and evaluates the Min or Max of each two elements in the list. If the list is odd, the last value is placed in the Reduced list without selection criteria */

evaluateInTwos([], [], [], [], _).

evaluateInTwos([M], [S], [M], [S], _).

evaluateInTwos([M1, M2 | ListOfMoves], [S1, S2 | ListOfScores], [MoveOption | ReducedMoves], [ScoreOption | ReducedScores], Criteria) :-
    ((Criteria = 0,
      ((S1 >= S2, ScoreOption is S1, clone_list(M1, MoveOption)) ;
      (S2 > S1, ScoreOption is S2, clone_list(M2, MoveOption)))) ;
    (Criteria = 1,
      ((S1 =< S2, ScoreOption is S1, clone_list(M1, MoveOption)) ;
      (S2 < S1, ScoreOption is S2, clone_list(M2, MoveOption)))),
    evaluateInTwos(ListOfMoves, ListOfScores, ReducedMoves, ReducedScores, Criteria).


/* Recursively calls evaluateInTwos and alternates between selecting Min values ​​or Max values */

minimax(ListOfMoves, ListOfScores, Criteria, BestMove) :-
    ((Criteria = 0, NewCriteria is 1) ; (Criteria = 1, NewCriteria is 0)),
    length(ListOfMoves, L),
    L \= 1,
    evaluateInTwos(ListOfMoves, ListOfScores, ReducedMoves, ReducedScores, Criteria),
    minimax(ReducedMoves, ReducedScores, NewCriteria, BestMove).

minimax([Move], _, _, Move).

/* Receives the game state (GameState) and the player (Player) and, through the Minimax algorithm, decides the best move. */

chooseBestMove(GameState, Player, BestMove) :-
    getListOfMoves(GameState, Player, 1, 1, [], ListOfMoves),
    board_size(BoardSize),
    D is div(BoardSize, 2) + 1,
    append([], [Player], L1),
    append(L1, [D], L2),
    append(L2, [D], Move),
    count_occurrences(Move, ListOfMoves, N),

    ((N > 0, clone_list(Move, BestMove)) ;

    (N = 0,
    getListOfScores(GameState, ListOfMoves, ListOfScores),
    length(ListOfScores, L),
    (divisible(L, 2), Levels is div(L, 2) ; \+divisible(L, 2), Levels is div(L, 2) + 1),
    ((divisible(Levels, 2), minimax(ListOfMoves, ListOfScores, 0, BestMove)) ; (\+divisible(Levels, 2), minimax(ListOfMoves, ListOfScores, 1, BestMove))))).


