
table 95201 "Audit Project Procedure"
{
    DrillDownPageID = "Audit Project Procedures";
    LookupPageID = "Audit Project Procedures";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            Editable = false;
        }
        field(2; "Audit Procedure ID"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "Audit Objective ID"; Integer)
        {
            TableRelation = "Audit Project Objective"."Audit Objective ID" where("Engagement ID" = field("Engagement ID"));

            trigger OnValidate()
            begin
                AuditProjectObjective.Reset;
                AuditProjectObjective.SetRange(AuditProjectObjective."Engagement ID", "Engagement ID");
                AuditProjectObjective.SetRange(AuditProjectObjective."Audit Objective ID", "Audit Objective ID");
                if AuditProjectObjective.FindSet then begin
                    "Objective Description" := AuditProjectObjective.Description;
                end;
            end;
        }
        field(5; "No. fo Audit Checklists"; Integer)
        {
            CalcFormula = count("Audit Project Checklist" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "No. Of Reccomm Audit Test Meth"; Integer)
        {
            CalcFormula = count("Audit Checklist Test Method" where("Engagement ID" = field("Engagement ID")));
            Description = 'No. of Recommended Audit Testing Methods/Guidelines';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "No. of Business Risks"; Integer)
        {
            CalcFormula = count("Audit Project Procedure Risk" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "No. of Controls"; Integer)
        {
            CalcFormula = count("Audit Proj  Procedure Control" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Objective Description"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Audit Procedure ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditProjectObjective: Record "Audit Project Objective";
}

