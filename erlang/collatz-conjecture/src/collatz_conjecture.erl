-module(collatz_conjecture).

-export([steps/1]).


steps(N) -> steps(N, 0).

steps(N, _) when N =< 0 -> erlang:error(badarg);
steps(1, Steps) -> Steps;
steps(N, Steps) -> case N rem 2 == 0 of
                     true -> steps(N div 2, Steps + 1);
                     false -> steps((3*N)+1, Steps + 1)
                   end.
