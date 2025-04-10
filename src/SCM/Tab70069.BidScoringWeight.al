
table 70069 "Bid Scoring Weight"
{
    // DrillDownPageID = "Grant Types List";
    // LookupPageID = "Grant Types List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Bid Scoring Template ID"; Code[20])
        {
        }
        field(2; "Score Section ID"; Code[20])
        {
        }
        field(3; "Total Weight %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Bid Scoring Template ID", "Score Section ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

