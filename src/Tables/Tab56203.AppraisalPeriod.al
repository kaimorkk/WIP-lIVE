
table 56203 "Appraisal  Period"
{
    DrillDownPageID = "Appraisal Period";
    LookupPageID = "Appraisal Period";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Period; Code[20])
        {
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

