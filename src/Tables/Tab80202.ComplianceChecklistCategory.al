
table 80202 "Compliance Checklist Category"
{

    fields
    {
        field(1; "Audit No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Checklist Category"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Total No. of Requirements"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Audit No.", "Checklist Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

