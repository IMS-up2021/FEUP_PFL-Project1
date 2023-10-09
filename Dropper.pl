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


