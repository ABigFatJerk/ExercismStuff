-module(isogram).

-export([is_isogram/1]).


is_isogram(_Phrase) -> _P2 = prep(_Phrase), _unique_count = sets:size(sets:from_list(_P2)), string:length(_P2) == _unique_count.

% Prep the string by lowercasing it and filtering out anything except english letters
prep(_Sentence) -> _S2 = string:to_lower(_Sentence), lists:filter(fun(X) -> is_alpha(X) end, _S2).

is_alpha(_Char) when _Char >= $a, _Char =< $z -> true;
is_alpha(_) -> false.
