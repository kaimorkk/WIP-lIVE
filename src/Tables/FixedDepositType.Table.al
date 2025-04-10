Table 52193493 "Fixed Deposit Type"
{
    DrillDownPageID = "Fixed Deposit Type list";
    LookupPageID = "Fixed Deposit Type list";

    fields
    {
        field(1;"Code";Code[30])
        {
            NotBlank = true;
        }
        field(2;Duration;DateFormula)
        {
        }
        field(3;Description;Text[50])
        {
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

