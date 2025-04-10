Table 52194039 "Contract Performance"
{
    DrillDownPageID = "Imprest Customer Posting Group";
    LookupPageID = "Imprest Customer Posting Group";

    fields
    {
        field(1;"Contract No";Code[20])
        {
            TableRelation = Contract;
        }
        field(2;"PI Code";Code[20])
        {
            TableRelation = "Performance Indicators";

            trigger OnValidate()
            begin
                if PIRec.Get("PI Code") then
                  Description:=PIRec.Description;
            end;
        }
        field(3;Description;Text[100])
        {
        }
        field(4;Comments;Text[250])
        {
        }
        field(5;Score;Decimal)
        {
        }
        field(6;Date;Date)
        {
        }
    }

    keys
    {
        key(Key1;"Contract No","PI Code",Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PIRec: Record "Performance Indicators";
}

