Table 52194010 "Due Delegence Sheet"
{
    DrillDownPageID = "Due Delegence Sheet";
    LookupPageID = "Due Delegence Sheet";

    fields
    {
        field(1;Supplier;Text[80])
        {
        }
        field(2;"Required Infomation";Text[130])
        {
            TableRelation = "Diligence Infomation";

            trigger OnValidate()
            begin
                  if Deligence.Get("Required Infomation") then
                    "Point Distribution":=Deligence."Point Distribution";
            end;
        }
        field(3;"Point Distribution";Decimal)
        {
        }
        field(4;"Points Awarded";Decimal)
        {
        }
        field(5;Period;Code[10])
        {
        }
    }

    keys
    {
        key(Key1;Supplier,"Required Infomation",Period)
        {
            Clustered = true;
            SumIndexFields = "Points Awarded";
        }
    }

    fieldgroups
    {
    }

    var
        Deligence: Record "Diligence Infomation";
}

