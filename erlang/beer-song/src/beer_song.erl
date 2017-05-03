-module(beer_song).
-export([test_version/0, verse/1, sing/2, sing/1]).

test_version() -> 1.

verse(0) -> ["No more bottles of beer on the wall, no more bottles of beer.\n", "Go to the store and buy some more, 99 bottles of beer on the wall.\n"];
verse(1) -> ["1 bottle of beer on the wall, 1 bottle of beer.\n", "Take it down and pass it around, no more bottles of beer on the wall.\n"];
verse(2) -> ["2 bottles of beer on the wall, 2 bottles of beer.\n", "Take one down and pass it around, 1 bottle of beer on the wall.\n"];
verse(Verse) -> [io_lib:format("~B bottles of beer on the wall, ~B bottles of beer.\n", [Verse, Verse]), io_lib:format("Take one down and pass it around, ~B bottles of beer on the wall.\n", [Verse-1])].

sing(StartVerse, EndVerse) -> [verse(Verse) ++ "\n" || Verse <- lists:seq(StartVerse, EndVerse, -1)].

sing(StartVerse) -> sing(StartVerse, 0).
