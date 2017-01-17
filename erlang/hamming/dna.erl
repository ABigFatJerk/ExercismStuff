-module(dna).
-export([hamming_distance/2]).

hamming_distance([], []) -> 0;
hamming_distance([H1|T1], [H2|T2]) -> case H1 == H2 of
                                        true -> hamming_distance(T1, T2);
                                        false -> 1 + hamming_distance(T1, T2)
                                      end.
