Table 52194084 "Vendor Penalties"
{

    fields
    {
        field(1;"Vendor No.";Code[20])
        {
        }
        field(2;"Order No";Code[20])
        {
        }
        field(3;"Order Date";Date)
        {
        }
        field(4;"Expected Receipt Date";Date)
        {
        }
        field(5;"Receipt Date";Date)
        {
        }
        field(6;"Penalty Amount";Decimal)
        {
        }
        field(7;Date;Date)
        {
        }
    }

    keys
    {
        key(Key1;"Order No","Vendor No.",Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vendor: Integer;
}

