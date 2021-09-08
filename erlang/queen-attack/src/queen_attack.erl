-module(queen_attack).

-export([can_attack/2]).

% A queen is a tuple of {xPos, yPos}
can_attack({X1, _Y1}, {X2, _Y2}) when X1 == X2 -> true;
can_attack({_X1, Y1}, {_X2, Y2}) when Y1 == Y2 -> true;
can_attack({X1, Y1}, {X2, Y2}) when abs(X2-X1) == abs(Y2-Y1) -> true;
can_attack(_, _) -> false.
