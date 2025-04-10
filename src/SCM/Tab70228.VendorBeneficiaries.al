
table 70228 "Vendor Beneficiaries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Name; Text[250])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = 'Director,Shareholder';
            OptionMembers = Director,Shareholder;
        }
        field(4; "ID Type"; Option)
        {
            OptionCaption = 'National ID,Passport';
            OptionMembers = "National ID",Passport;
        }
        field(5; "ID/Passport No."; Code[50])
        {
        }
        field(6; "Phone No."; Integer)
        {
        }
        field(7; Email; Text[50])
        {
        }
        field(8; "Allocated Shares"; Decimal)
        {
        }
        field(9; "Vendor No."; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

