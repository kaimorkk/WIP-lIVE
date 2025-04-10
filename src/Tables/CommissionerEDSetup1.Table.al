Table 52193814 "Commissioner ED Setup1"
{

    fields
    {
        field(1;Commissioner;Code[20])
        {
        }
        field(2;"E/D Code";Code[10])
        {
            NotBlank = true;
            TableRelation = "Commissioner ED1";

            trigger OnValidate()
            begin
                  if EDSetup.Get("E/D Code") then
                  Description:=EDSetup.Description;
            end;
        }
        field(3;Description;Text[30])
        {
        }
        field(4;Amount;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;Commissioner,"E/D Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EDSetup: Record "Commissioner ED1";
}

