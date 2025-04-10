
table 80036 "Strategic Analysis Matrix"
{

    fields
    {
        field(1; "Document No"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Strategy Framework"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework".Code;
        }
        field(4; Perspective; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
        }
        field(6; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(7; Description; Code[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

