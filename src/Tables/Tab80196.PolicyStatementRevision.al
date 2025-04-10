
table 80196 "Policy Statement Revision"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
        }
        field(2; "Area"; Code[30])
        {
        }
        field(3; "Line No"; Integer)
        {
        }
        field(4; "Policy Statement"; Text[255])
        {
        }
        field(5; "Revision No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Area", "Line No", "Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

