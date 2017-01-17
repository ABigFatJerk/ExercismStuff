-module(phone).
-export([number/1, areacode/1, pretty_print/1]).

number(String) -> NumbersOnly = numbers_only(String), normalize(NumbersOnly).

areacode(String) -> string:sub_string(normalize(String), 1, 3).

pretty_print(String) -> Normalized = normalize(String),
                        Area = areacode(Normalized), Exchange = string:sub_string(Normalized, 4, 6), Rest = string:sub_string(Normalized, 7, 10),
                        "(" ++ Area ++ ") " ++ Exchange ++ "-" ++ Rest.


numbers_only(String) -> re:replace(String, "\\D", "", [global, {return, list}]).

normalize(Numbers) -> case string:len(Numbers) of
                        10 -> Numbers;
                        11 -> case string:sub_string(Numbers, 1, 1) of
                                "1" -> string:sub_string(Numbers, 2);
                                _ -> "0000000000"
                              end;
                        _ -> "0000000000"
                      end.
