/* Playing modes */
/* Turn = 1 ou 2 */


pl1VsPl2(GameState, Turn) :-
    \+game_over(GameState, _),
    display_game(GameState),
    getLegalMove(GameState, NewGameState, Turn),
    (
        (Turn = 1,
        pl1VsPl2(NewGameState, 2));

        (Turn = 2,
        pl1VsPl2(NewGameState, 1))
    );

    game_over(GameState, Winner),
    display_game(GameState),
    (Winner = 'x' ; Winner = "x"),
    nl, write('CONGRATULATIONS, Player 1, You Won!') ;

    game_over(GameState, Winner),
    display_game(GameState),
    (Winner = 'o' ; Winner = "o"),
    nl, write('CONGRATULATIONS, Player 2, You Won!').


personVsComputer(GameState, Turn, Level):-
    
    \+game_over(GameState, _),
    display_game(GameState),
    (
        (Turn = 1) ;

        (Turn = 2,
        choose_move(GameState, 'o', Level, Move),
        move(GameState, Move, NewGameState),
        list_nth(Move, 1, X),
        list_nth(Move, 2, Y),
        nl, format('Computer placed a piece on column number ~w, row number ~w!', [X, Y]),nl) 
    ),

    (
        (Turn = 1,
        getLegalMove(GameState, NewGameState, Turn),
        personVsComputer(NewGameState, 2, Level)) ;

        (Turn = 2,
        personVsComputer(NewGameState, 1, Level))
    );

    game_over(GameState, Winner),
    display_game(GameState),
    (Winner = 'x' ; Winner = "x"),
    nl, write('CONGRATULATIONS, You Won!') ;

    game_over(GameState, Winner),
    display_game(GameState),
    (Winner = 'o' ; Winner = "o"),
    nl, write('Sorry, the Computer Won').



computerVsComputer(GameState, Turn, Level):-
    \+game_over(GameState, _),
    display_game(GameState),
    (
        (Turn = 1,
        choose_move(GameState, 'x', Level, Move),
        NewTurn is 2);

        (Turn = 2,
        choose_move(GameState, 'o', Level, Move),
        NewTurn is 1)
    ),
    move(GameState, Move, NewGameState),
    list_nth(Move, 1, X),
    list_nth(Move, 2, Y),
    format('\nComputer ~w placed a piece on column number ~w, row number ~w!\n', [Turn, X, Y]),
    computerVsComputer(NewGameState, NewTurn, Level) ;


    game_over(GameState, Winner),
    display_game(GameState),
    (Winner = 'x' ; Winner = "x"),
    nl, write('Computer 1 Won!') ;

    game_over(GameState, Winner),
    display_game(GameState),
    (Winner = 'o' ; Winner = "o"),
    nl, write('Computer 2 Won!').