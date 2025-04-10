
table 69603 "Positions Responsibility"
{
    DrillDownPageID = "Position Responsibilities";
    LookupPageID = "Position Responsibilities";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[700])
        {
        }
        field(4; Category; Text[250])
        {
        }
        field(5; Type; Option)
        {
            OptionCaption = 'Responsibility,Job Dimensions';
            OptionMembers = Responsibility,"Job Dimensions";
        }
    }

    keys
    {
        key(Key1; "Position ID", "Line No", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

