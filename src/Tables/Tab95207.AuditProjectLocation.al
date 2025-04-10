
table 95207 "Audit ProjectLocation"
{
    DrillDownPageID = "Audit Project Locations";
    LookupPageID = "Audit Project Locations";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
        }
        field(2; "Audit Location ID"; Code[20])
        {
            TableRelation = "Audit Location1".Code;

            trigger OnValidate()
            begin
                AuditLocation.Reset;
                AuditLocation.SetRange(Code, "Audit Location ID");
                if AuditLocation.FindSet then
                    Description := AuditLocation.Description;
            end;
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "Responsibility Center ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(5; "Audit Site Type"; Option)
        {
            OptionCaption = ' ,Within Organization,External to Organization';
            OptionMembers = " ","Within Organization","External to Organization";
        }
        field(6; "Contact Person"; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Contact Person");
                if Resource.FindSet then begin
                    "Primary Email" := Resource."Company E-Mail";
                    "Telephone No." := Resource."Mobile Phone No.";
                end;
            end;
        }
        field(7; "Primary Email"; Text[100])
        {
        }
        field(8; "Telephone No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Audit Location ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Employee;
        Employee: Record Employee;
        AuditLocation: Record "Audit Location1";
}

