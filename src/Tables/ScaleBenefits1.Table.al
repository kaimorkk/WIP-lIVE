Table 52193852 "Scale Benefits1"
{

    fields
    {
        field(1;"Salary Scale";Code[10])
        {
            TableRelation = "Salary Scales1";
        }
        field(2;"Salary Pointer";Code[10])
        {
            TableRelation = "Salary Pointers1";
        }
        field(3;"ED Code";Code[10])
        {
            NotBlank = true;
            TableRelation = EarningsX1;

            trigger OnValidate()
            begin
                  if EarningRec.Get("ED Code") then
                  begin
                   "ED Description":=EarningRec.Description;
                  end;
            end;
        }
        field(4;Amount;Decimal)
        {
        }
        field(5;"ED Description";Text[30])
        {
        }
        field(6;"G/L Account";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Salary Scale","Salary Pointer","ED Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EarningRec: Record EarningsX1;
}

