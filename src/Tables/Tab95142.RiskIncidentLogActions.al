
table 95142 "Risk Incident Log Actions"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Incident ID"; Code[20])
        {
        }
        field(2; "Action Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(4; Description; Text[300])
        {
        }
        field(5; "Action Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(6; "% Complete"; Decimal)
        {
        }
        field(7; "Actual Date Done"; Date)
        {
        }
        field(8; "Responsible Officer No."; Code[20])
        {
            TableRelation = Resource."No.";
        }
        field(9; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(10; "Planned Start Date"; Date)
        {
        }
        field(11; "Planned Due Date"; Date)
        {
        }
        field(12; Comments; Text[300])
        {
        }
    }

    keys
    {
        key(Key1; "Incident ID", "Action Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

