-module(strain).
-export([keep/2, discard/2]).

% Excercise says we're not supposed to use the fancy tools provided by the language, otherwise I'd just use lists:partition.
% keep(Fun, List) -> {Pass, _} = lists:partition(Fun, List), Pass.
% 
% discard(Fun, List) -> {_, Fail} = lists:partition(Fun, List), Fail.
%
% Next step down would probably be using list comprehensions.
% keep(Fun, List) -> [E || E <- List, Fun(E) == true].
% 
% discard(Fun, List) -> [E || E <- List, Fun(E) == false].
%
% But I'll go even more basic.
keep(_, []) -> [];
keep(Fun, [H|T]) -> case Fun(H) of
                      true -> [H|keep(Fun, T)];
                      false -> keep(Fun, T)
                    end.

discard(_, []) -> [];
discard(Fun, [H|T]) -> case Fun(H) of
                         true -> discard(Fun, T);
                         false -> [H|discard(Fun, T)]
                       end.
