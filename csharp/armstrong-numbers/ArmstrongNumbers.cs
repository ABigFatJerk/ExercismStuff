using System;
using System.Collections.Generic;
using System.Linq;

public static class ArmstrongNumbers
{
    public static bool IsArmstrongNumber(int number)
    {
        IEnumerable<int> digits = Convert(number);
        return number == digits.Select(x => (int)Math.Pow(x, digits.Count())).Sum();

        // Alternate solution that doesn't need the Convert function but needs lots of type conversion
        // string numberStr = number.ToString();
        // return number == numberStr.Select(x => (int)Math.Pow(int.Parse(x.ToString()), numberStr.Length)).Sum();
    }

    private static IEnumerable<int> Convert(int number) {
        List<int> result = new List<int>();

        while (number > 0) {
            result.Add(number % 10);
            number /= 10;
        }

        return result;
    }
}