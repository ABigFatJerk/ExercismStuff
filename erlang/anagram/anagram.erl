-module(anagram).
-export([find/2]).

find(Word, Candidates) -> lists:filter(fun(Candidate) -> is_different_permutation(Word, Candidate) end, Candidates).

is_different_permutation(Word, OtherWord) -> (string:to_upper(Word) =/= string:to_upper(OtherWord)) 
                                             and 
                                             (lists:sort(string:to_upper(Word)) =:= lists:sort(string:to_upper(OtherWord))).
