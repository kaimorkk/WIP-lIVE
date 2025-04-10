
table 95168 "Audit Finding Rating Code"
{
    DrillDownPageID = "Audit Finding Rating Codes";
    LookupPageID = "Audit Finding Rating Codes";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2048])
        {
        }
        field(3; "No. of Audit Findings"; Integer)
        {
        }
        field(4; Blocked; Boolean)
        {
        }
        field(5; "Risk Heat Zone"; Option)
        {
            OptionCaption = ' ,Green,Yellow,Red';
            OptionMembers = " ",Green,Yellow,Red;
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

