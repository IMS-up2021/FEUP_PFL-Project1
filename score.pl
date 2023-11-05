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

