-module(dna).
-export([count/2, nucleotide_counts/1]).

count(DnaString, [Nucleotide]) -> Counts = nucleotide_counts_dict(DnaString), io:format("Counts: ~w", [dict:to_list(Counts)]), 
                                case dict:find(Nucleotide, Counts) of
                                  {ok, Value} -> Value;
                                  _ -> erlang:error("Invalid nucleotide")
                                end.

% This doesn't work since
%   1) The keys when printed this way are the ints, not the strings
%   2) The ordering isn't the same as the test expects
nucleotide_counts(DnaString) -> dict:to_list(nucleotide_counts_dict(DnaString)).


initial_dict() -> dict:from_list([{$A, 0}, {$T, 0}, {$C, 0}, {$G, 0}]).

nucleotide_counts_dict(DnaString) -> lists:foldl(fun(Nucleotide, Counts) -> dict:update_counter(Nucleotide, 1, Counts) end, initial_dict(), DnaString).
