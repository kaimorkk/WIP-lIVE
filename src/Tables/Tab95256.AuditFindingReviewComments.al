table 95256 "Audit Finding Review Comments"
{
    Caption = 'Audit Finding Review Comments';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; "Finding ID"; Integer)
        {
            Caption = 'Finding ID';
            TableRelation = "Audit Execution Finding"."Finding ID";
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(4; Description; Text[2048])
        {
            Caption = 'Description';
        }
        field(5; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(6; "Engagement ID"; Code[20])
        {
            TableRelation = "Audit Execution Finding"."Engagement ID";
        }
        field(7; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Execution Finding"."Checklist ID";
        }
    }
    keys
    {
        key(PK; "Code","Finding ID","Document No.","Document Type","Engagement ID","Checklist ID")
        {
            Clustered = true;
        }
    }
}
