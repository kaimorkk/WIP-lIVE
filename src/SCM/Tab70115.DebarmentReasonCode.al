
table 70115 "Debarment Reason Code"
{
    LookupPageID = "Debarment Reason Code";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Reason Category"; Option)
        {
            OptionCaption = 'Debarment,Reinstatement';
            OptionMembers = Debarment,Reinstatement;
        }
        field(3; Description; Text[60])
        {
        }
        field(4; "No. of Vendors"; Decimal)
        {
            Description = 'Sum calcfield mapped to the Vendor Debarment Entry Table';
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

