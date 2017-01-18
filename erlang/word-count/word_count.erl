-module(word_count).
-export([count/1]).

count(String) -> Normalized = normalize_string(String), Tokens = string:tokens(Normalized, ",_ "), count_words(Tokens).


normalize_string(String) -> Lowered = string:to_lower(String), re:replace(Lowered, "[!:&@$%^&#\.]", "", [global, {return, list}]).

count_words(Tokens) -> lists:foldl(fun word_counter/2, dict:new(), Tokens). 

word_counter(Word, WordDict) -> dict:update_counter(Word, 1, WordDict).
