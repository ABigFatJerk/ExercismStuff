using System;
using System.Collections.Generic;
using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var normalizedWord = word.ToLower().Where(c => char.IsLetter(c));
        return new HashSet<char>(normalizedWord).Count == normalizedWord.Count();
    }
}
