-module(triangle).
-export([test_version/0, kind/3]).

test_version() -> 1.

kind(Side1, Side2, Side3) when Side1 =< 0; Side2 =< 0; Side3 =< 0 -> {error, "all side lengths must be positive"};
kind(Side1, Side2, Side3) when Side1+Side2 =< Side3; Side1+Side3 =< Side2; Side2+Side3 =< Side1 -> {error, "side lengths violate triangle inequality"};
kind(Side1, Side2, Side3) when Side1 == Side2, Side2 == Side3 -> equilateral;
kind(Side1, Side2, Side3) when Side1 == Side2; Side2 == Side3; Side1 == Side3 -> isosceles;
kind(_, _, _) -> scalene.
