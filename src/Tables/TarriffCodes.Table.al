Table 52193526 "Tarriff Codes"
{
    DrillDownPageID = "Tarriff Codes";
    LookupPageID = "Tarriff Codes";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;Percentage;Decimal)
        {
        }
        field(4;"G/L Account";Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

