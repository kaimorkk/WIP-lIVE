Table 52194085 "Invoice Header"
{

    fields
    {
        field(1;"Invoice No";Code[20])
        {
        }
        field(2;"Vendor No";Code[20])
        {
        }
        field(3;"Vendor Name";Text[50])
        {
        }
        field(4;"Posting Date";Date)
        {
        }
        field(5;"Document Date";Date)
        {
        }
        field(6;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(7;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(10;"Due Date";Date)
        {
        }
        field(11;Status;Option)
        {
            OptionMembers = "0","1";
        }
        field(12;Loaded;Boolean)
        {
        }
        field(13;"Posting Description";Text[100])
        {
            Caption = 'Posting Description';
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

