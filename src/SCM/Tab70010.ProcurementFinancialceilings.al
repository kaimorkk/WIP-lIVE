
table 70010 "Procurement Financial ceilings"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Method of Procurement"; Code[20])
        {
            TableRelation = "Procurement Method";
        }
        field(2; "Minimum Ceiling"; Decimal)
        {
        }
        field(3; "Maximum Ceiling"; Decimal)
        {
        }
        field(4; "Procument Description"; Text[30])
        {
            CalcFormula = lookup("Procurement Method".Description where(Code = field("Method of Procurement")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Blocked; Boolean)
        {
        }
        field(6; "Effective date"; Date)
        {
        }
        field(7; "Procurement Class"; Code[20])
        {
            TableRelation = "Procurement Classes";
        }
        field(8; "Procurement Type"; Option)
        {
            OptionMembers = " ",Goods,Services,Works;
        }
    }

    keys
    {
        key(Key1; "Method of Procurement", "Procurement Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

