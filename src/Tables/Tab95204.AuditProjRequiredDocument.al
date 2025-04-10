
table 95204 "Audit Proj Required Document"
{
    DrillDownPageID = "Audit Proj Required Documents";
    LookupPageID = "Audit Proj Required Documents";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            Editable = false;
        }
        field(2; "Document No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "Audit Procedure ID"; Integer)
        {
            TableRelation = "Audit Project Procedure"."Audit Procedure ID" where("Engagement ID" = field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectProcedure.Reset;
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Engagement ID", "Engagement ID");
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Audit Procedure ID", "Audit Procedure ID");
                if AuditProjectProcedure.FindSet then
                    "Procedure Description" := AuditProjectProcedure.Description;
            end;
        }
        field(5; "Preferred Format"; Option)
        {
            OptionCaption = ' ,Any Format,Soft Copy,Hard Copy';
            OptionMembers = " ","Any Format","Soft Copy","Hard Copy";
        }
        field(6; "Submission Deadline"; Date)
        {
        }
        field(7; "Requirement Type"; Option)
        {
            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(8; "Lead Auditor ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where("Engagement ID" = field("Engagement ID"),
                                                                       "Audit Team Type" = const("Auditor Team"));
        }
        field(9; "Lead Auditee Representative ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where("Engagement ID" = field("Engagement ID"),
                                                                       "Audit Team Type" = const("Auditee Team"));
        }
        field(10; "Date Requested"; Date)
        {
        }
        field(11; "Date Submitted"; Date)
        {
        }
        field(12; "Submission Status"; Option)
        {
            OptionCaption = ' ,Planned,Pending,Submitted,Cancelled,Partially Submitted';
            OptionMembers = " ",Planned,Pending,Submitted,Cancelled,"Partially Submitted";
        }
        field(13; "No. of Filed Audit Papers"; Integer)
        {
            Description = 'No. of Filed Audit Working Papers';
            Editable = false;
        }
        field(14; "Procedure Description"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectProcedure: Record "Audit Project Procedure";
}

