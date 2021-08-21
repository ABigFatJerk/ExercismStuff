using System;
using System.Linq;

public static class ReverseString
{
    public static string Reverse(string input)
    {
        string result = "";
        foreach (char c in input.Reverse<char>()) {
            result += c;
        }

        return result;
    }
}