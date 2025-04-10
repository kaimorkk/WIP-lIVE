Table 52194094 BudgetlinesWeeklySplits
{

    fields
    {
        field(1;BudgetlinesWeeklySplitID;Integer)
        {
            AutoIncrement = true;
        }
        field(2;JobPlanningLineNumber;Integer)
        {
        }
        field(3;StartDate;Date)
        {
        }
        field(4;EndDate;Date)
        {
        }
        field(5;WeekName;Text[100])
        {
        }
        field(6;WeeklySplitValue;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;BudgetlinesWeeklySplitID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

