using System;
using System.Collections.Generic;
using System.Linq;

public class HighScores
{
    private List<int> scores = new List<int>();

    public HighScores(List<int> list)
    {
        this.scores.AddRange(list);
    }

    public List<int> Scores()
    {
        return this.scores.ToList<int>();
    }

    public int Latest()
    {
        return this.scores.Last();
    }

    public int PersonalBest()
    {
        return this.scores.Max();
    }

    public List<int> PersonalTopThree()
    {
        List<int> result = new List<int>();

        List<int> scoreCopy = this.scores.ToList();
        for (int i = 0; i <= 2; i++) {
            if (scoreCopy.Count() > 0) {
                int maxLeft = scoreCopy.Max();
                scoreCopy.Remove(maxLeft);
                result.Add(maxLeft);
            }
        }

        return result;
    }
}