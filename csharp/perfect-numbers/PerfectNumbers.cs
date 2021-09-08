using System;
using System.Collections.Generic;
using System.Linq;

public enum Classification
{
    Perfect,
    Abundant,
    Deficient
}

public static class PerfectNumbers
{
    public static Classification Classify(int number)
    {
        if (number <= 0)
        {
            throw new ArgumentOutOfRangeException("blah");
        }

        int sum = FindFactors(number).Sum();

        if (sum < number)
        {
            return Classification.Deficient;
        } 
        else if (sum == number)
        {
            return Classification.Perfect;
        }
        else
        {
            return Classification.Abundant;
        }
    }

    private static IEnumerable<int> FindFactors(int number)
    {
        return Enumerable.Range(1, number-1).Where(x => number % x == 0);
    }
}
