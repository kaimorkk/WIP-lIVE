
table 95121 "RMP Role"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Code"; Code[20])
        {
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Executive Summary"; Text[2048])
        {
        }
        field(6; "Risk Management Team"; Integer)
        {
        }
        field(7; "Project Team (Internal Staff)"; Integer)
        {
            Description = 'Project Team (Internal Staff)';
        }
        field(8; "Project Team(Contractor Staff)"; Integer)
        {
            Description = 'Project Team(Contractor Staff)';
        }
        field(9; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

