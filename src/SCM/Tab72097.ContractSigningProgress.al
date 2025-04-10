
table 72097 "Contract Signing & Progress"
{

    fields
    {
        field(1; "Heder No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Contract Signing Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Completion Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Achieved Km This Month"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Total Achieved KM To Date"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Work Variation Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Heder No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

