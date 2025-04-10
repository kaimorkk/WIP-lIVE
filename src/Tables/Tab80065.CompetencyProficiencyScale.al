
table 80065 "Competency Proficiency Scale"
{
    DrillDownPageID = "Competency Proficiency Scales";
    LookupPageID = "Competency Proficiency Scales";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[200])
        {
        }
        field(3; "Competency Scoring Mode"; Option)
        {
            OptionCaption = 'Weighted Performance,Weighted Proficiency';
            OptionMembers = "Weighted Performance","Weighted Proficiency";
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; Blocked; Boolean)
        {
        }
        field(6; "Created By"; Code[50])
        {
        }
        field(7; "Created On"; Date)
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

