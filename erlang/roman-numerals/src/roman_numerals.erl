-module(roman_numerals).
-export([test_version/0, numerals/1]).

test_version() -> 1.

numerals(Number) when Number >= 1000 -> [$M|numerals(Number-1000)];
numerals(Number) when Number < 1000 andalso Number >= 900 -> [$C, $M|numerals(Number-900)];
numerals(Number) when Number < 900 andalso Number >= 500 -> [$D|numerals(Number-500)];
numerals(Number) when Number < 500 andalso Number >= 400 -> [$C,$D|numerals(Number-400)];
numerals(Number) when Number < 400 andalso Number >= 100 -> [$C|numerals(Number-100)];
numerals(Number) when Number < 100 andalso Number >= 90 -> [$X,$C|numerals(Number-90)];
numerals(Number) when Number < 90 andalso Number >= 50 -> [$L|numerals(Number-50)];
numerals(Number) when Number < 50 andalso Number >= 40 -> [$X,$L|numerals(Number-40)];
numerals(Number) when Number < 40 andalso Number >= 10 -> [$X|numerals(Number-10)];
numerals(Number) when Number =:= 9 -> [$I,$X|numerals(Number-9)];
numerals(Number) when Number < 9 andalso Number >= 5 -> [$V|numerals(Number-5)];
numerals(Number) when Number =:= 4 -> [$I,$V|numerals(Number-4)];
numerals(Number) when Number < 4 andalso Number >= 1 -> [$I|numerals(Number-1)];
numerals(Number) when Number =< 1 -> "".
