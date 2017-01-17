-module(space_age).
-export([ageOn/2]).

% Seconds per solar year:
% Earth:    31557600 seconds
% Mercury:  0.2408467 x earth
% Venus:    0.61519726 x earth
% Mars:     1.8808158 x earth
% Jupiter:  11.862615 x earth
% Saturn :  29.447498 x earth
% Uranus:  84.016846 x earth
% Neptune:   164.79132 x earth

% Obviously some kind of erlang equivalent to a static map, plus constants would be far more readable.

ageOn(earth, Seconds) -> Seconds / 31557600;
ageOn(mercury, Seconds) -> Seconds / (0.24084726 * 31557600);
ageOn(venus, Seconds) -> Seconds / (0.61519726 * 31557600);
ageOn(mars, Seconds) -> Seconds / (1.8808158 * 31557600);
ageOn(jupiter, Seconds) -> Seconds / (11.862615 * 31557600);
ageOn(saturn, Seconds) -> Seconds / (29.447498 * 31557600);
ageOn(uranus, Seconds) -> Seconds / (84.016846 * 31557600);
ageOn(neptune, Seconds) -> Seconds / (164.79132 * 31557600).
