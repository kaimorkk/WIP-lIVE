
table 85077 "Disciplinary Commitee"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "No. of Members"; Integer)
        {
            CalcFormula = count("Commiitee Members" where("Document No." = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; "Expiry Date"; Date)
        {
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

