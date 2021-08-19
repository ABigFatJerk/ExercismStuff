using System;

public class Clock
{
    private static int MINUTES_IN_DAY = 24*60;
    private int hours, minutes;
    public Clock(int hours, int minutes)
    {
        this.hours = hours;
        this.minutes = minutes;
        Normalize();
    }

    public Clock Add(int minutesToAdd)
    {
        int newMinutes = TotalMinutes() + minutesToAdd;
        Clock result = new Clock(0, newMinutes);
        return result;
    }

    public Clock Subtract(int minutesToSubtract)
    {
        return Add(-minutesToSubtract);
    }

    private void Normalize() {
        int totalMinutes = TotalMinutes();
        while (totalMinutes < 0) {
            totalMinutes += MINUTES_IN_DAY;
        }
        while (totalMinutes >= MINUTES_IN_DAY) {
            totalMinutes -= MINUTES_IN_DAY;
        }
        this.hours = totalMinutes / 60;
        this.minutes = totalMinutes % 60;
    }

    private int TotalMinutes() {
        return this.hours * 60 + this.minutes;
    }

    public override string ToString() {
       return this.hours.ToString("D2") + ":" + this.minutes.ToString("D2");
    }

    public override bool Equals(object obj)
    {
        if (obj == null || GetType() != obj.GetType())
        {
            return false;
        }

        Clock otherClock = (Clock)obj;

        return this.hours == otherClock.hours && this.minutes == otherClock.minutes;
    }
    
    public override int GetHashCode()
    {
        return base.GetHashCode();
    }
}
