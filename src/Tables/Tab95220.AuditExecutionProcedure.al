
table 95220 "Audit Execution Procedure"
{
    DrillDownPageID = "Audit Project Procedures";
    LookupPageID = "Audit Project Procedures";

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Audit Procedure ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Audit Objective ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(5; "No. fo Audit Checklists"; Integer)
        {
            CalcFormula = count("Audit Project Checklist" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "No. Of Reccomm Audit Test Meth"; Integer)
        {
            CalcFormula = count("Audit Checklist Test Method" where("Engagement ID" = field("Engagement ID")));
            Description = 'No. of Recommended Audit Testing Methods/Guidelines';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "No. of Business Risks"; Integer)
        {
            CalcFormula = count("Audit Project Procedure Risk" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "No. of Controls"; Integer)
        {
            CalcFormula = count("Audit Proj  Procedure Control" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(10; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

