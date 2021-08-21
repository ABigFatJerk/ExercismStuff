using System;
using System.Linq;
using System.Collections.Generic;

public static class SumOfMultiples
{
    public static int Sum(IEnumerable<int> multiples, int max)
    {
        IList<int> matches = new List<int>();
        for (int i = 1; i < max; i++) {
            if (IsMultiple(i, multiples)) {
                matches.Add(i);
            }
        }
        return matches.Sum();
    }

    private static bool IsMultiple(int number, IEnumerable<int> numbersToTest) {
        return numbersToTest.Any(x => x > 0 && number % x == 0);
    }
}