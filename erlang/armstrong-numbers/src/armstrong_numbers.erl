-module(armstrong_numbers).

-export([is_armstrong_number/1]).


is_armstrong_number(Number) -> Length = length(integer_to_list(Number)), 
                               trunc(calculate(Number, Length)) =:= Number.

calculate(0, _) -> 0;
calculate(Number, Power) -> math:pow(Number rem 10, Power) + calculate(Number div 10, Power).
