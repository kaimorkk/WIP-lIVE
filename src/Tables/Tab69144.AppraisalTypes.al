
table 69144 "Appraisal Types"
{
    DrillDownPageID = "Category Rating Scale";
    LookupPageID = "Category Rating Scale";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[150])
        {
            NotBlank = true;
        }
        field(3; "Use Template"; Boolean)
        {
        }
        field(4; "Template Link"; Text[200])
        {
        }
        field(5; Remarks; Text[250])
        {
        }
        field(6; "Max. Weighting"; Decimal)
        {
        }
        field(7; "Max. Score"; Decimal)
        {
        }
        field(8; "Minimum Job Group"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
        field(9; "Maximum Job Group"; Code[10])
        {
            TableRelation = "Salary Scales";
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

