
table 95189 "Audit Template Procedure Test"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; "Audit Objective ID"; Integer)
        {
        }
        field(3; "Audit Procedure ID"; Integer)
        {
        }
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Audit Testing Method"; Code[20])
        {
            TableRelation = "Audit Testing Method".Code;

            trigger OnValidate()
            begin
                AuditTestingMethod.Reset;
                AuditTestingMethod.SetRange(Code, "Audit Testing Method");
                if AuditTestingMethod.FindSet then begin
                    Description := AuditTestingMethod.Description;
                end;
            end;
        }
        field(6; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Audit Objective ID", "Audit Procedure ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditTestingMethod: Record "Audit Testing Method";
}

