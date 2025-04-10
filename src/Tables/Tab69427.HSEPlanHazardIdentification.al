
table 69427 "HSE Plan Hazard Identification"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; "Hazard Identification Method"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Hazard Identification Method".Code where(Blocked = const(false));
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

