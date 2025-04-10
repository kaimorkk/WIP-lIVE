
table 95122 "RMP Enterprise Risk Mgt Team"
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
        field(3; "Role Code"; Code[20])
        {
        }
        field(4; "Staff No."; Code[20])
        {
        }
        field(5; Name; Text[100])
        {
        }
        field(6; Telephone; Code[20])
        {
        }
        field(7; Email; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Role Code", "Staff No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

