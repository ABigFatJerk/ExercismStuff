﻿using System;

public static class TwoFer
{
    // In order to get the tests running, first you need to make sure the Speak method 
    // can be called both without any arguments and also by passing one string argument.
    public static string Speak()
    {
        return Speak("you");
    }

    public static string Speak(string who) {
        return "One for " + who + ", one for me.";
    }
}
