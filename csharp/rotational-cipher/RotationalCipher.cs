using System;

public static class RotationalCipher
{
    static int CAP_A_ASCII = (int)'A';
    static int LOWER_A_ASCII = (int)'a';

    public static string Rotate(string text, int shiftKey)
    {
        string result = "";

        foreach (char c in text) {
            char newChar = RotateChar(c, shiftKey);
            result += newChar;
        }

        return result;
    }

    private static char RotateChar(char c, int distance) {
        if (!Char.IsLetter(c)) {
            return c;
        } else {
            return RotateLetter(c, distance);
        }
    }

    private static char RotateLetter(char letter, int distance) {
        int a = Char.IsLower(letter) ? LOWER_A_ASCII : CAP_A_ASCII;
        int place = (int)letter - a;
        int transform = (place + distance) % 26;
        char newChar = (char)(transform + a);

        return newChar;
    }
}