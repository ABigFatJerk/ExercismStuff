using System;
using System.Linq;
using System.Collections.Generic;

public static class RnaTranscription
{
    private static IDictionary<char, char> rna = new Dictionary<char, char>() {
        {'G', 'C'}, {'C', 'G'}, {'A', 'U'}, {'T', 'A'}
    };

    public static string ToRna(string nucleotide)
    {
        return string.Concat(nucleotide.Select(s => rna[s]));
    }
}