-module(allergies).
-export([test_version/0, allergies/1, is_allergic_to/2]).

-define(ALLERGENS, ['eggs', 'peanuts', 'shellfish', 'strawberries', 'tomatoes', 'chocolate', 'pollen', 'cats']).

test_version() -> 1.

allergies(AllergyNumber) -> {_, Allergies} = lists:foldl(fun check_allergy/2, {AllergyNumber, []}, ?ALLERGENS), lists:reverse(Allergies).

is_allergic_to(Allergen, AllergyNumber) -> lists:member(Allergen, allergies(AllergyNumber)).

check_allergy(Allergen, {AllergyNumber, Allergies}) -> Div = AllergyNumber div 2, 
                                                       case AllergyNumber rem 2 of
                                                            0 -> {Div, Allergies};
                                                            1 -> {Div, [Allergen|Allergies]}
                                                       end.
