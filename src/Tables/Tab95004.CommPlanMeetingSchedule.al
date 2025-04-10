
table 95004 "Comm Plan Meeting Schedule"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; Category; Option)
        {
            OptionCaption = ' ,Meeting,Status Report';
            OptionMembers = " ",Meeting,"Status Report";
        }
        field(4; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Meeting ID"; Integer)
        {
        }
        field(6; "Communication Type"; Code[20])
        {
        }
        field(7; Description; Text[250])
        {
        }
        field(8; Frequency; Option)
        {
            OptionCaption = ' ,None,Once,Weekly,Monthly,Quarterly,Half-Yearly,Yearly';
            OptionMembers = " ","None",Once,Weekly,Monthly,Quarterly,"Half-Yearly",Yearly;
        }
        field(9; "Meeting Medium"; Option)
        {
            OptionCaption = ' ,Face to Face,Online';
            OptionMembers = " ","Face to Face",Online;
        }
        field(10; "Primary Owner"; Code[20])
        {
        }
        field(11; "Planned Meeting Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", Category, "Meeting ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

