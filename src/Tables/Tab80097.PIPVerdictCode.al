
table 80097 "PIP Verdict Code"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; "PIP Performance Outcome"; Option)
        {
            OptionCaption = 'Positive Performance,Negative Performance';
            OptionMembers = "Positive Performance","Negative Performance";
        }
        field(4; Blocked; Boolean)
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

