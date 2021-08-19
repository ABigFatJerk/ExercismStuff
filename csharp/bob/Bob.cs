using System;
using System.Linq;

public static class Bob
{
    private static string SILENCE_RESPONSE = "Fine. Be that way!";
    private static string Q_SHOUT_RESPONSE = "Calm down, I know what I'm doing!";
    private static string Q_RESPONSE = "Sure.";
    private static string SHOUT_RESPONSE = "Whoa, chill out!";
    private static string DEFAULT_RESPONSE = "Whatever.";

    public static string Response(string statement)
    {
        if (IsSilence(statement)) {
            return SILENCE_RESPONSE;
        }

        if (IsQuestion(statement) && IsShout(statement)) {
            return Q_SHOUT_RESPONSE;
        }

        if (IsQuestion(statement)) {
            return Q_RESPONSE;
        }

        if (IsShout(statement)) {
            return SHOUT_RESPONSE;
        }

        return DEFAULT_RESPONSE;
    }

    private static bool IsQuestion(string statement) {
        return statement.TrimEnd().EndsWith("?");
    }

    private static bool IsShout(string statement) {
        return statement.Any(c => char.IsLetter(c)) && !statement.Any(c => char.IsLower(c));
    }

    private static bool IsSilence(string statement) {
        return statement.Trim().Equals("");
    }
}