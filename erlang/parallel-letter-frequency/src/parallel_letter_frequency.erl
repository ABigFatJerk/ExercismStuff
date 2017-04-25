-module(parallel_letter_frequency).
-export([test_version/0, dict/1]).

test_version() -> 1.

dict(WordList) -> lists:foldl(fun one_word/2, dict:new(), WordList).

one_word(Word, Dict) -> lists:foldl(fun one_letter/2, Dict, Word).

one_letter(Letter, Dict) -> dict:update_counter(Letter, 1, Dict).
