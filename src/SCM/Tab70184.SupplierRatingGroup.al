
table 70184 "Supplier Rating Group"
{
    LookupPageID = "Supplier Rating Group";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Appraisal Template ID"; Code[20])
        {
            TableRelation = "Supplier Rating Template";
        }
        field(2; "Template Type"; Option)
        {
            OptionCaption = 'Vendor Due Diligence,Supplier Performance Review';
            OptionMembers = "Vendor Due Diligence","Supplier Performance Review";
        }
        field(3; "Criteria Group"; Code[20])
        {
            Description = 'This refers to the Criteria Group applicable in the Template. A simple scoring sheet may have 1 Group of all General criteria, generally adding upto 100%. Some appraisal/due diligence sheets may be split into different Criteria Groups e.g. Technical proposal at 80% and Financial proposal at 20%';
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Total Weight %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Appraisal Template ID", "Template Type", "Criteria Group")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

