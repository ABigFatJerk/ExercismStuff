-module(grade_school).
-export([new/0, add/3, get/2, sort/1]).

new() -> dict:new().

add(Value, Key, School) -> dict:append(Key, Value, School).

get(Key, School) -> case dict:find(Key, School) of
                      {ok, Value} -> Value;
                      error -> []
                    end.

sort(School) -> [{Key, lists:sort(Values)} || {Key, Values} <- lists:keysort(1, dict:to_list(School))].
