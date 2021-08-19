using System;
using System.Collections;
using System.Collections.Generic;

public static class MatchingBrackets
{
    private static Dictionary<char, char> brackets = new Dictionary<char, char>() {
        {')', '('}, {']', '['}, {'}', '{'}
    };

    public static bool IsPaired(string input)
    {
        if (input.Length == 0) {
            return true;
        }

        Stack<char> theStack = new Stack<char>();
        foreach (char oneChar in input) {
            if (IsOpen(oneChar)) {
                theStack.Push(oneChar);
            } else if (IsClose(oneChar)) {
                if (theStack.Count == 0) {
                    return false;
                }
                char possibleOpen = theStack.Pop();
                if (!Matches(possibleOpen, oneChar)) {
                    return false;
                } 
            }
        }

        return theStack.Count == 0;
    }

    private static bool IsOpen(char c) {
        return brackets.ContainsValue(c);
    }

    private static bool IsClose(char c) {
        return brackets.ContainsKey(c);
    }

    private static bool Matches(char open, char close) {
        return brackets.ContainsValue(open) && brackets[close] == open;
    }
}
