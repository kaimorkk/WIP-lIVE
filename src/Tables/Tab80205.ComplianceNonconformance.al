
table 80205 "Compliance Non-conformance"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit No."; Code[30])
        {
        }
        field(2; "Checklist Category"; Code[50])
        {
        }
        field(3; "Requirement ID"; Integer)
        {
        }
        field(4; "Non-Conformance ID"; Integer)
        {
        }
        field(5; Description; Text[50])
        {
        }
        field(22; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(23; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(24; "Additional Comments"; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Audit No.", "Checklist Category", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

