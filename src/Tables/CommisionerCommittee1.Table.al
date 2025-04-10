Table 52193744 "Commisioner Committee1"
{

    fields
    {
        field(1;"Meeting Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;"Code";Code[10])
        {
            NotBlank = true;
            TableRelation = Employee where ("Posting Group"=const('BOARD'));

            trigger OnValidate()
            begin
                   Employee.Reset;
                   if Employee.Get(Code) then
                   "Commisioner Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
            end;
        }
        field(3;"Commisioner Name";Text[50])
        {
        }
        field(4;"Committee Code";Code[10])
        {
            TableRelation = "Committee Type1";
        }
        field(5;Attended;Boolean)
        {

            trigger OnValidate()
            begin
                 /*
                 IF Attended THEN
                 EDSetup.RESET;
                 EDSetup.SETRANGE(EDSetup."Calculation Type",EDSetup."Calculation Type"::"Per sitting");
                 EDSetup.SETRANGE(EDSetup.Type,EDSetup.Type::Allowance);
                 IF EDSetup.FIND('-') THEN
                 REPEAT
                    CommTrans.INIT;
                    CommTrans.Commissioner:=Code;
                    CommTrans."Meeting ID":="Meeting Code";
                    CommTrans."Meeting Description":=Campaign."Committee Name";
                
                    CommTrans.Description:=EDSetup.Description;
                   CommTrans."E/D Code":=EDSetup.Code;
                   CommTrans."Transact Date":=TODAY;
                   CommTrans."Payroll Period":=TODAY;
                   CommTrans."Commissioner Name":="Commisioner Name";
                
                  IF CommissionerED.GET(CommTrans.Commissioner,EDSetup.Code) THEN
                  CommTrans."Gross  Amount":=CommissionerED.Amount;
                  IF EDSetup.Taxable=TRUE THEN
                   BEGIN
                  CommExpSetup.GET;
                  CommTrans.Tax:=(CommExpSetup."Tax %"*CommissionerED.Amount)/100;
                  CommTrans.Amount:=CommTrans."Gross  Amount"-CommTrans.Tax;
                   END
                     ELSE
                     CommTrans.Amount:=CommTrans."Gross  Amount";
                  CommTrans.INSERT;
                 UNTIL EDSetup.NEXT=0;
                   */

            end;
        }
        field(6;Email;Text[100])
        {
        }
        field(7;"Meeting Name";Text[50])
        {
        }
        field(8;"Total Amount";Decimal)
        {
            CalcFormula = -sum("G/L Entry".Amount where ("G/L Account No."=const('302210'),
                                                         "Global Dimension 2 Code"=field(Code),
                                                         "Document No."=field("Meeting Code")));
            FieldClass = FlowField;
        }
        field(9;"Commissioner Tax";Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where ("G/L Account No."=filter('302110'),
                                                        "Global Dimension 2 Code"=field(Code),
                                                        "Document No."=field("Meeting Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Meeting Code","Code","Committee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        GeneralLedger: Record "General Ledger Setup";
        EDSetup: Record "Commissioner ED1";
        CommTrans: Record "Commissioner Transactions1";
        CommissionerED: Record "Commissioner ED Setup1";
        CommExpSetup: Record "Commissioner Expe Payables1";
        Comm: Record "Commisioner Committee1";
        Campaign: Record Campaign;
}

