using System;
using System.Collections.Generic;

public class GradeSchool
{
    private Dictionary<int, List<string>> roster = new Dictionary<int, List<string>>();

    public void Add(string student, int grade)
    {
        if (!roster.ContainsKey(grade)) {
            roster[grade] = new List<string>();
        }
        roster[grade].Add(student);
    }

    public IEnumerable<string> Roster()
    {
        List<string> result = new List<string>();

        List<int> grades = new List<int>(roster.Keys);
        grades.Sort();

        foreach (int grade in grades) {
            List<string> students = roster[grade];
            students.Sort();
            result.AddRange(students);
        }

        return result;
    }

    public IEnumerable<string> Grade(int grade)
    {
        if (!roster.ContainsKey(grade)) {
            return new List<string>();
        }

        List<string> result = new List<string>(roster[grade]);
        result.Sort();

        return result;
    }
}