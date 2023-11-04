% Auxiliar functions.

% Returns the list element at the specified position.
nth_element([Element | _], 0, Element).
nth_element([_ | Rest], Index, Element) :-
    Index > 0,
    NewIndex is Index - 1,
    nth_element(Rest, NewIndex, Element).

% Counts the number of occurrences of an element in a list.
count_occurrences(_, [], 0).
count_occurrences(Element, [Head | Tail], Count) :-
    (Element = Head ->
        count_occurrences(Element, Tail, RestCount),
        Count is 1 + RestCount
    ;
        count_occurrences(Element, Tail, Count)
    ).

% Clone a list.
clone_list([], []).
clone_list([Head | Tail], [Head | NewTail]) :-
    clone_list(Tail, NewTail).

% Calculates the size of a list.
list_size([], 0).
list_size([_ | Tail], Size) :- 
    list_size(Tail, RestSize),
    Size is 1 + RestSize.

% Replaces an element in a list at the specified position.
replace_element([Old | Tail], 0, Old, New, [New | Tail]).
replace_element([Head | Tail], Index, Old, New, [Head | NewTail]) :-
    Index > 0,
    NewIndex is Index - 1,
    replace_element(Tail, NewIndex, Old, New, NewTail).

% Returns a part of a list (slicing).
list_slice(Source, Start, Size, Slice) :-
    list_slice_helper(Source, Start, Size, Slice, []).

list_slice_helper(_, 0, 0, Slice, Slice).
list_slice_helper([Head | Tail], Start, Size, Slice, Acc) :-
    (Start > 0 ->
        NewStart is Start - 1,
        append(Acc, [Head], NewAcc),
        list_slice_helper(Tail, NewStart, Size, Slice, NewAcc)
    ;
        NewSize is Size - 1,
        list_slice_helper(Tail, Start, NewSize, Slice, Acc)
    ).

% Replicate an element a number of times to create a list.
replicate_element(0, _, []).
replicate_element(Amount, Element, [Element | Rest]) :-
    Amount > 0,
    NewAmount is Amount - 1,
    replicate_element(NewAmount, Element, Rest).

% Checks if a number is divisible by another.
is_divisible(X, Y) :- 0 is X mod Y, !.

% -------- 

% Gets a list of elements from a column on the board .
get_column(Board, X, Column) :-
    get_column_helper(Board, X, Column).

get_column_helper([], _, []).
get_column_helper([Row | Rest], X, [Elem | Column]) :-
    list_nth(Row, X, Elem),
    get_column_helper(Rest, X, Column).

% -------- 

% Gets a list of elements on the left diagonal from X2, Y2.
get_left_diagonal(Board, X2, Y2, Diagonal) :-
    board_size(BoardSize),
    get_left_diagonal_helper(Board, X2, Y2, BoardSize, [], Diagonal).

get_left_diagonal_helper(_, _, _, 0, Diagonal, Diagonal).
get_left_diagonal_helper(Board, X2, Y2, BoardSize, Acc, Diagonal) :-
    X2 < BoardSize,
    Y2 < BoardSize,
    list_nth(Board, Y2, Row),
    list_nth(Row, X2, Elem),
    append(Acc, [Elem], NewAcc),
    X3 is X2 + 1,
    Y3 is Y2 + 1,
    get_left_diagonal_helper(Board, X3, Y3, BoardSize, NewAcc, Diagonal).

% -------- 

% Gets a list of right diagonal elements from X2, Y2.
get_right_diagonal(Board, X2, Y2, Diagonal) :-
    get_right_diagonal_helper(Board, X2, Y2, [], Diagonal).

get_right_diagonal_helper([], _, _, Diagonal, Diagonal).
get_right_diagonal_helper(Board, X2, Y2, Acc, Diagonal) :-
    list_nth(Board, Y2, Row),
    list_nth(Row, X2, Elem),
    append(Acc, [Elem], NewAcc),
    X3 is X2 + 1,
    Y3 is Y2 - 1,
    get_right_diagonal_helper(Board, X3, Y3, NewAcc, Diagonal).

% --------

% Calculates the vertical distance from the Y position.
get_vertical_distance(Y, VerticalDistance) :-
    board_size(BoardSize),
    D is div(BoardSize, 2),
    (Y > D ->
        VerticalDistance is BoardSize - Y
    ;
        VerticalDistance is Y - 1
    ).

% -------- 

% Calculates the horizontal distance from the X position.
get_horizontal_distance(X, HorizontalDistance) :-
    board_size(BoardSize),
    D is div(BoardSize, 2),
    (X > D ->
        HorizontalDistance is BoardSize - X
    ;
        HorizontalDistance is X - 1
    ).

% -------- 

% Board size.
board_size(8).