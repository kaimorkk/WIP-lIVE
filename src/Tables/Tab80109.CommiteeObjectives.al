
table 80109 "Commitee Objectives"
{

    fields
    {
        field(1; "Committee ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; Objective; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Target; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Achievement; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Responsible Person"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "SPM Commitee Members"."Employee No" where("Ref No" = field("Committee ID"));
        }
        field(7; "Date Achieved"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Committee ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

