using System;
using System.Collections.Generic;
using System.Linq;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        // Pangram = The size of the set of lowercase letters in the input is 26
        return new HashSet<char>(input.ToLower().Where(c => char.IsLetter(c))).Count == 26;
    }
}
