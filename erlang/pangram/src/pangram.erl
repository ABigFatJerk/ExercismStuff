-module(pangram).

-export([is_pangram/1]).


is_pangram(_Sentence) -> _s2 = prep(_Sentence), _count=unique_count(_s2), _count == 26.

% Prep the string by lowercasing it and filtering out anything except english letters
prep(_Sentence) -> _S2 = string:to_lower(_Sentence), lists:filter(fun(X) -> is_alpha(X) end, _S2).

is_alpha(_Char) when _Char >= $a, _Char =< $z -> true;
is_alpha(_) -> false.

unique_count(_Sentence) -> sets:size(sets:from_list(_Sentence)).
