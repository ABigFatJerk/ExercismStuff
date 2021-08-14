using System;
using System.Collections.Generic;

public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        IDictionary<char, int> result = new Dictionary<char, int>() {
            {'A', 0}, {'C', 0}, {'G', 0}, {'T', 0}
        };

        foreach (char oneChar in sequence) {
            if (!result.ContainsKey(oneChar)) {
                throw new ArgumentException("Not a nucleotide bro");
            }
            result[oneChar]++;
        }

        return result;
    }
}