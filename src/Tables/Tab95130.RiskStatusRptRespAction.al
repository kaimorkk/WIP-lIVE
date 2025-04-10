
table 95130 "Risk Status Rpt Resp. Action"
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
        field(3; "Risk Register Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(4; "Risk Management Plan ID"; Code[20])
        {
            //  TableRelation = "Risk Management Plan"."Document No" where ("Document Type"=field("Document No"));
            TableRelation = "Risk Management Plan"."Document No";
        }
        field(5; "Risk ID"; Integer)
        {
            AutoIncrement = false;
        }
        field(6; "Action ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Activity Description"; Text[2048])
        {
        }
        field(8; "Responsible Officer No."; Code[20])
        {
            TableRelation = Resource."No.";
        }
        field(9; "Action Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(10; "Percentage Complete"; Decimal)
        {
        }
        field(11; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(12; "Planned Start Date"; Date)
        {
        }
        field(13; "Planned Due Date"; Date)
        {
        }
        field(14; "Actual Date Done"; Date)
        {
        }
        field(15; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk Register Type", "Risk Management Plan ID", "Risk ID", "Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

