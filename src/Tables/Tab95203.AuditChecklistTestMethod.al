
table 95203 "Audit Checklist Test Method"
{
    DrillDownPageID = "Audit Checklist Test Methods";
    LookupPageID = "Audit Checklist Test Methods";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            Editable = false;
        }
        field(2; "Checklist ID"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; "Line No."; Integer)
        {
            TableRelation = "Audit Project Checklist"."Checklist ID" where("Engagement ID" = field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectChecklist.Reset;
                AuditProjectChecklist.SetRange(AuditProjectChecklist."Engagement ID", "Engagement ID");
                AuditProjectChecklist.SetRange(AuditProjectChecklist."Checklist ID", "Line No.");
                if AuditProjectChecklist.FindSet then begin
                    "Audit Objective ID" := AuditProjectChecklist."Completion %";
                    "Audit Objective ID" := AuditProjectChecklist."Audit Procedure ID";
                end;
            end;
        }
        field(4; "Audit Testing Method"; Code[20])
        {
            TableRelation = "Audit Testing Method".Code where(Blocked = filter(false));
        }
        field(5; Desription; Text[2048])
        {
        }
        field(6; "Audit Procedure ID"; Integer)
        {
            TableRelation = "Audit Project Procedure"."Audit Procedure ID";
        }
        field(7; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Procedure"."Audit Objective ID";
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Checklist ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectChecklist: Record "Audit Project Checklist";
}

