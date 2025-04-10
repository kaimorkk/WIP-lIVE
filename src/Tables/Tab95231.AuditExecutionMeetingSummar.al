
table 95231 "Audit Execution Meeting Summar"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Engagement ID"; Code[20])
        {
        }
        field(4; "Agenda Code"; Code[20])
        {
            TableRelation = "Audit Execution Meeting Agenda"."Agenda Code";
        }
        field(5; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "Item Discussed"; Text[2048])
        {
        }
        field(7; "Summary Notes"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Agenda Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

