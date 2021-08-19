-module(raindrops).

-export([convert/1]).

convert(_Number) when _Number rem 3 =/= 0, _Number rem 5 =/= 0, _Number rem 7 =/= 0 -> integer_to_list(_Number);
convert(_Number) -> pling(_Number) ++ plang(_Number) ++ plong(_Number).

pling(_Number) when _Number rem 3 == 0 -> "Pling";
pling(_Number) -> "".

plang(_Number) when _Number rem 5 == 0 -> "Plang";
plang(_Number) -> "".

plong(_Number) when _Number rem 7 == 0 -> "Plong";
plong(_Number) -> "".