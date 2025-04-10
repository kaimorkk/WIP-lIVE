
table 95237 "Audit Implementation Log Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Implementation Status Report,Followup Audit Voucher';
            OptionMembers = " ","Implementation Status Report","Followup Audit Voucher";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Entry No."; Integer)
        {
            AutoIncrement = false;
            TableRelation = "Audit Management Action Ledger"."Entry No." where("Auditor Followup Review Status" = filter(Open),
                                                                                "Auditee Implementation Status" = filter(Ongoing | Planned),
                                                                                "Primary RC ID" = field("Primary RC ID"));

            trigger OnValidate()
            begin
                AuditManagementActionLedger.Reset;
                AuditManagementActionLedger.SetRange(AuditManagementActionLedger."Entry No.", "Entry No.");
                if AuditManagementActionLedger.FindSet then begin
                    "Final Audit Report ID" := AuditManagementActionLedger."Final Audit Report ID";
                    "Engagement ID" := AuditManagementActionLedger."Engagement ID";
                    "Checklist ID" := AuditManagementActionLedger."Checklist ID";
                    "Finding ID" := AuditManagementActionLedger."Finding ID";
                    "Management Action ID" := AuditManagementActionLedger."Management Action ID";
                    "Primary RC ID" := AuditManagementActionLedger."Primary RC ID";
                    "Action Owner ID" := AuditManagementActionLedger."Action Owner ID";
                    "Due Date" := AuditManagementActionLedger."Due Date";
                    "Action Type" := AuditManagementActionLedger."Action Type";
                    "Task Priority" := AuditManagementActionLedger."Task Priority";
                    // "Audit Procedure ID":=AuditManagementActionLedger.;
                    "Audit Objective ID" := AuditManagementActionLedger."Audit Objective ID";
                    "Dimension Set ID" := AuditManagementActionLedger."Dimension Set ID";
                end;
            end;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Auditee Implementation Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;

            trigger OnValidate()
            begin
                if (("Auditee Implementation Status" = "auditee implementation status"::Ongoing) or
                  ("Auditee Implementation Status" = "auditee implementation status"::Planned))
                  then
                    "Auditee % Complete" := 0
                else
                    if "Auditee Implementation Status" = "auditee implementation status"::Completed then
                        "Auditee % Complete" := 100;
                Validate("Auditee % Complete");
                if "Auditee Implementation Status" = "auditee implementation status"::Completed then
                    "Actual Date Done" := Today;

            end;
        }
        field(6; "Auditee % Complete"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "Auditee % Complete" = 100 then
                    "Actual Date Done" := Today;
            end;
        }
        field(7; "Auditee Comments"; Text[2048])
        {
        }
        field(8; "Actual Date Done"; Date)
        {
        }
        field(9; "Requested Revised Date"; Date)
        {
        }
        field(10; "Final Audit Report ID"; Code[20])
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
        field(11; "Engagement ID"; Code[20])
        {
            TableRelation = "Audit Execution Header"."Engagement ID" where("Document Type" = filter("Final Audit Report"),
                                                                            "Document No." = field("Final Audit Report ID"));
        }
        field(12; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Management Action"."Checklist ID" where("Document Type" = filter("Final Audit Report"),
                                                                            "Document No." = field("Final Audit Report ID"),
                                                                            "Engagement ID" = field("Engagement ID"));
        }
        field(13; "Finding ID"; Integer)
        {
            TableRelation = "Audit Management Action"."Checklist ID" where("Document Type" = filter("Final Audit Report"),
                                                                            "Document No." = field("Final Audit Report ID"),
                                                                            "Engagement ID" = field("Engagement ID"),
                                                                            "Checklist ID" = field("Checklist ID"));
        }
        field(14; "Management Action ID"; Integer)
        {
            TableRelation = "Audit Management Action"."Checklist ID" where("Document Type" = filter("Final Audit Report"),
                                                                            "Document No." = field("Final Audit Report ID"),
                                                                            "Engagement ID" = field("Engagement ID"),
                                                                            "Checklist ID" = field("Checklist ID"),
                                                                            "Finding ID" = field("Finding ID"));
        }
        field(15; "Primary RC ID"; Code[20])
        {
            Description = 'Primary Responsibility Center ID';
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));
        }
        field(16; "Action Owner ID"; Code[20])
        {
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));
        }
        field(17; "Due Date"; Date)
        {
        }
        field(18; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(19; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(20; "Audit Procedure ID"; Integer)
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
        field(21; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));
        }
        field(22; "Dimension Set ID"; Integer)
        {
        }
        field(23; "Auditor Followup Review Status"; Option)
        {
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(24; "Last Followup Audit Voucher ID"; Code[20])
        {
            CalcFormula = max("Audit Followup Header"."Document No." where("Document Type" = filter("Followup Audit Voucher"),
                                                                            "Primary RC ID" = field("Primary RC ID"),
                                                                            Posted = filter(true)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditManagementActionLedger: Record "Audit Management Action Ledger";
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditProjectProcedure: Record "Audit Project Procedure";
}

