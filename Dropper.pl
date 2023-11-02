% Define the game board as an 8x8 grid of cells.
% '.' represents an empty cell.

print_board([]).
print_board([Row|Rest]) :-
    print_row(Row),
    nl, 
    print_board(Rest).

print_row([]).
print_row([X|Xs]) :-
    write(X),  % print matrix element.
    write(' '), % Adds a space.
    print_row(Xs).

initialize_board(Board) :-
    Board = [
        [., ., ., ., ., ., ., .],
        [., ., ., ., ., ., ., .],
        [., ., ., ., ., ., ., .],
        [., ., ., ., ., ., ., .],
        [., ., ., ., ., ., ., .],
        [., ., ., ., ., ., ., .],
        [., ., ., ., ., ., ., .],
        [., ., ., ., ., ., ., .]
    ].



% Predicate to place a stone on the board.
place_stone(Board, Row, Col, Player, NewBoard) :-
    nth0(Row, Board, OldRow),
    replace(OldRow, Col, Player, NewRow),
    replace(Board, Row, NewRow, NewBoard).

% Helper predicate (replace a specific index)
replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]) :-
    I > 0,
    I1 is I - 1,
    replace(T, I1, X, R).

%--------------------------------------------------------------------------------------------------------------------------------------

% Calculate the size of a group of stones for a given player.
group_size(Board, Player, GroupSize) :-
    findall(_, (nth0(Row, Board, RowContent), nth0(Col, RowContent, Player), no_adjacent_stones(Board, Row, Col)), Stones),
    length(Stones, GroupSize).

% Compare the sizes of groups for Player 1 and Player 2.
compare_group_sizes(Board, Player1, Player2, Winner) :-
    group_size(Board, Player1, Player1Size),
    group_size(Board, Player2, Player2Size),
    
    % Determine the winner based on group size comparison.
    (Player1Size > Player2Size -> Winner = Player1;
     Player2Size > Player1Size -> Winner = Player2;
     Winner = tie).

% Calculate the score and determine the winner.
calculate_score(Board, Player1, Player2, Winner) :-
    compare_group_sizes(Board, Player1, Player2, Winner).


% Initialize game.
initialize_game(board, player1, player2) :-
    write("Welcome to the game!"),
    initialize_board(Board), print_board(Board).
