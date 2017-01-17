-module(binary_string).
-export([to_decimal/1]).

to_decimal(String) -> case is_convertable(String) of
                        true -> do_conversion(String);
                        false -> 0
                      end.

% Predicate that checks if the given String consists of only 0s and 1s.
is_convertable(String) -> case re:run(String, "[^01]+") of
                            {match, _} -> false;
                            nomatch -> true
                          end.

do_conversion(String) -> {_, FinalSum} = lists:foldr(fun fold_fun/2, {0, 0}, String), erlang:trunc(FinalSum).

fold_fun(Element, {CurrPow, CurrSum}) ->  case Element of
                                           $1 -> {CurrPow + 1, CurrSum + math:pow(2,CurrPow)};
                                           $0 -> {CurrPow + 1, CurrSum}
                                          end.
