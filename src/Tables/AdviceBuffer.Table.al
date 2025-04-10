Table 52193482 "Advice Buffer"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;"Member No.";Code[20])
        {
        }
        field(3;"Personal No.";Code[20])
        {
        }
        field(4;Names;Text[30])
        {
        }
        field(5;"New Amount";Decimal)
        {
        }
        field(6;"Non Rec";Decimal)
        {
        }
        field(7;"Current Amount";Decimal)
        {
        }
        field(8;"New Balance";Decimal)
        {
        }
        field(9;EDCode;Code[20])
        {
        }
        field(10;Employer;Code[20])
        {
        }
        field(11;Refference;Code[20])
        {
        }
        field(12;Month;Integer)
        {
        }
        field(13;Remarks;Text[30])
        {
        }
        field(14;Station;Code[20])
        {
        }
        field(15;"NR Code";Code[20])
        {
        }
        field(16;"Sacco Code";Code[20])
        {
        }
        field(17;"Vote Code";Code[20])
        {
        }
        field(18;"Account No.";Code[20])
        {
        }
        field(19;"Current Balance";Decimal)
        {
        }
        field(20;"Transaction Type";Code[10])
        {
        }
        field(21;"Transaction Name";Text[30])
        {
        }
        field(22;Interest;Integer)
        {
        }
        field(23;"Action";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

