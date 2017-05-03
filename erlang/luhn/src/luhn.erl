-module(luhn).
-export([test_version/0, valid/1, create/1]).

test_version() -> 1.

valid(DigitString) -> Luhnized = luhnize(normalize(DigitString), false),
                      lists:sum(Luhnized) rem 10 =:= 0.

create(PartialString) -> PartialLuhnSum = lists:sum(luhnize(normalize(PartialString), true)),
                         MissingDigit = 10 - (PartialLuhnSum rem 10),
                         PartialString ++ integer_to_list(MissingDigit).

% Internal functions

% Strip spaces and convert to an actual list of integers
normalize(DigitString) -> convert_to_integers(re:replace(DigitString, " ", "", [global, {return,list}])).

% Convert a string of digits to a list of the represented integers
convert_to_integers(DigitString) -> lists:map(fun (X) -> X-$0 end, DigitString).

luhnize_number(Number, {Acc, false}) -> {[Number|Acc], true};
luhnize_number(Number, {Acc, true}) -> Doubled = Number * 2,
                                       Luhnized = case Doubled > 9 of
                                                    true -> Doubled - 9;
                                                    false -> Doubled
                                                  end,
                                       {[Luhnized|Acc], false}.

luhnize(IntegerList, InitialFlag) -> {Luhnized, _} = lists:foldr(fun luhnize_number/2, {[], InitialFlag}, IntegerList), Luhnized.
