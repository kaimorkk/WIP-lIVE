Table 52193668 "Procurement Commitee"
{
    // DrillDownPageID = "Fleet Driver Card";
    // LookupPageID = "Fleet Driver Card";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;Members;Integer)
        {
            CalcFormula = count("Commitee Members" where (Commitee=field(Code)));
            FieldClass = FlowField;
        }
        field(4;Permanent;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

