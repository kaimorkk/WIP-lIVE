
table 95239 "Audit Management Action"
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
            TableRelation = "Audit Execution Finding"."Finding ID";

            trigger OnValidate()
            begin
                AuditExecutionFinding.Reset;
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Document Type", "Document Type");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Document No.", "Document No.");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Engagement ID", "Engagement ID");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Checklist ID", "Checklist ID");
                AuditExecutionFinding.SetRange(AuditExecutionFinding."Finding ID", "Finding ID");
                if AuditExecutionFinding.FindSet then begin
                    "Audit Procedure ID" := AuditExecutionFinding."Audit Procedure ID";
                    "Audit Objective ID" := AuditExecutionFinding."Audit Objective ID";
                    "Dimension Set ID" := AuditExecutionFinding."Dimension Set ID";
                    "Finding Name" := AuditExecutionFinding.Description;

                end;
            end;
        }
        field(6; "Management Action ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Primary RC ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));
        }
        field(9; "Action Owner ID"; Code[20])
        {
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Action Owner ID");
                if Resource.FindSet then
                    "Action Owner ID" := Resource."No.";
                "Action Owner Name" := Resource.Name;
            end;
        }
        field(10; "Due Date"; Date)
        {
        }
        field(11; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(12; "Action Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                // IF (("Action Status"="Action Status"::Planned) OR ("Action Status"="Action Status"::Ongoing)) THEN
                //  "% Complete":=0
                // ELSE
                //  IF "Action Status"="Action Status"::Completed THEN
                //  "% Complete":=100;
            end;
        }
        field(13; "% Complete"; Decimal)
        {
            Editable = false;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                // IF "% Complete" = 100 THEN
                //  "Actual Date Done":=TODAY;
            end;
        }
        field(14; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(15; "Audit Procedure ID"; Integer)
        {
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(16; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(17; "Dimension Set ID"; Integer)
        {
        }
        field(18; "Posted Mgt Action Entry No."; Integer)
        {
            CalcFormula = lookup("Audit Management Action Ledger"."Entry No." where("Final Audit Report ID" = field("Document No."),
                                                                                     "Engagement ID" = field("Engagement ID"),
                                                                                     "Checklist ID" = field("Checklist ID"),
                                                                                     "Finding ID" = field("Finding ID"),
                                                                                     "Management Action ID" = field("Management Action ID")));
            Description = 'Posted Management Action Entry No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Action Owner Name"; Text[250])
        {
            Editable = false;
        }
        field(20; "Finding Name"; Text[2048])
        {
            Editable = false;
        }
        field(21; Recommendations; Text[2048])
        {
        }
        field(22; "Management Comments"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Checklist ID", "Finding ID", "Management Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionFinding: Record "Audit Execution Finding";
        AuditProjectProcedure: Record "Audit Project Procedure";
        Resource: Record Resource;
}

