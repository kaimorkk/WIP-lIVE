Table 52193752 "Visiting Commissioners1"
{

    fields
    {
        field(1;"Visit No.";Code[10])
        {
        }
        field(2;"Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                  GeneralLedger.Get;

                  CommissionerRec.Reset;
                  CommissionerRec.SetRange(CommissionerRec."Dimension Code",GeneralLedger."Global Dimension 2 Code");
                  CommissionerRec.SetRange(CommissionerRec.Code,Code);
                  if CommissionerRec.Find('-') then
                  Name:=CommissionerRec.Name;
                  //E-mail:=CommissionerRec.Email;
            end;
        }
        field(3;Name;Text[60])
        {
        }
        field(4;"E-Mail";Text[60])
        {
        }
    }

    keys
    {
        key(Key1;"Visit No.","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CommissionerRec: Record "Dimension Value";
        GeneralLedger: Record "General Ledger Setup";
}

