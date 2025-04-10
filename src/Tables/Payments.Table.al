Table 52193679 Payments
{
    DrillDownPageID = "Payment Listing";
    LookupPageID = "Payment Listing";

    fields
    {
        field(1;No;Code[20])
        {

            trigger OnValidate()
            begin

                if No <> xRec.No then begin
                  GenLedgerSetup.Get;
                  if "Payment Type"="payment type"::Normal then begin
                    NoSeriesMgt.TestManual(GenLedgerSetup."Payments No");
                  end
                  else begin
                    //NoSeriesMgt.TestManual(GenLedgerSetup."Petty Cash Payments No");
                  end;
                  "No. Series" := '';
                end;
            end;
        }
        field(2;Date;Date)
        {

            trigger OnValidate()
            begin
                    if Status=Status::Released then begin
                       Error('You cannot change the date at this stage');
                        exit;
                // change the property so that it cannot be change after the document is released;
                    end
            end;
        }
        field(3;Type;Code[20])
        {
            TableRelation = "Receipts and Payment Types1".Code where (Type=filter(Payment));

            trigger OnValidate()
            begin
                 "Account No.":='';
                 "Account Name":='';
                 Remarks:='';

                if RecPayTypes.Get(Type,RecPayTypes.Type::Payment) then begin
                Grouping:=RecPayTypes."Default Grouping";
                "Account Type":=RecPayTypes."Account Type";
                "Transaction Name":=RecPayTypes.Description;




                if RecPayTypes."Account Type"=RecPayTypes."account type"::"G/L Account" then begin
                if RecPayTypes."G/L Account"<>'' then
                begin
                "Account No.":=RecPayTypes."G/L Account";
                Validate("Account No.");
                end;
                end;


                end;

                //VALIDATE("Account No.");
            end;
        }
        field(4;"Pay Mode";Code[30])
        {
            NotBlank = true;
            TableRelation = "Payment ModesPS".Code;

            trigger OnValidate()
            begin
                 if BankAcc.Get("Paying Bank Account") then
                 begin
                   Currency:=BankAcc."Currency Code";
                  "Bank Name":=BankAcc.Name;
                   Validate(Currency);
                   Validate(Amount);
                   if "Pay Mode"='CHEQUE' then
                   begin
                  // "Cheque No":=BankAcc."Last Check No.";
                  // MODIFY;
                   end;
                 end;
            end;
        }
        field(5;"Cheque No";Code[20])
        {

            trigger OnValidate()
            begin
                /*IF "Pay Mode"='CHEQUE' THEN
                 ValidateChequeNo("Cheque No");
                PVRec.RESET;
                PVRec.SETRANGE(PVRec."Cheque No","Cheque No");
                IF PVRec.FIND('-') THEN
                 ERROR('Cheque No %1 has already been used in Payment %2!',PVRec."Cheque No",PVRec.No);
                */

            end;
        }
        field(6;"Cheque Date";Date)
        {
        }
        field(7;"Cheque Type";Code[20])
        {
            TableRelation = "Cheque Types1";
        }
        field(8;"KBA Bank Code";Code[20])
        {
            TableRelation = "Employee Bank AccountX1".Code;
        }
        field(9;"Received From";Text[100])
        {
        }
        field(10;"On Behalf Of";Text[100])
        {
        }
        field(11;Cashier;Code[70])
        {
        }
        field(12;"Account Type";Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13;"Account No.";Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name":='';
                RecPayTypes.Reset;
                RecPayTypes.SetRange(RecPayTypes.Code,Type);
                RecPayTypes.SetRange(RecPayTypes.Type,RecPayTypes.Type::Payment);

                if "Account Type" in ["account type"::"G/L Account","account type"::Customer,"account type"::Vendor,"account type"::"IC Partner"]
                then

                case "Account Type" of
                  "account type"::"G/L Account":
                    begin
                      GLAcc.Get("Account No.");
                      "Account Name":=GLAcc.Name;
                      "VAT Code":=RecPayTypes."VAT Code";
                      "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                      "Global Dimension 1 Code":='';
                      Payee:="Account Name";
                    end;
                  "account type"::Customer:
                    begin
                      Cust.Get("Account No.");
                      "Account Name":=Cust.Name;
                      //"VAT Code":=Cust."Default VAT Code";
                      //"Withholding Tax Code":=Cust."Default Withholding Tax Code";
                      //"Global Dimension 1 Code":=Cust."Global Dimension 1 Code";
                      Payee:="Account Name";
                    end;
                  "account type"::Vendor:
                    begin
                      Vend.Get("Account No.");
                      "Account Name":=Vend.Name;
                      //"VAT Code":=Vend."Default VAT Code";
                      //"Withholding Tax Code":=Vend."Default Withholding Tax Code";
                      //"Global Dimension 1 Code":=Vend."Global Dimension 1 Code";
                      Payee:="Account Name";

                    end;
                  "account type"::"Bank Account":
                    begin
                      BankAcc.Get("Account No.");
                      "Account Name":=BankAcc.Name;
                      Payee:="Account Name";
                     // "VAT Code":=RecPayTypes."VAT Code";
                     // "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                     // "Global Dimension 1 Code":=BankAcc."Global Dimension 1 Code";

                    end;
                  "account type"::"Fixed Asset":
                    begin
                      FA.Get("Account No.");
                      "Account Name":=FA.Description;
                      Payee:="Account Name";
                      //"VAT Code":=FA."Default VAT Code";
                      //"Withholding Tax Code":=FA."Default Withholding Tax Code";
                      // "Global Dimension 1 Code":=FA."Global Dimension 1 Code";

                    end;
                end;
                Payee:="Account Name";
                Validate(Payee);
            end;
        }
        field(14;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15;"Account Name";Text[150])
        {
        }
        field(16;Posted;Boolean)
        {
        }
        field(17;"Date Posted";Date)
        {
        }
        field(18;"Time Posted";Time)
        {
        }
        field(19;"Posted By";Code[70])
        {
        }
        field(20;Amount;Decimal)
        {

            trigger OnValidate()
            begin
                      "Amount (LCY)":=CurrExchRate.ExchangeAmtFCYToLCY(Date,Currency,Amount,"Exchange Factor");
                    /* IF Tarriff.GET("Withholding Tax Code") THEN
                     BEGIN
                      "Withholding Tax Amount":=(Tarriff.Percentage/100)*Amount;
                      "Net Amount":=Amount-"Withholding Tax Amount";
                     END;*/

            end;
        }
        field(21;Remarks;Text[100])
        {
        }
        field(22;"Transaction Name";Text[100])
        {
        }
        field(23;"VAT Code";Code[20])
        {
            TableRelation = "Tarriff Codes1";
        }
        field(24;"Withholding Tax Code";Code[20])
        {
            TableRelation = "Tarriff Codes1";

            trigger OnValidate()
            begin
                    /* IF Tarriff.GET("Withholding Tax Code") THEN
                     BEGIN
                    // MESSAGE('gETS HERE');
                      "Withholding Tax Amount":=(Tarriff.Percentage/100)*Amount;
                      "Net Amount":=Amount-"Withholding Tax Amount";
                     END;*/

            end;
        }
        field(25;"VAT Amount";Decimal)
        {
        }
        field(26;"Withholding Tax Amount";Decimal)
        {
        }
        field(27;"Net Amount";Decimal)
        {
        }
        field(28;"Paying Bank Account";Code[20])
        {
            NotBlank = true;
            TableRelation = "Bank Account";

            trigger OnValidate()
            begin
                 if BankAcc.Get("Paying Bank Account") then
                 begin
                   Currency:=BankAcc."Currency Code";
                  "Bank Name":=BankAcc.Name;
                   Validate(Currency);
                   Validate(Amount);
                   if "Pay Mode"='CHEQUE' then
                   begin
                    if BankAcc."Last Check No."='' then
                    begin
                     PVRec.Reset;
                     PVRec.SetFilter(PVRec."Cheque No",'<>%1','');
                     if PVRec.Find('+') then
                      BankAcc."Last Check No.":=PVRec."Cheque No";
                      BankAcc.Modify;
                    end;
                    // MESSAGE('Last check no=%1',BankAcc."Last Check No.");

                    Evaluate(VarInteger,BankAcc."Last Check No.");
                    "Cheque No":=Format(VarInteger+1);
                    BankAcc."Last Check No.":="Cheque No";
                    BankAcc.Modify;

                   // MESSAGE('Last check no=%1',BankAcc."Last Check No.");
                   end;
                 end;
            end;
        }
        field(29;Payee;Text[100])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                 Payee:=UpperCase(Payee);
            end;
        }
        field(30;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(31;"Branch Code";Code[20])
        {
        }
        field(32;"PO/INV No";Code[20])
        {
        }
        field(33;"Bank Account No";Code[20])
        {
        }
        field(34;"Cashier Bank Account";Code[20])
        {
        }
        field(35;Status;Option)
        {
            Editable = false;
            Enabled = true;
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(36;Select;Boolean)
        {
        }
        field(37;Grouping;Code[20])
        {
            TableRelation = if ("Account Type"=const(Customer)) "Customer Posting Group".Code
                            else if ("Account Type"=const(Vendor)) "Vendor Posting Group".Code;
        }
        field(38;"Payment Type";Option)
        {
            OptionMembers = Normal,"Petty Cash","Payment Voucher",Imprest,"Imprest Surrender","Imprest Requisitioning";

            trigger OnValidate()
            begin
                 if BankAcc.Get("Paying Bank Account") then
                 begin
                   Currency:=BankAcc."Currency Code";
                  "Bank Name":=BankAcc.Name;
                   Validate(Currency);
                   Validate(Amount);
                   if "Pay Mode"='CHEQUE' then
                   begin
                   "Cheque No":=BankAcc."Last Check No.";
                   Modify;
                   end;
                 end;
            end;
        }
        field(39;"Bank Type";Option)
        {
            OptionMembers = Normal,"Petty Cash";
        }
        field(40;"PV Type";Option)
        {
            OptionMembers = Normal,Other;
        }
        field(41;"Apply to";Code[20])
        {
        }
        field(42;"Apply to ID";Code[20])
        {
        }
        field(43;"No of Units";Decimal)
        {
        }
        field(44;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(45;Currency;Code[10])
        {
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                  if Currency<>'' then begin
                    CurrExchRate.Reset;
                    CurrExchRate.SetRange(CurrExchRate."Currency Code",Currency);
                    CurrExchRate.SetRange(CurrExchRate."Starting Date",0D,Today);
                    if CurrExchRate.Find('+') then begin
                     "Exchange Rate":=CurrExchRate."Relational Exch. Rate Amount";
                     if CurrExchRate."Relational Exch. Rate Amount"<>0 then
                      "Exchange Factor":=CurrExchRate."Exchange Rate Amount"/CurrExchRate."Relational Exch. Rate Amount";

                    end;
                  end;
            end;
        }
        field(46;"Exchange Rate";Decimal)
        {
        }
        field(47;"Amount (LCY)";Decimal)
        {
        }
        field(48;"Exchange Factor";Decimal)
        {
        }
        field(49;"Cheque Printed";Boolean)
        {
        }
        field(50;"Bank Name";Text[250])
        {
            Editable = false;
        }
        field(51;"Total Amount";Decimal)
        {
            CalcFormula = sum("PV Lines1"."Net Amount" where ("PV No"=field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(52;"KBA Branch Code";Code[10])
        {
            TableRelation = "Employee Bank AccountX1"."Bank Branch No." where (Code=field("KBA Bank Code"));
        }
        field(53;"Base Amount";Decimal)
        {
            CalcFormula = sum("PV Lines1".Amount where ("PV No"=field(No),
                                                        Tax=const(false)));
            FieldClass = FlowField;
        }
        field(54;"Transaction Type";Option)
        {
            OptionMembers = Payments,Imprest;
        }
        field(55;"Imprest No";Code[20])
        {
            TableRelation = "Request Header1";

            trigger OnValidate()
            begin
                if ReaquestHeader.Get("Imprest No") then begin

                end;
            end;
        }
        field(56;Paid;Boolean)
        {
        }
        field(57;"Vendor No";Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                 if Vend.Get("Vendor No") then
                 Payee:=Vend.Name;
            end;
        }
        field(59;Archived;Boolean)
        {
        }
        field(60;Institution;Text[30])
        {
        }
        field(61;"Investment No";Code[20])
        {
        }
        field(62;"Investment Type";Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(63;"Investment Transcation Type";Option)
        {
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,Principal;
        }
        field(64;"Issue No.";Code[20])
        {
        }
        field(65;Rate;Decimal)
        {
        }
        field(66;"No. Printed";Integer)
        {
        }
        field(67;Collected;Boolean)
        {
        }
        field(68;"Eft Generated";Boolean)
        {
            Editable = true;
        }
        field(69;"Global Dimension 3 Code";Code[10])
        {
        }
        field(70;BoardMemberNo;Code[30])
        {
        }
        field(71;"No of Approvals";Integer)
        {
        }
        field(72;CreditorInstitution;Code[30])
        {
        }
        field(73;Source;Option)
        {
            OptionCaption = 'Payment Voucher,Imprest,Petty Cash Voucher';
            OptionMembers = "Payment Voucher",Imprest,"Petty Cash Voucher";
        }
        field(74;"Amount Paid";Decimal)
        {
        }
        field(75;"Imprest Deadline";Date)
        {
        }
        field(76;"Partial No.";Code[10])
        {
        }
        field(77;"Partial Line No.";Integer)
        {
        }
        field(78;"Petty Cash Total Amount";Decimal)
        {
        }
        field(79;"Dimension Set ID";Code[10])
        {
        }
        field(80;"Created From Mprest";Boolean)
        {
        }
        field(81;Purpose;Text[2048])
        {
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted=true then
        Error('The transaction has already been posted and therefore cannot be modified.');

        if Status<>Status::Open then
        Error('You cannot modify this voucher');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
          GenLedgerSetup.Get;

          if "Payment Type"="payment type"::Normal then begin
             GenLedgerSetup.TestField(GenLedgerSetup."Payments No");
             NoSeriesMgt.InitSeries(GenLedgerSetup."Payments No",xRec."No. Series",0D,No,"No. Series");
          end
          else begin
             //GenLedgerSetup.TESTFIELD(GenLedgerSetup."Petty Cash Payments No");
             //NoSeriesMgt.InitSeries(GenLedgerSetup."Petty Cash Payments No",xRec."No. Series",0D,No,"No. Series");
          end;
        end;

        Date:=Today;
        Cashier:=UserId;
    end;

    trigger OnModify()
    begin
        /*
        IF Posted=TRUE THEN
        ERROR('The transaction has already been posted and therefore cannot be modified.');
        IF Status<>Status::Open THEN
        BEGIN
        //ERROR('You cannot modify this voucher');
        END;
        */

    end;

    trigger OnRename()
    begin
        if Posted=true then
        Error('The transaction has already been posted and therefore cannot be modified.');

        if Status<>Status::Open then
        Error('You cannot modify this voucher');
    end;

    var
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        FA: Record "Fixed Asset";
        BankAcc: Record "Bank Account";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        RecPayTypes: Record "Receipts and Payment Types1";
        CurrExchRate: Record "Currency Exchange Rate";
        LastLineNo: Integer;
        ReaquestHeader: Record "Request Header1";
        RequestLines: Record "Request Lines1";
        Text000: label 'You cannot enter zero as the first digit of a cheque Number';
        Text001: label 'The Cheque Number length should be 5';
        PVRec: Record Payments;
        VarInteger: Integer;
        NewChequeNo: Integer;


    procedure AssistEdit(OldPvRec: Record Payments): Boolean
    var
        Pv: Record Payments;
    begin
        with PVRec do begin
          Pv := Rec;
          GenLedgerSetup.Get;
          GenLedgerSetup.TestField(GenLedgerSetup."Payments No");
          NoSeriesMgt.InitSeries(GenLedgerSetup."Payments No",xRec."No. Series",0D,No,"No. Series");
            NoSeriesMgt.SetSeries(No);
            Rec := Pv;
            exit(true);
        end;
    end;


    procedure CreateTaxes(var PV: Record Payments)
    var
        PVlines: Record "PV Lines1";
        GenJnline: Record "Gen. Journal Line";
        TariffRec: Record "Tarriff Codes1";
        VATPsetup: Record "VAT Posting Setup";
        PurchInvoice: Record "Purch. Inv. Header";
    begin
         GenJnline.Reset;                               ;
         GenJnline.SetRange(GenJnline."Journal Template Name",'GENERAL');
         GenJnline.SetRange(GenJnline."Journal Batch Name",'ACCR-TAX');
         if GenJnline.Find('+') then
         LastLineNo:=GenJnline."Line No.";


        PVlines.Reset;
        PVlines.SetRange(PVlines."PV No",PV.No);
        if PVlines.Find('-') then
        repeat
        LastLineNo:=LastLineNo+10000;
        GenJnline.Init;
        GenJnline."Journal Template Name":='GENERAL';
        GenJnline."Journal Batch Name":='ACCR-TAX';
        GenJnline."Line No.":=LastLineNo;
        GenJnline."Account Type":=PVlines."Account Type";
        GenJnline."Account No.":=PVlines."Account No";
        GenJnline."Posting Date":=PV.Date;
        GenJnline."Document No.":=PVlines."PV No";
        GenJnline."External Document No.":=PVlines."Applies to Doc. No";
        GenJnline.Description:='VAT Withheld';
        GenJnline.Amount:=PVlines."VAT Amount";
        GenJnline."Bal. Account Type":=GenJnline."bal. account type"::"G/L Account";
        GenJnline."Bal. Account No.":='304000';
        if GenJnline.Amount<>0 then
        GenJnline.Insert;


        GenJnline.Init;
        LastLineNo:=LastLineNo+10000;
        GenJnline."Journal Template Name":='GENERAL';
        GenJnline."Journal Batch Name":='ACCR-TAX';
        GenJnline."Line No.":=LastLineNo;
        GenJnline."Account Type":=PVlines."Account Type";
        GenJnline."Account No.":=PVlines."Account No";
        GenJnline."Posting Date":=PV.Date;
        GenJnline."Document No.":=PVlines."PV No";
        GenJnline."External Document No.":=PVlines."Applies to Doc. No";
        GenJnline.Description:='Tax Withheld';
        GenJnline.Amount:=PVlines."W/Tax Amount";
        GenJnline."Bal. Account Type":=GenJnline."bal. account type"::"G/L Account";
        GenJnline."Bal. Account No.":='307000';
        if GenJnline.Amount<>0 then
        GenJnline.Insert;



        until PVlines.Next=0;
    end;


    procedure ValidateChequeNo(ChequeNo: Code[10])
    var
        FirstDigit: Text[1];
        ChequeLength: Integer;
    begin
        FirstDigit := CopyStr(ChequeNo,1,1);
        if FirstDigit='0' then
         Error(Text000);
        ChequeLength:= StrLen(ChequeNo);
        if ChequeLength<>5 then
         Error(Text001);
    end;
}

