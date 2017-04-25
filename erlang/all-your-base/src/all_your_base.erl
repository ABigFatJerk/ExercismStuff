-module(all_your_base).
-export([test_version/0, convert/3]).

test_version() -> 1.

convert(_, SourceBase, _) when SourceBase =< 1 -> {error, invalid_src_base};
convert(_, _, TargetBase) when TargetBase =< 1 -> {error, invalid_dst_base};
convert(Powers, SourceBase, TargetBase) -> case lists:any(fun (X) -> X < 0 end, Powers) of
                                             true -> {error, negative};
                                             false -> case lists:any(fun (Y) -> Y >= SourceBase end, Powers) of
                                                        true -> {error, not_in_base};
                                                        false -> valid_convert(Powers, SourceBase, TargetBase)
                                                      end
                                           end.

valid_convert(Powers, SourceBase, TargetBase) -> Decimal = to_decimal(Powers, SourceBase), to_target(Decimal, TargetBase).

to_decimal(Powers, SourceBase) -> lists:foldl(fun (X, Acc) -> Acc*SourceBase + X end, 0, Powers).

to_target(0, _) -> {ok, []};
to_target(Decimal, TargetBase) -> {ok, to_target(Decimal, TargetBase, [])}.
to_target(Decimal, TargetBase, Acc) when Decimal div TargetBase =:= 0 -> Rem = Decimal rem TargetBase, [Rem|Acc];
to_target(Decimal, TargetBase, Acc) -> Div = Decimal div TargetBase, Rem = Decimal rem TargetBase, to_target(Div, TargetBase, [Rem|Acc]).
