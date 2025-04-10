Table 52193713 "Trustee dates1"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            TableRelation = Trustees1;
        }
        field(2;StartDate;Date)
        {
        }
        field(3;EndDate;Date)
        {
        }
    }

    keys
    {
        key(Key1;"Code",StartDate,EndDate)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

