Table 52193950 "Fuel Cards1"
{

    fields
    {
        field(1;Vehicle;Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(2;"Card No";Code[20])
        {
        }
        field(3;Company;Code[10])
        {
            NotBlank = true;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                  if Vend.Get(Company) then
                  begin
                  "Company Name":=Vend.Name;
                  end;
            end;
        }
        field(4;PIN;Code[20])
        {
        }
        field(5;"Company Name";Text[30])
        {
        }
        field(6;Limit;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;Vehicle,"Card No",Company)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;
}

