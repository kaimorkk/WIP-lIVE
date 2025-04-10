
table 95225 "Audit Finding Location"
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
            Description = '"Audit Execution Finding"."Engagement ID"';
        }
        field(4; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Execution Finding"."Checklist ID";
        }
        field(5; "Finding ID"; Integer)
        {
            AutoIncrement = false;
            TableRelation = "Audit Execution Finding"."Finding ID";
        }
        field(6; "Audit Location"; Code[20])
        {
            TableRelation = "Audit ProjectLocation"."Audit Location ID" where("Engagement ID" = field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectLocation.Reset;
                AuditProjectLocation.SetRange(AuditProjectLocation."Engagement ID", "Engagement ID");
                AuditProjectLocation.SetRange(AuditProjectLocation."Audit Location ID", "Audit Location");
                if AuditProjectLocation.FindSet then begin
                    Description := AuditProjectLocation.Description;
                    "Compliance Status" := "compliance status"::"Fully Compliant";

                    //Field missing in the AuditProjectLocation table
                    "Risk Rating Code" := '';
                    "Audit Procedure ID" := 0;
                    "Audit Objective ID" := 0;
                    "Dimension Set ID" := 0;
                end;
            end;
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Compliance Status"; Option)
        {
            OptionCaption = ' ,Non-Compliant,Partially Compliant,Substantially Compliant,Fully Compliant,Not Applicable';
            OptionMembers = " ","Non-Compliant","Partially Compliant","Substantially Compliant","Fully Compliant","Not Applicable";
        }
        field(9; "Risk Rating Code"; Code[20])
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
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Checklist ID", "Finding ID", "Audit Location")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectLocation: Record "Audit ProjectLocation";
        AuditProjectProcedure: Record "Audit Project Procedure";
}

