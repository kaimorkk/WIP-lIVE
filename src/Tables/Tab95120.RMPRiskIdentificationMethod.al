
table 95120 "RMP Risk Identification Method"
{
    DrillDownPageID = "RMP Risk Identifictn Methods";
    LookupPageID = "RMP Risk Identifictn Methods";
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
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Risk Identification Method"; Code[50])
        {
        }
        field(5; Description; Text[2048])
        {
        }
        field(6; "Start Date"; Date)
        {
        }
        field(7; "End Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

