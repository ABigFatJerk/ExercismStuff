-module(zipper).
-export([test_version/0, from_tree/1, to_tree/1, value/1, up/1, right/1, left/1, set_value/2, set_left/2, set_right/2, new_tree/3, empty/0]).

test_version() -> 1.

from_tree(Tree) -> {[], Tree}.

to_tree({[], Tree}) -> Tree;
to_tree(Zipper) -> to_tree(up(Zipper)).

value({_, {Value, _, _}}) -> Value.

up({[], _}) -> empty();
up({[{left, {Value, _, Right}}|Rest], Current}) -> {Rest, {Value, Current, Right}};
up({[{right, {Value, Left, _}}|Rest], Current}) -> {Rest, {Value, Left, Current}}.

right({_, {_, _, empty}}) -> empty();
right({History, {Value, Left, Right}}) -> {[{right, {Value, Left, empty()}}|History], Right}.

left({_, {_, empty, _}}) -> empty();
left({History, {Value, Left, Right}}) -> {[{left, {Value, empty(), Right}}|History], Left}.

set_value({History, {_, Left, Right}}, Value) -> {History, {Value, Left, Right}}.

set_left({History, {Value, _, Right}}, NewLeft) -> {History, {Value, NewLeft, Right}}.

set_right({History, {Value, Left, _}}, NewRight) -> {History, {Value, Left, NewRight}}.

% Tree building functions
new_tree(Value, Left, Right) -> {Value, Left, Right}.

empty() -> empty.
