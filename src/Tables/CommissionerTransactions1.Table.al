Table 52193812 "Commissioner Transactions1"
{

    fields
    {
        field(1;Commissioner;Code[20])
        {
            NotBlank = true;
            TableRelation = Employee where ("Posting Group"=const('BOARD'));
        }
        field(2;"E/D Code";Code[10])
        {
            TableRelation = if (Type=const(Earning)) EarningsX1
                            else if (Type=const(Deduction)) DeductionsX1;

            trigger OnValidate()
            begin
                 if CommissionerED.Get("E/D Code") then
                 begin
                  Description:=CommissionerED.Description;
                 end;
            end;
        }
        field(3;"Payroll Period";Date)
        {
        }
        field(4;"Gross  Amount";Decimal)
        {

            trigger OnValidate()
            begin

                  if  CommissionerED.Get("E/D Code")  then begin
                  if CommissionerED.Taxable=true then begin
                     CommissionerEPayables.Get();
                     Tax:=("Gross  Amount"* CommissionerEPayables."Tax %")/100;
                     Amount:="Gross  Amount"-Tax;
                    end else begin
                    Amount:="Gross  Amount";
                    end;
                  end;
            end;
        }
        field(5;Closed;Boolean)
        {
        }
        field(6;Paid;Boolean)
        {
        }
        field(7;"Transact Date";Date)
        {
        }
        field(8;Recurring;Boolean)
        {
        }
        field(9;Description;Text[30])
        {
        }
        field(10;"Meeting ID";Code[20])
        {
        }
        field(11;Tax;Decimal)
        {
        }
        field(12;Amount;Decimal)
        {
        }
        field(13;"Language Code(Default)";Code[20])
        {
        }
        field(14;Attachment;Option)
        {
            OptionMembers = No,Yes;
        }
        field(15;"Commissioner Name";Text[30])
        {
        }
        field(16;"Meeting Description";Text[50])
        {
        }
        field(17;"Starting Date";Date)
        {
        }
        field(18;"Ending Date";Date)
        {
        }
        field(19;Type;Option)
        {
            OptionCaption = ' ,Earning,Deduction';
            OptionMembers = " ",Earning,Deduction;
        }
    }

    keys
    {
        key(Key1;Commissioner,"E/D Code","Transact Date","Payroll Period","Meeting ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CommissionerED: Record "Commissioner ED1";
        CommissionerEPayables: Record "Commissioner Expe Payables1";
}

