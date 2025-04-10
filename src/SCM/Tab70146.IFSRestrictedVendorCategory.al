
table 70146 "IFS Restricted Vendor Category"
{

    fields
    {
        field(1; "Document No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Restricted Vendor Category ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Special Vendor Category".Code;
        }
        field(3; Description; Text[100])
        {
            CalcFormula = lookup("Special Vendor Category".Description where(Code = field("Restricted Vendor Category ID")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document No", "Restricted Vendor Category ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

