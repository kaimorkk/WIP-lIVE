Table 52193827 "Claims line1"
{

    fields
    {
        field(1;"Line No";Integer)
        {
        }
        field(2;"Document No.";Code[20])
        {
            TableRelation = "Claims Header1"."No.";
        }
        field(3;"Claimant ID";Code[20])
        {
            TableRelation = "Claims Header1"."Claimant ID";
        }
        field(4;Description;Text[150])
        {
        }
        field(5;Amount;Decimal)
        {
        }
        field(6;Comment;Text[250])
        {
        }
        field(7;"Employee Name";Text[50])
        {
            TableRelation = Employee."Last Name";
        }
    }

    keys
    {
        key(Key1;"Document No.","Claimant ID","Line No")
        {
            Clustered = true;
        }
        key(Key2;Amount)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

