
table 69228 "HR Job Qualifications"
{
    Caption = 'HR Qualifications';
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "HR Job Qualifications";
    LookupPageID = "HR Job Qualifications";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Qualification Type"; Code[50])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Qualification Type"));
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Description; Text[100])
        {
            Caption = 'Description';
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "Qualification Type", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

