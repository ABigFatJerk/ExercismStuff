using System;
using System.Collections.Generic;

public static class Etl
{
    public static Dictionary<string, int> Transform(Dictionary<int, string[]> old)
    {
        Dictionary<string, int> result = new Dictionary<string, int>();

        foreach (KeyValuePair<int, string[]> entry in old) {
            int points = entry.Key;
            foreach (string letter in entry.Value) {
                result[letter.ToLower()] = points;
            }
        }

        return result;
    }
}