
table 69161 "Appraisal Performance"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Integer)
        {
        }
        field(2; Competence; Text[50])
        {
        }
        field(3; "Appraisers Remarks"; Text[250])
        {
        }
        field(4; "Appraisee Remarks"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

