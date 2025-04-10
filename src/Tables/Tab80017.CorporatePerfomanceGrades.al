
table 80017 "Corporate Perfomance Grades"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; "Min Score (%) Per. Contract"; Decimal)
        {
        }
        field(4; "Max Score (%) Per. Contract"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

