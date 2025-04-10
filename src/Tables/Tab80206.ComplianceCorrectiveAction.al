
table 80206 "Compliance Corrective Action"
{

    fields
    {
        field(1; "Audit No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Checklist Category"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Requirement ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Action ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Responsible Person"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Action Deadline"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Status; Boolean)
        {
            DataClassification = ToBeClassified;
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

