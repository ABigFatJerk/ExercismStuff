-module(bracket_push).

-export([is_paired/1]).


is_paired(String) -> Filtered = filter(String), is_paired(Filtered, []).

% Filter out anything that isn't a {}[]()
filter(String) -> lists:filter(fun(X) -> keep(X) end, String).
keep($[) -> true;
keep($]) -> true;
keep($() -> true;
keep($)) -> true;
keep(${) -> true;
keep($}) -> true;
keep(_) -> false.

% If we've run out of input, it's balanced only if the stack is empty 
is_paired([], []) -> true;
is_paired([], _) -> false;

% If we see a close, it has to match an open on the stack, then continue checking
is_paired([$)|T1], [H|T2]) -> case H == $( of
                                 true -> is_paired(T1, T2);
                                 false -> false
                               end;
is_paired([$}|T1], [H|T2]) -> case H == ${ of
                                 true -> is_paired(T1, T2);
                                 false -> false
                               end;
is_paired([$]|T1], [H|T2]) -> case H == $[ of
                                 true -> is_paired(T1, T2);
                                 false -> false
                               end;

% H must be an open, so push it to the stack
is_paired([H|T], Stack) -> is_paired(T, [H|Stack]).
