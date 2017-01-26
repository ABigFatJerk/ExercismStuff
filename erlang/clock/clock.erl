-module('clock').

-export([create/2,
  is_equal/2,
  minutes_add/2,
  to_string/1]).

create(Hour, Minute) -> normalize({clock, Hour, Minute}).

is_equal(Clock1, Clock2) -> {clock, Hour1, Minute1} = normalize(Clock1),
                            {clock, Hour2, Minute2} = normalize(Clock2),
                            (Hour1 =:= Hour2) and (Minute1 =:= Minute2).

minutes_add({clock, Hour, Minute}, Minutes) -> normalize({clock, Hour, Minute+Minutes}).

to_string({clock, Hour, Minute}) -> lists:flatten(io_lib:format("~2..0B:~2..0B", [Hour, Minute])).


normalize({clock, Hour, Minute}) -> AllMinutes = Hour*60 + Minute, 
                                    PositiveMinutes = to_positive(AllMinutes),
                                    FinalHour = (PositiveMinutes div 60) rem 24,
                                    FinalMinute = PositiveMinutes rem 60,
                                    {clock, FinalHour, FinalMinute}.

to_positive(PossiblyNegativeMinutes) -> case PossiblyNegativeMinutes < 0 of
                                          true -> to_positive(PossiblyNegativeMinutes + 24*60);
                                          false -> PossiblyNegativeMinutes
                                        end.
