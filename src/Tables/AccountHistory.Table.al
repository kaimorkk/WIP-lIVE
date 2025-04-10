Table 52194049 "Account History"
{

    fields
    {
        field(1;"Account No.";Code[20])
        {
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin


                      if GLAccount.Get("Account No.") then
                       "Account Name":=GLAccount.Name;
            end;
        }
        field(2;"Date Of Event";Date)
        {
        }
        field(3;"Description of  Event";Text[60])
        {
        }
        field(4;Comment;Text[250])
        {
            Editable = false;
        }
        field(5;Reason;Text[250])
        {
        }
        field(6;"Line No.";Integer)
        {
        }
        field(7;"Account Name";Text[60])
        {
        }
        field(8;"Old Value";Text[250])
        {
        }
        field(9;"New Value";Text[250])
        {
        }
        field(10;User;Code[30])
        {
        }
    }

    keys
    {
        key(Key1;"Account No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
}

