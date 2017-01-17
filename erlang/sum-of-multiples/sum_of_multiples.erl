-module(sum_of_multiples).
-export([sumOfMultiples/2]).

sumOfMultiples(Factors, Max) -> lists:sum([Number || Number <- lists:seq(0, Max-1), lists:any(fun (Factor) -> Number rem Factor =:= 0 end, Factors)]).
