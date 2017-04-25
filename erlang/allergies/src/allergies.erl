-module(allergies).
-export([test_version/0, allergies/1, is_allergic_to/2]).

-define(ALLERGENS, [{'eggs', 1}, 
                    {'peanuts', 2}, 
                    {'shellfish', 4}, 
                    {'strawberries', 8}, 
                    {'tomatoes', 16}, 
                    {'chocolate', 32}, 
                    {'pollen', 64}, 
                    {'cats', 128}]).

test_version() -> 1.

allergies(AllergyNumber) -> [Allergen || {Allergen, AllergenCode} <- ?ALLERGENS, AllergyNumber band AllergenCode == AllergenCode].

is_allergic_to(Allergen, AllergyNumber) -> lists:member(Allergen, allergies(AllergyNumber)).

