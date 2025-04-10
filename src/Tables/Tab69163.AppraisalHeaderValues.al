
table 69163 "Appraisal Header Values"
{
    DrillDownPageID = "OSH Legal Instrument";
    LookupPageID = "OSH Legal Instrument";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Appraisal Header"; Text[50])
        {
            TableRelation = "Appraisal Format Header";
        }
        field(2; Value; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Appraisal Header", Value)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

