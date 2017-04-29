-module(largest_series_product).
-export([test_version/0, lsp/2]).

test_version() -> 1.

lsp(String, Length) when Length > length(String) orelse Length < 0 -> error;
lsp(String, Length) -> case all_digits(String) of 
                         false -> error;
                         true -> CandidateStrings = [lists:sublist(String, X, Length) || X <- lists:seq(1, length(String) - Length + 1)],
                                 lists:max(lists:map(fun product/1, CandidateStrings))
                       end.

product(DigitsString) -> lists:foldl(fun (Digit, Acc) -> {Int, _} = string:to_integer([Digit]), Int * Acc end, 1, DigitsString).

all_digits(String) -> case re:run(String, "^[0-9]*$") of
                        {match, _} -> true;
                        nomatch -> false
                      end.
