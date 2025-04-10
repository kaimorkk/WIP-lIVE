Table 52193758 "PPA Parties1"
{

    fields
    {
        field(1;"PPA No.";Code[10])
        {
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Party No";Code[10])
        {

            trigger OnLookup()
            begin
                if Type=Type::Vendor then begin
                  if Page.RunModal(27,Vend)=Action::LookupOK then begin
                  "Party No":=Vend."No.";
                  "Party Name":=Vend.Name;
                  end;
                end else begin
                if Type=Type::StakeHolder then begin
                  if Page.RunModal(5052,Contact)=Action::LookupOK then begin
                  "Party No":=Contact."No.";
                  "Party Name":=Contact.Name;
                  end;
                  end;
                  end;
            end;
        }
        field(4;"Party Name";Text[100])
        {
        }
        field(5;Type;Option)
        {
            OptionMembers = Vendor,StakeHolder;
        }
    }

    keys
    {
        key(Key1;"PPA No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;
        Contact: Record Contact;
}

