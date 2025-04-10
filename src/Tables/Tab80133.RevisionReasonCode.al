
table 80133 "Revision Reason Code"
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
        field(3; "Revision Type"; Option)
        {
            OptionCaption = 'Minor Revision,Major Revision';
            OptionMembers = "Minor Revision","Major Revision";
        }
        field(4; "No. of Policies"; Integer)
        {
        }
        field(5; Blocked; Boolean)
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

