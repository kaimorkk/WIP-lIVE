
table 95210 "Audit ACN Auditor Team"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response";
        }
        field(2; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(3; "Engagement ID"; Code[20])
        {
            Editable = false;
        }
        field(4; "Resource No."; Code[20])
        {
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false));

            trigger OnValidate()
            begin
                if Resource.Get("Resource No.") then begin
                    // Resource.TestField("E-mail Address");
                    Resource.TestField(Email);
                    Name := Resource.Name;
                    "Phone No." := Resource.Address;
                    "Job Title" := Resource."Job Title";
                end;
            end;
        }
        field(5; Name; Text[100])
        {
            Editable = false;
        }
        field(6; "Engagement Role"; Code[20])
        {
            TableRelation = "Risk Management Role".Code where(Blocked = filter(false));
        }
        field(7; "Start Date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; "Job Title"; Text[200])
        {
        }
        field(10; "Phone No."; Code[20])
        {
        }
        field(11; Email; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

