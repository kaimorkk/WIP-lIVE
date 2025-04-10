
table 95229 "Audit Execution Meeting Agenda"
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
        }
        field(5; "Agenda Description"; Text[2048])
        {
        }
        field(6; "Estimate Time (Minutes)"; Integer)
        {
        }
        field(7; "No. of Discussed Items"; Integer)
        {
            CalcFormula = count("Audit Execution Meeting Summar" where("Agenda Code" = field("Agenda Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Agenda Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

