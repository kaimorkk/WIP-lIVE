
table 80077 "Appraisal Questionnaire Temp"
{
    DrillDownPageID = "Appraisal Questionnaire Temp";
    LookupPageID = "Appraisal Questionnaire Temp";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[255])
        {
        }
        field(3; "Template Category"; Option)
        {
            OptionCaption = 'General Assessment,360-Degree Peer Review';
            OptionMembers = "General Assessment","360-Degree Peer Review";
        }
        field(4; "General Instructions"; Text[255])
        {
        }
        field(5; "Global?"; Boolean)
        {
        }
        field(6; "Primary Responsibility Center"; Code[50])
        {
            TableRelation = "Responsibility Center";
        }
        field(7; "Effective Date"; Date)
        {
        }
        field(8; Blocked; Boolean)
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

