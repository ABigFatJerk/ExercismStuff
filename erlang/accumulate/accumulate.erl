-module(accumulate).
-export([accumulate/2]).

% The real way would be to use lists:map but the instructions say not to, and to 'solve this one using basic tools'
%
% Next step down would probably be a list comprehension:
% accumulate(Fn, Ls) -> [Fn(E) || E <- Ls].
% but I'll go one further.

accumulate(_, []) -> [];
accumulate(Fn, [H|T]) -> [Fn(H)|accumulate(Fn, T)].
