-module(difference_of_squares).
-export([sum_of_squares/1, square_of_sums/1, difference_of_squares/1, test_version/0]).

test_version() -> 1.

sum_of_squares(Integer) -> lists:sum(lists:map(fun (X) -> X*X end, lists:seq(1, Integer))).

square_of_sums(Integer) -> Sum = lists:sum(lists:seq(1, Integer)), Sum*Sum.

difference_of_squares(Integer) -> square_of_sums(Integer) - sum_of_squares(Integer) .
