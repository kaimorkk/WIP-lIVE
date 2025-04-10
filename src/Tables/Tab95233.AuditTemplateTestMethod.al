
table 95233 "Audit Template Test Method"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; "Checklist ID"; Integer)
        {
            TableRelation = "Audit Template Checklist"."Checklist ID";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;

            trigger OnValidate()
            begin
                AuditTemplateChecklist.Reset;
                AuditTemplateChecklist.SetRange(AuditTemplateChecklist."Checklist ID", "Checklist ID");
                if AuditTemplateChecklist.FindSet then begin
                    "Audit Objective ID" := AuditTemplateChecklist."Audit Objective ID";
                    "Audit Procedure ID" := AuditTemplateChecklist."Audit Procedure ID";
                end;
            end;
        }
        field(4; "Audit Testing Method"; Code[20])
        {
            TableRelation = "Audit Testing Method".Code where(Blocked = filter(false));
        }
        field(5; Description; Text[2048])
        {
        }
        field(6; "Audit Procedure ID"; Integer)
        {
            TableRelation = "Audit Project Checklist"."Audit Procedure ID";
        }
        field(7; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Checklist"."Audit Objective ID";
        }
    }

    keys
    {
        key(Key1; "Template ID", "Checklist ID", "Line No.", "Audit Testing Method")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditTemplateChecklist: Record "Audit Template Checklist";
}

