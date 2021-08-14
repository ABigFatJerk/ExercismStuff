using System;

public static class Hamming
{
    public static int Distance(string firstStrand, string secondStrand)
    {
        if (firstStrand.Length != secondStrand.Length) {
            throw new ArgumentException("Cannot ham up different length strings");
        }

        int hamming = 0;

        for (int i = 0; i < firstStrand.Length; i++) {
            char elem1 = firstStrand[i];
            char elem2 = secondStrand[i];
            if (elem1 != elem2) {
                hamming++;
            }
        }

        return hamming;
    }
}