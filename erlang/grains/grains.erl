-module(grains).
-export([square/1, total/0]).

square(Square) -> trunc(math:pow(2, Square-1)).

total() -> total(64, 0).
total(0, Acc) -> Acc;
% Recursion is not the best choice here
total(Square, Acc) -> ThisSquare = square(Square), total(Square-1, Acc + ThisSquare).
