Table 52193682 Receipts1
{

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GenLedgerSetup.Get;
                    NoSeriesMgt.TestManual(GenLedgerSetup."Payments No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Date; Date)
        {
        }
        field(4; "Pay Mode"; Option)
        {
            OptionCaption = ' ,Cash,Cheque,EFT,Credit Card';
            OptionMembers = " ",Cash,Cheque,EFT,"Credit Card";
        }
        field(5; "Cheque No"; Code[20])
        {
        }
        field(6; "Cheque Date"; Date)
        {

            trigger OnValidate()
            begin
                /*
                GenLedgerSetup.GET;
                IF CALCDATE(GenLedgerSetup."Withholding Agent","Cheque Date")<=TODAY THEN BEGIN
                ERROR('The cheque date is not within the allowed range.');
                END;
                  */
                if "Cheque Date" > Today then begin
                    Error('The cheque date is not within the allowed range.');
                end;

            end;
        }
        field(9; "Received From"; Text[100])
        {

            trigger OnValidate()
            begin
                "On Behalf Of" := "Received From";
            end;
        }
        field(10; "On Behalf Of"; Text[100])
        {
        }
        field(11; Cashier; Code[20])
        {
        }
        field(12; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";
        }
        field(13; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Account Type" = const("Bank Account")) "Bank Account"
            else if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            begin
                "Account Name" := '';

                if "Account Type" in ["account type"::"G/L Account", "account type"::Customer,
                "account type"::Vendor, "account type"::"IC Partner"] then
                    case "Account Type" of
                        "account type"::"G/L Account":
                            begin
                                GLAcc.Get("Account No.");
                                "Account Name" := GLAcc.Name;
                                "Received From" := GLAcc.Name;
                            end;
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                "Account Name" := Cust.Name;
                                "Received From" := Cust.Name;
                                Currency := Cust."Currency Code";
                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                "Account Name" := Vend.Name;
                                "Received From" := Vend.Name;
                                Currency := Vend."Currency Code";
                            end;
                        "account type"::"Bank Account":
                            begin
                                BankAcc.Get("Account No.");
                                "Account Name" := BankAcc.Name;
                                "Received From" := BankAcc.Name;
                                Currency := BankAcc."Currency Code";
                            end;
                        "account type"::"Fixed Asset":
                            begin
                                FA.Get("Account No.");
                                "Account Name" := FA.Description;
                                "Received From" := FA.Description;

                            end;
                    end;
                Validate("Received From");
            end;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Account Name"; Text[150])
        {
        }
        field(16; Posted; Boolean)
        {
        }
        field(17; "Date Posted"; Date)
        {
        }
        field(18; "Time Posted"; Time)
        {
        }
        field(19; "Posted By"; Code[20])
        {
        }
        field(20; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                "Amount (LCY)" := CurrExchRate.ExchangeAmtFCYToLCY(Today, Currency, Amount, "Exchange Factor");
            end;
        }
        field(21; Remarks; Text[100])
        {

            trigger OnValidate()
            begin
                Validate("Applies-to Doc. No.");
            end;
        }
        field(22; "Transaction Name"; Text[100])
        {
        }
        field(27; "Receiving Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            begin
                if BankAcc.Get("Receiving Bank Account") then begin
                    Currency := BankAcc."Currency Code";
                    Validate(Currency);
                end;
            end;
        }
        field(28; Currency; Code[10])
        {
            TableRelation = Currency.Code;

            trigger OnValidate()
            begin
                if Currency <> '' then begin
                    CurrExchRate.Reset;
                    CurrExchRate.SetRange(CurrExchRate."Currency Code", Currency);
                    CurrExchRate.SetRange(CurrExchRate."Starting Date", 0D, Today);
                    if CurrExchRate.Find('+') then begin
                        "Exchange Rate" := CurrExchRate."Relational Exch. Rate Amount";
                        if CurrExchRate."Relational Exch. Rate Amount" <> 0 then
                            "Exchange Factor" := CurrExchRate."Exchange Rate Amount" / CurrExchRate."Relational Exch. Rate Amount";

                    end;
                end;
            end;
        }
        field(29; "Exchange Rate"; Decimal)
        {
        }
        field(30; "Amount (LCY)"; Decimal)
        {
        }
        field(31; "Exchange Factor"; Decimal)
        {
        }
        field(32; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(33; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
                PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
            begin
            end;

            trigger OnValidate()
            var
                CustLedgEntry: Record "Cust. Ledger Entry";
                VendLedgEntry: Record "Vendor Ledger Entry";
                TempGenJnlLine: Record "Gen. Journal Line" temporary;
            begin
            end;
        }
        field(34; "Applies-to ID"; Code[20])
        {
            Caption = 'Applies-to ID';
        }
        field(35; "Policy Type"; Code[20])
        {
        }
        field(50044; "Agent/Broker"; Code[20])
        {
            // TableRelation = Vendor where ("Vendor Type"=const("Professional Bodies"));
        }
        field(50045; Underwriter; Code[20])
        {
            // TableRelation = Vendor where ("Vendor Type"=const(Law));
        }
        field(50047; "Brokers Name"; Text[50])
        {
            Editable = false;
        }
        field(50048; "Undewriter Name"; Text[30])
        {
            Editable = false;
        }
        field(50062; "Quote Type"; Option)
        {
            Editable = true;
            InitValue = New;
            OptionMembers = " ",New,Modification,Renewal;
        }
        field(50066; "Broker #2"; Code[10])
        {
            // TableRelation = Vendor where ("Vendor Type"=const("Professional Bodies"));
        }
        field(50067; "Broker #3"; Code[10])
        {
            // TableRelation = Vendor where ("Vendor Type"=const("Professional Bodies"));
        }
        field(50068; "Broker #2 Name"; Text[30])
        {
            Editable = false;
        }
        field(50070; "Commission Due"; Decimal)
        {
        }
        field(50071; "Split 1"; Decimal)
        {
        }
        field(50072; "Split 2"; Decimal)
        {
        }
        field(50073; "Split 3"; Decimal)
        {
        }
        field(50074; "Commissions Generated"; Boolean)
        {
        }
        field(50075; YOA; Code[10])
        {
        }
        field(50076; "Policy Inception Date"; Date)
        {
        }
        field(50077; "Payment Frequency"; Code[20])
        {
        }
        field(50078; "Premium Due Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');
    end;

    trigger OnInsert()
    begin
        if No = '' then begin
            GenLedgerSetup.Get;

            GenLedgerSetup.TestField(GenLedgerSetup."Payments No");
            NoSeriesMgt.InitSeries(GenLedgerSetup."Payments No", xRec."No. Series", 0D, No, "No. Series");
        end;


        Date := Today;
        Cashier := UserId;
    end;

    trigger OnModify()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');
    end;

    trigger OnRename()
    begin
        if Posted = true then
            Error('The transaction has already been posted and therefore cannot be modified.');
    end;

    var
        GenLedgerSetup: Record "General Ledger Setup";
        RecPayTypes: Record Receipts1;
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlLine: Record "Gen. Journal Line";
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Cust2: Record Customer;
        Vend: Record Vendor;
        Vend2: Record Vendor;
        ICPartner: Record "IC Partner";
        Currenc: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        PaymentTerms: Record "Payment Terms";
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        VATPostingSetup: Record "VAT Posting Setup";
        BankAcc: Record "Bank Account";
        BankAcc2: Record "Bank Account";
        BankAcc3: Record "Bank Account";
        FA: Record "Fixed Asset";
        FASetup: Record "FA Setup";
        FADeprBook: Record "FA Depreciation Book";
        GenBusPostingGrp: Record "Gen. Business Posting Group";
        GenProdPostingGrp: Record "Gen. Product Posting Group";
        GLSetup: Record "General Ledger Setup";
        JobCurrency: Record Currency;
        Job: Record Job;
        JobJnlLine: Record "Job Journal Line";
        ApplyCustEntries: Page "Apply Customer Entries";
        ApplyVendEntries: Page "Apply Vendor Entries";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CustCheckCreditLimit: Codeunit "Cust-Check Cr. Limit";
        SalesTaxCalculate: Codeunit "Sales Tax Calculate";
        GenJnlApply: Codeunit "Gen. Jnl.-Apply";
        CustEntrySetApplID: Codeunit "Cust. Entry-SetAppl.ID";
        VendEntrySetApplID: Codeunit "Vend. Entry-SetAppl.ID";
        DimMgt: Codeunit DimensionManagement;
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        AccNo: Code[20];
        FromCurrencyCode: Code[10];
        ToCurrencyCode: Code[10];
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        ReplaceInfo: Boolean;
        CurrencyCode: Code[10];
        OK: Boolean;
        TemplateFound: Boolean;
        CurrencyDate: Date;
        SourceCodeSetup: Record "Source Code Setup";
        TotalExpenDonPj: Decimal;
        RemainingBalDonPj: Decimal;
        Test: Boolean;
        ExpenPjDon: Decimal;
        BudgetPjDon: Decimal;
        Test1: Boolean;
        BankToTest: Code[20];
        BankOrGLTxn: Boolean;
        Editing: Boolean;
        GnlJournalLineCp: Record "Gen. Journal Line";
        vendor: Record Vendor;
        SalesInvoiceHeadr: Record "Sales Invoice Header";
}

