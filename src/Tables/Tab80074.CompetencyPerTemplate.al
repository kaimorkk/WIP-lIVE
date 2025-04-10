
table 80074 "Competency Per Template"
{
    DrillDownPageID = "Competency Performance Temps";
    LookupPageID = "Competency Performance Temps";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Competency Proficiency Scale"; Code[100])
        {
        }
        field(4; "Competency Scoring Model"; Option)
        {
            OptionCaption = 'Weighted Performance,Weighted Proficiency';
            OptionMembers = "Weighted Performance","Weighted Proficiency";
        }
        field(5; "General Instructions"; Text[255])
        {
        }
        field(6; "Global?"; Boolean)
        {
        }
        field(7; "Primary Responsibility Center"; Code[100])
        {
            TableRelation = "Responsibility Center";
        }
        field(8; "Job Title"; Code[100])
        {
        }
        field(9; "Job Grade"; Code[100])
        {
        }
        field(10; "Effective Date"; Date)
        {
        }
        field(11; Blocked; Boolean)
        {
        }
        field(12; "Total Assigned Weight %"; Decimal)
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

