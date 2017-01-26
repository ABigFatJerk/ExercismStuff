-module(gigasecond).
-export([from/1]).

from(Date = {_, _, _}) -> from({Date, {0, 0, 0}});
from(Datetime = {{_, _, _}, {_, _, _}}) -> calendar:gregorian_seconds_to_datetime(calendar:datetime_to_gregorian_seconds(Datetime) + 1000000000).
