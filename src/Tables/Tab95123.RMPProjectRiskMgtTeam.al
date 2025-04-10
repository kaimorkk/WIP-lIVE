
table 95123 "RMP Project Risk Mgt Team"
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
        field(3; "Work Execution Plan ID"; Code[20])
        {
        }
        field(4; "Role Code"; Code[20])
        {
        }
        field(5; "Project Staff Type"; Option)
        {
            OptionCaption = ' ,Internal/Inhouse Staff,Contractor Staff';
            OptionMembers = " ","Internal/Inhouse Staff","Contractor Staff";
        }
        field(6; "Staff No."; Code[20])
        {
        }
        field(7; Name; Text[100])
        {
        }
        field(8; Telephone; Code[20])
        {
        }
        field(9; Email; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Work Execution Plan ID", "Role Code", "Project Staff Type", "Staff No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

