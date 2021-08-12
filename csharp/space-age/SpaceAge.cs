using System;

public class SpaceAge
{
    private static double EARTH_YEAR_SECONDS = 31557600;
    private static double MERCURY_YEAR_SECONDS = EARTH_YEAR_SECONDS * 0.2408467;
    private static double VENUS_YEAR_SECONDS = EARTH_YEAR_SECONDS * 0.61519726;
    private static double MARS_YEAR_SECONDS = EARTH_YEAR_SECONDS * 1.8808158;
    private static double JUPITER_YEAR_SECONDS = EARTH_YEAR_SECONDS * 11.862615;
    private static double SATURN_YEAR_SECONDS = EARTH_YEAR_SECONDS * 29.447498;
    private static double URANUS_YEAR_SECONDS = EARTH_YEAR_SECONDS * 84.016846;
    private static double NEPTUNE_YEAR_SECONDS = EARTH_YEAR_SECONDS * 164.79132;
    private double seconds;

    public SpaceAge(int seconds)
    {
        this.seconds = (double)seconds;
    }

    public double OnEarth()
    {
        return seconds / EARTH_YEAR_SECONDS;
    }

    public double OnMercury()
    {
        return seconds / MERCURY_YEAR_SECONDS;
    }

    public double OnVenus()
    {
        return seconds / VENUS_YEAR_SECONDS;
    }

    public double OnMars()
    {
        return seconds / MARS_YEAR_SECONDS;
    }

    public double OnJupiter()
    {
        return seconds / JUPITER_YEAR_SECONDS;
    }

    public double OnSaturn()
    {
        return seconds / SATURN_YEAR_SECONDS;
    }

    public double OnUranus()
    {
        return seconds / URANUS_YEAR_SECONDS;
    }

    public double OnNeptune()
    {
        return seconds / NEPTUNE_YEAR_SECONDS;
    }
}