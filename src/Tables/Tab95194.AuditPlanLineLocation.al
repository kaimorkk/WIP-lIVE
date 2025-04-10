
table 95194 "Audit Plan Line Location"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Plan ID"; Code[20])
        {
        }
        field(2; "Engagement Line No."; Integer)
        {
        }
        field(3; "Audit Location ID"; Code[20])
        {

            trigger OnValidate()
            begin
                AuditLocation.Reset;
                AuditLocation.SetRange(Code, "Audit Location ID");
                if AuditLocation.FindSet then begin
                    "Audit Location ID" := AuditLocation.Code;
                    Description := AuditLocation.Description;
                    "Responsibility Center ID" := AuditLocation."Responsibility Center ID";
                    "Contact Person" := AuditLocation."Contact Person";
                    "Primary Email" := AuditLocation."Primary Email";
                    "Telephone No." := AuditLocation."Telephone No.";
                end;
            end;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Responsibility Center ID"; Code[20])
        {
        }
        field(6; "Audit Site Type"; Option)
        {
            OptionCaption = ' ,Within Organization,External to Organization';
            OptionMembers = " ","Within Organization","External to Organization";
        }
        field(7; "Contact Person"; Code[20])
        {
        }
        field(8; "Primary Email"; Text[100])
        {
        }
        field(9; "Telephone No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Audit Plan ID", "Engagement Line No.", "Audit Location ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AuditLocation: Record "Audit Location1";
}

