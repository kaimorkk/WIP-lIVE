Table 52194035 "Receipt Lines1"
{
    // // Cut from account No lookup
    // 
    // {
    // IF "Account Type"="Account Type"::"G/L Account" THEN BEGIN
    //  IF PAGE.RUNMODAL(18,GLAccount)=ACTION::LookupOK THEN BEGIN
    //     GLAccount.TESTFIELD("Direct Posting",TRUE);
    //     "Account No.":=GLAccount."No.";
    //     "Account Name":=GLAccount.Name;
    //     Description:=GLAccount.Name;
    //   END;
    //  END
    // ELSE IF "Account Type"="Account Type"::Customer THEN BEGIN
    //  IF PAGE.RUNMODAL(22,Cust)=ACTION::LookupOK THEN BEGIN
    //   "Account No.":=Cust."No.";
    //   "Account Name":=Cust.Name;
    //    Description:=Cust.Name;
    //  END;
    //  END
    // ELSE IF "Account Type"="Account Type"::Vendor THEN BEGIN
    //  IF PAGE.RUNMODAL(27,Vendor)=ACTION::LookupOK THEN BEGIN
    //  "Account No.":=Vendor."No.";
    //  "Account Name":=Vendor.Name;
    //  Description:=Vendor.Name;
    // 
    //  END;
    //  END
    //  ELSE IF "Account Type"="Account Type"::"Bank Account" THEN BEGIN
    //  IF PAGE.RUNMODAL(371,Bank)=ACTION::LookupOK THEN BEGIN
    //   "Account No.":=Bank."No.";
    //   "Account Name":=Bank.Name;
    //   Description:=Bank.Name;
    // 
    //  END;
    // END
    // ELSE IF "Account Type"="Account Type"::"Fixed Asset" THEN BEGIN
    //  IF PAGE.RUNMODAL(5601,FixedAsset)=ACTION::LookupOK THEN BEGIN
    //   "Account No.":=FixedAsset."No.";
    //   "Account Name":=FixedAsset.Description;
    //   Description:=FixedAsset.Description;
    //  END;
    // END;     }

    DrillDownPageID = "Receipts Line";
    LookupPageID = "Receipts Line";

    fields
    {
        field(1; "Receipt No."; Code[20])
        {
            TableRelation = "Receipts Header1";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(4; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("Bank Account")) "Bank Account";

            trigger OnValidate()
            begin
                //BosaSetup.GET();
                /*
               CASE "Account Type" OF
                "Account Type"::"G/L Account":
                 BEGIN
                  IF GLAccount.GET("Account No.") THEN
                     "Account Name":=GLAccount.Name;
                 END;
                 "Account Type"::Customer:
                 BEGIN
                 IF Cust.GET("Account No.")THEN
                    "Account Name":=Cust.Name;

                 END;
                 "Account Type"::"Bank Account":
                 BEGIN
                   IF Bank.GET("Account No.")THEN
                      "Account Name":=Bank.Name;
                 END;

                 "Account Type"::Vendor:
                 BEGIN
                  IF Vendor.GET("Account No.") THEN;
                     "Account Name":=Vendor.Name;
                  END;
                END;   */

                if "Account Type" in ["account type"::"G/L Account", "account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"]
                then
                    case "Account Type" of
                        "account type"::"G/L Account":
                            begin
                                GLAccount.Get("Account No.");
                                "Account Name" := GLAccount.Name;
                                Description := GLAccount.Name;
                                if not GLAccount."Direct Posting" then
                                    Error('You cannot select a control account');
                                // "VAT Code":=RecPayTypes."VAT Code";
                                // "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                                // "Global Dimension 1 Code":='';
                            end;
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                Description := Cust.Name;
                                //"VAT Code":=Cust."Default VAT Code";
                                //"Withholding Tax Code":=Cust."Default Withholding Tax Code";
                                //"Global Dimension 1 Code":=Cust."Global Dimension 1 Code";
                                //Payee:="Account Name";
                                //"KBA Branch Code":=Cust."KBA Code";
                                //  "Bank Account No":=Cust."Our Account No.";

                            end;
                        "account type"::Vendor:
                            begin
                                Vendor.Get("Account No.");
                                "Account Name" := Vendor.Name;
                                Description := Vendor.Name;
                                //"VAT Code":=Vend."Default VAT Code";
                                //"Withholding Tax Code":=Vend."Withholding Tax Code";
                                //"KBA Branch Code":=Vend."KBA Code";
                                //"Bank Account No":=Vend."Our Account No.";

                                //"Global Dimension 1 Code":=Vend."Global Dimension 1 Code";
                                //Payee:="Account Name";

                            end;
                        "account type"::"Bank Account":
                            begin
                                Bank.Get("Account No.");
                                "Account Name" := Bank.Name;
                                Description := Bank.Name;
                                // "VAT Code":=RecPayTypes."VAT Code";
                                // "Withholding Tax Code":=RecPayTypes."Withholding Tax Code";
                                // "Global Dimension 1 Code":=BankAcc."Global Dimension 1 Code";

                            end;
                    end;
                //VALIDATE(Payee);

            end;
        }
        field(5; "Account Name"; Text[50])
        {
        }
        field(6; Description; Text[70])
        {
        }
        field(7; "VAT Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(8; "W/Tax Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(9; "VAT Amount"; Decimal)
        {
        }
        field(10; "W/Tax Amount"; Decimal)
        {
        }
        field(11; Amount; Decimal)
        {
            FieldClass = Normal;

            trigger OnValidate()
            begin
                Validate("Applies to Doc. No");
                "Net Amount" := Amount;
            end;
        }
        field(12; "Net Amount"; Decimal)
        {
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(15; "Applies to Doc. No"; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
                PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
            begin
                "Applies to Doc. No" := '';
                Amt := 0;
                NetAmount := 0;
                //VATAmount:=0;
                //"W/TAmount":=0;

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No.");
                            CustLedger.SetRange(Open, true);
                            CustLedger.CalcFields("Remaining Amount");
                            if Page.RunModal(0, CustLedger) = Action::LookupOK then begin

                                if CustLedger."Applies-to ID" <> '' then begin
                                    CustLedger1.Reset;
                                    CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                    CustLedger1.SetRange(CustLedger1."Customer No.", "Account No.");
                                    CustLedger1.SetRange(Open, true);
                                    CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                    if CustLedger1.Find('-') then begin
                                        repeat
                                            CustLedger1.CalcFields("Remaining Amount");
                                            Amt := Amt + Abs(CustLedger1."Remaining Amount");
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amt <> Amt then
                                        //ERROR('Amount is not equal to the amount applied on the application form');
                                        if Amount = 0 then
                                            Amount := Amt;
                                    Validate(Amount);
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                end else begin
                                    if Amount <> Abs(CustLedger."Remaining Amount") then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if Amount = 0 then
                                        Amount := Abs(CustLedger."Remaining Amount");
                                    Validate(Amount);
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                end;
                            end;
                            Validate(Amount);
                        end;

                    "account type"::Vendor:
                        begin
                            VendLedger.Reset;
                            VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                            VendLedger.SetRange(VendLedger."Vendor No.", "Account No.");
                            VendLedger.SetRange(Open, true);
                            VendLedger.CalcFields("Remaining Amount");
                            if Page.RunModal(0, VendLedger) = Action::LookupOK then begin

                                if VendLedger."Applies-to ID" <> '' then begin
                                    VendLedger1.Reset;
                                    VendLedger1.SetCurrentkey(VendLedger1."Vendor No.", Open, "Applies-to ID");
                                    VendLedger1.SetRange(VendLedger1."Vendor No.", "Account No.");
                                    VendLedger1.SetRange(Open, true);
                                    VendLedger1.SetRange(VendLedger1."Applies-to ID", VendLedger."Applies-to ID");
                                    if VendLedger1.Find('-') then begin
                                        repeat
                                            VendLedger1.CalcFields(VendLedger1."Remaining Amount");

                                            NetAmount := NetAmount + Abs(VendLedger1."Remaining Amount");
                                        until VendLedger1.Next = 0;
                                    end;

                                    if NetAmount <> NetAmount then
                                        //ERROR('Amount is not equal to the amount applied on the application form');
                                        if Amount = 0 then
                                            Amount := NetAmount;

                                    Validate(Amount);
                                    "Applies to Doc. No" := VendLedger."Document No.";
                                end else begin
                                    if Amount <> Abs(VendLedger."Remaining Amount") then
                                        VendLedger.CalcFields(VendLedger."Remaining Amount");
                                    if Amount = 0 then
                                        Amount := Abs(VendLedger."Remaining Amount");
                                    Validate(Amount);
                                    "Applies to Doc. No" := VendLedger."Document No.";
                                end;
                            end;
                            Amount := Abs(VendLedger."Remaining Amount");
                            Validate(Amount);
                        end;
                end;
            end;

            trigger OnValidate()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
                VendLedgEntry: Record "Vendor Ledger Entry";
                TempGenJnlLine: Record "Gen. Journal Line" temporary;
            begin

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            CustLedger.Reset;
                            CustLedger.SetRange("Customer No.", "Account No.");
                            CustLedger.SetRange(Open, true);
                            CustLedger.SetRange("Document No.", "Applies to Doc. No");
                            if CustLedger.Find('-') then
                                "Applies-to Doc. Type" := CustLedger."Document Type";
                        end;
                    "account type"::Vendor:
                        begin
                            VendLedger.Reset;
                            VendLedger.SetRange("Vendor No.", "Account No.");
                            VendLedger.SetRange(Open, true);
                            VendLedger.SetRange("Document No.", "Applies to Doc. No");
                            if VendLedger.Find('-') then
                                "Applies-to Doc. Type" := VendLedger."Document Type";

                        end;
                end;
            end;
        }
        field(16; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(17; "Procurement Method"; Option)
        {
            OptionCaption = ' ,Direct,RFQ,RFP,Tender,Low Value,Specially Permitted,EOI';
            OptionMembers = " ",Direct,RFQ,RFP,Tender,"Low Value","Specially Permitted",EOI;
        }
        field(18; "Procurement Request"; Code[30])
        {
            TableRelation = "Procurement Request1";
        }
        field(19; "Loan No."; Code[20])
        {
            //TableRelation = Loans."Loan No." where("Member No." = field("Account No."));

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
                //     LoanRepayAmount(LOAN, LoanAmount, InterestRate, RepayPeriod);

                //     "Global Dimension 1 Code" := BosaSetup."Global Dimension 1 Code";
                //     Validate("Global Dimension 1 Code");

                //     if LoanType.Get(LOAN."Loan Product Type") then begin
                //         "Posting Group" := LoanType."Loan Posting Group";
                //         Validate("Posting Group");

                //         /*IF GLAccount.GET(LoanType."Loan Account") THEN
                //         "G/L Account Name":=GLAccount.Name;*/
                //     end;

                //     //Principal:=Amount - Interest;

                // end else begin
                //     Principal := 0;
                //     Interestx := 0;
                // end;

            end;
        }
        field(20; "Loan Type"; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                // if LoanType.Get("Loan Type") then begin
                //     "Loan Type Name" := LoanType."Product Description";

                //     // LOAN.Reset;
                //     // LOAN.SetRange(LOAN."Loan Product Type", LoanType.Code);
                //     // LOAN.SetRange(LOAN."Fully Paid", false);
                //     // if LOAN.Find('-') then
                //     //     if Cust.Get(LOAN."Member No.") then begin
                //     //         LOAN.CalcFields("Outstanding Balance");
                //     //         if LOAN."Outstanding Balance" > 0 then begin
                //     //             "Loan No." := LOAN."Loan No.";
                //     //             Validate("Loan No.");
                //     //         end;
                //     //     end;
                // end;
            end;
        }
        field(21; "Posting Group"; Code[30])
        {
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else if ("Account Type" = const("Fixed Asset")) "FA Posting Group";
        }
        field(22; "Transaction Code"; Code[20])
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
        field(23; Type; Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;

            trigger OnValidate()
            begin
                "Transaction Code" := '';
                Description := '';
                "Posting Group" := '';

                // if Type = Type::Repayment then
                // "Transaction Type":="transaction type"::"Loan Repayment";
            end;
        }
        field(24; "Loan Type Name"; Text[50])
        {
            Editable = false;
        }
        field(25; Principal; Decimal)
        {
            Editable = false;
        }
        field(26; Interestx; Decimal)
        {
            Editable = false;
        }
        field(27; "Transaction Type"; Enum "Receipt Types")
        {
            // OptionCaption = ' ,Licensing,Tender Alert';
            // OptionMembers = " ",Licensing,"Tender Alert";

            trigger OnValidate()
            begin
                /*GenSetup.GET;
                
                CASE "Account Type" OF
                  "Account Type"::Customer:
                    BEGIN
                        IF Cust.GET("Account No.") THEN BEGIN
                        Amnt:=Amount;
                           Cust.CALCFIELDS("Registration Fee Paid");
                           IF Cust."Registration Fee Paid" <> 0 THEN BEGIN
                           IF ("Transaction Type" = "Transaction Type"::"Registration Fee") AND
                            ((Cust."Registration Fee Paid" + Amnt)  > GenSetup."Registration Fee") THEN
                                  ERROR((Text001),Cust."No.",GenSetup."Registration Fee");
                           END ELSE IF Cust."Registration Fee Paid" = 0 THEN BEGIN
                           //REPEAT
                           IF ("Transaction Type" = "Transaction Type"::"Registration Fee") AND
                            (Amnt > GenSetup."Registration Fee") THEN
                           ERROR((Text001),Cust."No.",GenSetup."Registration Fee");
                           //UNTIL "Transaction Type" =0;
                           END;
                
                            Cust.CALCFIELDS("Current Shares");
                           IF Cust."Current Shares" <> 0 THEN BEGIN
                           IF ("Transaction Type" = "Transaction Type"::"Share Contribution") AND
                            ((Cust."Current Shares" + Amnt)  > GenSetup."Minimum Share Capital") THEN
                                  ERROR((Text003),Cust."No.",GenSetup."Registration Fee");
                            //Deposit
                            IF ("Transaction Type" = "Transaction Type"::"Deposit Contribution") AND
                            ((Cust."Current Shares" + Amnt) < GenSetup."Minimum Share Capital") THEN
                            ERROR((Text002),Cust."No.", GenSetup."Minimum Share Capital","Transaction Type");
                
                
                           END ELSE IF Cust."Current Shares" = 0 THEN BEGIN
                          // REPEAT
                           IF ("Transaction Type" = "Transaction Type"::"Share Contribution") AND
                            (Amnt > GenSetup."Minimum Share Capital") THEN
                           ERROR((Text003),GenSetup."Minimum Share Capital");
                          // UNTIL "Transaction Type" =0;
                            //Deposit
                            {IF ("Transaction Type" = "Transaction Type"::"Deposit Contribution") THEN
                            ERROR((Text002),Cust."No.", GenSetup."Minimum Share Capital","Transaction Type");}
                
                           END;
                
                            {IF ("Transaction Type" = "Transaction Type"::"Share Contribution") AND
                            (Cust."Current Shares" >= 0) AND ((Cust."Current Shares" + Amnt) > GenSetup."Minimum Share Capital") THEN
                            ERROR((Text003),Cust."No.", GenSetup."Minimum Share Capital");
                
                            IF ("Transaction Type" = "Transaction Type"::"Deposit Contribution") AND
                            ((Cust."Current Shares" + Amnt) < GenSetup."Minimum Share Capital") THEN
                           // REPEAT
                            If ("Transaction Type" = "Transaction Type"::"Deposit Contribution") AND NOT (Amnt > 0) THEN
                            ERROR((Text002),Cust."No.", GenSetup."Minimum Share Capital","Transaction Type");
                           // UNTIL "Transaction Type" =0;
                            }
                
                         END;
                
                    END;
                END;
                */

            end;
        }
        field(28; "Product Code"; Code[30])
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
                    Validate("Account No.");

                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Receipt No.", "Line No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        NetAmount: Decimal;
        Bank: Record "Bank Account";
        RecHeader: Record "Receipts Header1";
        // LOAN: Record Loans;
        // LOANx: Record Loans;
        // type: Record "Loan Repayment Schedule";
        PostContributions: Codeunit "Receipt Management";
        // LRSchedule: Record "Loan Repayment Schedule";
        Balance: Decimal;
        CashierRec: Record Receipts;
        PrincipleRepayAmnt: Decimal;
        InterestRepayAmnt: Decimal;
        ProdType: Record "Monthly Contributions";
        Prod: Record "Bosa Products";
        GenSetup: Record "General Set-Up";
        Amnt: Decimal;
        TotalAmnt: Decimal;
        Emp: Record "Bank Account";
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
        Text002: label 'The Member No %1 must increase Share Capital to the minimum shares value required of %2 before attempting transaction code %3';
        Text003: label 'The transaction will result to Member No %1 exceeding the maximum allowed share capital value of %2. To increase the shares, perform the share transfer transaction, otherwise deposit %3 as Share Capital';
        Text004: label 'The Member No %1 does have a product %2';
        MontContrib: Record "Monthly Contributions";
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


    // procedure LoanRepayAmount(var LoanR: Record Loans; LoanAmount1: Decimal; InterestRate1: Decimal; RepayPeriod1: Integer)
    // var
    //     LineNo: Integer;
    //     LoanRec: Record Loans;
    //     TotalMRepay: Decimal;
    //     InterestRate: Decimal;
    //     RepayPeriod: Integer;
    //     LoanAmount: Decimal;
    //     LPrincipal: Decimal;
    //     Linterest: Decimal;
    //     LBalance: Decimal;
    //     InitialInstal: Integer;
    //     InitialGraceInt: Integer;
    //     GrPrinciple: Decimal;
    //     InPeriod: DateFormula;
    //     GrInterest: Decimal;
    //     BosaSetup: Record "Bosa Setup";
    //     Allocate: Record "Receipts Header1";
    //     MontContrib: Record "Monthly Contributions";
    //     ContribAmnt: Decimal;
    //     ReallocateLines: Record "Reallocation Lines";
    //     ProdTotalBal: Decimal;
    //     LoanTotalBal: Decimal;
    // begin
    //     with LoanR do begin

    //         if LoanAmount1 > 0 then begin

    //             if "Repayment Method" = "repayment method"::Amortised then begin

    //                 TotalMRepay := ROUND((InterestRate1 / 12 / 100) / (1 - Power((1 + (InterestRate1 / 12 / 100)), -RepayPeriod1)) * LoanAmount1, 0.05, '>');
    //                 Linterest := ROUND(LoanAmount1 / 100 / 12 * InterestRate1, 0.05, '>');
    //                 LPrincipal := TotalMRepay - Linterest;


    //                 if Amount > TotalMRepay then begin
    //                     Principal := LPrincipal;
    //                     Interestx := Linterest;
    //                 end;

    //                 if (Amount < TotalMRepay) and (Amount > Linterest) then begin
    //                     Interestx := Linterest;
    //                     Principal := Amount - Linterest;
    //                 end;

    //                 if (Amount < Linterest) then begin
    //                     Interestx := Amount;
    //                     Principal := 0;
    //                 end;


    //             end;

    //             if "Repayment Method" = "repayment method"::"Straight Line" then begin

    //                 LPrincipal := ROUND(LoanAmount1 / RepayPeriod1, 0.05, '>');
    //                 Linterest := ROUND((InterestRate / 12 / 100) * LoanAmount1, 0.05, '>');
    //                 //Grace Period Interest
    //                 Linterest := ROUND((Linterest * InitialInstal) / (InitialInstal - InitialGraceInt), 0.05, '>');

    //                 if Amount > TotalMRepay then begin
    //                     Principal := LPrincipal;
    //                     Interestx := Linterest;
    //                 end;

    //                 if (Amount < TotalMRepay) and (Amount > Linterest) then begin
    //                     Interestx := Linterest;
    //                     Principal := Amount - Linterest;
    //                 end;

    //                 if (Amount < Linterest) then begin
    //                     Interestx := Amount;
    //                     Principal := 0;
    //                 end;



    //             end;

    //             // if "Repayment Method" = "repayment method"::"Reducing Balance" then begin

    //             //     LPrincipal := ROUND(LoanAmount1 / RepayPeriod1, 0.05, '>');
    //             //     Linterest := ROUND((InterestRate / 12 / 100) * LoanAmount1, 0.05, '>');

    //             //     if Amount > TotalMRepay then begin
    //             //         Principal := LPrincipal;
    //             //         Interestx := Linterest;
    //             //     end;

    //             //     if (Amount < TotalMRepay) and (Amount > Linterest) then begin
    //             //         Interestx := Linterest;
    //             //         Principal := Amount - Linterest;
    //             //     end;

    //             //     if (Amount < Linterest) then begin
    //             //         Interestx := Amount;
    //             //         Principal := 0;
    //             //     end;



    //             // end;

    //             // if "Repayment Method" = "repayment method"::Constants then begin
    //             //     TestField("Loan Repayment");
    //             //     if LBalance < "Loan Repayment" then
    //             //         LPrincipal := LBalance
    //             //     else
    //             //         LPrincipal := "Loan Repayment";


    //             //     Principal := Linterest;
    //             //     Interestx := LPrincipal;

    //             // end;


    //             //Grace Period
    //             // if GrPrinciple > 0 then begin
    //             //     LPrincipal := 0
    //             // end else begin
    //             //     if "Instalment Period" <> InPeriod then
    //             //         LBalance := LBalance - LPrincipal;

    //             // end;

    //             if GrInterest > 0 then
    //                 Linterest := 0;

    //             GrPrinciple := GrPrinciple - 1;
    //             GrInterest := GrInterest - 1;
    //             //Grace Period


    //         end;

    //         // Type:=Type::Repayment;
    //         //"Transaction Type" := "transaction type"::"Loan Repayment";

    //     end;
    // end;
}

