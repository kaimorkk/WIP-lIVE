
table 69238 "HR Absence Preferences"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Include Weekends"; Boolean)
        {
        }
        field(2; "Include Holidays"; Boolean)
        {
        }
        field(3; "Year-Start Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Include Weekends", "Include Holidays")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

