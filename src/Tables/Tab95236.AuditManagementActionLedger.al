
table 95236 "Audit Management Action Ledger"
{
    Caption = 'Audit Management Action Ledger';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Final Audit Report ID"; Code[20])
        {
            TableRelation = "Audit Execution Header"."Document No." where("Document Type" = filter("Final Audit Report"));

            trigger OnValidate()
            begin
                AuditExecutionHeader.Reset;
                AuditExecutionHeader.SetRange(AuditExecutionHeader."Document No.", "Final Audit Report ID");
                if AuditExecutionHeader.FindSet then begin
                    "Engagement ID" := AuditExecutionHeader."Engagement ID";
                end;
            end;
        }
        field(3; "Engagement ID"; Code[20])
        {
            TableRelation = "Audit Execution Header"."Engagement ID" where("Document No." = field("Final Audit Report ID"));
        }
        field(4; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Management Action Ledger";
        }
        field(5; "Finding ID"; Integer)
        {
        }
        field(6; "Management Action ID"; Integer)
        {
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Primary RC ID"; Code[20])
        {
            Description = 'Primary Responsibility Center ID';
        }
        field(9; "Action Owner ID"; Code[20])
        {
        }
        field(10; "Due Date"; Date)
        {
        }
        field(11; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(12; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(13; "Auditee Implementation Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(14; "Auditee % Complete"; Decimal)
        {
        }
        field(15; "Actual Date Done"; Date)
        {
        }
        field(16; "Audit Objective ID"; Integer)
        {
        }
        field(17; "Dimension Set ID"; Integer)
        {
        }
        field(18; "Auditor Followup Review Status"; Option)
        {
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(19; "Auditor Followup Comments"; Text[2048])
        {
        }
        field(20; "Last Posted Impl. Status Repot"; Code[20])
        {
            Description = 'Last Posted Implementation Status Report ID';
        }
        field(21; "Last Posted Fol. Audit Voucher"; Code[20])
        {
            Description = 'Last Posted Followup Audit Voucher ID';
        }
        field(22; "Last Auditor Review Date"; Date)
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
}

