Table 52193586 "Receipts Lines"
{
    DrillDownPageID = "Reallocation Linesx";
    LookupPageID = "Reallocation Linesx";

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = Receipts.No;

            trigger OnValidate()
            begin
                //************Transfering Default Accounts to the Lines
                /*CashierRec.RESET;
                CashierRec.SETRANGE(CashierRec.No,No);
                IF CashierRec.FIND('-') THEN
                 BEGIN
                  "Account Type":=CashierRec."Account Type";
                  "Account No.":=CashierRec."Account No.";
                 END;
                 */
                "Account Type" := "account type"::Customer;

            end;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                GenSetup.Get;
                "Net Amount" := Amount;

                //VALIDATE("Repayment Method");
                Validate("Product Code");
                Validate("Loan No.");
            end;
        }
        field(4; "Loan No."; Code[20])
        {
            //TableRelation = Loans."Loan No." where ("Member No."=field("Account No."));

            trigger OnValidate()
            begin
                BosaSetup.Get;

                // if LOAN.Get("Loan No.") then begin
                //     "Loan Type" := LOAN."Loan Product Type";
                //     "Loan Type Name" := LOAN."Loan Product Type Name";
                //     LOAN.CalcFields("Outstanding Balance", "Interest Due");
                //     LoanAmount := LOAN."Outstanding Balance" - LOAN."Interest Due";
                //     InterestRate := LOAN.Interest;
                //     RepayPeriod := LOAN.Installments;
                //     LoanRepayAmount(LOAN, LoanAmount);

                //     "Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
                //     Validate("Global Dimension 1 Code");

                //     if LoanType.Get(LOAN."Loan Product Type") then begin
                //         "Posting Group" := LoanType."Loan Posting Group";
                //         Validate("Posting Group");

                //         if GLAccount.Get(LoanType."Loan Account") then
                //             "G/L Account Name" := GLAccount.Name;
                //     end;

                //     Principal := Amount - Interest;

                // end else begin
                //     Principal := 0;
                //     Interest := 0;
                // end;
            end;
        }
        field(5; "Account No."; Code[20])
        {
            Caption = 'Account No.';

            trigger OnLookup()
            begin
                if "Account Type" = "account type"::"G/L Account" then begin
                    if Page.RunModal(18, GLAccount) = Action::LookupOK then begin
                        GLAccount.TestField("Direct Posting", true);
                        "Account No." := GLAccount."No.";
                        "Account Name" := GLAccount.Name;
                    end;
                end
                else if "Account Type" = "account type"::Customer then begin
                    CashierRec.Reset;
                    CashierRec.SetRange(CashierRec.No, No);
                    if CashierRec.Find('-') then
                        Cust.Reset;
                    Cust.SetRange(Cust."Employer Code", CashierRec."Employer Code");
                    if Page.RunModal(51507607, Cust) = Action::LookupOK then begin
                        "Account No." := Cust."No.";
                        "Account Name" := Cust.Name;
                        if xRec."Account No." <> "Account No." then
                            Validate(Type);
                    end;
                end
                else if "Account Type" = "account type"::Vendor then begin
                    if Page.RunModal(27, Vendor) = Action::LookupOK then begin
                        "Account No." := Vendor."No.";
                        "Account Name" := Vendor.Name;
                    end;
                end
                else if "Account Type" = "account type"::"Bank Account" then begin
                    Bank.Reset;
                    Bank.SetRange("Account Type", Bank."account type"::Employer);
                    if Page.RunModal(51507323, Bank) = Action::LookupOK then begin
                        "Account No." := Bank."No.";
                        "Account Name" := Bank.Name;
                    end;
                end
                else if "Account Type" = "account type"::"Fixed Asset" then begin
                    if Page.RunModal(5601, FixedAsset) = Action::LookupOK then begin
                        "Account No." := FixedAsset."No.";
                        "Account Name" := FixedAsset.Description;
                    end;
                end;
            end;

            trigger OnValidate()
            begin
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            if GLAccount.Get("Account No.") then
                                "Account Name" := GLAccount.Name;
                        end;
                    "account type"::Customer:
                        begin
                            if Cust.Get("Account No.") then begin
                                "Account Name" := Cust.Name;
                                "Staff No/Payroll No." := Cust."Staff No";
                                Validate("Transaction Type");
                            end;

                        end;
                    "account type"::Vendor:
                        begin
                            if Vendor.Get("Account No.") then
                                "Account Name" := Vendor.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            if Bank.Get("Account No.") then
                                "Account Name" := Bank.Name;
                        end;

                end;
            end;
        }
        field(6; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(8; "Loan Type"; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                // if LoanType.Get("Loan Type") then begin
                //     "Loan Type Name" := LoanType."Product Description";

                // LOAN.Reset;
                // LOAN.SetRange(LOAN."Loan Product Type", LoanType.Code);
                // LOAN.SetRange(LOAN."Fully Paid", false);
                // if LOAN.Find('-') then
                //     if Cust.Get(LOAN."Member No.") then begin
                //         LOAN.CalcFields("Outstanding Balance");
                //         if LOAN."Outstanding Balance" > 0 then begin
                //             "Loan No." := LOAN."Loan No.";
                //             Validate("Loan No.");
                //         end;
                //     end;
                //  end;
            end;
        }
        field(10; "Outstanding Interest"; Decimal)
        {
            Editable = false;
        }
        field(11; "Account Name"; Text[50])
        {
        }
        field(12; Description; Text[50])
        {
        }
        field(13; Principal; Decimal)
        {
            Editable = false;
        }
        field(14; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Registration Fee,Deposit Contribution,Share Contribution,Loan,Loan Repayment,Withdrawal,Interest Due,Interest Paid,Investment,Dividend Paid,Processing Fee,Withholding Tax,BBF Contribution,Other';
            OptionMembers = " ","Registration Fee","Deposit Contribution","Share Contribution",Loan,"Loan Repayment",Withdrawal,"Interest Due","Interest Paid",Investment,"Dividend Paid","Processing Fee","Withholding Tax","BBF Contribution",Other;
        }
        field(17; Interest; Decimal)
        {
            Editable = false;
        }
        field(18; "Staff No/Payroll No."; Code[20])
        {
            TableRelation = Customer."Staff No";

            trigger OnValidate()
            begin
                Cust.Reset;
                Cust.SetRange(Cust."Staff No", "Staff No/Payroll No.");
                if Cust.Find('-') then begin
                    "Account Name" := Cust.Name;
                    "Account No." := Cust."No.";
                end;
            end;
        }
        field(20; "Duplicate Nos"; Boolean)
        {
        }
        field(21; "Repayment Code"; Code[20])
        {
        }
        field(22; "VAT Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(23; "W/Tax Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(24; "VAT Amount"; Decimal)
        {
        }
        field(25; "W/Tax Amount"; Decimal)
        {
        }
        field(26; "Net Amount"; Decimal)
        {
            Editable = false;
        }
        field(27; "Receipt Type"; Code[50])
        {
            TableRelation = "Receipts and Payments Types".Code where(Type = filter(Receipts));
        }
        field(28; "Installment Nos"; Integer)
        {
            Editable = false;
            // TableRelation = "Loan Repayment Schedule"."Instalment No" where("Loan No." = field("Loan No."),
            //                                                                  "Member No." = field("Account No."),
            //                                                                  "Fully Paid" = filter(false));

            trigger OnValidate()
            begin

                // LRSchedule.Reset;
                // LRSchedule.SetRange("Instalment No", "Installment Nos");
                // LRSchedule.SetRange("Loan No.", "Loan No.");
                // if LRSchedule.Find('-') then begin
                //     Principal := LRSchedule."Principal Repayment";
                //     Interest := LRSchedule."Monthly Interest";
                // end;
            end;
        }
        field(29; "Posting Group"; Code[30])
        {
            Editable = false;
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else if ("Account Type" = const("Fixed Asset")) "FA Posting Group";
        }
        field(30; "Global Dimension 1 Code"; Code[30])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(31; "Global Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(32; "Product Code"; Code[30])
        {
            TableRelation = if (Type = filter(Contribution)) "Bosa Products" where("Transaction Type" = filter(Contribution))
            else if (Type = filter(Other)) "Bosa Products" where("Transaction Type" = filter(Other));

            trigger OnValidate()
            begin
                BosaSetup.Get;
                GenSetup.Get;

                if Prod.Get("Product Code") then begin
                    "Posting Group" := Prod."Default Grouping";
                    Validate("Posting Group");
                    "Global Dimension 1 Code" := Prod."Global Dimension 1 Code";
                    Validate("Global Dimension 1 Code");
                    "Global Dimension 2 Code" := Prod."Global Dimension 2 Code";
                    Validate("Global Dimension 2 Code");
                    if Prod."VAT Chargeable" then
                        "VAT Code" := Prod."VAT Code";
                    if Prod."Withholding Tax Chargeable" then
                        "W/Tax Code" := Prod."Withholding Tax Code";
                    "G/L Account Name" := Prod."G/L Account Name";

                    //Validating if a Member has the specified product
                    if not ProdType.Get("Account No.", Prod."Global Dimension 2 Code") then begin
                        if (Prod."Global Dimension 2 Code" <> '') and (Prod."Global Dimension 2 Code" <> 'OTHER') then
                            Error((Text004), "Account No.", Prod."Product Name");
                    end;

                    //Checking the Share Capital Deposited
                    case "Account Type" of
                        "account type"::Customer:
                            begin
                            end;
                    end;
                    //Checking the Share Capital Deposited --- End

                    Validate("Account No.");

                end;
            end;
        }
        field(33; "Transaction Code"; Code[20])
        {
            TableRelation = if (Type = filter(Contribution)) "Transactions Type" where(Type = filter(Contribution))
            else if (Type = filter(Repayment)) "Transactions Type" where(Type = filter(Repayment))
            else if (Type = filter(Other)) "Transactions Type" where(Type = filter(Other));

            trigger OnValidate()
            begin
                if Trans.Get("Transaction Code") then
                    Description := Trans.Description;
            end;
        }
        field(34; Type; Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;

            trigger OnValidate()
            begin
                "Transaction Code" := '';
                Description := '';
                "Product Code" := '';
                "Posting Group" := '';
                "G/L Account Name" := '';
            end;
        }
        field(35; "G/L Account Name"; Text[50])
        {
            Editable = false;
        }
        field(36; "Loan Type Name"; Text[50])
        {
            Editable = false;
        }
        field(37; "Repayment Method"; Option)
        {
            OptionCaption = ' ,Scheduled,Block';
            OptionMembers = " ",Scheduled,Block;

            trigger OnValidate()
            begin
                case "Repayment Method" of
                    "repayment method"::Block:
                        begin
                            Amnt := Amount;
                            // LOAN.Reset;
                            // LOAN.SetRange("Member No.", "Account No.");
                            // LOAN.SetRange("Loan No.", "Loan No.");
                            // if LOAN.Find('-') then begin
                            //     Amount := LOAN.Repayment;
                            //     "Net Amount" := Amount;
                            //     Amnt := Amnt - Amount;
                            // end;

                            if Cust.Get("Account No.") then begin
                                //         LoanType.Reset;
                                //         LoanType.SetCurrentkey(Code, "Product Priority");
                                //         if LoanType.Find('-') then
                                //             repeat
                                //                 LOAN.Reset;
                                //                 LOAN.SetRange("Member No.", Cust."No.");
                                //                 LOAN.SetRange(Source, LOAN.Source::BOSA);
                                //                 LOAN.SetRange("Loan Product Type", LoanType.Code);
                                //                 LOAN.SetRange("Fully Paid", false);
                                //                 if LOAN.Find('-') then begin
                                //                     LOAN.CalcFields("Outstanding Balance");
                                //                     LOAN.CalcFields("Interest Due");
                                //                     repeat
                                //                         LineNo := LineNo + 1000;
                                //                         if LOAN."Outstanding Balance" > 0 then
                                //                             if Amnt > 0 then begin
                                //                                 RecLines.Init;
                                //                                 RecLines.No := No;
                                //                                 RecLines."Line No." := LineNo;
                                //                                 RecLines."Account Type" := "account type"::Customer;
                                //                                 RecLines."Account No." := Cust."No.";
                                //                                 RecLines.Validate("Account No.");
                                //                                 RecLines.Type := Type::Repayment;
                                //                                 RecLines."Loan No." := LOAN."Loan No.";
                                //                                 RecLines."Loan Type" := LOAN."Loan Product Type";
                                //                                 if Amnt > LOAN.Repayment then begin
                                //                                     RecLines.Amount := LOAN.Repayment;
                                //                                     RecLines."Net Amount" := RecLines.Amount;
                                //                                     RecLines.Interest := LOAN."Interest Due";
                                //                                     RecLines.Principal := LOAN.Repayment - LOAN."Interest Due";
                                //                                 end else begin
                                //                                     RecLines.Amount := Amnt;
                                //                                     RecLines."Net Amount" := RecLines.Amount;
                                //                                     RecLines.Interest := LOAN."Interest Due";
                                //                                     RecLines.Principal := Amnt - LOAN."Interest Due";
                                //                                 end;

                                //                                 if not RecLines.Get(RecLines.No, RecLines."Line No.") then begin
                                //                                     RecLines.Reset;
                                //                                     RecLines.SetRange(No, No);
                                //                                     RecLines.SetRange("Line No.", "Line No.");
                                //                                     RecLines.SetRange("Account No.", "Account No.");
                                //                                     RecLines.SetRange("Loan No.", LOAN."Loan No.");
                                //                                     RecLines.SetRange("Loan Type", LOAN."Loan Product Type");
                                //                                     RecLines.SetRange(Type, RecLines.Type::Repayment);
                                //                                     if RecLines.Find('-') then begin
                                //                                         RecLines.Amount := Rec.Amount;
                                //                                         RecLines.Validate(Amount);
                                //                                         RecLines.Modify(true);
                                //                                     end else begin
                                //                                         RecLines.Insert(true);
                                //                                         //Amnt:=Amnt-RecLines.Amount;
                                //                                     end;
                                //                                 end;


                                //                             end;
                                //                     until (LOAN.Next = 0) or (Amnt = 0);


                                //                 end;
                                //             until LoanType.Next = 0;

                                //         if Amnt > 0 then begin
                                //             LineNo := LineNo + 1000;
                                //             RecLines.Init;
                                //             RecLines.No := No;
                                //             RecLines."Line No." := LineNo;
                                //             RecLines."Account Type" := "account type"::Customer;
                                //             RecLines."Account No." := Cust."No.";
                                //             RecLines.Validate("Account No.");
                                //             RecLines.Type := Type::Contribution;
                                //             RecLines.Amount := Amnt;
                                //             //RecLines.VALIDATE(Amount);
                                //             if not RecLines.Get(RecLines.No, RecLines."Line No.") then begin
                                //                 RecLines.Reset;
                                //                 RecLines.SetRange(No, No);
                                //                 RecLines.SetRange("Line No.", "Line No.");
                                //                 RecLines.SetRange("Account No.", "Account No.");
                                //                 RecLines.SetRange(Type, RecLines.Type::Contribution);
                                //                 if RecLines.Find('-') then begin
                                //                     RecLines.Amount := Amnt;
                                //                     RecLines.Validate(Amount);
                                //                     RecLines.Modify(true)
                                //                 end else
                                //                     RecLines.Insert(true);
                                //             end;
                                //         end;

                            end;

                        end;
                end;
            end;
        }
        field(38; "Block Amount"; Decimal)
        {
            CalcFormula = sum("Receipts Lines Block Schedule".Amount where("Account No." = field("Account No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; No, "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Account No.", "Loan No.", "Account Type")
        {
            SumIndexFields = Amount;
        }
        key(Key3; "Loan No.", "Transaction Type")
        {
            SumIndexFields = Interest;
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //Delete Lines Total of the Combined products and loans
        Cnt := 0;
        ReallocateLines.Reset;
        ReallocateLines.SetRange(No, No);
        ReallocateLines.SetRange("Account Type", "Account Type");
        ReallocateLines.SetRange("Account No.", "Account No.");
        if ReallocateLines.Find('-') then begin

            ReallocateLines1.Reset;
            ReallocateLines1.SetRange(No, ReallocateLines.No);
            ReallocateLines1.SetRange("Account Type", ReallocateLines."Account Type");
            ReallocateLines1.SetRange("Account No.", ReallocateLines."Account No.");
            if ReallocateLines1.Find('-') then begin
                repeat
                    Cnt := Cnt + 1;
                until ReallocateLines1.Next = 0;



                if Cnt = 1 then begin
                    ReallocateLines.Delete
                end else begin

                    Reset;
                    SetRange(No, No);
                    SetRange("Account Type", "Account Type");
                    SetRange("Account No.", "Account No.");
                    if Rec.Find('-') then begin
                        repeat
                            ReallocateLines.Reset;
                            ReallocateLines.SetRange(No, No);
                            ReallocateLines.SetRange("Account Type", "Account Type");
                            ReallocateLines.SetRange("Account No.", "Account No.");
                            if ReallocateLines.Find('-') then
                                ReallocateLines.CalcFields("Total Amount");
                            ReallocateLines.Validate("Total Amount");
                        until Rec.Next = 0;
                    end;
                    Reset;

                end;

            end;



        end;
    end;

    trigger OnInsert()
    begin
        //"Account Type":="Account Type"::Customer;
    end;

    var
        cashierr: Record Receipts;
        // LOAN: Record Loans;
        // LOANx: Record Loans;
        // types: Record "Loan Repayment Schedule";
        PostContributions: Codeunit "Receipt Management";
        Cust: Record Customer;
        // LRSchedule: Record "Loan Repayment Schedule";
        Balance: Decimal;
        CashierRec: Record Receipts;
        PrincipleRepayAmnt: Decimal;
        InterestRepayAmnt: Decimal;
        RecType: Record "Receipts and Payments Types";
        ProdType: Record "Monthly Contributions";
        Prod: Record "Bosa Products";
        GLAccount: Record "G/L Account";
        Vendor: Record Vendor;
        GenSetup: Record "General Set-Up";
        Amnt: Decimal;
        Text001: label 'The maximum Membership fee for Member No %1 if %2';
        Text002: label 'The Member No %1 must increase Share Capital to the minimum shares value required of %2 before attempting transaction code %3';
        Text003: label 'The transaction will result to Member No %1 exceeding the maximum allowed share capital value of %2. To increase the shares, perform the share transfer transaction, otherwise deposit %3 as Share Capital';
        TotalAmnt: Decimal;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        Emp: Record "Bank Account";
        Text004: label 'The Member No %1 does have a product %2';
        Trans: Record "Transactions Type";
        // LoanType: Record "Loan Product Types";
        BosaSetup: Record "Bosa Setup";
        L: Integer;
        RepaymentAmnt: Decimal;
        NewAmnt: Decimal;
        RecLines: Record "Receipts Lines";
        LineNo: Integer;
        MontCont: Record "Monthly Contributions";
        DiffAmnt: Decimal;
        RecLinesx: Record "Receipts Lines";
        ShareCapitalAmnt: Decimal;
        RecLine: Record "Receipts Lines";
        ReallocateLines: Record "Reallocation Lines";
        ReallocateLines1: Record "Receipts Lines";
        Cnt: Integer;
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        TotalMRepay: Decimal;
        Linterest: Decimal;
        LBalance: Decimal;
        InitialInstal: Integer;
        InitialGraceInt: Integer;
        GrPrinciple: Decimal;
        InPeriod: DateFormula;
        GrInterest: Decimal;
        LPrincipal: Decimal;
        RecHeader: Record Receipts;


    // procedure LoanRepayAmount(var LoanR: Record Loans; LoanAmount: Decimal)
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

