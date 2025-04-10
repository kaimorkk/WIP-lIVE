
table 95133 "Risk Status Rpt Inciden Action"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Risk ID"; Integer)
        {
            AutoIncrement = false;
        }
        field(4; "Incident Line No."; Integer)
        {
        }
        field(5; "Action Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(7; "Activity Description"; Text[2048])
        {
        }
        field(8; Responsibility; Code[20])
        {
        }
        field(9; "Owner ID"; Code[20])
        {
        }
        field(10; Name; Text[100])
        {
        }
        field(11; "Planned Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID", "Incident Line No.", "Action Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

