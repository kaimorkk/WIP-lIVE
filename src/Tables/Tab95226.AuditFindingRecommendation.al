
table 95226 "Audit Finding Recommendation"
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
            TableRelation = "Audit Execution Finding"."Engagement ID";
        }
        field(4; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Execution Finding"."Checklist ID";
        }
        field(5; "Finding ID"; Integer)
        {
            AutoIncrement = false;
            TableRelation = "Audit Execution Finding"."Finding ID" where("Document Type" = field("Document Type"),
                                                                          "Document No." = field("Document No."),
                                                                          "Engagement ID" = field("Engagement ID"),
                                                                          "Checklist ID" = field("Checklist ID"),
                                                                          "Finding ID" = field("Finding ID"));

            trigger OnValidate()
            begin
                AuditExecutionFinding.Reset;
                AuditExecutionFinding.SetRange("Finding ID", "Finding ID");
                if AuditExecutionFinding.FindSet then
                    "Finding ID" := AuditExecutionFinding."Finding ID";
                "Finding Description" := AuditExecutionFinding.Description;
            end;
        }
        field(6; "Recommendation ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Risk Rating Code"; Code[20])
        {
            TableRelation = "Audit Finding Rating Code".Code where(Blocked = filter(false));
        }
        field(9; "Audit Procedure ID"; Integer)
        {
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where("Engagement ID" = field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectProcedure.Reset;
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Engagement ID", "Engagement ID");
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Audit Procedure ID", "Audit Procedure ID");
                if AuditProjectProcedure.FindSet then begin
                    "Audit Objective ID" := AuditProjectProcedure."Audit Objective ID";
                end;
            end;
        }
        field(10; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(11; "Dimension Set ID"; Integer)
        {
        }
        field(12; "Finding Description"; Text[2048])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Checklist ID", "Finding ID", "Recommendation ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectProcedure: Record "Audit Project Procedure";
        AuditExecutionFinding: Record "Audit Execution Finding";
}

