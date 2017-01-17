-module(bob).
-export([response_for/1]).

% Yell -> "Whoa, chill out!"
% Question -> "Sure."
% blank -> "Fine. Be that way!"
% otherwise -> "Whatever."

response_for(String) -> case is_blank(String) of 
                          false -> case is_yell(String) of 
                               true -> "Whoa, chill out!";
                               false -> case is_question(String) of 
                                          true -> "Sure."; 
                                          false -> "Whatever." 
                                         end
                               end;
                          true -> "Fine. Be that way!"
                          end.

is_blank(String) -> string:strip(String) == "".

is_yell(String) -> string:equal(String, string:to_upper(String)) and has_at_least_one_letter(String).
has_at_least_one_letter(String) -> case re:run(String, "[a-zA-Z]+") of
                                     {match, _} -> true;
                                     nomatch -> false
                                  end.

is_question(String) -> lists:suffix("?", String).
