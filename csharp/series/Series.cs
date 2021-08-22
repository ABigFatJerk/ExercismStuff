using System;

public static class Series
{
    public static string[] Slices(string numbers, int sliceLength)
    {
        if (sliceLength > numbers.Length) {
            throw new ArgumentException("No");
        }

        if (sliceLength <= 0) {
            throw new ArgumentException("Nope");
        }

        if (numbers.Length <= 0) {
            throw new ArgumentException("Wo way");
        }

        int resultCount = numbers.Length - sliceLength + 1;
        string[] result = new string[resultCount];

        for (int i = 0; i < resultCount; i++) {
            string oneSlice = numbers.Substring(i, sliceLength);
            result[i] = oneSlice;
        }

        return result;
    }
}