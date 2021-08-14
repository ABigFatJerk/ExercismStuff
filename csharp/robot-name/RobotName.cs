using System;
using System.Collections.Generic;

public class Robot
{
    private static ISet<string> USED_NAMES = new HashSet<string>();

    private static String CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    Random random = new Random();

    private string name = null;

    public string Name
    {
        get
        {
            if (name == null) {
                name = GenerateUniqueName();
            }
            return name;
        }
    }

    public void Reset()
    {
        string oldName, newName;
        oldName = newName = name;
        while (oldName == newName) {
            newName = GenerateUniqueName();
        }
        name = newName;
        USED_NAMES.Remove(oldName);
    }

    private string GenerateUniqueName() {
        string candidate = GenerateName();
        while (USED_NAMES.Contains(candidate)) {
            candidate = GenerateName();
        }
        USED_NAMES.Add(candidate);
        return candidate;
    }

    private string GenerateName() {
        return RandomChar() + RandomChar() + RandomDigit() + RandomDigit() + RandomDigit();
    }

    private String RandomChar() {
        return CHARS[RandomInt(26)].ToString();
    }

    private String RandomDigit() {
        return RandomInt(10).ToString();
    }

    private int RandomInt(int max) {
        return random.Next(max);
    }
}