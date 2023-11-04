:-[logic].
:-[board].
:-[menu].
:-[minimax].
:-use_module(library(random)).

/* Move = [Player, X, Y] */
move(GameState, Move, NewGameState) :-
    list_nth(Move, 0, Player),
    list_nth(Move, 1, X),
    list_nth(Move, 2, Y),
    placeStone(GameState, Player, X, Y, NewGameState).


display_game(GameState) :-
    boardSize(BoardSize),
    Size is 3*BoardSize+BoardSize-1,
    nl, writeColumnNumbers(1), nl,
    write(' '),
    writeCharNTimes(Size, '_'), nl,
    drawBoard(GameState, 1), !.


initial_state(Size, GameState) :-
    \+ divisible(Size, 2),
    retractall(boardSize(_)),
    assert(boardSize(Size)),
    getGameState(Size, GameState, [], Size), !.


valid_moves(GameState, Player, ListOfMoves) :-
    getListOfMoves(GameState, Player, 1, 1, [], ListOfMoves).


game_over(GameState, Winner) :-
    boardSize(BoardSize),
    D is div(BoardSize, 2),
    list_nth(GameState, D, Row),
    list_nth(Row, D, Winner),
    Winner \= ' ',
    Winner \= " ".
    

/* Value = o número de amigos que nos faltam ver (do ponto de vista do centro), para poder vencer o jogo. Quanto mais pequeno o valor melhor */

value(GameState, Player, Value) :-
    boardSize(BoardSize),
    Middle is div(BoardSize, 2)+1,
    howManyFriendsInSight(GameState, Player, Middle, Middle, Answer),
    distanceFromPerimeter(Middle, Middle, Distance),
    Value is Distance-Answer.


choose_move(GameState, Player, Level, Move) :-
    Level = 1,
    getListOfMoves(GameState, Player, 1, 1, [], ListOfMoves),
    length(ListOfMoves, Size),
    random(0,Size,Random),
    list_nth(ListOfMoves, Random, Move) ;

    Level = 2,
    chooseBestMove(GameState, Player, Move).

/*não está a funcionar*/

play:-
    writeGameBanner,
    write('\n\n'),
    write('**************** Main Menu *****************\n'),
    write('*       OPTION               ACTION        *\n'),
    write('*         1.            Player VS Player   *\n'),
    write('*         2.            Player VS Computer *\n'),
    write('*         3.          Computer VS Computer *\n'),
    write('*         0.                   Quit        *\n'),
    write('********************************************\n'),
    read(Choice),
    menuChoice(Choice).

/*
play:-
    writeGameBanner,
    write('\n\n'),
    write('**************** Main Menu *****************\n'),
    write('*                                          *\n'),
    write('*                                          *\n'),
    write('*             1. Let\'s begin!             *\n'),
    write('*                                          *\n'),
    write('*                                          *\n'),
    write('********************************************\n'),
    read(Choice),
    menuChoice(Choice).
*/