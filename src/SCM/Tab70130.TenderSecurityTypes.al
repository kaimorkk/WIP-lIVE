
table 70130 "Tender Security Types"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Security Type"; Option)
        {
            OptionCaption = 'Bid/Tender Security,Performance/Contract Security,Advance Payment Security';
            OptionMembers = "Bid/Tender Security","Performance/Contract Security","Advance Payment Security";
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Nature of Security"; Option)
        {
            OptionCaption = 'Monetary,Non-Monetary';
            OptionMembers = Monetary,"Non-Monetary";
        }
        field(5; "No. of Filed Securities"; Decimal)
        {
        }
        field(6; "Filed Securities Value (LCY)"; Decimal)
        {
        }
        field(7; "No. of Forfeited Securities"; Decimal)
        {
        }
        field(8; "Forfeited Securities Value LCY"; Decimal)
        {
            Description = 'Forfeited Securities Value (LCY)';
        }
        field(9; "No. of Released Securities"; Decimal)
        {
        }
        field(10; "Released Securities Value LCY"; Decimal)
        {
            Description = 'Released Securities Value (LCY)';
        }
        field(11; BLocked; Boolean)
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

