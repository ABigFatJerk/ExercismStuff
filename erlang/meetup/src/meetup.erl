-module(meetup).
-export([test_version/0, schedule/4]).

test_version() -> 1.

% DayOfWeek will be one of: monday, tuesday, wednesday, etc.
% Qualifier will be one of: teenth, first, second, third, fourth, last
schedule(Year, Month, DayOfWeek, Qualifier) -> DaysInMonth = calendar:last_day_of_the_month(Year, Month),
                                               AllDatesInMonth = [{Year, Month, Day} || Day <- lists:seq(1, DaysInMonth)],
                                               MatchingWeekdays = lists:filter(fun (Date) -> calendar:day_of_the_week(Date) =:= weekday(DayOfWeek) end, AllDatesInMonth),
                                               qualifies(Qualifier, MatchingWeekdays).

weekday(monday) -> 1;
weekday(tuesday) -> 2;
weekday(wednesday) -> 3;
weekday(thursday) -> 4;
weekday(friday) -> 5;
weekday(saturday) -> 6;
weekday(sunday) -> 7.

qualifies(teenth, Candidates) -> [Teenth] = lists:filter(fun ({Y, M, D}) -> D >= 13 andalso D =< 19 end, Candidates), Teenth;
qualifies(first, Candidates) -> lists:nth(1, Candidates);
qualifies(second, Candidates) -> lists:nth(2, Candidates);
qualifies(third, Candidates) -> lists:nth(3, Candidates);
qualifies(fourth, Candidates) -> lists:nth(4, Candidates);
qualifies(last, Candidates) -> lists:last(Candidates).
