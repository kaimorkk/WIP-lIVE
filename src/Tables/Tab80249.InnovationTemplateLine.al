
table 80249 "Innovation Template Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; Category; Code[30])
        {
        }
        field(4; Description; Text[255])
        {
        }
        field(5; "Weighted Score %"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

