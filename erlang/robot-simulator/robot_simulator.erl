-module(robot_simulator).
-export([create/0, direction/1, position/1, place/3, left/1, right/1, advance/1, control/2]).

% Queries
direction(Robot) -> Robot ! {direction, self()},
                    receive Direction -> Direction end.

position(Robot) -> Robot ! {position, self()},
                   receive Position -> Position end.

% Create a new Robot
create() -> spawn(fun() -> robot({undefined, {undefined, undefined}}) end).

% Robot commands
place(Robot, Direction, Position) -> Robot ! {place, Direction, Position}.

left(Robot) -> Robot ! left.

right(Robot) -> Robot ! right.

advance(Robot) -> Robot ! advance.

control(_, []) -> ok;
control(Robot, [$L|T]) -> left(Robot), control(Robot, T);
control(Robot, [$R|T]) -> right(Robot), control(Robot, T);
control(Robot, [$A|T]) -> advance(Robot), control(Robot, T);
control(Robot, [_|T]) -> control(Robot, T).

% The 'robot'
robot({Direction, {X, Y}}) -> receive
                  {place, NewDirection, {NewX, NewY}} -> robot({NewDirection, {NewX, NewY}});
                  left -> NewDirection = turn_left(Direction), robot({NewDirection, {X, Y}});
                  right -> NewDirection = turn_right(Direction), robot({NewDirection, {X, Y}});
                  advance -> NewPosition = do_advance(Direction, {X, Y}), robot({Direction, NewPosition});
                  {direction, From} -> From ! Direction, robot({Direction, {X, Y}});
                  {position, From} -> From ! {X, Y}, robot({Direction, {X, Y}})
                end.

% Transform functions
turn_left(north) -> west;
turn_left(west) -> south;
turn_left(south) -> east;
turn_left(east) -> north.
turn_right(north) -> east;
turn_right(east) -> south;
turn_right(south) -> west;
turn_right(west) -> north.
do_advance(north, {X, Y}) -> {X, Y+1};
do_advance(east, {X, Y}) -> {X+1, Y};
do_advance(south, {X, Y}) -> {X, Y-1};
do_advance(west, {X, Y}) -> {X-1, Y}.
