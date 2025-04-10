
/// <summary>
/// Table w (ID 80210).
/// </summary>
table 80210 w
{
    DrillDownPageID = "BR Option Text Response Type";
    LookupPageID = "BR Option Text Response Type";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[200])
        {
        }
        field(3; "Rating Type"; Option)
        {
            OptionCaption = 'Number,Yes/No,Options Text';
            OptionMembers = Number,"Yes/No","Options Text";
        }
        field(4; "Score (%)"; Decimal)
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

