Table 52193595 "Reallocation Lines"
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
        field(3; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Receipts Lines".Amount where(No = field(No),
                                                             "Account Type" = field("Account Type"),
                                                             "Account No." = field("Account No.")));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                GenSetup.Get;
                /*"Net Amount":=Amount;
                
                VALIDATE("Repayment Method");
                VALIDATE("Product Code");
                VALIDATE("Loan No.");*/

            end;
        }
        field(5; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            Editable = false;

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
                        //IF xRec."Account No."<> "Account No." THEN
                        //VALIDATE(Type);
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
                                //"Staff No/Payroll No.":=Cust."Staff No";
                                //VALIDATE("Transaction Type");
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
        field(11; "Account Name"; Text[50])
        {
            Editable = false;
        }
        field(12; "Actual Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                BosaSetup.Get;
                //Clear Previous Payment Schedule
                RecLine.Reset;
                RecLine.SetRange(No, No);
                RecLine.SetRange("Account No.", "Account No.");
                RecLine.DeleteAll;

                RemainAmnt := "Actual Amount";
                RecLine.Reset;
                RecLine.SetRange(No, No);
                if RecLine.FindLast then
                    LineNo := RecLine."Line No."
                else
                    LineNo := 0;
                //Insert new payment schedule prioritizing
                // LoanType.Reset;
                // LoanType.SetCurrentkey("Product Priority");
                //  if LoanType.Find('-') then
                //   repeat
                //     LOAN.Reset;
                //     LOAN.SetCurrentkey("Loan No.","Loan Product Type","Product Priority");
                //     LOAN.SetRange("Loan Product Type",LoanType.Code);
                //     LOAN.SetRange("Fully Paid",false);
                //     LOAN.SetRange("Member No.","Account No.");
                //      if LOAN.Find('-') then
                //        repeat

                //          LineNo:=LineNo+1000;
                //          RecLine.Init;
                //          RecLine.No:=No;
                //          RecLine."Line No.":=LineNo;
                //           LOAN.CalcFields("Outstanding Balance","Interest Due");
                //           LoanAmount:=LOAN."Outstanding Balance"-LoanRec."Interest Due";
                //           InterestRate:=LOAN.Interest;
                //           RepayPeriod:=LOAN.Installments;
                //           LoanRepayAmountx(LOAN,LOAN."Outstanding Balance",LOAN.Interest,LOAN.Installments);
                //          RecLine.Type:=RecLine.Type::Repayment;
                //          RecLine."Transaction Type":=RecLine."transaction type"::"Loan Repayment";
                //          RecLine.Description:='Loan Repayment';
                //          RecLine."Loan No.":=LOAN."Loan No.";
                //          RecLine."Posting Group":=LoanType."Loan Posting Group";
                //          RecLine.Validate("Posting Group");
                //          if GLAccount.Get(LoanType."Loan Account") then
                //          RecLine."G/L Account Name":=GLAccount.Name;
                //          RecLine."Loan Type Name":=LoanType."Product Description";
                //          RecLine."Transaction Code":=BosaSetup."Loan Repayment Transaction";
                //          RecLine.Validate("Transaction Code");
                //          RecLine."Account No.":="Account No.";
                //          if Cust.Get(RecLine."Account No.")then
                //          RecLine."Account Name":=Cust.Name;
                //          RecLine."Account Type":=RecLine."account type"::Customer;
                //          RecLine."Loan Type":=LoanType.Code;
                //          RecLine."Global Dimension 1 Code":=BosaSetup."Global Dimension 1 Code";
                //          RecLine.Validate("Global Dimension 1 Code");
                //          RecLine."Global Dimension 2 Code":='';
                //          RecLine.Validate("Global Dimension 2 Code");
                //           if not (RecLine.Get(RecLine.No,RecLine."Line No."))  and (RecLine.Amount>0) then begin
                //            RecLine.Insert;
                //           end;

                //      until LOAN.Next=0;
                //   until LoanType.Next=0;



                //If there's more than loan repayment
                if RemainAmnt > 0 then begin
                    BosaSetup.TestField("Default Contribution Trans");
                    BosaSetup.TestField("Default Product Code");

                    LineNo := LineNo + 1000;
                    RecLine.Init;
                    RecLine.No := No;
                    RecLine."Line No." := LineNo;
                    RecLine.Amount := RemainAmnt;
                    RecLine."Net Amount" := RemainAmnt;
                    RecLine.Type := RecLine.Type::Contribution;
                    RecLine."Transaction Code" := BosaSetup."Default Contribution Trans";
                    RecLine.Validate("Transaction Code");
                    if Trans.Get(RecLine."Transaction Code") then
                        RecLine.Description := Trans.Description;
                    RecLine."Account No." := "Account No.";
                    if Cust.Get(RecLine."Account No.") then
                        RecLine."Account Name" := Cust.Name;
                    RecLine."Account Type" := RecLine."account type"::Customer;
                    RecLine."Product Code" := BosaSetup."Default Product Code";
                    RecLine.Validate("Product Code");
                    if Prod.Get(RecLine."Product Code") then
                        ProdDimen := Prod."Global Dimension 2 Code";
                    RecLine."Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
                    RecLine.Validate("Global Dimension 1 Code");
                    RecLine."Global Dimension 2 Code" := ProdDimen;
                    RecLine.Validate("Global Dimension 2 Code");
                    if not RecLine.Get(RecLine.No, RecLine."Line No.") then
                        RecLine.Insert;
                end;
            end;
        }
        field(13; "Expected Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; No, "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Account No.", "Account Type")
        {
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        RecHeader.Reset;
        RecHeader.SetRange(RecHeader.No, No);
        if RecHeader.Find('-') then begin
            RecHeader.CalcFields("Total Line Amount");
            RecHeader.Variance := RecHeader."Total Line Amount" - RecHeader."Received Amount";
            RecHeader.Modify(true);
        end;

        //Lines Total
        RecLine.Reset;
        RecLine.SetRange(RecLine.No, No);
        RecLine.SetRange("Account Type", "Account Type");
        RecLine.SetRange("Account No.", "Account No.");
        if RecLine.Find('-') then begin
            repeat
                RecLine.Delete;
            until RecLine.Next = 0;
        end;
    end;

    trigger OnInsert()
    begin
        //"Account Type":="Account Type"::Customer;
    end;

    trigger OnModify()
    begin
        RecHeader.Reset;
        RecHeader.SetRange(RecHeader.No, No);
        if RecHeader.Find('-') then begin
            RecHeader.CalcFields("Total Line Amount");
            RecHeader.Variance := RecHeader."Total Line Amount" - RecHeader."Received Amount";
            RecHeader.Modify(true);
        end;
    end;

    var
        cashierr: Record Receipts;
        // LOAN: Record Loans;
        // LOANx: Record Loans;
        // type: Record "Loan Repayment Schedule";
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
        BosaSetup: Record "Bosa Setup";
        L: Integer;
        RepaymentAmnt: Decimal;
        NewAmnt: Decimal;
        RecLines: Record "Receipts Lines";
        LineNo: Integer;
        MontCont: Record "Monthly Contributions";
        DiffAmnt: Decimal;
        RecLine: Record "Receipts Lines";
        ShareCapitalAmnt: Decimal;
        MontContrib: Record "Monthly Contributions";
        ContribAmnt: Decimal;
        // LoanRec: Record Loans;
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Decimal;
        RecHeader: Record Receipts;
        RemainingAmnt: Decimal;
        TotalRecAmnt: Decimal;
        Found: Boolean;
        Priority: Integer;
        // LoanType: Record "Loan Product Types";
        // LoanProd: Record "Loan Product Types";
        AmntTotal: Decimal;
        Diff: Decimal;
        RemainAmnt: Decimal;
        ProdDimen: Code[20];


    procedure LoanRepayAmountx(var LoanR: Record "Medical History Setup"; LoanAmount: Decimal; InterestRate: Decimal; RepayPeriod: Integer): Decimal
    var
        TotalMRepay: Decimal;
        LPrincipal: Decimal;
        Linterest: Decimal;
        LBalance: Decimal;
        InitialInstal: Integer;
        InitialGraceInt: Integer;
        GrPrinciple: Decimal;
        InPeriod: DateFormula;
        GrInterest: Decimal;
    begin
        // with LoanR do begin

        //     if LoanAmount > 0 then begin

        //         if "Repayment Method" = "repayment method"::Amortised then begin

        //             TotalMRepay := ROUND((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -RepayPeriod)) * LoanAmount, 0.05, '>');
        //             Linterest := ROUND(LoanAmount / 100 / 12 * InterestRate, 0.05, '>');

        //             /*IF RemainAmnt>=TotalMRepay THEN BEGIN
        //             RecLine.Amount:=TotalMRepay;
        //             LPrincipal:=TotalMRepay-Linterest;
        //             END ELSE IF RemainAmnt < TotalMRepay THEN BEGIN
        //             RecLine.Amount:=RemainAmnt;
        //               IF RemainAmnt >= LPrincipal THEN
        //               LPrincipal:=RemainAmnt-Linterest
        //               ELSE
        //               Linterest:=RemainAmnt;
        //             END;*/

        //             if RemainAmnt >= TotalMRepay then begin
        //                 RecLine.Amount := TotalMRepay;
        //                 LPrincipal := TotalMRepay - Linterest;
        //                 RecLine.Principal := LPrincipal;
        //                 RecLine.Interest := Linterest;

        //             end else if RemainAmnt < TotalMRepay then begin
        //                 RecLine.Amount := RemainAmnt;
        //                 if RemainAmnt >= LPrincipal then begin
        //                     RecLine.Principal := RemainAmnt - Linterest;
        //                     RecLine.Interest := Linterest;
        //                 end else if RemainAmnt < LPrincipal then begin
        //                     if RemainAmnt >= Linterest then begin
        //                         RecLine.Interest := Linterest;
        //                         RecLine.Principal := RemainAmnt - Linterest;
        //                     end else begin
        //                         RecLine.Interest := Linterest;
        //                         RecLine.Principal := 0;
        //                     end;
        //                 end;
        //             end;




        //             RemainAmnt := RemainAmnt - TotalMRepay;
        //             RecLine."Net Amount" := RecLine.Amount;

        //         end;

        //         if "Repayment Method" = "repayment method"::"Straight Line" then begin

        //             LPrincipal := ROUND(LoanAmount / RepayPeriod, 0.05, '>');
        //             Linterest := ROUND((InterestRate / 12 / 100) * LoanAmount, 0.05, '>');
        //             //Grace Period Interest
        //             Linterest := ROUND((Linterest * InitialInstal) / (InitialInstal - InitialGraceInt), 0.05, '>');

        //             RecLine.Amount := Linterest + LPrincipal;
        //             RecLine.Validate(Amount);
        //             RecLine.Principal := Linterest;
        //             RecLine.Interest := LPrincipal;

        //         end;

        //         if "Repayment Method" = "repayment method"::"Reducing Balance" then begin

        //             LPrincipal := ROUND(LoanAmount / RepayPeriod, 0.05, '>');
        //             Linterest := ROUND((InterestRate / 12 / 100) * LoanAmount, 0.05, '>');
        //             TotalMRepay := Linterest + LPrincipal;

        //             if RemainAmnt >= TotalMRepay then begin
        //                 RecLine.Amount := TotalMRepay;
        //                 LPrincipal := TotalMRepay - Linterest;
        //                 RecLine.Principal := LPrincipal;
        //                 RecLine.Interest := Linterest;

        //             end else if RemainAmnt < TotalMRepay then begin
        //                 RecLine.Amount := RemainAmnt;
        //                 if RemainAmnt >= LPrincipal then begin
        //                     RecLine.Principal := RemainAmnt - Linterest;
        //                     RecLine.Interest := Linterest;
        //                 end else if RemainAmnt < LPrincipal then begin
        //                     if RemainAmnt >= Linterest then begin
        //                         RecLine.Interest := Linterest;
        //                         RecLine.Principal := RemainAmnt - Linterest;
        //                     end else begin
        //                         RecLine.Interest := Linterest;
        //                         RecLine.Principal := 0;
        //                     end;
        //                 end;
        //             end;



        //             RemainAmnt := RemainAmnt - TotalMRepay;
        //             RecLine."Net Amount" := RecLine.Amount;

        //         end;

        //         // if "Repayment Method" = "repayment method"::Constants then begin
        //         //     TestField("Loan Repayment");
        //         //     if LBalance < "Loan Repayment" then
        //         //         LPrincipal := LBalance
        //         //     else
        //         //         LPrincipal := "Loan Repayment";


        //         //     RecLine.Amount := Linterest + LPrincipal;
        //         //     RecLine.Validate(Amount);
        //         //     RecLine.Principal := Linterest;
        //         //     RecLine.Interest := LPrincipal;

        //         // end;


        //         //Grace Period
        //         if GrPrinciple > 0 then begin
        //             LPrincipal := 0
        //         end else begin
        //             if "Instalment Period" <> InPeriod then
        //                 LBalance := LBalance - LPrincipal;

        //         end;

        //         if GrInterest > 0 then
        //             Linterest := 0;

        //         GrPrinciple := GrPrinciple - 1;
        //         GrInterest := GrInterest - 1;
        //         //Grace Period

        //         /*//Q Principle
        //         IF "Instalment Period" = InPeriod THEN BEGIN
        //         //ADDED
        //         IF GrPrinciple <> 0 THEN
        //         GrPrinciple:=GrPrinciple-1;
        //         IF QCounter = 1 THEN BEGIN
        //         QCounter:=3;
        //         LPrincipal:=QPrinciple+LPrincipal;
        //         IF LPrincipal > LBalance THEN
        //         LPrincipal:=LBalance;
        //         LBalance:=LBalance-LPrincipal;
        //         QPrinciple:=0;
        //         END ELSE BEGIN
        //         QCounter:=QCounter - 1;
        //         QPrinciple:=QPrinciple+LPrincipal;
        //         //IF QPrinciple > LBalance THEN
        //         //QPrinciple:=LBalance;
        //         LPrincipal:=0;
        //         END

        //         END;*/
        //         //Q Principle


        //     end;

        // end;

    end;
}

