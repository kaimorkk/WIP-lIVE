
table 80203 "Compliance Requirement"
{

    fields
    {
        field(1; "Audit No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Checklist Category"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Requirement ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Total No. of Findings"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total No. of Non-Conformance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Corrective Actions"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Audit No", "Checklist Category", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

