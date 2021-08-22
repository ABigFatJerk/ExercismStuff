using System;

public static class Raindrops
{
    public static string Convert(int number)
    {
        string pling = Plxng(number, 3, "Pling");
        string plang = Plxng(number, 5, "Plang");
        string plong = Plxng(number, 7, "Plong");
        string result = pling + plang + plong;

        return result.Length == 0 ? number.ToString() : result;
    }

    private static string Plxng(int number, int div, string sound) {
        return number % div == 0 ? sound : "";
    }

}