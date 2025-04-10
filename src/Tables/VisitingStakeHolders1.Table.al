Table 52193753 "Visiting StakeHolders1"
{

    fields
    {
        field(1;"Visit No";Code[10])
        {
        }
        field(2;"StakeHolder No.";Code[20])
        {
            TableRelation = Contact;

            trigger OnValidate()
            begin
                  if Contact.Get("StakeHolder No.") then
                  "StakeHolder Name":=Contact.Name;
            end;
        }
        field(3;"StakeHolder Name";Text[80])
        {
        }
        field(4;"E- Mail";Text[80])
        {
        }
    }

    keys
    {
        key(Key1;"Visit No","StakeHolder No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Contact: Record Contact;
}

