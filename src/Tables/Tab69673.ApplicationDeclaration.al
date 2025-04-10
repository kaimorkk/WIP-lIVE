
table 69673 "Application Declaration"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Declaration Statement"; Text[500])
        {
        }
        field(4; "Candidate Accepted"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Application No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

