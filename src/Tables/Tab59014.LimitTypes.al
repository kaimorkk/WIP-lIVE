
table 59014 "Limit Types"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Upper Limit"; Decimal)
        {
        }
        field(2; "Lower Limit"; Decimal)
        {
        }
        field(3; "Code"; Code[50])
        {
        }
        field(4; "Request Duration"; DateFormula)
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

