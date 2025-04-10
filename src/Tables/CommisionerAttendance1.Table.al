Table 52193813 "Commisioner Attendance1"
{

    fields
    {
        field(1;"Meeting ID";Code[20])
        {
            Enabled = false;
        }
        field(2;"Commissioner Code";Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                  GeneralLedger.Get;

                  CommissionerRec.Reset;
                  CommissionerRec.SetRange(CommissionerRec."Dimension Code",GeneralLedger."Global Dimension 2 Code");
                  CommissionerRec.SetRange(CommissionerRec.Code,"Commissioner Code");
                  if CommissionerRec.Find('-') then
                  "Commissioners Name":=CommissionerRec.Name;
                  Email:=CommissionerRec.Email;
            end;
        }
        field(3;"Commissioners Name";Text[30])
        {
        }
        field(4;Attended;Boolean)
        {

            trigger OnValidate()
            begin
                 if Attended then
                 EDSetup.Reset;
                 EDSetup.SetRange(EDSetup."Calculation Type",EDSetup."calculation type"::"Per sitting");
                 if EDSetup.Find('-') then
                 repeat
                    CommTrans.Init;
                    CommTrans.Commissioner:="Commissioner Code";
                    CommTrans."Meeting ID":="Meeting ID";
                   CommTrans."E/D Code":=EDSetup.Code;
                   CommTrans."Transact Date":=Today;
                  // CommTrans."Payroll Period":=
                  if CommissionerED.Get(CommTrans.Commissioner,EDSetup.Code) then
                  CommTrans."Gross  Amount":=CommissionerED.Amount;
                  CommTrans.Insert;
                 until EDSetup.Next=0;
            end;
        }
        field(5;"Committee Code";Code[20])
        {
            TableRelation = "Committee Type1";
        }
        field(6;Email;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Commissioner Code","Committee Code")
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
        EDSetup: Record "Commissioner ED1";
        CommTrans: Record "Commissioner Transactions1";
        CommissionerED: Record "Commissioner ED Setup1";
}

