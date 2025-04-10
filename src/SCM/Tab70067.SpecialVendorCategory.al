
table 70067 "Special Vendor Category"
{
    DrillDownPageID = "Special Vendor Category";
    LookupPageID = "Special Vendor Category";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Vendor Group"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',General,Special';
            OptionMembers = ,General,Special;
        }
        field(4; "Vendor Type"; Option)
        {
            OptionCaption = 'Local,Foreign';
            OptionMembers = "Local",Foreign;
        }
        field(5; "Default Certifiying Agency"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Certifiying Agency URL"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No of Active Vendors"; Integer)
        {
            CalcFormula = count(Vendor where("Special Category" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
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
    }
}

