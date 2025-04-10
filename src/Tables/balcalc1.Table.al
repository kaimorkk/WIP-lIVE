Table 52193851 balcalc1
{
    DrillDownPageID = "Scale Benefits";
    LookupPageID = "Scale Benefits";

    fields
    {
        field(1;"employee no";Code[10])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = "Balance adjustments1"."Employee Number";
        }
        field(2;"code";Code[20])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = "Balance adjustments1".Code;
        }
        field(3;amount;Decimal)
        {
            CalcFormula = sum("Balance adjustments1".Amount where ("Employee Number"=field("employee no"),
                                                                   Code=field(code)));
            Editable = false;
            FieldClass = FlowField;
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1;"code","employee no")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

