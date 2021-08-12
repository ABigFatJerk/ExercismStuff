using System;

public static class Leap
{
    public static bool IsLeapYear(int year)
    {
        if (Divisible(year, 400)) {
            return true;
        } else if (Divisible(year, 100)) {
            return false;
        } else if (Divisible(year, 4)) {
            return true;
        }
        return false;
    }

    private static bool Divisible(int val1, int val2) {
        return (val1 % val2) == 0;
    }
}