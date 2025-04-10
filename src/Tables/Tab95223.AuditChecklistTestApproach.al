
table 95223 "Audit Checklist Test Approach"
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
            TableRelation = "Audit Execution Header"."Engagement ID";
        }
        field(4; "Checklist ID"; Integer)
        {
            Editable = false;
            TableRelation = "Audit Execution Checklist"."Checklist ID";

            trigger OnValidate()
            begin
                // AuditExecutionChecklist.RESET;
                // AuditExecutionChecklist.SETRANGE(AuditExecutionChecklist."Engagement ID","Engagement ID");
                // AuditExecutionChecklist.SETRANGE(AuditExecutionChecklist."Checklist ID","Checklist ID");
                // IF AuditExecutionChecklist.FINDSET THEN BEGIN
                //  "Audit Objective ID":=AuditExecutionChecklist."Audit Objective ID";
                //  "Audit Procedure ID":=AuditExecutionChecklist."Audit Procedure ID";
                //  "Checklist ID":= AuditExecutionChecklist."Checklist ID";
                //  "Checklist Name":= AuditExecutionChecklist.Description;
                //  END;
                AuditExecutionChecklist.Reset;
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Engagement ID", "Engagement ID");
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Checklist ID", "Checklist ID");
                if AuditExecutionChecklist.FindSet then begin
                    "Audit Objective ID" := AuditExecutionChecklist."Audit Objective ID";
                    "Audit Procedure ID" := AuditExecutionChecklist."Audit Procedure ID";
                    "Dimension Set ID" := AuditExecutionChecklist."Dimension Set ID";
                    "Checklist Name" := AuditExecutionChecklist.Description;
                end;
            end;
        }
        field(5; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "Audit Testing Method"; Code[20])
        {
            TableRelation = "Audit Testing Method".Code where(Blocked = filter(false));
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Audit Procedure ID"; Integer)
        {
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(9; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(10; "Dimension Set ID"; Integer)
        {
        }
        field(11; "Checklist Name"; Text[250])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Checklist ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditExecutionChecklist: Record "Audit Execution Checklist";
        AuditProjectProcedure: Record "Audit Project Procedure";
}

