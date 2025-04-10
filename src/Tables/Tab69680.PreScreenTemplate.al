
table 69680 "Pre-Screen Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Pre-Screening Stage"; Option)
        {
            OptionCaption = 'Application Stage,Interview-Invitation';
            OptionMembers = "Application Stage","Interview-Invitation";
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; "No. of Qns"; Integer)
        {
        }
        field(6; "Created By"; Code[30])
        {
        }
        field(7; "Created Date"; Date)
        {
        }
        field(8; "Created On"; Time)
        {
        }
        field(9; Blocked; Boolean)
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

