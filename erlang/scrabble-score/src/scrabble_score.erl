-module(scrabble_score).
-export([test_version/0, score/1]).

test_version() -> 1.

score([]) -> 0;
score(Word) -> lists:sum(lists:map(fun lettervalue/1, string:to_lower(Word))).

lettervalue($a) -> 1;
lettervalue($b) -> 3;
lettervalue($c) -> 3;
lettervalue($d) -> 2;
lettervalue($e) -> 1;
lettervalue($f) -> 4;
lettervalue($g) -> 2;
lettervalue($h) -> 4;
lettervalue($i) -> 1;
lettervalue($j) -> 8;
lettervalue($k) -> 5;
lettervalue($l) -> 1;
lettervalue($m) -> 3;
lettervalue($n) -> 1;
lettervalue($o) -> 1;
lettervalue($p) -> 3;
lettervalue($q) -> 10;
lettervalue($r) -> 1;
lettervalue($s) -> 1;
lettervalue($t) -> 1;
lettervalue($u) -> 1;
lettervalue($v) -> 4;
lettervalue($w) -> 4;
lettervalue($x) -> 8;
lettervalue($y) -> 4;
lettervalue($z) -> 10.
