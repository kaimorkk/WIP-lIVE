
table 69667 "Application Req.  Evidence"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Application No."; Code[30])
        {
        }
        field(2; "Vacancy No."; Code[30])
        {
        }
        field(3; "Requirement ID"; Integer)
        {
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Remarks/Evidence/Comment"; Text[800])
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

