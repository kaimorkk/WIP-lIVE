
table 69513 "Case Advocates"
{
    DrillDownPageID = "Case Advocates";
    LookupPageID = "Case Advocates";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Names; Text[100])
        {
        }
        field(3; Contacts; Code[255])
        {
        }
        field(4; Email; Text[100])
        {
        }
        field(5; "Firm Code"; Code[10])
        {
            TableRelation = Contact."No.";

            trigger OnValidate()
            begin
                contact.Reset;
                contact.SetRange("No.", "Firm Code");
                if contact.Find('-') then
                    "Firm name" := contact.Name;
            end;
        }
        field(6; "Firm name"; Text[30])
        {
        }
        field(7; "Second name"; Text[30])
        {
        }
        field(8; Address; Code[10])
        {
        }
        field(9; City; Text[30])
        {
        }
        field(10; "Postal Code"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(LooKUp; Names)
        {
        }
        fieldgroup(DrillDown; Contacts)
        {
        }
    }

    var
        contact: Record Contact;
}

