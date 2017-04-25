-module(series).
-export([test_version/0, from_string/2]).

test_version() -> 1.

from_string(Length, SourceString) -> [lists:sublist(SourceString, X, Length) || X <- lists:seq(1, length(SourceString) - Length + 1)].
