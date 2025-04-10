Table 52193592 "Payment Lines"
{

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = Payments1.No;

            trigger OnValidate()
            begin
                /*//************Transfering Default Accounts to the Lines
                PaymentRec.RESET;
                PaymentRec.SETRANGE(PaymentRec.No,No);
                IF PaymentRec.FIND('-') THEN
                 BEGIN
                  "Account Type":=PaymentRec."Account Type";
                  "Account No":=PaymentRec."Account No.";
                //MESSAGE('%1',"Account Type" );
                //MESSAGE('%1',"Account No.");
                 END;
                 */
                "Account Type" := "account type"::Customer;

            end;
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; Amount; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
                Committments: Record "Commitment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Commitment Entries";
                PVHeader: Record "Payments HeaderFin";
                TotalCommittedAmount: Decimal;
            begin
                Csetup.Get;
                Csetup.TestField("Rounding Precision");
                if Csetup."Rounding Type" = Csetup."rounding type"::Up then
                    Direction := '>'
                else if Csetup."Rounding Type" = Csetup."rounding type"::Nearest then
                    Direction := '='
                else if Csetup."Rounding Type" = Csetup."rounding type"::Down then
                    Direction := '<';
                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            if "VAT Code" <> '' then begin
                                if GLAccount.Get("Account No") then
                                    if VATSetup.Get(GLAccount."VAT Bus. Posting Group", "VAT Code") then begin
                                        if VATSetup."VAT %" <> 0 then begin
                                            VATAmount := ROUND((Amount / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), Csetup."Rounding Precision", Direction);
                                            NetAmount := Amount - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if Csetup."Post VAT" then//Check IF VAT is to be posted
                                                "Net Amount" := Amount - VATAmount
                                            else
                                                "Net Amount" := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if GLAccount.Get("Account No") then
                                                    if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if Csetup."Post VAT" then//Check IF VAT is to be posted
                                                            "Net Amount" := NetAmount
                                                        else
                                                            "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end else begin
                                            "Net Amount" := Amount;
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if GLAccount.Get("Account No") then
                                                    if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                "Net Amount" := Amount;
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if GLAccount.Get("Account No") then
                                        if VATSetup.Get(GLAccount."Gen. Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            "Net Amount" := Amount - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                    "account type"::Customer:
                        begin
                            if "VAT Code" <> '' then begin
                                if Customer.Get("Account No") then
                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "VAT Code") then begin
                                        VATAmount := ROUND((Amount / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), Csetup."Rounding Precision", Direction);
                                        if VATSetup."VAT %" <> 0 then begin
                                            NetAmount := Amount - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if Csetup."Post VAT" then//Check IF VAT is to be posted
                                                "Net Amount" := Amount - VATAmount
                                            else
                                                "Net Amount" := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if Csetup."Post VAT" then//Check IF VAT is to be posted
                                                            "Net Amount" := NetAmount
                                                        else
                                                            "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end else begin
                                            "Net Amount" := Amount;
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                "Net Amount" := Amount;
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if Customer.Get("Account No") then
                                        if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            "Net Amount" := Amount - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                    "account type"::Vendor:
                        begin
                            if "VAT Code" <> '' then begin
                                if Vendor.Get("Account No") then
                                    if VATSetup.Get(Vendor."VAT Bus. Posting Group", "VAT Code") then begin
                                        if VATSetup."VAT %" <> 0 then begin
                                            VATAmount := ROUND((Amount / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), Csetup."Rounding Precision", Direction);
                                            NetAmount := Amount - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if Csetup."Post VAT" then//Check IF VAT is to be posted
                                                "Net Amount" := Amount - VATAmount
                                            else
                                                "Net Amount" := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Vendor.Get("Account No") then
                                                    if VATSetup.Get(Vendor."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if Csetup."Post VAT" then//Check IF VAT is to be posted
                                                            "Net Amount" := NetAmount
                                                        else
                                                            "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end else begin
                                            "Net Amount" := Amount;
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Vendor.Get("Account No") then
                                                    if VATSetup.Get(Vendor."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        "Net Amount" := Amount - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                "Net Amount" := Amount;
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if Vendor.Get("Account No") then
                                        if VATSetup.Get(Vendor."VAT Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, Csetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            "Net Amount" := Amount - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                    "account type"::"Bank Account":
                        "Net Amount" := Amount;
                end;

                /*///
                       //Confirm the Amount to be issued does not exceed the budget and amount Committed
                        //Get Budget for the G/L
                        GenLedSetup.GET;
                        GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SETRANGE(GLAccount."No.","Account No");
                       //Get budget amount avaliable
                       GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                        IF GLAccount.FIND('-') THEN BEGIN
                         GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                         BudgetAmount:=GLAccount."Budgeted Amount";
                         Expenses:=GLAccount."Net Change";
                         BudgetAvailable:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                        END;
                     //Get committed Amount
                     CommittedAmount:=0;
                     CommitmentEntries.RESET;
                     CommitmentEntries.SETCURRENTKEY(CommitmentEntries.Account);
                     CommitmentEntries.SETRANGE(CommitmentEntries.Account,"Account No");
                
                      PVHeader.RESET;
                      PVHeader.SETRANGE(PVHeader."No.",No);
                      IF PVHeader.FIND('-')THEN BEGIN
                       IF PVHeader.Date=0D THEN
                        ERROR('Please insert the Payment Voucher date');
                        CommitmentEntries.SETRANGE(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",
                                                  PVHeader.Date);
                        CommitmentEntries.CALCSUMS(CommitmentEntries."Committed Amount");
                        CommittedAmount:=CommitmentEntries."Committed Amount";
                
                        {IF LineBudget(No,"Account No.","Line No")THEN
                           MESSAGE('Line No %1 has been included in the Budget',"Line No")
                        ELSE}
                
                        IF Rec."Account Type" = "Account Type"::"G/L Account" THEN
                          IF CommittedAmount + Amount>BudgetAvailable THEN
                             ERROR('You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4'
                            ,"Account No",
                             ABS(BudgetAvailable - (CommittedAmount+Amount)),BudgetAvailable,CommittedAmount);
                      END;
                */

                // if "Loan No." <> '' then begin
                //   if LOAN.Get("Loan No.") then begin
                //   if (Amount > LOAN."Approved Amount") and (Type=Type::Loan) then
                //   Error((Text002),LOAN."Loan No.");
                //     if (Amount < LOAN."Approved Amount") and(Type=Type::Loan) then
                //       if Confirm((Text001))=true then begin
                //         if LoanType.Get(LOAN."Loan Product Type") then
                //         "Transactions Code":=LoanType."Transaction Code for Part Dis";
                //       end else Amount:=xRec.Amount;
                //   end;
                // end;

            end;
        }
        field(4; "Loan No."; Code[20])
        {
            //TableRelation = Loans."Loan No." where ("Member No."=field("Account No"));

            trigger OnValidate()
            begin
                //Populate the Loan Type Based on the Loan Number Choosen
                /*LOAN.RESET;
                LOAN.SETRANGE(LOAN."Loan  No.","Loan No.");
                IF LOAN.FIND('-') THEN BEGIN
                "Loan Type":=LOAN."Loan Product Type";
                END;  */

            end;
        }
        field(5; "Member No."; Code[20])
        {
        }
        field(6; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(7; "Account No"; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                cust.Reset;
                cust.SetRange(cust."No.", "Account No");
                if cust.Find('-') then begin
                    Name := cust.Name;
                    "Staff No/Payroll No." := cust."Staff No";
                end;
            end;
        }
        field(8; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Registration Fee,Deposit Contribution,Share Contribution,Loan,Loan Repayment,Withdrawal,Interest Due,Interest Paid,Investment,Dividend Paid,Processing Fee,Withholding Tax,BBF Contribution';
            OptionMembers = " ","Registration Fee","Deposit Contribution","Share Contribution",Loan,"Loan Repayment",Withdrawal,"Interest Due","Interest Paid",Investment,"Dividend Paid","Processing Fee","Withholding Tax","BBF Contribution";
        }
        field(9; Name; Text[50])
        {
        }
        field(10; "Staff No/Payroll No."; Code[20])
        {
            TableRelation = Customer."Staff No";
        }
        field(11; Description; Text[100])
        {
        }
        field(12; "Interest Paid"; Decimal)
        {
            Editable = false;
        }
        field(14; "Loan Product Type Code"; Code[20])
        {
            Editable = false;
        }
        field(15; "VAT Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(16; "W/Tax Code"; Code[20])
        {
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(17; "VAT Amount"; Decimal)
        {
        }
        field(18; "W/Tax Amount"; Decimal)
        {
        }
        field(19; "Payment Type"; Code[20])
        {

            trigger OnValidate()
            begin
                /* IF PayType.GET("Payment Type") THEN BEGIN
                 "Transaction Type":=PayType."Transaction Type";
                 "Posting Group":=PayType."Default Grouping";
                 VALIDATE("Posting Group");
                 VALIDATE("Account No");
                 "Global Dimension 1 Code":=PayType."Global Dimension 1 Code";
                 VALIDATE( "Global Dimension 1 Code");
                 "Global Dimension 2 Code":=PayType."Global Dimension 2 Code";
                 VALIDATE( "Global Dimension 2 Code");
                 IF PayType."VAT Chargeable" THEN
                 "VAT Code":=PayType."VAT Code";
                 IF PayType."Withholding Tax Chargeable" THEN
                 "W/Tax Code":=PayType."Withholding Tax Code";
                 END;*/

            end;
        }
        field(20; LoanTopUpAmount; Decimal)
        {
        }
        field(28; "Posting Group"; Code[30])
        {
            Editable = false;
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
        field(32; "Net Amount"; Decimal)
        {
            Editable = false;
        }
        field(33; "Transactions Code"; Code[20])
        {
            TableRelation = if (Type = filter(Loan)) "Transactions Type" where(Type = filter(Loan))
            else if (Type = filter(Other)) "Transactions Type" where(Type = filter(Other));

            trigger OnValidate()
            begin
                if Trans.Get("Transactions Code") then
                    Description := Trans.Description;

                if "Loan No." <> '' then begin
                    // if LOAN.Get("Loan No.") then begin
                    //     // if (Amount < LOAN."Approved Amount") and (Type=Type::Loan)then
                    //     //     if LoanType.Get(LOAN."Loan Product Type") then
                    //     //     if "Transactions Code"<>LoanType."Transaction Code for Part Dis" then
                    //     //     Amount:=0;
                    // end;
                end;
            end;
        }
        field(34; Type; Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;

            trigger OnValidate()
            begin
                "Transactions Code" := '';
                Description := '';
                "Posting Group" := '';
            end;
        }
    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        cashierr: Record Receipts;
        // LOAN: Record Loans;
        // type: Record "Loan Repayment Schedule";
        cust: Record Customer;
        PaymentRec: Record Payments1;
        PayType: Record "Receipts and Payments Types";
        Csetup: Record "Cash Management Setup1";
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        RetAmount: Decimal;
        NetAmount: Decimal;
        VATSetup: Record "VAT Posting Setup";
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        Direction: Text[30];
        Trans: Record "Transactions Type";
        Text001: label 'Do you want to do a part payment?';
        // LoanType: Record "Loan Product Types";
        Text002: label 'The amount to be issued cannot be great than the Approved Loan Amount';

}

