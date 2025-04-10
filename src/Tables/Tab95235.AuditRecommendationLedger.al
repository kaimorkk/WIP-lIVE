
table 95235 "Audit Recommendation Ledger"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(3; "Document No."; Code[20])
        {
            TableRelation = "Audit Execution Header"."Document No.";

            trigger OnValidate()
            begin
                AuditExecutionHeader.Reset;
                AuditExecutionHeader.SetRange(AuditExecutionHeader."Document Type", "Document Type");
                AuditExecutionHeader.SetRange(AuditExecutionHeader."Document No.", "Document No.");
                if AuditExecutionHeader.FindSet then begin
                    "Engagement ID" := AuditExecutionHeader."Engagement ID";

                end;
            end;
        }
        field(4; "Engagement ID"; Code[20])
        {
            TableRelation = "Audit Execution Header"."Engagement ID" where("Document Type" = field("Document Type"),
                                                                            "Document No." = field("Document No."));
        }
        field(5; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Finding Recommendation"."Checklist ID" where("Document Type" = field("Document Type"),
                                                                                 "Document No." = field("Document No."),
                                                                                 "Engagement ID" = field("Engagement ID"));
        }
        field(6; "Finding ID"; Integer)
        {
            TableRelation = "Audit Finding Recommendation"."Finding ID" where("Document Type" = field("Document Type"),
                                                                               "Document No." = field("Document No."),
                                                                               "Engagement ID" = field("Engagement ID"),
                                                                               "Checklist ID" = field("Checklist ID"));
        }
        field(7; "Recommendation ID"; Integer)
        {
            TableRelation = "Audit Finding Recommendation"."Recommendation ID" where("Document Type" = field("Document Type"),
                                                                                      "Document No." = field("Document No."),
                                                                                      "Engagement ID" = field("Engagement ID"),
                                                                                      "Checklist ID" = field("Checklist ID"),
                                                                                      "Finding ID" = field("Finding ID"));

            trigger OnValidate()
            begin
                AuditFindingRecommendation.Reset;
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Document Type", "Document Type");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Document No.", "Document No.");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Engagement ID", "Engagement ID");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Checklist ID", "Checklist ID");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Finding ID", "Finding ID");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Recommendation ID", "Recommendation ID");
                if AuditFindingRecommendation.FindSet then begin
                    Description := AuditFindingRecommendation.Description;
                    "Risk Rating" := AuditFindingRecommendation."Risk Rating Code";
                    "Audit Objective ID" := AuditFindingRecommendation."Audit Objective ID";
                    "Audit Procedure ID" := AuditFindingRecommendation."Audit Procedure ID";
                    "Dimension Set ID" := AuditFindingRecommendation."Dimension Set ID";

                end;
            end;
        }
        field(8; Description; Text[2048])
        {
        }
        field(9; "Risk Rating"; Code[20])
        {
            TableRelation = "Audit Finding Rating Code".Code where(Blocked = filter(false));
        }
        field(10; "Audit Procedure ID"; Integer)
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
        field(11; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(12; "Dimension Set ID"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditFindingRecommendation: Record "Audit Finding Recommendation";
        AuditProjectProcedure: Record "Audit Project Procedure";
}

