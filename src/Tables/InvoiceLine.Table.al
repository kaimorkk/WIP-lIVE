Table 52194086 "Invoice Line"
{

    fields
    {
        field(1;"Invoice No";Code[20])
        {
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;Type;Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item,Resource,Fixed Asset,Charge (Item)';
            OptionMembers = " ","G/L Account",Item,Resource,"Fixed Asset","Charge (Item)";
        }
        field(4;"Account No";Code[10])
        {
        }
        field(5;Quantity;Decimal)
        {
        }
        field(6;"Unit Price";Decimal)
        {
        }
        field(7;Amount;Decimal)
        {
        }
        field(8;Status;Option)
        {
            OptionMembers = "0","1";
        }
        field(9;Description;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Invoice No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

