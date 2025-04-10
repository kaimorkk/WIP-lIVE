
table 69145 "Appraisal Periods"
{
    DrillDownPageID = "Rating Scales";
    LookupPageID = "Rating Scales";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Period; Code[30])
        {
            NotBlank = true;
        }
        field(2; Comments; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; Period)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

