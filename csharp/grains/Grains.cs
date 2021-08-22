using System;
using System.Linq;

public static class Grains
{
    public static ulong Square(int n)
    {
        if (n < 1 || n > 64) {
            throw new ArgumentOutOfRangeException("nope");
        }
        return (ulong)Math.Pow(2, n-1);
    }

    public static ulong Total()
    {
        ulong result = 0;
        // Would have been nice to use .Sum but that's not defined for ulong
        foreach (ulong sq in Enumerable.Range(1, 64).Select(x => Square(x))) {
            result += sq;
        }

        return result;
    }
}