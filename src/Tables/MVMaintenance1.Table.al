Table 52193872 "MV Maintenance1"
{

    fields
    {
        field(1;No;Integer)
        {
        }
        field(2;Vehicle;Code[10])
        {
            TableRelation = "Fixed Asset"."Parastatl Reg. No" where ("FA Class Code"=filter('MV'));
        }
        field(3;Make;Text[30])
        {
        }
        field(4;"Service Due(Km)";Decimal)
        {
        }
        field(5;"Service Done(Km)";Decimal)
        {
        }
        field(6;Date;Date)
        {
        }
        field(7;Remarks;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

