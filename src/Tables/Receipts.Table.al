Table 52193585 Receipts
{
    DrillDownPageID = "Unallocated List";
    LookupPageID = "Unallocated List";

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Account No."; Code[20])
        {

            trigger OnValidate()
            begin

                if "Account Type" = "account type"::Customer then begin
                    Cust.Reset;
                    Cust.SetRange(Cust."No.", "Account No.");
                    if Cust.Find('-') then begin
                        "Member name" := Cust.Name;
                        "Personal No." := Cust."Staff No";

                    end;
                end;

                if "Account Type" = "account type"::"G/L Account" then begin
                    "GL Account".Reset;
                    "GL Account".SetRange("GL Account"."No.", "Account No.");
                    if "GL Account".Find('-') then begin
                        "Member name" := "GL Account".Name;
                    end;
                end;
            end;
        }
        field(3; "Receipt Date"; Date)
        {
        }
        field(4; "Total Line Amount"; Decimal)
        {
            CalcFormula = sum("Receipts Lines".Amount where(No = field(No)));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                Validate("Received Amount");
            end;

            trigger OnValidate()
            begin
                Validate("Received Amount");
            end;
        }
        field(5; "No.Series"; Code[20])
        {
        }
        field(6; Cashier; Code[80])
        {
        }
        field(7; "Bank Account"; Code[20])
        {
            // TableRelation = "Bank Account"."No." where(Type = filter(Bank | "Petty Cash"),
            //                                             "Account Type" = filter(" "));
        }
        field(8; "Ext. Document No."; Code[20])
        {
        }
        field(9; Posted; Boolean)
        {
            Editable = false;
        }
        field(10; "Receipt Mode"; Code[20])
        {
            TableRelation = "Payment Modes".Code;
        }
        field(11; "Member name"; Text[60])
        {
        }
        field(12; "Cheque No."; Code[20])
        {
        }
        field(13; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(14; "Account Name"; Code[20])
        {
        }
        field(15; "Unallocated Receipt"; Code[20])
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Unallocated Receipt';
            Editable = true;
            // TableRelation = "Receipts Header1" where("Unallocated Receipt" = filter(false),
            //                                           "Employer Code" = filter(<> ''));

            trigger OnValidate()
            begin
                if "Unallocated Receipt" = '' then begin
                    "Employer Code" := '';
                    Validate("Employer Code");
                    "Received Amount" := 0;
                    Validate("Received Amount");
                    "Received From" := '';
                    "On Behalf Of" := '';
                    "Receipt Mode" := '';
                    "Cheque No." := '';
                    "Cheque Date" := 0D;
                end;


                if Allocate.Get("Unallocated Receipt") then begin
                    "Employer Code" := Allocate."Employer Code";
                    Validate("Employer Code");
                    "Received Amount" := Allocate.Amount;
                    Validate("Received Amount");
                    "Received From" := Allocate."Received From";
                    "On Behalf Of" := Allocate."On Behalf Of";
                    "Receipt Mode" := Allocate."Pay Mode";
                    "Cheque No." := Allocate."Cheque No";
                    "Cheque Date" := Allocate."Cheque Date";
                end;
            end;
        }
        field(16; "Cheque Date"; Date)
        {
        }
        field(24; "Activity Code"; Code[30])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(25; "Personal No."; Code[30])
        {
        }
        field(26; Branch; Text[40])
        {
            TableRelation = "Dimension Value";
        }
        field(27; "Creation Date"; Date)
        {
            Editable = false;
        }
        field(28; Status; Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Reversed,Rejected';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Reversed,Rejected;
        }
        field(29; "Entered By"; Code[80])
        {
        }
        field(30; "Entered Date"; Date)
        {
        }
        field(31; "Approved By"; Code[20])
        {
        }
        field(32; "Approved Date"; Date)
        {
        }
        field(33; "Line Totals"; Decimal)
        {
        }
        field(34; "Posting Date"; Date)
        {
        }
        field(35; "Employer Code"; Code[30])
        {
            Editable = false;
            // TableRelation = "Bank Account"."No." where(Status = filter(Released),
            //                                             Type = filter(Bank),
            //                                             "Account Type" = const(Employer));

            trigger OnValidate()
            var
                TotalExpectedLRepay: Decimal;
                TotalExpectedContrib: Decimal;
                TotalExpected: Decimal;
            begin
                BosaSetup.Get;

                if "Employer Code" = '' then begin
                    "Bank Account" := '';
                    "Received From" := '';

                    //Lines Total
                    RecLine.Reset;
                    RecLine.SetRange(RecLine.No, No);
                    RecLine.DeleteAll;

                    //Lines Total of the Combined products and loans
                    ReallocateLines.Reset;
                    ReallocateLines.SetRange(ReallocateLines.No, No);
                    ReallocateLines.DeleteAll;
                end;


                if Employer.Get("Employer Code") then begin
                    "Received From" := Employer.Name;
                    "Bank Account" := "Employer Code";

                    //Lines Total
                    RecLine.Reset;
                    RecLine.SetRange(RecLine.No, No);
                    RecLine.DeleteAll;

                    //Lines Total of the Combined products and loans
                    ReallocateLines.Reset;
                    ReallocateLines.SetRange(ReallocateLines.No, No);
                    ReallocateLines.DeleteAll;



                    Cust.Reset;
                    Cust.SetRange(Cust."Employer Code", "Employer Code");
                    if Cust.Find('-') then begin
                        repeat
                            RecLine.Reset;
                            RecLine.SetRange(RecLine.No, No);
                            LineNo := LineNo + 1000;


                            //Inserting the Expected Amounts
                            MontContrib.Reset;
                            MontContrib.SetRange("Member No.", Cust."No.");
                            MontContrib.SetRange("Share Capital", false);
                            if MontContrib.Find('-') then begin
                                repeat
                                    ContribAmnt := MontContrib."Expected Contribution";
                                    //Inserting Contributions
                                    RecLine.Init;
                                    RecLine.No := No;
                                    RecLine."Line No." := LineNo;
                                    RecLine."Account Type" := RecLine."account type"::Customer;
                                    RecLine."Account No." := Cust."No.";
                                    RecLine."Account Name" := Cust.Name;
                                    RecLine.Amount := ContribAmnt;
                                    RecLine.Validate(Amount);
                                    RecLine.Type := RecLine.Type::Contribution;
                                    RecLine."Transaction Type" := RecLine."transaction type"::"Deposit Contribution";
                                    RecLine."Product Code" := MontContrib."Product Code";
                                    RecLine.Validate("Product Code");
                                    RecLine."Transaction Code" := BosaSetup."Default Contribution Trans";
                                    RecLine.Validate("Transaction Code");
                                    if not RecLine.Get(Rec.No, RecLine."Line No.") then begin
                                        RecLine.SetRange("Account No.", RecLine."Account No.");
                                        if RecLine.Find('-') then
                                            RecLine.Modify(true)
                                        else
                                            RecLine.Insert(true);
                                    end;
                                //TotalExpectedContrib:=TotalExpectedContrib+ContribAmnt;
                                until MontContrib.Next = 0;
                            end;

                        //Inserting Loan Repayment
                        //         LoanRec.Reset;
                        //         LoanRec.SetRange("Member No.", Cust."No.");
                        //         LoanRec.SetRange(Posted, true);
                        //         LoanRec.SetRange("Fully Paid", false);
                        //         LoanRec.SetRange(Source, LoanRec.Source::BOSA);
                        //         if LoanRec.Find('-') then begin
                        //             repeat
                        //                 LoanRec.CalcFields("Outstanding Balance");
                        //                 if LoanRec."Outstanding Balance" > 0 then begin
                        //                     LineNo := LineNo + 1000;
                        //                     RecLine.Init;
                        //                     RecLine.No := No;
                        //                     RecLine."Line No." := LineNo;
                        //                     RecLine."Account Type" := RecLine."account type"::Customer;
                        //                     RecLine."Account No." := Cust."No.";
                        //                     RecLine."Account Name" := Cust.Name;
                        //                     LoanRec.CalcFields("Outstanding Balance", "Interest Due");
                        //                     LoanAmount := LoanRec."Outstanding Balance" - LoanRec."Interest Due";
                        //                     InterestRate := LoanRec.Interest;
                        //                     RepayPeriod := LoanRec.Installments;
                        //                     LoanRepayAmount(LoanRec);
                        //                     RecLine.Type := RecLine.Type::Repayment;
                        //                     RecLine."Transaction Type" := RecLine."transaction type"::"Loan Repayment";
                        //                     RecLine."Transaction Code" := BosaSetup."Loan Repayment Transaction";
                        //                     RecLine.Validate("Transaction Code");
                        //                     RecLine."Loan No." := LoanRec."Loan No.";
                        //                     RecLine.Validate("Loan No.");
                        //                     RecLine."Loan Type" := LoanRec."Loan Product Type";
                        //                     RecLine."Loan Type Name" := LoanRec."Loan Product Type Name";
                        //                     RecLine."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
                        //                     RecLine.Validate("Global Dimension 1 Code");
                        //                     if not RecLine.Get(Rec.No, RecLine."Line No.") then
                        //                         RecLine.Insert(true)
                        //                     else
                        //                         RecLine.Modify(true);
                        //                 end;
                        //             //TotalExpectedLRepay:=TotalExpectedLRepay+RecLine.Amount;
                        //             until LoanRec.Next = 0;
                        //         end;


                        until Cust.Next = 0;
                    end;

                    //"Expected Total Amount":=TotalExpectedLRepay;//TotalExpectedContrib;//+TotalExpectedLRepay;
                    //"Expected Total Amount":=0;
                    //Inserting Total Lines in the distribution table
                    CustRec.Reset;
                    CustRec.SetRange("Employer Code", "Employer Code");
                    if CustRec.Find('-') then begin
                        repeat
                            //Inserting totals of Products and Loans
                            ReallocateLines.Reset;
                            ReallocateLines.SetRange(ReallocateLines.No, No);
                            LineNo := LineNo + 1000;

                            ReallocateLines.Init;
                            ReallocateLines.No := No;
                            ReallocateLines."Line No." := LineNo;
                            ReallocateLines."Account Type" := RecLine."account type"::Customer;
                            ReallocateLines."Account No." := CustRec."No.";
                            ReallocateLines."Account Name" := CustRec.Name;
                            if not ReallocateLines.Get(Rec.No, ReallocateLines."Line No.") then begin
                                ReallocateLines.SetRange("Account No.", ReallocateLines."Account No.");
                                if ReallocateLines.Find('-') then
                                    ReallocateLines.Modify(true)
                                else
                                    ReallocateLines.Insert(true);
                            end;
                            // ReallocateLines.CalcFields("Total Amount");
                            ReallocateLines."Expected Amount" := ReallocateLines."Total Amount";
                            ReallocateLines.Modify(true);

                        until CustRec.Next = 0;
                    end;


                end;
            end;

        }
        field(36; "Received From"; Code[40])
        {
        }
        field(37; "Staff No"; Code[20])
        {
            TableRelation = Customer."Staff No";
        }
        field(38; Remarks; Text[100])
        {
        }
        field(40; "On Behalf Of"; Text[100])
        {
        }
        field(41; "Receipt Type"; Code[50])
        {
            TableRelation = "Receipts and Payments Types".Code;
        }
        field(42; Description; Text[100])
        {
        }
        field(43; "Posting Time"; Time)
        {
        }
        field(44; "Posted By"; Code[80])
        {
        }
        field(45; "Global Dimension 1 Code"; Code[30])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(46; "Global Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(47; "Currency Code"; Code[30])
        {
            TableRelation = Currency.Code;
        }
        field(49; Variance; Decimal)
        {
            Editable = false;
        }
        field(50; "Received Amount"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                CalcFields("Total Line Amount");
                Variance := "Total Line Amount" - "Received Amount";
            end;
        }
        field(51; "Allocated Amount"; Decimal)
        {
            CalcFormula = sum("Allocated Receipts".Amount where("Receipt No" = field(No)));
            FieldClass = FlowField;
        }
        field(52; "Expected Total Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
        key(Key2; "Receipt Date")
        {
        }
        key(Key3; "Account No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted then
            Error('The the transaction is posted');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            BosaSetup.Get;
            BosaSetup.TestField(BosaSetup."Reallocation Nos");
            NoSeriesMgt.InitSeries(BosaSetup."Reallocation Nos", xRec."No.Series", 0D, No, "No.Series");
        end;
        "Receipt Date" := Today;
        Cashier := UserId;
        "Creation Date" := Today;
    end;

    trigger OnModify()
    begin
        if Posted then
            Error('The the transaction is posted');
    end;

    trigger OnRename()
    begin
        if Posted then
            Error('The the transaction is posted');
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Cust: Record Customer;
        CustRec: Record Customer;
        "cashier receipt": Record Receipts;
        "GL Account": Record "G/L Account";
        cashrec: Record "Receipts Lines";
        cashierr: Record "Receipts Lines";
        Employer: Record "Bank Account";
        PaymentModes: Record "Payment Modes";
        Receipt: Record "Receipts and Payments Types";
        RecLine: Record "Receipts Lines";
        LineNo: Integer;
        // LoanRec: Record Loans;
        TotalMRepay: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        LoanAmount: Decimal;
        LPrincipal: Decimal;
        Linterest: Decimal;
        LBalance: Decimal;
        InitialInstal: Integer;
        InitialGraceInt: Integer;
        GrPrinciple: Decimal;
        InPeriod: DateFormula;
        GrInterest: Decimal;
        BosaSetup: Record "Bosa Setup";
        Allocate: Record "Receipts Header1";
        MontContrib: Record "Monthly Contributions";
        ContribAmnt: Decimal;
        ReallocateLines: Record "Reallocation Lines";
        ProdTotalBal: Decimal;
        LoanTotalBal: Decimal;


    procedure AssistEdit(): Boolean
    begin
    end;


    // procedure LoanRepayAmount(var LoanR: Record Loans)
    // begin
    //     with LoanR do begin

    //         if LoanAmount > 0 then begin

    //             if "Repayment Method" = "repayment method"::Amortised then begin

    //                 TotalMRepay := ROUND((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -RepayPeriod)) * LoanAmount, 0.05, '>');
    //                 Linterest := ROUND(LoanAmount / 100 / 12 * InterestRate, 0.05, '>');
    //                 LPrincipal := TotalMRepay - Linterest;

    //                 RecLine.Amount := TotalMRepay;
    //                 RecLine.Validate(Amount);
    //                 RecLine.Principal := LPrincipal;
    //                 RecLine.Interest := Linterest;

    //             end;

    //             if "Repayment Method" = "repayment method"::"Straight Line" then begin

    //                 LPrincipal := ROUND(LoanAmount / RepayPeriod, 0.05, '>');
    //                 Linterest := ROUND((InterestRate / 12 / 100) * LoanAmount, 0.05, '>');
    //                 //Grace Period Interest
    //                 Linterest := ROUND((Linterest * InitialInstal) / (InitialInstal - InitialGraceInt), 0.05, '>');

    //                 RecLine.Amount := Linterest + LPrincipal;
    //                 RecLine.Validate(Amount);
    //                 RecLine.Principal := Linterest;
    //                 RecLine.Interest := LPrincipal;

    //             end;

    //             if "Repayment Method" = "repayment method"::"Reducing Balance" then begin

    //                 LPrincipal := ROUND(LoanAmount / RepayPeriod, 0.05, '>');
    //                 Linterest := ROUND((InterestRate / 12 / 100) * LoanAmount, 0.05, '>');

    //                 RecLine.Amount := Linterest + LPrincipal;
    //                 RecLine.Validate(Amount);
    //                 RecLine.Principal := LPrincipal;
    //                 RecLine.Interest := Linterest;

    //             end;

    //             if "Repayment Method" = "repayment method"::Constants then begin
    //                 TestField("Loan Repayment");
    //                 if LBalance < "Loan Repayment" then
    //                     LPrincipal := LBalance
    //                 else
    //                     LPrincipal := "Loan Repayment";


    //                 RecLine.Amount := Linterest + LPrincipal;
    //                 RecLine.Validate(Amount);
    //                 RecLine.Principal := Linterest;
    //                 RecLine.Interest := LPrincipal;

    //             end;


    //             //Grace Period
    //             if GrPrinciple > 0 then begin
    //                 LPrincipal := 0
    //             end else begin
    //                 if "Instalment Period" <> InPeriod then
    //                     LBalance := LBalance - LPrincipal;

    //             end;

    //             if GrInterest > 0 then
    //                 Linterest := 0;

    //             GrPrinciple := GrPrinciple - 1;
    //             GrInterest := GrInterest - 1;
    //             //Grace Period

    //             /*//Q Principle
    //             IF "Instalment Period" = InPeriod THEN BEGIN
    //             //ADDED
    //             IF GrPrinciple <> 0 THEN
    //             GrPrinciple:=GrPrinciple-1;
    //             IF QCounter = 1 THEN BEGIN
    //             QCounter:=3;
    //             LPrincipal:=QPrinciple+LPrincipal;
    //             IF LPrincipal > LBalance THEN
    //             LPrincipal:=LBalance;
    //             LBalance:=LBalance-LPrincipal;
    //             QPrinciple:=0;
    //             END ELSE BEGIN
    //             QCounter:=QCounter - 1;
    //             QPrinciple:=QPrinciple+LPrincipal;
    //             //IF QPrinciple > LBalance THEN
    //             //QPrinciple:=LBalance;
    //             LPrincipal:=0;
    //             END

    //             END;*/
    //             //Q Principle


    //         end;

    //     end;

    // end;
}

