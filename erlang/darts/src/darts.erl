-module(darts).

-export([score/2]).


score(X, Y) -> Distance = distance(X, Y), score(Distance).

distance(X, Y) -> math:sqrt(math:pow(X, 2) + math:pow(Y, 2)).

score(Distance) when Distance =< 1 -> 10;
score(Distance) when Distance =< 5 -> 5;
score(Distance) when Distance =< 10 -> 1;
score(Distance) when Distance > 10 -> 0.


