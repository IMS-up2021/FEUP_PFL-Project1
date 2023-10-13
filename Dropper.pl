% Define the game board as an 8x8 grid of cells.
% '.' represents an empty cell.

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

% Drop Move:
% Player 2 selects an opponents stone and moves it to an adjacent free square (diagonally or orthogonally adjacent).

player2_drop_move(Board, Player1, Player2, OpponentRow, OpponentCol, FreeRow, FreeCol, NewBoard) :-

    % Check if the cell at (OpponentRow, OpponentCol) contains an opponents stone.
    nth0(OpponentRow, Board, OpponentRowContent),
    nth0(OpponentCol, OpponentRowContent, Player1),

    % Find an adjacent free cell (diagonally or orthogonally adjacent).
    adjacent_free_cell(Board, OpponentRow, OpponentCol, FreeRow, FreeCol),

    % Move the opponents stone to the free cell and place Player 2s stone.
    place_stone(Board, OpponentRow, OpponentCol, '.', TempBoard),
    place_stone(TempBoard, FreeRow, FreeCol, Player2, NewBoard).

% Free Move:
% After the Drop move, Player 2 places their own stone in a free square that has no stones adjacent diagonally or orthogonally.

player2_free_move(Board, Player2, FreeRow, FreeCol, NewBoard) :-

    % Check if the cell at (FreeRow, FreeCol) is empty and has no adjacent stones.
    nth0(FreeRow, Board, FreeRowContent),
    nth0(FreeCol, FreeRowContent, '.'),
    no_adjacent_stones(Board, FreeRow, FreeCol),

    % Place Player 2s stone.
    place_stone(Board, FreeRow, FreeCol, Player2, NewBoard).



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