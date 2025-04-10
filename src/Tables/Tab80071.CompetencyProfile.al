
table 80071 "Competency Profile"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[30])
        {
        }
        field(2; Description; Code[200])
        {
        }
        field(3; "Job Title"; Text[100])
        {
        }
        field(4; "Job Grade"; Code[50])
        {
        }
        field(5; "Responsibility Center"; Code[100])
        {
        }
        field(6; "Effective Date"; Date)
        {
        }
        field(7; "Competency Rating Scale"; Code[100])
        {
        }
        field(8; "General Instructions"; Text[100])
        {
        }
        field(9; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

