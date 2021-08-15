using System.Linq;
using System.Collections.Generic;

public enum Allergen
{
    Eggs,  // 1
    Peanuts,  // 2
    Shellfish,  // 4
    Strawberries, // 8
    Tomatoes,  // 16
    Chocolate,  // 32
    Pollen,  // 64
    Cats  // 128
}

public class Allergies
{

    private Dictionary<Allergen, bool> allergies = new Dictionary<Allergen, bool>();

    public Allergies(int mask) {
        int maskCopy = mask;
        foreach (Allergen allergen in Allergen.GetValues(typeof(Allergen))) {
            CheckAllergy(maskCopy, allergen);
            maskCopy /= 2;
        }
    }

    private void CheckAllergy(int mask, Allergen allergen) {
        if (mask % 2 == 1) {
            allergies[allergen] = true;
        }
    }

    public bool IsAllergicTo(Allergen allergen)
    {
        return allergies.ContainsKey(allergen) && allergies[allergen];
    }

    public Allergen[] List()
    {
        return allergies.Keys.ToArray();
    }
}