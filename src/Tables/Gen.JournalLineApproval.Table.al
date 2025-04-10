Table 52194081 "Gen. Journal Line Approval"
{
    Caption = 'Gen. Journal Line';

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";

            trigger OnValidate()
            begin
                if ("Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Fixed Asset",
                                       "account type"::"IC Partner"]) and
                   ("Bal. Account Type" in ["bal. account type"::Customer, "bal. account type"::Vendor, "bal. account type"::"Fixed Asset",
                                            "bal. account type"::"IC Partner"])
                then
                    Error(
                      Text000,
                      FieldCaption("Account Type"), FieldCaption("Bal. Account Type"));
                Validate("Account No.", '');
                Validate("IC Partner G/L Acc. No.", '');
                if "Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"] then begin
                    Validate("Gen. Posting Type", "gen. posting type"::" ");
                    Validate("Gen. Bus. Posting Group", '');
                    Validate("Gen. Prod. Posting Group", '');
                end else
                    if "Bal. Account Type" in [
                                               "bal. account type"::"G/L Account", "account type"::"Bank Account", "bal. account type"::"Fixed Asset"]
                    then
                        Validate("Payment Terms Code", '');
                UpdateSource;

                if ("Account Type" <> "account type"::"Fixed Asset") and
                   ("Bal. Account Type" <> "bal. account type"::"Fixed Asset")
                then begin
                    "Depreciation Book Code" := '';
                    Validate("FA Posting Type", "fa posting type"::" ");
                end;
                if xRec."Account Type" in
                   [xRec."account type"::Customer, xRec."account type"::Vendor]
                then begin
                    "Bill-to/Pay-to No." := '';
                    "Ship-to/Order Address Code" := '';
                    "Sell-to/Buy-from No." := '';
                    "VAT Registration No." := '';
                end;

                if "Journal Template Name" <> '' then
                    if "Account Type" = "account type"::"IC Partner" then begin
                        GetTemplate;
                        if GenJnlTemplate.Type <> GenJnlTemplate.Type::Intercompany then
                            FieldError("Account Type");
                    end;
                if "Account Type" <> "account type"::Customer then
                    Validate("Credit Card No.", '');
            end;
        }
        field(4; "Account No."; Code[20])
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
                if "Account No." <> xRec."Account No." then
                    Validate("Job No.", '');

                if xRec."Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"IC Partner"] then
                    "IC Partner Code" := '';

                if "Account No." = '' then begin
                    UpdateLineBalance;
                    UpdateSource;
                    CreateDim(
                      DimMgt.TypeToTableID1("Account Type"), "Account No.",
                      DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                      Database::Job, "Job No.",
                      Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
                      Database::Campaign, "Campaign No.");
                    if xRec."Account No." <> '' then begin
                        "Gen. Posting Type" := "gen. posting type"::" ";
                        "Gen. Bus. Posting Group" := '';
                        "Gen. Prod. Posting Group" := '';
                        "VAT Bus. Posting Group" := '';
                        "VAT Prod. Posting Group" := '';
                        "Tax Area Code" := '';
                        "Tax Liable" := false;
                        "Tax Group Code" := '';
                    end;
                    exit;
                end;

                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            GLAcc.Get("Account No.");
                            CheckGLAcc;
                            ReplaceInfo := "Bal. Account No." = '';
                            if not ReplaceInfo then begin
                                GenJnlBatch.Get("Journal Template Name", "Journal Batch Name");
                                ReplaceInfo := GenJnlBatch."Bal. Account No." <> '';
                            end;
                            if ReplaceInfo then
                                Description := GLAcc.Name;

                            if ("Bal. Account No." = '') or
                               ("Bal. Account Type" in
                                ["bal. account type"::"G/L Account", "bal. account type"::"Bank Account"])
                            then begin
                                "Posting Group" := '';
                                "Salespers./Purch. Code" := '';
                                "Payment Terms Code" := '';
                            end;
                            if "Bal. Account No." = '' then
                                "Currency Code" := '';
                            if not GenJnlBatch.Get("Journal Template Name", "Journal Batch Name") or
                               GenJnlBatch."Copy VAT Setup to Jnl. Lines"
                            then begin
                                "Gen. Posting Type" := GLAcc."Gen. Posting Type";
                                "Gen. Bus. Posting Group" := GLAcc."Gen. Bus. Posting Group";
                                "Gen. Prod. Posting Group" := GLAcc."Gen. Prod. Posting Group";
                                "VAT Bus. Posting Group" := GLAcc."VAT Bus. Posting Group";
                                "VAT Prod. Posting Group" := GLAcc."VAT Prod. Posting Group";
                            end;
                            "Tax Area Code" := GLAcc."Tax Area Code";
                            "Tax Liable" := GLAcc."Tax Liable";
                            "Tax Group Code" := GLAcc."Tax Group Code";
                            if "Posting Date" <> 0D then
                                if "Posting Date" = ClosingDate("Posting Date") then begin
                                    "Gen. Posting Type" := 0;
                                    "Gen. Bus. Posting Group" := '';
                                    "Gen. Prod. Posting Group" := '';
                                    "VAT Bus. Posting Group" := '';
                                    "VAT Prod. Posting Group" := '';
                                end;
                        end;
                    "account type"::Customer:
                        begin
                            Cust.Get("Account No.");
                            Cust.CheckBlockedCustOnJnls(Cust, "Document Type", false);
                            if Cust."IC Partner Code" <> '' then begin
                                if GenJnlTemplate.Get("Journal Template Name") then;
                                if (Cust."IC Partner Code" <> '') and ICPartner.Get(Cust."IC Partner Code") then begin
                                    ICPartner.CheckICPartnerIndirect(Format("Account Type"), "Account No.");
                                    "IC Partner Code" := Cust."IC Partner Code";
                                end;
                            end;
                            Description := Cust.Name;
                            "Posting Group" := Cust."Customer Posting Group";
                            "Salespers./Purch. Code" := Cust."Salesperson Code";
                            "Payment Terms Code" := Cust."Payment Terms Code";
                            Validate("Bill-to/Pay-to No.", "Account No.");
                            Validate("Sell-to/Buy-from No.", "Account No.");
                            if not SetCurrencyCode("Bal. Account Type", "Bal. Account No.") then
                                "Currency Code" := Cust."Currency Code";
                            "Gen. Posting Type" := 0;
                            "Gen. Bus. Posting Group" := '';
                            "Gen. Prod. Posting Group" := '';
                            "VAT Bus. Posting Group" := '';
                            "VAT Prod. Posting Group" := '';
                            if (Cust."Bill-to Customer No." <> '') and (Cust."Bill-to Customer No." <> "Account No.") then begin
                                OK := Confirm(Text014, false, Cust.TableCaption, Cust."No.", Cust.FieldCaption("Bill-to Customer No."),
                                    Cust."Bill-to Customer No.");
                                if not OK then
                                    Error('');
                            end;
                            Validate("Payment Terms Code");
                        end;
                    "account type"::Vendor:
                        begin
                            Vend.Get("Account No.");
                            Vend.CheckBlockedVendOnJnls(Vend, "Document Type", false);
                            if Vend."IC Partner Code" <> '' then begin
                                if GenJnlTemplate.Get("Journal Template Name") then;
                                if (Vend."IC Partner Code" <> '') and ICPartner.Get(Vend."IC Partner Code") then begin
                                    ICPartner.CheckICPartnerIndirect(Format("Account Type"), "Account No.");
                                    "IC Partner Code" := Vend."IC Partner Code";
                                end;
                            end;
                            Description := Vend.Name;
                            "Posting Group" := Vend."Vendor Posting Group";
                            "Salespers./Purch. Code" := Vend."Purchaser Code";
                            "Payment Terms Code" := Vend."Payment Terms Code";
                            Validate("Bill-to/Pay-to No.", "Account No.");
                            Validate("Sell-to/Buy-from No.", "Account No.");
                            if not SetCurrencyCode("Bal. Account Type", "Bal. Account No.") then
                                "Currency Code" := Vend."Currency Code";
                            "Gen. Posting Type" := 0;
                            "Gen. Bus. Posting Group" := '';
                            "Gen. Prod. Posting Group" := '';
                            "VAT Bus. Posting Group" := '';
                            "VAT Prod. Posting Group" := '';
                            if (Vend."Pay-to Vendor No." <> '') and (Vend."Pay-to Vendor No." <> "Account No.") and
                               not HideValidationDialog
                            then begin
                                OK := Confirm(Text014, false, Vend.TableCaption, Vend."No.", Vend.FieldCaption("Pay-to Vendor No."),
                                    Vend."Pay-to Vendor No.");
                                if not OK then
                                    Error('');
                            end;
                            Validate("Payment Terms Code");
                        end;
                    "account type"::"Bank Account":
                        begin
                            BankAcc.Get("Account No.");
                            BankAcc.TestField(Blocked, false);
                            ReplaceInfo := "Bal. Account No." = '';
                            if not ReplaceInfo then begin
                                GenJnlBatch.Get("Journal Template Name", "Journal Batch Name");
                                ReplaceInfo := GenJnlBatch."Bal. Account No." <> '';
                            end;
                            if ReplaceInfo then
                                Description := BankAcc.Name;

                            if ("Bal. Account No." = '') or
                               ("Bal. Account Type" in
                                ["bal. account type"::"G/L Account", "bal. account type"::"Bank Account"])
                            then begin
                                "Posting Group" := '';
                                "Salespers./Purch. Code" := '';
                                "Payment Terms Code" := '';
                            end;
                            if BankAcc."Currency Code" = '' then begin
                                if "Bal. Account No." = '' then
                                    "Currency Code" := '';
                            end else
                                if SetCurrencyCode("Bal. Account Type", "Bal. Account No.") then
                                    BankAcc.TestField("Currency Code", "Currency Code")
                                else
                                    "Currency Code" := BankAcc."Currency Code";
                            "Gen. Posting Type" := 0;
                            "Gen. Bus. Posting Group" := '';
                            "Gen. Prod. Posting Group" := '';
                            "VAT Bus. Posting Group" := '';
                            "VAT Prod. Posting Group" := '';
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            FA.Get("Account No.");
                            FA.TestField(Blocked, false);
                            FA.TestField(Inactive, false);
                            FA.TestField("Budgeted Asset", false);
                            Description := FA.Description;
                            if "Depreciation Book Code" = '' then begin
                                FASetup.Get;
                                "Depreciation Book Code" := FASetup."Default Depr. Book";
                                if not FADeprBook.Get("Account No.", "Depreciation Book Code") then
                                    "Depreciation Book Code" := '';
                            end;
                            if "Depreciation Book Code" <> '' then begin
                                FADeprBook.Get("Account No.", "Depreciation Book Code");
                                "Posting Group" := FADeprBook."FA Posting Group";
                            end;
                            GetFAVATSetup;
                            GetFAAddCurrExchRate;
                        end;
                    "account type"::"IC Partner":
                        begin
                            ICPartner.Get("Account No.");
                            ICPartner.CheckICPartner;
                            Description := ICPartner.Name;
                            if ("Bal. Account No." = '') or ("Bal. Account Type" = "bal. account type"::"G/L Account") then
                                "Currency Code" := ICPartner."Currency Code";
                            if ("Bal. Account Type" = "bal. account type"::"Bank Account") and ("Currency Code" = '') then
                                "Currency Code" := ICPartner."Currency Code";
                            "Gen. Posting Type" := 0;
                            "Gen. Bus. Posting Group" := '';
                            "Gen. Prod. Posting Group" := '';
                            "VAT Bus. Posting Group" := '';
                            "VAT Prod. Posting Group" := '';
                            "IC Partner Code" := "Account No.";
                        end;
                end;

                Validate("Currency Code");
                Validate("VAT Prod. Posting Group");
                UpdateLineBalance;
                UpdateSource;
                CreateDim(
                  DimMgt.TypeToTableID1("Account Type"), "Account No.",
                  DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                  Database::Job, "Job No.",
                  Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
                  Database::Campaign, "Campaign No.");

                Validate("IC Partner G/L Acc. No.", GetDefaultICPartnerGLAccNo);
                //ValidateApplyRequirements(Rec);
            end;
        }
        field(5; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            ClosingDates = true;

            trigger OnValidate()
            begin
                Validate("Document Date", "Posting Date");
                Validate("Currency Code");

                if ("Posting Date" <> xRec."Posting Date") and (Amount <> 0) then
                    // PaymentToleranceMgt.PmtTolGenJnl(Rec);

                    //ValidateApplyRequirements(Rec);

                    if JobTaskIsSet then begin
                        CreateTempJobJnlLine;
                        UpdatePricesFromJobJnlLine;
                    end
            end;
        }
        field(6; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;

            trigger OnValidate()
            begin
                Validate("Payment Terms Code");
                if "Account No." <> '' then
                    case "Account Type" of
                        "account type"::Customer:
                            begin
                                Cust.Get("Account No.");
                                Cust.CheckBlockedCustOnJnls(Cust, "Document Type", false);
                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Account No.");
                                Vend.CheckBlockedVendOnJnls(Vend, "Document Type", false);
                            end;
                    end;
                if "Bal. Account No." <> '' then
                    case "Bal. Account Type" of
                        "account type"::Customer:
                            begin
                                Cust.Get("Bal. Account No.");
                                Cust.CheckBlockedCustOnJnls(Cust, "Document Type", false);
                            end;
                        "account type"::Vendor:
                            begin
                                Vend.Get("Bal. Account No.");
                                Vend.CheckBlockedVendOnJnls(Vend, "Document Type", false);
                            end;
                    end;
                UpdateSalesPurchLCY;
                //ValidateApplyRequirements(Rec);
                if not ("Document Type" in ["document type"::Payment, "document type"::Refund]) then
                    Validate("Credit Card No.", '');
            end;
        }
        field(7; "Document No."; Code[20])
        {
            Caption = 'Document No.';

            trigger OnValidate()
            begin
                CheckNoCardTransactEntryExist(xRec);
            end;
        }
        field(8; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(10; "VAT %"; Decimal)
        {
            Caption = 'VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                GetCurrency;
                case "VAT Calculation Type" of
                    "vat calculation type"::"Normal VAT",
                    "vat calculation type"::"Reverse Charge VAT":
                        begin
                            "VAT Amount" :=
                              ROUND(Amount * "VAT %" / (100 + "VAT %"), Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                            "VAT Base Amount" :=
                              ROUND(Amount - "VAT Amount", Currency."Amount Rounding Precision");
                        end;
                    "vat calculation type"::"Full VAT":
                        "VAT Amount" := Amount;
                    "vat calculation type"::"Sales Tax":
                        if ("Gen. Posting Type" = "gen. posting type"::Purchase) and
                           "Use Tax"
                        then begin
                            "VAT Amount" := 0;
                            "VAT %" := 0;
                        end else begin
                            "VAT Amount" :=
                              Amount -
                              SalesTaxCalculate.ReverseCalculateTax(
                                "Tax Area Code", "Tax Group Code", "Tax Liable",
                                "Posting Date", Amount, Quantity, "Currency Factor");
                            if Amount - "VAT Amount" <> 0 then
                                "VAT %" := ROUND(100 * "VAT Amount" / (Amount - "VAT Amount"), 0.00001)
                            else
                                "VAT %" := 0;
                            "VAT Amount" :=
                              ROUND("VAT Amount", Currency."Amount Rounding Precision");
                        end;
                end;
                "VAT Base Amount" := Amount - "VAT Amount";
                "VAT Difference" := 0;

                if "Currency Code" = '' then
                    "VAT Amount (LCY)" := "VAT Amount"
                else
                    "VAT Amount (LCY)" :=
                      ROUND(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          "Posting Date", "Currency Code",
                          "VAT Amount", "Currency Factor"));
                "VAT Base Amount (LCY)" := "Amount (LCY)" - "VAT Amount (LCY)";

                UpdateSalesPurchLCY;
            end;
        }
        field(11; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = if ("Bal. Account Type" = const("G/L Account")) "G/L Account"
            else if ("Bal. Account Type" = const(Customer)) Customer
            else if ("Bal. Account Type" = const(Vendor)) Vendor
            else if ("Bal. Account Type" = const("Bank Account")) "Bank Account"
            else if ("Bal. Account Type" = const("Fixed Asset")) "Fixed Asset"
            else if ("Bal. Account Type" = const("IC Partner")) "IC Partner";

            trigger OnValidate()
            var
                AccType: Option "Income Statement","Balance Sheet";
                BalType: Option "Income Statement","Balance Sheet";
            begin
                case "Transaction Type" of
                    "transaction type"::Budget:
                        begin
                            if GLAcc.Get("Account No.") then
                                if GLAcc."Block Budget Transfer" then
                                    Error('You cannot transfer budget to or from account %1', "Account No.");
                        end;
                    "transaction type"::Normal:
                        begin

                            Validate("Job No.", '');

                            if xRec."Bal. Account Type" in ["bal. account type"::Customer, "bal. account type"::Vendor,
                                                            "bal. account type"::"IC Partner"]
                            then
                                "IC Partner Code" := '';

                            if "Bal. Account No." = '' then begin
                                UpdateLineBalance;
                                UpdateSource;
                                CreateDim(
                                  DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                                  DimMgt.TypeToTableID1("Account Type"), "Account No.",
                                  Database::Job, "Job No.",
                                  Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
                                  Database::Campaign, "Campaign No.");
                                if xRec."Bal. Account No." <> '' then begin
                                    "Bal. Gen. Posting Type" := "bal. gen. posting type"::" ";
                                    "Bal. Gen. Bus. Posting Group" := '';
                                    "Bal. Gen. Prod. Posting Group" := '';
                                    "Bal. VAT Bus. Posting Group" := '';
                                    "Bal. VAT Prod. Posting Group" := '';
                                    "Bal. Tax Area Code" := '';
                                    "Bal. Tax Liable" := false;
                                    "Bal. Tax Group Code" := '';
                                end;
                                exit;
                            end;

                            case "Bal. Account Type" of
                                "bal. account type"::"G/L Account":
                                    begin
                                        GLAcc.Get("Bal. Account No.");
                                        CheckGLAcc;
                                        if "Account No." = '' then begin
                                            Description := GLAcc.Name;
                                            "Currency Code" := '';
                                        end;
                                        if ("Account No." = '') or
                                           ("Account Type" in
                                            ["account type"::"G/L Account", "account type"::"Bank Account"])
                                        then begin
                                            "Posting Group" := '';
                                            "Salespers./Purch. Code" := '';
                                            "Payment Terms Code" := '';
                                        end;
                                        if not GenJnlBatch.Get("Journal Template Name", "Journal Batch Name") or
                                           GenJnlBatch."Copy VAT Setup to Jnl. Lines"
                                        then begin
                                            "Bal. Gen. Posting Type" := GLAcc."Gen. Posting Type";
                                            "Bal. Gen. Bus. Posting Group" := GLAcc."Gen. Bus. Posting Group";
                                            "Bal. Gen. Prod. Posting Group" := GLAcc."Gen. Prod. Posting Group";
                                            "Bal. VAT Bus. Posting Group" := GLAcc."VAT Bus. Posting Group";
                                            "Bal. VAT Prod. Posting Group" := GLAcc."VAT Prod. Posting Group";
                                        end;
                                        "Bal. Tax Area Code" := GLAcc."Tax Area Code";
                                        "Bal. Tax Liable" := GLAcc."Tax Liable";
                                        "Bal. Tax Group Code" := GLAcc."Tax Group Code";
                                        if "Posting Date" <> 0D then
                                            if "Posting Date" = ClosingDate("Posting Date") then begin
                                                "Bal. Gen. Bus. Posting Group" := '';
                                                "Bal. Gen. Prod. Posting Group" := '';
                                                "Bal. VAT Bus. Posting Group" := '';
                                                "Bal. VAT Prod. Posting Group" := '';
                                                "Bal. Gen. Posting Type" := 0;
                                            end;
                                    end;
                                "bal. account type"::Customer:
                                    begin
                                        Cust.Get("Bal. Account No.");
                                        Cust.CheckBlockedCustOnJnls(Cust, "Document Type", false);
                                        if Cust."IC Partner Code" <> '' then begin
                                            if GenJnlTemplate.Get("Journal Template Name") then;
                                            if (Cust."IC Partner Code" <> '') and ICPartner.Get(Cust."IC Partner Code") then begin
                                                ICPartner.CheckICPartnerIndirect(Format("Bal. Account Type"), "Bal. Account No.");
                                                "IC Partner Code" := Cust."IC Partner Code";
                                            end;
                                        end;

                                        if "Account No." = '' then
                                            Description := Cust.Name;

                                        "Posting Group" := Cust."Customer Posting Group";
                                        "Salespers./Purch. Code" := Cust."Salesperson Code";
                                        "Payment Terms Code" := Cust."Payment Terms Code";
                                        Validate("Bill-to/Pay-to No.", "Bal. Account No.");
                                        Validate("Sell-to/Buy-from No.", "Bal. Account No.");
                                        if ("Account No." = '') or ("Account Type" = "account type"::"G/L Account") then
                                            "Currency Code" := Cust."Currency Code";
                                        if ("Account Type" = "account type"::"Bank Account") and ("Currency Code" = '') then
                                            "Currency Code" := Cust."Currency Code";
                                        "Bal. Gen. Posting Type" := 0;
                                        "Bal. Gen. Bus. Posting Group" := '';
                                        "Bal. Gen. Prod. Posting Group" := '';
                                        "Bal. VAT Bus. Posting Group" := '';
                                        "Bal. VAT Prod. Posting Group" := '';
                                        if (Cust."Bill-to Customer No." <> '') and (Cust."Bill-to Customer No." <> "Bal. Account No.") then begin
                                            OK := Confirm(Text014, false, Cust.TableCaption, Cust."No.", Cust.FieldCaption("Bill-to Customer No."),
                                                Cust."Bill-to Customer No.");
                                            if not OK then
                                                Error('');
                                        end;
                                        Validate("Payment Terms Code");
                                    end;
                                "bal. account type"::Vendor:
                                    begin
                                        Vend.Get("Bal. Account No.");
                                        Vend.CheckBlockedVendOnJnls(Vend, "Document Type", false);
                                        if Vend."IC Partner Code" <> '' then begin
                                            if GenJnlTemplate.Get("Journal Template Name") then;
                                            if (Vend."IC Partner Code" <> '') and ICPartner.Get(Vend."IC Partner Code") then begin
                                                ICPartner.CheckICPartnerIndirect(Format("Bal. Account Type"), "Bal. Account No.");
                                                "IC Partner Code" := Vend."IC Partner Code";
                                            end;
                                        end;

                                        if "Account No." = '' then
                                            Description := Vend.Name;

                                        "Posting Group" := Vend."Vendor Posting Group";
                                        "Salespers./Purch. Code" := Vend."Purchaser Code";
                                        "Payment Terms Code" := Vend."Payment Terms Code";
                                        Validate("Bill-to/Pay-to No.", "Bal. Account No.");
                                        Validate("Sell-to/Buy-from No.", "Bal. Account No.");
                                        if ("Account No." = '') or ("Account Type" = "account type"::"G/L Account") then
                                            "Currency Code" := Vend."Currency Code";
                                        if ("Account Type" = "account type"::"Bank Account") and ("Currency Code" = '') then
                                            "Currency Code" := Vend."Currency Code";
                                        "Bal. Gen. Posting Type" := 0;
                                        "Bal. Gen. Bus. Posting Group" := '';
                                        "Bal. Gen. Prod. Posting Group" := '';
                                        "Bal. VAT Bus. Posting Group" := '';
                                        "Bal. VAT Prod. Posting Group" := '';
                                        if (Vend."Pay-to Vendor No." <> '') and (Vend."Pay-to Vendor No." <> "Bal. Account No.") then begin
                                            OK := Confirm(Text014, false, Vend.TableCaption, Vend."No.", Vend.FieldCaption("Pay-to Vendor No."),
                                                Vend."Pay-to Vendor No.");
                                            if not OK then
                                                Error('');
                                        end;
                                        Validate("Payment Terms Code");
                                    end;
                                "bal. account type"::"Bank Account":
                                    begin
                                        BankAcc.Get("Bal. Account No.");
                                        BankAcc.TestField(Blocked, false);
                                        if "Account No." = '' then
                                            Description := BankAcc.Name;

                                        if ("Account No." = '') or
                                           ("Account Type" in
                                            ["account type"::"G/L Account", "account type"::"Bank Account"])
                                        then begin
                                            "Posting Group" := '';
                                            "Salespers./Purch. Code" := '';
                                            "Payment Terms Code" := '';
                                        end;
                                        if BankAcc."Currency Code" = '' then begin
                                            if "Account No." = '' then
                                                "Currency Code" := '';
                                        end else
                                            if SetCurrencyCode("Bal. Account Type", "Bal. Account No.") then
                                                BankAcc.TestField("Currency Code", "Currency Code")
                                            else
                                                "Currency Code" := BankAcc."Currency Code";
                                        "Bal. Gen. Posting Type" := 0;
                                        "Bal. Gen. Bus. Posting Group" := '';
                                        "Bal. Gen. Prod. Posting Group" := '';
                                        "Bal. VAT Bus. Posting Group" := '';
                                        "Bal. VAT Prod. Posting Group" := '';
                                    end;
                                "bal. account type"::"Fixed Asset":
                                    begin
                                        FA.Get("Bal. Account No.");
                                        FA.TestField(Blocked, false);
                                        FA.TestField(Inactive, false);
                                        FA.TestField("Budgeted Asset", false);
                                        if "Account No." = '' then
                                            Description := FA.Description;

                                        if "Depreciation Book Code" = '' then begin
                                            FASetup.Get;
                                            "Depreciation Book Code" := FASetup."Default Depr. Book";
                                            if not FADeprBook.Get("Bal. Account No.", "Depreciation Book Code") then
                                                "Depreciation Book Code" := '';
                                        end;
                                        if "Depreciation Book Code" <> '' then begin
                                            FADeprBook.Get("Bal. Account No.", "Depreciation Book Code");
                                            "Posting Group" := FADeprBook."FA Posting Group";
                                        end;
                                        GetFAVATSetup;
                                        GetFAAddCurrExchRate;
                                    end;
                                "bal. account type"::"IC Partner":
                                    begin
                                        ICPartner.Get("Bal. Account No.");
                                        if "Account No." = '' then
                                            Description := ICPartner.Name;

                                        if ("Account No." = '') or ("Account Type" = "account type"::"G/L Account") then
                                            "Currency Code" := ICPartner."Currency Code";
                                        if ("Account Type" = "account type"::"Bank Account") and ("Currency Code" = '') then
                                            "Currency Code" := ICPartner."Currency Code";
                                        "Bal. Gen. Posting Type" := 0;
                                        "Bal. Gen. Bus. Posting Group" := '';
                                        "Bal. Gen. Prod. Posting Group" := '';
                                        "Bal. VAT Bus. Posting Group" := '';
                                        "Bal. VAT Prod. Posting Group" := '';
                                        "IC Partner Code" := "Bal. Account No.";
                                    end;
                            end;

                            Validate("Currency Code");
                            Validate("Bal. VAT Prod. Posting Group");
                            UpdateLineBalance;
                            UpdateSource;
                            CreateDim(
                              DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                              DimMgt.TypeToTableID1("Account Type"), "Account No.",
                              Database::Job, "Job No.",
                              Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
                              Database::Campaign, "Campaign No.");

                            Validate("IC Partner G/L Acc. No.", GetDefaultICPartnerGLAccNo);
                            //ValidateApplyRequirements(Rec);
                        end;
                end
            end;
        }
        field(12; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;

            trigger OnValidate()
            begin
                if "Bal. Account Type" = "bal. account type"::"Bank Account" then begin
                    if BankAcc3.Get("Bal. Account No.") and (BankAcc3."Currency Code" <> '') then
                        BankAcc3.TestField("Currency Code", "Currency Code");
                end;
                if "Account Type" = "account type"::"Bank Account" then begin
                    if BankAcc3.Get("Account No.") and (BankAcc3."Currency Code" <> '') then
                        BankAcc3.TestField("Currency Code", "Currency Code");
                end;
                if ("Recurring Method" in
                    ["recurring method"::"B  Balance", "recurring method"::"RB Reversing Balance"]) and
                   ("Currency Code" <> '')
                then
                    Error(
                      Text001,
                      FieldCaption("Currency Code"), FieldCaption("Recurring Method"), "Recurring Method");

                if "Currency Code" <> '' then begin
                    GetCurrency;
                    if ("Currency Code" <> xRec."Currency Code") or
                       ("Posting Date" <> xRec."Posting Date") or
                       (CurrFieldNo = FieldNo("Currency Code")) or
                       ("Currency Factor" = 0)
                    then
                        "Currency Factor" :=
                          CurrExchRate.ExchangeRate("Posting Date", "Currency Code");
                end else
                    "Currency Factor" := 0;
                Validate("Currency Factor");

                if ("Currency Code" <> xRec."Currency Code") and (Amount <> 0) then
;
            end;
        }
        field(13; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Amount';

            trigger OnValidate()
            begin
                GetCurrency;
                if "Currency Code" = '' then
                    "Amount (LCY)" := Amount
                else
                    "Amount (LCY)" := ROUND(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          "Posting Date", "Currency Code",
                          Amount, "Currency Factor"));

                Amount := ROUND(Amount, Currency."Amount Rounding Precision");
                if (CurrFieldNo <> 0) and
                   (CurrFieldNo <> FieldNo("Applies-to Doc. No.")) and
                   ((("Account Type" = "account type"::Customer) and
                     ("Account No." <> '') and (Amount > 0) and
                     (CurrFieldNo <> FieldNo("Bal. Account No."))) or
                    (("Bal. Account Type" = "bal. account type"::Customer) and
                     ("Bal. Account No." <> '') and (Amount < 0) and
                     (CurrFieldNo <> FieldNo("Account No."))))
                then
                    // CustCheckCreditLimit.GenJnlLineCheck(Rec);

                    Validate("VAT %");
                Validate("Bal. VAT %");
                UpdateLineBalance;

                if Amount <> xRec.Amount then begin
                    if ("Applies-to Doc. No." <> '') or ("Applies-to ID" <> '') then
                        SetApplyToAmount;
                    //PaymentToleranceMgt.PmtTolGenJnl(Rec);
                end;

                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    UpdatePricesFromJobJnlLine;
                end
            end;
        }
        field(14; "Debit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';

            trigger OnValidate()
            begin
                GetCurrency;
                "Debit Amount" := ROUND("Debit Amount", Currency."Amount Rounding Precision");
                Correction := "Debit Amount" < 0;
                Amount := "Debit Amount";
                Validate(Amount);
            end;
        }
        field(15; "Credit Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';

            trigger OnValidate()
            begin
                GetCurrency;
                "Credit Amount" := ROUND("Credit Amount", Currency."Amount Rounding Precision");
                Correction := "Credit Amount" < 0;
                Amount := -"Credit Amount";
                Validate(Amount);
            end;
        }
        field(16; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount (LCY)';

            trigger OnValidate()
            begin
                if "Currency Code" = '' then begin
                    Amount := "Amount (LCY)";
                    Validate(Amount);
                end else begin
                    if CheckFixedCurrency then begin
                        GetCurrency;
                        Amount := ROUND(
                            CurrExchRate.ExchangeAmtLCYToFCY(
                              "Posting Date", "Currency Code",
                              "Amount (LCY)", "Currency Factor"),
                            Currency."Amount Rounding Precision")
                    end else begin
                        TestField("Amount (LCY)");
                        TestField(Amount);
                        "Currency Factor" := Amount / "Amount (LCY)";
                    end;

                    Validate("VAT %");
                    Validate("Bal. VAT %");
                    UpdateLineBalance;
                end;
            end;
        }
        field(17; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Balance (LCY)';
            Editable = false;
        }
        field(18; "Currency Factor"; Decimal)
        {
            Caption = 'Currency Factor';
            DecimalPlaces = 0 : 15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate()
            begin
                if ("Currency Code" = '') and ("Currency Factor" <> 0) then
                    FieldError("Currency Factor", StrSubstNo(Text002, FieldCaption("Currency Code")));
                Validate(Amount);
            end;
        }
        field(19; "Sales/Purch. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Sales/Purch. (LCY)';
        }
        field(20; "Profit (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Profit (LCY)';
        }
        field(21; "Inv. Discount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Inv. Discount (LCY)';
        }
        field(22; "Bill-to/Pay-to No."; Code[20])
        {
            Caption = 'Bill-to/Pay-to No.';
            TableRelation = if ("Account Type" = const(Customer)) Customer
            else if ("Bal. Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Bal. Account Type" = const(Vendor)) Vendor;

            trigger OnValidate()
            begin
                if "Bill-to/Pay-to No." <> xRec."Bill-to/Pay-to No." then
                    "Ship-to/Order Address Code" := '';
                ReadGLSetup;
                if GLSetup."Bill-to/Sell-to VAT Calc." = GLSetup."bill-to/sell-to vat calc."::"Bill-to/Pay-to No." then
                    UpdateCountryCodeAndVATRegNo("Bill-to/Pay-to No.");
            end;
        }
        field(23; "Posting Group"; Code[10])
        {
            Caption = 'Posting Group';
            Editable = false;
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else if ("Account Type" = const("Fixed Asset")) "FA Posting Group";
        }
        field(24; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(25; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(26; "Salespers./Purch. Code"; Code[10])
        {
            Caption = 'Salespers./Purch. Code';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            begin
                CreateDim(
                  Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
                  DimMgt.TypeToTableID1("Account Type"), "Account No.",
                  DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                  Database::Job, "Job No.",
                  Database::Campaign, "Campaign No.");
            end;
        }
        field(29; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            Editable = false;
            TableRelation = "Source Code";
        }
        field(30; "System-Created Entry"; Boolean)
        {
            Caption = 'System-Created Entry';
            Editable = false;
        }
        field(34; "On Hold"; Code[3])
        {
            Caption = 'On Hold';
        }
        field(35; "Applies-to Doc. Type"; Option)
        {
            Caption = 'Applies-to Doc. Type';
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(36; "Applies-to Doc. No."; Code[20])
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
                if ("Applies-to Doc. No." = '') and (xRec."Applies-to Doc. No." <> '') then begin
                    //PaymentToleranceMgt.DelPmtTolApllnDocNo(Rec,xRec."Applies-to Doc. No.");

                    //TempGenJnlLine := Rec;
                    if (TempGenJnlLine."Bal. Account Type" = TempGenJnlLine."bal. account type"::Customer) or
                       (TempGenJnlLine."Bal. Account Type" = TempGenJnlLine."bal. account type"::Vendor)
                    then
                        Codeunit.Run(Codeunit::"Exchange Acc. G/L Journal Line", TempGenJnlLine);

                    if TempGenJnlLine."Account Type" = TempGenJnlLine."account type"::Customer then begin
                        CustLedgEntry.SetCurrentkey("Document No.");
                        CustLedgEntry.SetRange("Document No.", xRec."Applies-to Doc. No.");
                        if not (xRec."Applies-to Doc. Type" = "document type"::" ") then
                            CustLedgEntry.SetRange("Document Type", xRec."Applies-to Doc. Type");
                        CustLedgEntry.SetRange("Customer No.", TempGenJnlLine."Account No.");
                        CustLedgEntry.SetRange(Open, true);
                        if CustLedgEntry.FindFirst then begin
                            if CustLedgEntry."Amount to Apply" <> 0 then begin
                                CustLedgEntry."Amount to Apply" := 0;
                                Codeunit.Run(Codeunit::"Cust. Entry-Edit", CustLedgEntry);
                            end;
                        end;
                    end else
                        if TempGenJnlLine."Account Type" = TempGenJnlLine."account type"::Vendor then begin
                            VendLedgEntry.SetCurrentkey("Document No.");
                            VendLedgEntry.SetRange("Document No.", xRec."Applies-to Doc. No.");
                            if not (xRec."Applies-to Doc. Type" = "document type"::" ") then
                                VendLedgEntry.SetRange("Document Type", xRec."Applies-to Doc. Type");
                            VendLedgEntry.SetRange("Vendor No.", TempGenJnlLine."Account No.");
                            VendLedgEntry.SetRange(Open, true);
                            if VendLedgEntry.FindFirst then begin
                                if VendLedgEntry."Amount to Apply" <> 0 then begin
                                    VendLedgEntry."Amount to Apply" := 0;
                                    Codeunit.Run(Codeunit::"Vend. Entry-Edit", VendLedgEntry);
                                end;
                            end;
                        end;
                end;

                if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and (Amount <> 0) then begin
                    if xRec."Applies-to Doc. No." <> '' then
                        // PaymentToleranceMgt.DelPmtTolApllnDocNo(Rec,xRec."Applies-to Doc. No.");
                        SetApplyToAmount;
                    // PaymentToleranceMgt.PmtTolGenJnl(Rec);
                end;

                //ValidateApplyRequirements(Rec);

                GetCreditCard;
            end;
        }
        field(38; "Due Date"; Date)
        {
            Caption = 'Due Date';
        }
        field(39; "Pmt. Discount Date"; Date)
        {
            Caption = 'Pmt. Discount Date';
        }
        field(40; "Payment Discount %"; Decimal)
        {
            Caption = 'Payment Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(42; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            TableRelation = Job;

            trigger OnValidate()
            begin
                if "Job No." = xRec."Job No." then
                    exit;

                SourceCodeSetup.Get;
                if "Source Code" <> SourceCodeSetup."Job G/L WIP" then
                    Validate("Job Task No.", '');
                if "Job No." = '' then begin
                    CreateDim(
                      Database::Job, "Job No.",
                      DimMgt.TypeToTableID1("Account Type"), "Account No.",
                      DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                      Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
                      Database::Campaign, "Campaign No.");
                    exit;
                end;

                TestField("Account Type", "account type"::"G/L Account");

                if "Bal. Account No." <> '' then
                    if not ("Bal. Account Type" in ["bal. account type"::"G/L Account", "bal. account type"::"Bank Account"]) then
                        Error(Text016, FieldCaption("Bal. Account Type"));

                Job.Get("Job No.");
                Job.TestBlocked;
                "Job Currency Code" := Job."Currency Code";

                CreateDim(
                  Database::Job, "Job No.",
                  DimMgt.TypeToTableID1("Account Type"), "Account No.",
                  DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                  Database::"Salesperson/Purchaser", "Salespers./Purch. Code",
                  Database::Campaign, "Campaign No.");
            end;
        }
        field(43; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(44; "VAT Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Amount';

            trigger OnValidate()
            begin
                GenJnlBatch.Get("Journal Template Name", "Journal Batch Name");
                GenJnlBatch.TestField("Allow VAT Difference", true);
                if not ("VAT Calculation Type" in
                        ["vat calculation type"::"Normal VAT", "vat calculation type"::"Reverse Charge VAT"])
                then
                    Error(
                      Text010, FieldCaption("VAT Calculation Type"),
                      "vat calculation type"::"Normal VAT", "vat calculation type"::"Reverse Charge VAT");
                if "VAT Amount" <> 0 then begin
                    TestField("VAT %");
                    TestField(Amount);
                end;

                GetCurrency;
                "VAT Amount" := ROUND("VAT Amount", Currency."Amount Rounding Precision", Currency.VATRoundingDirection);

                if "VAT Amount" * Amount < 0 then
                    if "VAT Amount" > 0 then
                        Error(Text011, FieldCaption("VAT Amount"))
                    else
                        Error(Text012, FieldCaption("VAT Amount"));

                "VAT Base Amount" := Amount - "VAT Amount";

                "VAT Difference" :=
                  "VAT Amount" -
                  ROUND(
                    Amount * "VAT %" / (100 + "VAT %"),
                    Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                if Abs("VAT Difference") > Currency."Max. VAT Difference Allowed" then
                    Error(Text013, FieldCaption("VAT Difference"), Currency."Max. VAT Difference Allowed");

                if "Currency Code" = '' then
                    "VAT Amount (LCY)" := "VAT Amount"
                else
                    "VAT Amount (LCY)" :=
                      ROUND(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          "Posting Date", "Currency Code",
                          "VAT Amount", "Currency Factor"));
                "VAT Base Amount (LCY)" := "Amount (LCY)" - "VAT Amount (LCY)";

                UpdateSalesPurchLCY;
            end;
        }
        field(45; "VAT Posting"; Option)
        {
            Caption = 'VAT Posting';
            Editable = false;
            OptionCaption = 'Automatic VAT Entry,Manual VAT Entry';
            OptionMembers = "Automatic VAT Entry","Manual VAT Entry";
        }
        field(47; "Payment Terms Code"; Code[10])
        {
            Caption = 'Payment Terms Code';
            TableRelation = "Payment Terms";

            trigger OnValidate()
            begin
                "Due Date" := 0D;
                "Pmt. Discount Date" := 0D;
                "Payment Discount %" := 0;
                if ("Account Type" <> "account type"::"G/L Account") or
                   ("Bal. Account Type" <> "bal. account type"::"G/L Account")
                then
                    case "Document Type" of
                        "document type"::Invoice:
                            if ("Payment Terms Code" <> '') and ("Document Date" <> 0D) then begin
                                PaymentTerms.Get("Payment Terms Code");
                                "Due Date" := CalcDate(PaymentTerms."Due Date Calculation", "Document Date");
                                "Pmt. Discount Date" := CalcDate(PaymentTerms."Discount Date Calculation", "Document Date");
                                "Payment Discount %" := PaymentTerms."Discount %";
                            end;
                        "document type"::"Credit Memo":
                            if ("Payment Terms Code" <> '') and ("Document Date" <> 0D) then begin
                                PaymentTerms.Get("Payment Terms Code");
                                if PaymentTerms."Calc. Pmt. Disc. on Cr. Memos" then begin
                                    "Due Date" := CalcDate(PaymentTerms."Due Date Calculation", "Document Date");
                                    "Pmt. Discount Date" :=
                                      CalcDate(PaymentTerms."Discount Date Calculation", "Document Date");
                                    "Payment Discount %" := PaymentTerms."Discount %";
                                end else
                                    "Due Date" := "Document Date";
                            end;
                        else
                            "Due Date" := "Document Date";
                    end;
            end;
        }
        field(48; "Applies-to ID"; Code[50])
        {
            Caption = 'Applies-to ID';

            trigger OnValidate()
            begin
                if ("Applies-to ID" <> xRec."Applies-to ID") and (xRec."Applies-to ID" <> '') then
                    ClearCustVendApplnEntry;
            end;
        }
        field(50; "Business Unit Code"; Code[10])
        {
            Caption = 'Business Unit Code';
            TableRelation = "Business Unit";
        }
        field(51; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Journal Template Name"));
        }
        field(52; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(53; "Recurring Method"; Option)
        {
            BlankZero = true;
            Caption = 'Recurring Method';
            OptionCaption = ' ,F  Fixed,V  Variable,B  Balance,RF Reversing Fixed,RV Reversing Variable,RB Reversing Balance';
            OptionMembers = " ","F  Fixed","V  Variable","B  Balance","RF Reversing Fixed","RV Reversing Variable","RB Reversing Balance";

            trigger OnValidate()
            begin
                if "Recurring Method" in
                   ["recurring method"::"B  Balance", "recurring method"::"RB Reversing Balance"]
                then
                    TestField("Currency Code", '');
            end;
        }
        field(54; "Expiration Date"; Date)
        {
            Caption = 'Expiration Date';
        }
        field(55; "Recurring Frequency"; DateFormula)
        {
            Caption = 'Recurring Frequency';
        }
        field(56; "Allocated Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Gen. Jnl. Allocation".Amount where("Journal Template Name" = field("Journal Template Name"),
                                                                   "Journal Batch Name" = field("Journal Batch Name"),
                                                                   "Journal Line No." = field("Line No.")));
            Caption = 'Allocated Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57; "Gen. Posting Type"; Option)
        {
            Caption = 'Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;

            trigger OnValidate()
            begin
                if "Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"] then
                    TestField("Gen. Posting Type", "gen. posting type"::" ");
                if ("Gen. Posting Type" = "gen. posting type"::Settlement) and (CurrFieldNo <> 0) then
                    Error(Text006, "Gen. Posting Type");
                CheckVATInAlloc;
                if "Gen. Posting Type" > 0 then
                    Validate("VAT Prod. Posting Group");
            end;
        }
        field(58; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                if "Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"] then
                    TestField("Gen. Bus. Posting Group", '');
                if xRec."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Gen. Bus. Posting Group") then
                        Validate("VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(59; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            begin
                if "Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"] then
                    TestField("Gen. Prod. Posting Group", '');
                if xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then
                    if GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProdPostingGrp."Def. VAT Prod. Posting Group");
            end;
        }
        field(60; "VAT Calculation Type"; Option)
        {
            Caption = 'VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(61; "EU 3-Party Trade"; Boolean)
        {
            Caption = 'EU 3-Party Trade';
            Editable = false;
        }
        field(62; "Allow Application"; Boolean)
        {
            Caption = 'Allow Application';
            InitValue = true;
        }
        field(63; "Bal. Account Type"; Option)
        {
            Caption = 'Bal. Account Type';
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner";

            trigger OnValidate()
            begin
                /*IF ("Account Type" IN ["Account Type"::Customer,"Account Type"::Vendor,"Account Type"::"Fixed Asset",
                                       "Account Type"::"IC Partner"]) AND
                   ("Bal. Account Type" IN ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor,"Bal. Account Type"::"Fixed Asset",
                                            "Bal. Account Type"::"IC Partner"])
                THEN
                  ERROR(
                    Text000,
                    FIELDCAPTION("Account Type"),FIELDCAPTION("Bal. Account Type"));
                VALIDATE("Bal. Account No.",'');
                VALIDATE("IC Partner G/L Acc. No.",'');
                IF "Bal. Account Type" IN
                   ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor,"Bal. Account Type"::"Bank Account"]
                THEN BEGIN
                  VALIDATE("Bal. Gen. Posting Type","Bal. Gen. Posting Type"::" ");
                  VALIDATE("Bal. Gen. Bus. Posting Group",'');
                  VALIDATE("Bal. Gen. Prod. Posting Group",'');
                END ELSE
                  IF "Account Type" IN [
                                        "Bal. Account Type"::"G/L Account","Account Type"::"Bank Account","Account Type"::"Fixed Asset"]
                  THEN
                    VALIDATE("Payment Terms Code",'');
                UpdateSource;
                IF ("Account Type" <> "Account Type"::"Fixed Asset") AND
                   ("Bal. Account Type" <> "Bal. Account Type"::"Fixed Asset")
                THEN BEGIN
                  "Depreciation Book Code" := '';
                  VALIDATE("FA Posting Type","FA Posting Type"::" ");
                END;
                IF xRec."Bal. Account Type" IN
                   [xRec."Bal. Account Type"::Customer,xRec."Bal. Account Type"::Vendor]
                THEN BEGIN
                  "Bill-to/Pay-to No." := '';
                  "Ship-to/Order Address Code" := '';
                  "Sell-to/Buy-from No." := '';
                  "VAT Registration No." := '';
                END;
                IF ("Account Type" IN [
                                       "Account Type"::"G/L Account","Account Type"::"Bank Account","Account Type"::"Fixed Asset"]) AND
                   ("Bal. Account Type" IN [
                                            "Bal. Account Type"::"G/L Account","Bal. Account Type"::"Bank Account","Bal. Account Type"::"Fixed Asset"])
                THEN
                  VALIDATE("Payment Terms Code",'');
                
                IF "Bal. Account Type" = "Bal. Account Type"::"IC Partner" THEN BEGIN
                  GetTemplate;
                  IF GenJnlTemplate.Type <> GenJnlTemplate.Type::Intercompany THEN
                    FIELDERROR("Bal. Account Type");
                END;
                IF "Bal. Account Type" <> "Bal. Account Type"::"Bank Account" THEN
                  VALIDATE("Credit Card No.",'');
                  */

            end;
        }
        field(64; "Bal. Gen. Posting Type"; Option)
        {
            Caption = 'Bal. Gen. Posting Type';
            OptionCaption = ' ,Purchase,Sale,Settlement';
            OptionMembers = " ",Purchase,Sale,Settlement;

            trigger OnValidate()
            begin
                if "Bal. Account Type" in ["bal. account type"::Customer, "bal. account type"::Vendor, "bal. account type"::"Bank Account"] then
                    TestField("Bal. Gen. Posting Type", "bal. gen. posting type"::" ");
                if ("Bal. Gen. Posting Type" = "gen. posting type"::Settlement) and (CurrFieldNo <> 0) then
                    Error(Text006, "Bal. Gen. Posting Type");
                if "Bal. Gen. Posting Type" > 0 then
                    Validate("Bal. VAT Prod. Posting Group");

                if ("Account Type" <> "account type"::"Fixed Asset") and
                   ("Bal. Account Type" <> "bal. account type"::"Fixed Asset")
                then begin
                    "Depreciation Book Code" := '';
                    Validate("FA Posting Type", "fa posting type"::" ");
                end;
            end;
        }
        field(65; "Bal. Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Bal. Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                if "Bal. Account Type" in ["bal. account type"::Customer, "bal. account type"::Vendor, "bal. account type"::"Bank Account"] then
                    TestField("Bal. Gen. Bus. Posting Group", '');
                if xRec."Bal. Gen. Bus. Posting Group" <> "Bal. Gen. Bus. Posting Group" then
                    if GenBusPostingGrp.ValidateVatBusPostingGroup(GenBusPostingGrp, "Bal. Gen. Bus. Posting Group") then
                        Validate("Bal. VAT Bus. Posting Group", GenBusPostingGrp."Def. VAT Bus. Posting Group");
            end;
        }
        field(66; "Bal. Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Bal. Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            begin
                if "Bal. Account Type" in ["bal. account type"::Customer, "bal. account type"::Vendor, "bal. account type"::"Bank Account"] then
                    TestField("Bal. Gen. Prod. Posting Group", '');
                if xRec."Bal. Gen. Prod. Posting Group" <> "Bal. Gen. Prod. Posting Group" then
                    if GenProdPostingGrp.ValidateVatProdPostingGroup(GenProdPostingGrp, "Bal. Gen. Prod. Posting Group") then
                        Validate("Bal. VAT Prod. Posting Group", GenProdPostingGrp."Def. VAT Prod. Posting Group");
            end;
        }
        field(67; "Bal. VAT Calculation Type"; Option)
        {
            Caption = 'Bal. VAT Calculation Type';
            Editable = false;
            OptionCaption = 'Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(68; "Bal. VAT %"; Decimal)
        {
            Caption = 'Bal. VAT %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                GetCurrency;
                case "Bal. VAT Calculation Type" of
                    "bal. vat calculation type"::"Normal VAT",
                    "bal. vat calculation type"::"Reverse Charge VAT":
                        begin
                            "Bal. VAT Amount" :=
                              ROUND(-Amount * "Bal. VAT %" / (100 + "Bal. VAT %"), Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                            "Bal. VAT Base Amount" :=
                              ROUND(-Amount - "Bal. VAT Amount", Currency."Amount Rounding Precision");
                        end;
                    "bal. vat calculation type"::"Full VAT":
                        "Bal. VAT Amount" := -Amount;
                    "bal. vat calculation type"::"Sales Tax":
                        if ("Bal. Gen. Posting Type" = "bal. gen. posting type"::Purchase) and
                           "Bal. Use Tax"
                        then begin
                            "Bal. VAT Amount" := 0;
                            "Bal. VAT %" := 0;
                        end else begin
                            "Bal. VAT Amount" :=
                              -(Amount -
                                SalesTaxCalculate.ReverseCalculateTax(
                                  "Bal. Tax Area Code", "Bal. Tax Group Code", "Bal. Tax Liable",
                                  "Posting Date", Amount, Quantity, "Currency Factor"));
                            if Amount + "Bal. VAT Amount" <> 0 then
                                "Bal. VAT %" := ROUND(100 * -"Bal. VAT Amount" / (Amount + "Bal. VAT Amount"), 0.00001)
                            else
                                "Bal. VAT %" := 0;
                            "Bal. VAT Amount" :=
                              ROUND("Bal. VAT Amount", Currency."Amount Rounding Precision");
                        end;
                end;
                "Bal. VAT Base Amount" := -(Amount + "Bal. VAT Amount");
                "Bal. VAT Difference" := 0;

                if "Currency Code" = '' then
                    "Bal. VAT Amount (LCY)" := "Bal. VAT Amount"
                else
                    "Bal. VAT Amount (LCY)" :=
                      ROUND(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          "Posting Date", "Currency Code",
                          "Bal. VAT Amount", "Currency Factor"));
                "Bal. VAT Base Amount (LCY)" := -("Amount (LCY)" + "Bal. VAT Amount (LCY)");

                UpdateSalesPurchLCY;
            end;
        }
        field(69; "Bal. VAT Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Bal. VAT Amount';

            trigger OnValidate()
            begin
                GenJnlBatch.Get("Journal Template Name", "Journal Batch Name");
                GenJnlBatch.TestField("Allow VAT Difference", true);
                if not ("Bal. VAT Calculation Type" in
                        ["bal. vat calculation type"::"Normal VAT", "bal. vat calculation type"::"Reverse Charge VAT"])
                then
                    Error(
                      Text010, FieldCaption("Bal. VAT Calculation Type"),
                      "bal. vat calculation type"::"Normal VAT", "bal. vat calculation type"::"Reverse Charge VAT");
                if "Bal. VAT Amount" <> 0 then begin
                    TestField("Bal. VAT %");
                    TestField(Amount);
                end;

                GetCurrency;
                "Bal. VAT Amount" :=
                  ROUND("Bal. VAT Amount", Currency."Amount Rounding Precision", Currency.VATRoundingDirection);

                if "Bal. VAT Amount" * Amount > 0 then
                    if "Bal. VAT Amount" > 0 then
                        Error(Text011, FieldCaption("Bal. VAT Amount"))
                    else
                        Error(Text012, FieldCaption("Bal. VAT Amount"));

                "Bal. VAT Base Amount" := -(Amount + "Bal. VAT Amount");

                "Bal. VAT Difference" :=
                  "Bal. VAT Amount" -
                  ROUND(
                    -Amount * "Bal. VAT %" / (100 + "Bal. VAT %"),
                    Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                if Abs("Bal. VAT Difference") > Currency."Max. VAT Difference Allowed" then
                    Error(
                      Text013, FieldCaption("Bal. VAT Difference"), Currency."Max. VAT Difference Allowed");

                if "Currency Code" = '' then
                    "Bal. VAT Amount (LCY)" := "Bal. VAT Amount"
                else
                    "Bal. VAT Amount (LCY)" :=
                      ROUND(
                        CurrExchRate.ExchangeAmtFCYToLCY(
                          "Posting Date", "Currency Code",
                          "Bal. VAT Amount", "Currency Factor"));
                "Bal. VAT Base Amount (LCY)" := -("Amount (LCY)" + "Bal. VAT Amount (LCY)");

                UpdateSalesPurchLCY;
            end;
        }
        field(70; "Bank Payment Type"; Option)
        {
            Caption = 'Bank Payment Type';
            OptionCaption = ' ,Computer Check,Manual Check';
            OptionMembers = " ","Computer Check","Manual Check";

            trigger OnValidate()
            begin
                if ("Bank Payment Type" <> "bank payment type"::" ") and
                   ("Account Type" <> "account type"::"Bank Account") and
                   ("Bal. Account Type" <> "bal. account type"::"Bank Account")
                then
                    Error(
                      Text007,
                      FieldCaption("Account Type"), FieldCaption("Bal. Account Type"));
                if ("Account Type" = "account type"::"Fixed Asset") and
                   ("Bank Payment Type" <> "bank payment type"::" ")
                then
                    FieldError("Account Type");
            end;
        }
        field(71; "VAT Base Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Base Amount';

            trigger OnValidate()
            begin
                GetCurrency;
                "VAT Base Amount" := ROUND("VAT Base Amount", Currency."Amount Rounding Precision");
                case "VAT Calculation Type" of
                    "vat calculation type"::"Normal VAT",
                  "vat calculation type"::"Reverse Charge VAT":
                        Amount :=
                          ROUND(
                            "VAT Base Amount" * (1 + "VAT %" / 100),
                            Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                    "vat calculation type"::"Full VAT":
                        if "VAT Base Amount" <> 0 then
                            FieldError(
                              "VAT Base Amount",
                              StrSubstNo(
                                Text008, FieldCaption("VAT Calculation Type"),
                                "VAT Calculation Type"));
                    "vat calculation type"::"Sales Tax":
                        if ("Gen. Posting Type" = "gen. posting type"::Purchase) and
                           "Use Tax"
                        then begin
                            "VAT Amount" := 0;
                            "VAT %" := 0;
                            Amount := "VAT Base Amount" + "VAT Amount";
                        end else begin
                            "VAT Amount" :=
                              SalesTaxCalculate.CalculateTax(
                                "Tax Area Code", "Tax Group Code", "Tax Liable", "Posting Date",
                                "VAT Base Amount", Quantity, "Currency Factor");
                            if "VAT Base Amount" <> 0 then
                                "VAT %" := ROUND(100 * "VAT Amount" / "VAT Base Amount", 0.00001)
                            else
                                "VAT %" := 0;
                            "VAT Amount" :=
                              ROUND("VAT Amount", Currency."Amount Rounding Precision");
                            Amount := "VAT Base Amount" + "VAT Amount";
                        end;
                end;
                Validate(Amount);
            end;
        }
        field(72; "Bal. VAT Base Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Bal. VAT Base Amount';

            trigger OnValidate()
            begin
                GetCurrency;
                "Bal. VAT Base Amount" := ROUND("Bal. VAT Base Amount", Currency."Amount Rounding Precision");
                case "Bal. VAT Calculation Type" of
                    "bal. vat calculation type"::"Normal VAT",
                  "bal. vat calculation type"::"Reverse Charge VAT":
                        Amount :=
                          ROUND(
                            -"Bal. VAT Base Amount" * (1 + "Bal. VAT %" / 100),
                            Currency."Amount Rounding Precision", Currency.VATRoundingDirection);
                    "bal. vat calculation type"::"Full VAT":
                        if "Bal. VAT Base Amount" <> 0 then
                            FieldError(
                              "Bal. VAT Base Amount",
                              StrSubstNo(
                                Text008, FieldCaption("Bal. VAT Calculation Type"),
                                "Bal. VAT Calculation Type"));
                    "bal. vat calculation type"::"Sales Tax":
                        if ("Bal. Gen. Posting Type" = "bal. gen. posting type"::Purchase) and
                           "Bal. Use Tax"
                        then begin
                            "Bal. VAT Amount" := 0;
                            "Bal. VAT %" := 0;
                            Amount := -"Bal. VAT Base Amount" - "Bal. VAT Amount";
                        end else begin
                            "Bal. VAT Amount" :=
                              SalesTaxCalculate.CalculateTax(
                                "Bal. Tax Area Code", "Bal. Tax Group Code", "Bal. Tax Liable",
                                "Posting Date", "Bal. VAT Base Amount", Quantity, "Currency Factor");
                            if "Bal. VAT Base Amount" <> 0 then
                                "Bal. VAT %" := ROUND(100 * "Bal. VAT Amount" / "Bal. VAT Base Amount", 0.00001)
                            else
                                "Bal. VAT %" := 0;
                            "Bal. VAT Amount" :=
                              ROUND("Bal. VAT Amount", Currency."Amount Rounding Precision");
                            Amount := -"Bal. VAT Base Amount" - "Bal. VAT Amount";
                        end;
                end;
                Validate(Amount);
            end;
        }
        field(73; Correction; Boolean)
        {
            Caption = 'Correction';

            trigger OnValidate()
            begin
                Validate(Amount);
            end;
        }
        field(75; "Check Printed"; Boolean)
        {
            Caption = 'Check Printed';
            Editable = false;
        }
        field(76; "Document Date"; Date)
        {
            Caption = 'Document Date';
            ClosingDates = true;

            trigger OnValidate()
            begin
                Validate("Payment Terms Code");
            end;
        }
        field(77; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
        }
        field(78; "Source Type"; Option)
        {
            Caption = 'Source Type';
            OptionCaption = ' ,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = " ",Customer,Vendor,"Bank Account","Fixed Asset";

            trigger OnValidate()
            begin
                if ("Account Type" <> "account type"::"G/L Account") and ("Account No." <> '') or
                   ("Bal. Account Type" <> "bal. account type"::"G/L Account") and ("Bal. Account No." <> '')
                then
                    UpdateSource
                else
                    "Source No." := '';
            end;
        }
        field(79; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = if ("Source Type" = const(Customer)) Customer
            else if ("Source Type" = const(Vendor)) Vendor
            else if ("Source Type" = const("Bank Account")) "Bank Account"
            else if ("Source Type" = const("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin
                if ("Account Type" <> "account type"::"G/L Account") and ("Account No." <> '') or
                   ("Bal. Account Type" <> "bal. account type"::"G/L Account") and ("Bal. Account No." <> '')
                then
                    UpdateSource;
            end;
        }
        field(80; "Posting No. Series"; Code[10])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series";
        }
        field(82; "Tax Area Code"; Code[20])
        {
            Caption = 'Tax Area Code';
            TableRelation = "Tax Area";

            trigger OnValidate()
            begin
                Validate("VAT %");
            end;
        }
        field(83; "Tax Liable"; Boolean)
        {
            Caption = 'Tax Liable';

            trigger OnValidate()
            begin
                Validate("VAT %");
            end;
        }
        field(84; "Tax Group Code"; Code[10])
        {
            Caption = 'Tax Group Code';
            TableRelation = "Tax Group";

            trigger OnValidate()
            begin
                Validate("VAT %");
            end;
        }
        field(85; "Use Tax"; Boolean)
        {
            Caption = 'Use Tax';

            trigger OnValidate()
            begin
                TestField("Gen. Posting Type", "gen. posting type"::Purchase);
                Validate("VAT %");
            end;
        }
        field(86; "Bal. Tax Area Code"; Code[20])
        {
            Caption = 'Bal. Tax Area Code';
            TableRelation = "Tax Area";

            trigger OnValidate()
            begin
                Validate("Bal. VAT %");
            end;
        }
        field(87; "Bal. Tax Liable"; Boolean)
        {
            Caption = 'Bal. Tax Liable';

            trigger OnValidate()
            begin
                Validate("Bal. VAT %");
            end;
        }
        field(88; "Bal. Tax Group Code"; Code[10])
        {
            Caption = 'Bal. Tax Group Code';
            TableRelation = "Tax Group";

            trigger OnValidate()
            begin
                Validate("Bal. VAT %");
            end;
        }
        field(89; "Bal. Use Tax"; Boolean)
        {
            Caption = 'Bal. Use Tax';

            trigger OnValidate()
            begin
                TestField("Bal. Gen. Posting Type", "bal. gen. posting type"::Purchase);
                Validate("Bal. VAT %");
            end;
        }
        field(90; "VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                if "Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"] then
                    TestField("VAT Bus. Posting Group", '');

                Validate("VAT Prod. Posting Group");

                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    UpdatePricesFromJobJnlLine;
                end
            end;
        }
        field(91; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                if "Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Bank Account"] then
                    TestField("VAT Prod. Posting Group", '');

                CheckVATInAlloc;

                "VAT %" := 0;
                "VAT Calculation Type" := "vat calculation type"::"Normal VAT";
                if "Gen. Posting Type" <> 0 then begin
                    if not VATPostingSetup.Get("VAT Bus. Posting Group", "VAT Prod. Posting Group") then
                        VATPostingSetup.Init;
                    "VAT Calculation Type" := VATPostingSetup."VAT Calculation Type";
                    case "VAT Calculation Type" of
                        "vat calculation type"::"Normal VAT":
                            "VAT %" := VATPostingSetup."VAT %";
                        "vat calculation type"::"Full VAT":
                            case "Gen. Posting Type" of
                                "gen. posting type"::Sale:
                                    begin
                                        VATPostingSetup.TestField("Sales VAT Account");
                                        TestField("Account No.", VATPostingSetup."Sales VAT Account");
                                    end;
                                "gen. posting type"::Purchase:
                                    begin
                                        VATPostingSetup.TestField("Purchase VAT Account");
                                        TestField("Account No.", VATPostingSetup."Purchase VAT Account");
                                    end;
                            end;
                    end;
                end;
                Validate("VAT %");

                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    UpdatePricesFromJobJnlLine;
                end
            end;
        }
        field(92; "Bal. VAT Bus. Posting Group"; Code[10])
        {
            Caption = 'Bal. VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                if "Bal. Account Type" in
                   ["bal. account type"::Customer, "bal. account type"::Vendor, "bal. account type"::"Bank Account"]
                then
                    TestField("Bal. VAT Bus. Posting Group", '');

                Validate("Bal. VAT Prod. Posting Group");
            end;
        }
        field(93; "Bal. VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'Bal. VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                if "Bal. Account Type" in
                   ["bal. account type"::Customer, "bal. account type"::Vendor, "bal. account type"::"Bank Account"]
                then
                    TestField("Bal. VAT Prod. Posting Group", '');

                "Bal. VAT %" := 0;
                "Bal. VAT Calculation Type" := "bal. vat calculation type"::"Normal VAT";
                if "Bal. Gen. Posting Type" <> 0 then begin
                    if not VATPostingSetup.Get("Bal. VAT Bus. Posting Group", "Bal. VAT Prod. Posting Group") then
                        VATPostingSetup.Init;
                    "Bal. VAT Calculation Type" := VATPostingSetup."VAT Calculation Type";
                    case "Bal. VAT Calculation Type" of
                        "bal. vat calculation type"::"Normal VAT":
                            "Bal. VAT %" := VATPostingSetup."VAT %";
                        "bal. vat calculation type"::"Full VAT":
                            case "Bal. Gen. Posting Type" of
                                "bal. gen. posting type"::Sale:
                                    begin
                                        VATPostingSetup.TestField("Sales VAT Account");
                                        TestField("Bal. Account No.", VATPostingSetup."Sales VAT Account");
                                    end;
                                "bal. gen. posting type"::Purchase:
                                    begin
                                        VATPostingSetup.TestField("Purchase VAT Account");
                                        TestField("Bal. Account No.", VATPostingSetup."Purchase VAT Account");
                                    end;
                            end;
                    end;
                end;
                Validate("Bal. VAT %");
            end;
        }
        field(95; "Additional-Currency Posting"; Option)
        {
            Caption = 'Additional-Currency Posting';
            Editable = false;
            OptionCaption = 'None,Amount Only,Additional-Currency Amount Only';
            OptionMembers = "None","Amount Only","Additional-Currency Amount Only";
        }
        field(98; "FA Add.-Currency Factor"; Decimal)
        {
            Caption = 'FA Add.-Currency Factor';
            DecimalPlaces = 0 : 15;
            MinValue = 0;
        }
        field(99; "Source Currency Code"; Code[10])
        {
            Caption = 'Source Currency Code';
            Editable = false;
            TableRelation = Currency;
        }
        field(100; "Source Currency Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Source Currency Amount';
            Editable = false;
        }
        field(101; "Source Curr. VAT Base Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Source Curr. VAT Base Amount';
            Editable = false;
        }
        field(102; "Source Curr. VAT Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Source Curr. VAT Amount';
            Editable = false;
        }
        field(103; "VAT Base Discount %"; Decimal)
        {
            Caption = 'VAT Base Discount %';
            DecimalPlaces = 0 : 5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(104; "VAT Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Amount (LCY)';
            Editable = false;
        }
        field(105; "VAT Base Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'VAT Base Amount (LCY)';
            Editable = false;
        }
        field(106; "Bal. VAT Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Bal. VAT Amount (LCY)';
            Editable = false;
        }
        field(107; "Bal. VAT Base Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Bal. VAT Base Amount (LCY)';
            Editable = false;
        }
        field(108; "Reversing Entry"; Boolean)
        {
            Caption = 'Reversing Entry';
            Editable = false;
        }
        field(109; "Allow Zero-Amount Posting"; Boolean)
        {
            Caption = 'Allow Zero-Amount Posting';
            Editable = false;
        }
        field(110; "Ship-to/Order Address Code"; Code[10])
        {
            Caption = 'Ship-to/Order Address Code';
            TableRelation = if ("Account Type" = const(Customer)) "Ship-to Address".Code where("Customer No." = field("Bill-to/Pay-to No."))
            else if ("Account Type" = const(Vendor)) "Order Address".Code where("Vendor No." = field("Bill-to/Pay-to No."))
            else if ("Bal. Account Type" = const(Customer)) "Ship-to Address".Code where("Customer No." = field("Bill-to/Pay-to No."))
            else if ("Bal. Account Type" = const(Vendor)) "Order Address".Code where("Vendor No." = field("Bill-to/Pay-to No."));
        }
        field(111; "VAT Difference"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'VAT Difference';
            Editable = false;
        }
        field(112; "Bal. VAT Difference"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            Caption = 'Bal. VAT Difference';
            Editable = false;
        }
        field(113; "IC Partner Code"; Code[20])
        {
            Caption = 'IC Partner Code';
            Editable = false;
            TableRelation = "IC Partner";
        }
        field(114; "IC Direction"; Option)
        {
            Caption = 'IC Direction';
            OptionCaption = 'Outgoing,Incoming';
            OptionMembers = Outgoing,Incoming;
        }
        field(116; "IC Partner G/L Acc. No."; Code[20])
        {
            Caption = 'IC Partner G/L Acc. No.';
            TableRelation = "IC G/L Account";

            trigger OnValidate()
            var
                ICGLAccount: Record "IC G/L Account";
            begin
                if "IC Partner G/L Acc. No." <> '' then begin
                    GetTemplate;
                    GenJnlTemplate.TestField(Type, GenJnlTemplate.Type::Intercompany);
                    if ICGLAccount.Get("IC Partner G/L Acc. No.") then
                        ICGLAccount.TestField(Blocked, false);
                end
            end;
        }
        field(117; "IC Partner Transaction No."; Integer)
        {
            Caption = 'IC Partner Transaction No.';
            Editable = false;
        }
        field(118; "Sell-to/Buy-from No."; Code[20])
        {
            Caption = 'Sell-to/Buy-from No.';
            TableRelation = if ("Account Type" = const(Customer)) Customer
            else if ("Bal. Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor
            else if ("Bal. Account Type" = const(Vendor)) Vendor;

            trigger OnValidate()
            begin
                ReadGLSetup;
                if GLSetup."Bill-to/Sell-to VAT Calc." = GLSetup."bill-to/sell-to vat calc."::"Sell-to/Buy-from No." then
                    UpdateCountryCodeAndVATRegNo("Sell-to/Buy-from No.");
            end;
        }
        field(119; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            var
                VATRegNoFormat: Record "VAT Registration No. Format";
            begin
                VATRegNoFormat.Test("VAT Registration No.", "Country/Region Code", '', 0);
            end;
        }
        field(120; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                Validate("VAT Registration No.");
            end;
        }
        field(121; Prepayment; Boolean)
        {
            Caption = 'Prepayment';
        }
        field(122; "Financial Void"; Boolean)
        {
            Caption = 'Financial Void';
            Editable = false;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;
        }
        field(827; "Credit Card No."; Code[20])
        {
            Caption = 'Credit Card No.';
            // TableRelation = if ("Account Type" = const(Customer),
            //                     "Document Type" = filter(Payment | Refund),
            //                     "Bal. Account Type" = const("Bank Account")) "DO Payment Credit Card" where("Customer No." = field("Account No."));

            trigger OnValidate()
            var
                DOPaymentMgt: Codeunit "Sales Post Invoice Events";
            begin
                CheckNoCardTransactEntryExist(xRec);
                if "Credit Card No." = '' then
                    exit;

                //DOPaymentMgt.CheckCreditCardData("Credit Card No.");
            end;
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

            trigger OnValidate()
            begin
                if "Job Task No." <> xRec."Job Task No." then
                    Validate("Job Planning Line No.", 0);
                if "Job Task No." = '' then begin
                    "Job Quantity" := 0;
                    "Job Currency Factor" := 0;
                    "Job Currency Code" := '';
                    "Job Unit Price" := 0;
                    "Job Total Price" := 0;
                    "Job Line Amount" := 0;
                    "Job Line Discount Amount" := 0;
                    "Job Unit Cost" := 0;
                    "Job Total Cost" := 0;
                    "Job Line Discount %" := 0;

                    "Job Unit Price (LCY)" := 0;
                    "Job Total Price (LCY)" := 0;
                    "Job Line Amount (LCY)" := 0;
                    "Job Line Disc. Amount (LCY)" := 0;
                    "Job Unit Cost (LCY)" := 0;
                    "Job Total Cost (LCY)" := 0;
                    exit;
                end;

                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1002; "Job Unit Price (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Job Unit Price (LCY)';
            Editable = false;
        }
        field(1003; "Job Total Price (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Job Total Price (LCY)';
            Editable = false;
        }
        field(1004; "Job Quantity"; Decimal)
        {
            Caption = 'Job Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if JobTaskIsSet then begin
                    if "Job Planning Line No." <> 0 then
                        Validate("Job Planning Line No.");
                    CreateTempJobJnlLine;
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1005; "Job Unit Cost (LCY)"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Job Unit Cost (LCY)';
            Editable = false;
        }
        field(1006; "Job Line Discount %"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Job Line Discount %';

            trigger OnValidate()
            begin
                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    JobJnlLine.Validate("Line Discount %", "Job Line Discount %");
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1007; "Job Line Disc. Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Job Line Disc. Amount (LCY)';
            Editable = false;

            trigger OnValidate()
            begin
                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    JobJnlLine.Validate("Line Discount Amount (LCY)", "Job Line Disc. Amount (LCY)");
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1008; "Job Unit Of Measure Code"; Code[10])
        {
            Caption = 'Job Unit Of Measure Code';
            TableRelation = "Unit of Measure";
        }
        field(1009; "Job Line Type"; Option)
        {
            Caption = 'Job Line Type';
            OptionCaption = ' ,Schedule,Contract,Both Schedule and Contract';
            OptionMembers = " ",Schedule,Contract,"Both Schedule and Contract";

            trigger OnValidate()
            begin
                if "Job Planning Line No." <> 0 then
                    Error(Text019, FieldCaption("Job Line Type"), FieldCaption("Job Planning Line No."));
            end;
        }
        field(1010; "Job Unit Price"; Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 2;
            Caption = 'Job Unit Price';

            trigger OnValidate()
            begin
                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    JobJnlLine.Validate("Unit Price", "Job Unit Price");
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1011; "Job Total Price"; Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Total Price';
            Editable = false;
        }
        field(1012; "Job Unit Cost"; Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 2;
            Caption = 'Job Unit Cost';
            Editable = false;
        }
        field(1013; "Job Total Cost"; Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Total Cost';
            Editable = false;
        }
        field(1014; "Job Line Discount Amount"; Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Line Discount Amount';

            trigger OnValidate()
            begin
                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    JobJnlLine.Validate("Line Discount Amount", "Job Line Discount Amount");
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1015; "Job Line Amount"; Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            Caption = 'Job Line Amount';

            trigger OnValidate()
            begin
                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    JobJnlLine.Validate("Line Amount", "Job Line Amount");
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1016; "Job Total Cost (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Job Total Cost (LCY)';
            Editable = false;
        }
        field(1017; "Job Line Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Job Line Amount (LCY)';
            Editable = false;

            trigger OnValidate()
            begin
                if JobTaskIsSet then begin
                    CreateTempJobJnlLine;
                    JobJnlLine.Validate("Line Amount (LCY)", "Job Line Amount (LCY)");
                    UpdatePricesFromJobJnlLine;
                end;
            end;
        }
        field(1018; "Job Currency Factor"; Decimal)
        {
            Caption = 'Job Currency Factor';
        }
        field(1019; "Job Currency Code"; Code[10])
        {
            Caption = 'Job Currency Code';

            trigger OnValidate()
            begin
                if ("Job Currency Code" <> xRec."Job Currency Code") or ("Job Currency Code" <> '') then
                    if JobTaskIsSet then begin
                        CreateTempJobJnlLine;
                        UpdatePricesFromJobJnlLine;
                    end;
            end;
        }
        field(1020; "Job Planning Line No."; Integer)
        {
            BlankZero = true;
            Caption = 'Job Planning Line No.';

            trigger OnLookup()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                JobPlanningLine.SetRange("Job No.", "Job No.");
                JobPlanningLine.SetRange("Job Task No.", "Job Task No.");
                JobPlanningLine.SetRange(Type, JobPlanningLine.Type::"G/L Account");
                JobPlanningLine.SetRange("No.", "Account No.");
                JobPlanningLine.SetRange("Usage Link", true);
                JobPlanningLine.SetRange("System-Created Entry", false);

                if Page.RunModal(0, JobPlanningLine) = Action::LookupOK then
                    Validate("Job Planning Line No.", JobPlanningLine."Line No.");
            end;

            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                if "Job Planning Line No." <> 0 then begin
                    JobPlanningLine.Get("Job No.", "Job Task No.", "Job Planning Line No.");
                    JobPlanningLine.TestField("Job No.", "Job No.");
                    JobPlanningLine.TestField("Job Task No.", "Job Task No.");
                    JobPlanningLine.TestField(Type, JobPlanningLine.Type::"G/L Account");
                    JobPlanningLine.TestField("No.", "Account No.");
                    JobPlanningLine.TestField("Usage Link", true);
                    JobPlanningLine.TestField("System-Created Entry", false);
                    "Job Line Type" := JobPlanningLine."Line Type" + 1;
                    Validate("Job Remaining Qty.", JobPlanningLine."Remaining Qty." - "Job Quantity");
                end else
                    Validate("Job Remaining Qty.", 0);
            end;
        }
        field(1030; "Job Remaining Qty."; Decimal)
        {
            Caption = 'Job Remaining Qty.';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            var
                JobPlanningLine: Record "Job Planning Line";
            begin
                if ("Job Remaining Qty." <> 0) and ("Job Planning Line No." = 0) then
                    Error(Text018, FieldCaption("Job Remaining Qty."), FieldCaption("Job Planning Line No."));

                if "Job Planning Line No." <> 0 then begin
                    JobPlanningLine.Get("Job No.", "Job Task No.", "Job Planning Line No.");
                    if JobPlanningLine.Quantity >= 0 then begin
                        if "Job Remaining Qty." < 0 then
                            "Job Remaining Qty." := 0;
                    end else begin
                        if "Job Remaining Qty." > 0 then
                            "Job Remaining Qty." := 0;
                    end;
                end;
            end;
        }
        field(5050; "Campaign No."; Code[20])
        {
            Caption = 'Campaign No.';
            TableRelation = Campaign;

            trigger OnValidate()
            begin
                CreateDim(
                  Database::Campaign, "Campaign No.",
                  DimMgt.TypeToTableID1("Account Type"), "Account No.",
                  DimMgt.TypeToTableID1("Bal. Account Type"), "Bal. Account No.",
                  Database::Job, "Job No.",
                  Database::"Salesperson/Purchaser", "Salespers./Purch. Code");
            end;
        }
        field(5400; "Prod. Order No."; Code[20])
        {
            Caption = 'Prod. Order No.';
            Editable = false;
        }
        field(5600; "FA Posting Date"; Date)
        {
            Caption = 'FA Posting Date';
        }
        field(5601; "FA Posting Type"; Option)
        {
            Caption = 'FA Posting Type';
            OptionCaption = ' ,Acquisition Cost,Depreciation,Write-Down,Appreciation,Custom 1,Custom 2,Disposal,Maintenance';
            OptionMembers = " ","Acquisition Cost",Depreciation,"Write-Down",Appreciation,"Custom 1","Custom 2",Disposal,Maintenance;

            trigger OnValidate()
            begin
                if not (("Account Type" = "account type"::"Fixed Asset") or
                         ("Bal. Account Type" = "bal. account type"::"Fixed Asset")) and
                   ("FA Posting Type" = "fa posting type"::" ")
                then begin
                    "FA Posting Date" := 0D;
                    "Salvage Value" := 0;
                    "No. of Depreciation Days" := 0;
                    "Depr. until FA Posting Date" := false;
                    "Depr. Acquisition Cost" := false;
                    "Maintenance Code" := '';
                    "Insurance No." := '';
                    "Budgeted FA No." := '';
                    "Duplicate in Depreciation Book" := '';
                    "Use Duplication List" := false;
                    "FA Reclassification Entry" := false;
                    "FA Error Entry No." := 0;
                end;

                if "FA Posting Type" <> "fa posting type"::"Acquisition Cost" then
                    TestField("Insurance No.", '');
                if "FA Posting Type" <> "fa posting type"::Maintenance then
                    TestField("Maintenance Code", '');
                GetFAVATSetup;
                GetFAAddCurrExchRate;
            end;
        }
        field(5602; "Depreciation Book Code"; Code[20])
        {
            Caption = 'Depreciation Book Code';
            TableRelation = "Depreciation Book";

            trigger OnValidate()
            begin
                if "Depreciation Book Code" = '' then
                    exit;

                if ("Account No." <> '') and
                   ("Account Type" = "account type"::"Fixed Asset")
                then begin
                    FADeprBook.Get("Account No.", "Depreciation Book Code");
                    "Posting Group" := FADeprBook."FA Posting Group";
                end;

                if ("Bal. Account No." <> '') and
                   ("Bal. Account Type" = "bal. account type"::"Fixed Asset")
                then begin
                    FADeprBook.Get("Bal. Account No.", "Depreciation Book Code");
                    "Posting Group" := FADeprBook."FA Posting Group";
                end;
                GetFAVATSetup;
                GetFAAddCurrExchRate;
            end;
        }
        field(5603; "Salvage Value"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Salvage Value';
        }
        field(5604; "No. of Depreciation Days"; Integer)
        {
            BlankZero = true;
            Caption = 'No. of Depreciation Days';
        }
        field(5605; "Depr. until FA Posting Date"; Boolean)
        {
            Caption = 'Depr. until FA Posting Date';
        }
        field(5606; "Depr. Acquisition Cost"; Boolean)
        {
            Caption = 'Depr. Acquisition Cost';
        }
        field(5609; "Maintenance Code"; Code[10])
        {
            Caption = 'Maintenance Code';
            TableRelation = Maintenance;

            trigger OnValidate()
            begin
                if "Maintenance Code" <> '' then
                    TestField("FA Posting Type", "fa posting type"::Maintenance);
            end;
        }
        field(5610; "Insurance No."; Code[20])
        {
            Caption = 'Insurance No.';
            TableRelation = Insurance;

            trigger OnValidate()
            begin
                if "Insurance No." <> '' then
                    TestField("FA Posting Type", "fa posting type"::"Acquisition Cost");
            end;
        }
        field(5611; "Budgeted FA No."; Code[20])
        {
            Caption = 'Budgeted FA No.';
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                if "Budgeted FA No." <> '' then begin
                    FA.Get("Budgeted FA No.");
                    FA.TestField("Budgeted Asset", true);
                end;
            end;
        }
        field(5612; "Duplicate in Depreciation Book"; Code[10])
        {
            Caption = 'Duplicate in Depreciation Book';
            TableRelation = "Depreciation Book";

            trigger OnValidate()
            begin
                "Use Duplication List" := false;
            end;
        }
        field(5613; "Use Duplication List"; Boolean)
        {
            Caption = 'Use Duplication List';

            trigger OnValidate()
            begin
                "Duplicate in Depreciation Book" := '';
            end;
        }
        field(5614; "FA Reclassification Entry"; Boolean)
        {
            Caption = 'FA Reclassification Entry';
        }
        field(5615; "FA Error Entry No."; Integer)
        {
            BlankZero = true;
            Caption = 'FA Error Entry No.';
            TableRelation = "FA Ledger Entry";
        }
        field(5616; "Index Entry"; Boolean)
        {
            Caption = 'Index Entry';
        }
        field(5617; "Source Line No."; Integer)
        {
            Caption = 'Source Line No.';
        }
        field(50000; "Loan No"; Code[20])
        {
            //TableRelation = Table59018;
        }
        field(50001; "Pay Mode"; Code[20])
        {
            //TableRelation = Table50006;
        }
        field(50002; "Cheque Date"; Date)
        {
        }
        field(50003; Remarks; Text[50])
        {
        }
        field(50004; "Asset No"; Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(50005; "ED Code"; Code[20])
        {
        }
        field(50006; "Commissioner Code"; Code[20])
        {
        }
        field(50007; "Commissioner Name"; Text[50])
        {
        }
        field(50009; "Meeting ID"; Code[20])
        {
        }
        field(50010; "Meeting Description"; Text[50])
        {
        }
        field(50011; "Starting Date"; Date)
        {
        }
        field(50012; "Ending Date"; Date)
        {
        }
        field(50013; "Budget Name"; Code[20])
        {
            TableRelation = "G/L Budget Name";
        }
        field(50014; "Transaction Type"; Option)
        {
            OptionCaption = 'Normal,Budget';
            OptionMembers = Normal,Budget;
        }
        field(50015; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Rejected,Released,Canceled';
            OptionMembers = Open,"Pending Approval",Rejected,Released,Canceled;
        }
        field(50016; "Licensee No."; Code[20])
        {
        }
        field(50017; "Payment Type"; Option)
        {
            OptionMembers = " ",Levy,Penalty,Registration;
        }
        field(50018; "Employee Code"; Code[30])
        {
            TableRelation = Employee;
        }
        field(50019; "No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Journal Template Name", "Journal Batch Name", "No.", "Line No.")
        {
            Clustered = true;
            MaintainSIFTIndex = false;
            SumIndexFields = "Balance (LCY)";
        }
        key(Key2; "Journal Template Name", "Journal Batch Name", "Posting Date", "Document No.")
        {
            MaintainSQLIndex = false;
        }
        key(Key3; "Account Type", "Account No.", "Applies-to Doc. Type", "Applies-to Doc. No.")
        {
        }
        key(Key4; "Document No.")
        {
            MaintainSQLIndex = false;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CheckNoCardTransactEntryExist(Rec);

        TestField("Check Printed", false);

        ClearCustVendApplnEntry;

        GenJnlAlloc.SetRange("Journal Template Name", "Journal Template Name");
        GenJnlAlloc.SetRange("Journal Batch Name", "Journal Batch Name");
        GenJnlAlloc.SetRange("Journal Line No.", "Line No.");
        GenJnlAlloc.DeleteAll;
    end;

    trigger OnInsert()
    begin
        GenJnlAlloc.LockTable;
        LockTable;
        GenJnlTemplate.Get("Journal Template Name");
        GenJnlBatch.Get("Journal Template Name", "Journal Batch Name");
        "Posting No. Series" := GenJnlBatch."Posting No. Series";
        "Check Printed" := false;

        ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
        ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
    end;

    trigger OnModify()
    begin
        TestField("Check Printed", false);
        if ("Applies-to ID" = '') and (xRec."Applies-to ID" <> '') then
            ClearCustVendApplnEntry;
    end;

    trigger OnRename()
    begin
        CheckNoCardTransactEntryExist(Rec);
        TestField("Check Printed", false);
    end;

    var
        Text000: label '%1 or %2 must be G/L Account or Bank Account.';
        Text001: label 'You must not specify %1 when %2 is %3.';
        Text002: label 'cannot be specified without %1';
        Text003: label 'The %1 in the %2 will be changed from %3 to %4.\';
        Text004: label 'Do you wish to continue?';
        Text005: label 'The update has been interrupted to respect the warning.';
        Text006: label 'The %1 option can only be used internally in the system.';
        Text007: label '%1 or %2 must be a Bank Account.';
        Text008: label ' must be 0 when %1 is %2.';
        Text009: label 'LCY';
        Text010: label '%1 must be %2 or %3.';
        Text011: label '%1 must be negative.';
        Text012: label '%1 must be positive.';
        Text013: label 'The %1 must not be more than %2.';
        Text017: label 'Credit card %1 has already been performed for this %2, but posting failed. You must complete posting of the document of type %2 with the number %3.';
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlBatch: Record "Gen. Journal Batch";
        GenJnlLine: Record "Gen. Journal Line";
        GLAcc: Record "G/L Account";
        Cust: Record Customer;
        Vend: Record Vendor;
        ICPartner: Record "IC Partner";
        Currency: Record Currency;
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
        Job: Record Job;
        JobJnlLine: Record "Job Journal Line" temporary;
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
        Text014: label 'The %1 %2 has a %3 %4.\Do you still want to use %1 %2 in this journal line?';
        OK: Boolean;
        TemplateFound: Boolean;
        Text015: label 'You are not allowed to apply and post an entry to an entry with an earlier posting date.\\Instead, post %1 %2 and then apply it to %3 %4.';
        CurrencyDate: Date;
        SourceCodeSetup: Record "Source Code Setup";
        Text016: label '%1 must be G/L Account or Bank Account.';
        HideValidationDialog: Boolean;
        Text018: label '%1 can only be set when %2 is set.';
        Text019: label '%1 cannot be changed when %2 is set.';
        GLSetupRead: Boolean;


    procedure EmptyLine(): Boolean
    begin
        exit(
          ("Account No." = '') and (Amount = 0) and
          (("Bal. Account No." = '') or not "System-Created Entry"));
    end;


    procedure UpdateLineBalance()
    begin
        if ((Amount > 0) and (not Correction)) or
           ((Amount < 0) and Correction)
        then begin
            "Debit Amount" := Amount;
            "Credit Amount" := 0
        end else begin
            "Debit Amount" := 0;
            "Credit Amount" := -Amount;
        end;
        if "Currency Code" = '' then
            "Amount (LCY)" := Amount;
        case true of
            ("Account No." <> '') and ("Bal. Account No." <> ''):
                "Balance (LCY)" := 0;
            "Bal. Account No." <> '':
                "Balance (LCY)" := -"Amount (LCY)";
            else
                "Balance (LCY)" := "Amount (LCY)";
        end;

        Clear(GenJnlAlloc);
        //GenJnlAlloc.UpdateAllocations(Rec);

        UpdateSalesPurchLCY;
    end;


    procedure SetUpNewLine(LastGenJnlLine: Record "Gen. Journal Line Approval"; Balance: Decimal; BottomLine: Boolean)
    begin
        GenJnlTemplate.Get("Journal Template Name");
        GenJnlBatch.Get("Journal Template Name", "Journal Batch Name");
        GenJnlLine.SetRange("Journal Template Name", "Journal Template Name");
        GenJnlLine.SetRange("Journal Batch Name", "Journal Batch Name");
        if GenJnlLine.FindFirst then begin
            "Posting Date" := LastGenJnlLine."Posting Date";
            "Document Date" := LastGenJnlLine."Posting Date";
            "Document No." := LastGenJnlLine."Document No.";
            if BottomLine and
               (Balance - LastGenJnlLine."Balance (LCY)" = 0) and
               not LastGenJnlLine.EmptyLine
            then
                "Document No." := IncStr("Document No.");
        end else begin
            "Posting Date" := WorkDate;
            "Document Date" := WorkDate;
            if GenJnlBatch."No. Series" <> '' then begin
                Clear(NoSeriesMgt);
                "Document No." := NoSeriesMgt.TryGetNextNo(GenJnlBatch."No. Series", "Posting Date");
                //  "Document No." := NoSeriesMgt.GetNextNo(GenJnlBatch."No. Series","Posting Date",TRUE);
            end;
        end;
        if GenJnlTemplate.Recurring then
            "Recurring Method" := LastGenJnlLine."Recurring Method";
        "Account Type" := LastGenJnlLine."Account Type";
        "Document Type" := LastGenJnlLine."Document Type";
        "Source Code" := GenJnlTemplate."Source Code";
        "Reason Code" := GenJnlBatch."Reason Code";
        "Posting No. Series" := GenJnlBatch."Posting No. Series";
        "Bal. Account Type" := GenJnlBatch."Bal. Account Type";
        if ("Account Type" in ["account type"::Customer, "account type"::Vendor, "account type"::"Fixed Asset"]) and
           ("Bal. Account Type" in ["bal. account type"::Customer, "bal. account type"::Vendor, "bal. account type"::"Fixed Asset"])
        then
            "Account Type" := "account type"::"G/L Account";
        Validate("Bal. Account No.", GenJnlBatch."Bal. Account No.");
        Description := '';
    end;

    local procedure CheckVATInAlloc()
    begin
        if "Gen. Posting Type" <> 0 then begin
            GenJnlAlloc.Reset;
            GenJnlAlloc.SetRange("Journal Template Name", "Journal Template Name");
            GenJnlAlloc.SetRange("Journal Batch Name", "Journal Batch Name");
            GenJnlAlloc.SetRange("Journal Line No.", "Line No.");
            if GenJnlAlloc.Find('-') then
                repeat
                // GenJnlAlloc.CheckVAT(Rec);
                until GenJnlAlloc.Next = 0;
        end;
    end;

    local procedure SetCurrencyCode(AccType2: Option "G/L Account",Customer,Vendor,"Bank Account"; AccNo2: Code[20]): Boolean
    begin
        "Currency Code" := '';
        if AccNo2 <> '' then
            if AccType2 = Acctype2::"Bank Account" then
                if BankAcc2.Get(AccNo2) then
                    "Currency Code" := BankAcc2."Currency Code";
        exit("Currency Code" <> '');
    end;

    local procedure GetCurrency()
    begin
        if "Additional-Currency Posting" =
           "additional-currency posting"::"Additional-Currency Amount Only"
        then begin
            if GLSetup."Additional Reporting Currency" = '' then
                ReadGLSetup;
            CurrencyCode := GLSetup."Additional Reporting Currency";
        end else
            CurrencyCode := "Currency Code";

        if CurrencyCode = '' then begin
            Clear(Currency);
            Currency.InitRoundingPrecision
        end else
            if CurrencyCode <> Currency.Code then begin
                Currency.Get(CurrencyCode);
                Currency.TestField("Amount Rounding Precision");
            end;
    end;


    procedure UpdateSource()
    var
        SourceExists1: Boolean;
        SourceExists2: Boolean;
    begin
        SourceExists1 := ("Account Type" <> "account type"::"G/L Account") and ("Account No." <> '');
        SourceExists2 := ("Bal. Account Type" <> "bal. account type"::"G/L Account") and ("Bal. Account No." <> '');
        case true of
            SourceExists1 and not SourceExists2:
                begin
                    "Source Type" := "Account Type";
                    "Source No." := "Account No.";
                end;
            SourceExists2 and not SourceExists1:
                begin
                    "Source Type" := "Bal. Account Type";
                    "Source No." := "Bal. Account No.";
                end;
            else begin
                "Source Type" := "source type"::" ";
                "Source No." := '';
            end;
        end;
    end;

    local procedure CheckGLAcc()
    begin
        GLAcc.CheckGLAcc;
        if GLAcc."Direct Posting" or ("Journal Template Name" = '') or "System-Created Entry" then
            exit;
        if "Posting Date" <> 0D then
            if "Posting Date" = ClosingDate("Posting Date") then
                exit;
        GLAcc.TestField("Direct Posting", true);
    end;


    procedure GetFAAddCurrExchRate()
    var
        DeprBook: Record "Depreciation Book";
        FANo: Code[20];
        UseFAAddCurrExchRate: Boolean;
    begin
        "FA Add.-Currency Factor" := 0;
        if ("FA Posting Type" <> "fa posting type"::" ") and
           ("Depreciation Book Code" <> '')
        then begin
            if "Account Type" = "account type"::"Fixed Asset" then
                FANo := "Account No.";
            if "Bal. Account Type" = "bal. account type"::"Fixed Asset" then
                FANo := "Bal. Account No.";
            if FANo <> '' then begin
                DeprBook.Get("Depreciation Book Code");
                case "FA Posting Type" of
                    "fa posting type"::"Acquisition Cost":
                        UseFAAddCurrExchRate := DeprBook."Add-Curr Exch Rate - Acq. Cost";
                    "fa posting type"::Depreciation:
                        UseFAAddCurrExchRate := DeprBook."Add.-Curr. Exch. Rate - Depr.";
                    "fa posting type"::"Write-Down":
                        UseFAAddCurrExchRate := DeprBook."Add-Curr Exch Rate -Write-Down";
                    "fa posting type"::Appreciation:
                        UseFAAddCurrExchRate := DeprBook."Add-Curr. Exch. Rate - Apprec.";
                    "fa posting type"::"Custom 1":
                        UseFAAddCurrExchRate := DeprBook."Add-Curr. Exch Rate - Custom 1";
                    "fa posting type"::"Custom 2":
                        UseFAAddCurrExchRate := DeprBook."Add-Curr. Exch Rate - Custom 2";
                    "fa posting type"::Disposal:
                        UseFAAddCurrExchRate := DeprBook."Add.-Curr. Exch. Rate - Disp.";
                    "fa posting type"::Maintenance:
                        UseFAAddCurrExchRate := DeprBook."Add.-Curr. Exch. Rate - Maint.";
                end;
                if UseFAAddCurrExchRate then begin
                    FADeprBook.Get(FANo, "Depreciation Book Code");
                    FADeprBook.TestField("FA Add.-Currency Factor");
                    "FA Add.-Currency Factor" := FADeprBook."FA Add.-Currency Factor";
                end;
            end;
        end;
    end;


    procedure GetShowCurrencyCode(CurrencyCode: Code[10]): Code[10]
    begin
        if CurrencyCode <> '' then
            exit(CurrencyCode);

        exit(Text009);
    end;


    procedure ClearCustVendApplnEntry()
    var
        TempCustLedgEntry: Record "Cust. Ledger Entry";
        TempVendLedgEntry: Record "Vendor Ledger Entry";
        CustEntryEdit: Codeunit "Cust. Entry-Edit";
        VendEntryEdit: Codeunit "Vend. Entry-Edit";
    begin
        if "Bal. Account Type" in
           ["bal. account type"::Customer, "bal. account type"::Vendor]
        then begin
            AccType := "Bal. Account Type";
            AccNo := "Bal. Account No.";
        end else begin
            AccType := "Account Type";
            AccNo := "Account No.";
        end;
        case AccType of
            Acctype::Customer:
                begin
                    CustLedgEntry.Reset;
                    if "Applies-to ID" <> '' then begin
                        CustLedgEntry.SetCurrentkey("Customer No.", "Applies-to ID", Open);
                        CustLedgEntry.SetRange("Customer No.", AccNo);
                        CustLedgEntry.SetRange("Applies-to ID", "Applies-to ID");
                        CustLedgEntry.SetRange(Open, true);
                        if CustLedgEntry.Find('-') then begin
                            CustLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
                            CustLedgEntry."Accepted Payment Tolerance" := 0;
                            CustLedgEntry."Amount to Apply" := 0;
                            CustEntrySetApplID.SetApplId(CustLedgEntry, TempCustLedgEntry, '');
                        end;
                    end else
                        if "Applies-to Doc. No." <> '' then begin
                            CustLedgEntry.SetCurrentkey("Document No.");
                            CustLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                            CustLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                            CustLedgEntry.SetRange("Customer No.", AccNo);
                            CustLedgEntry.SetRange(Open, true);
                            if CustLedgEntry.Find('-') then begin
                                CustLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
                                CustLedgEntry."Accepted Payment Tolerance" := 0;
                                CustLedgEntry."Amount to Apply" := 0;
                                CustEntryEdit.Run(CustLedgEntry);
                            end;
                        end;
                end;
            Acctype::Vendor:
                begin
                    VendLedgEntry.Reset;
                    if "Applies-to ID" <> '' then begin
                        VendLedgEntry.SetCurrentkey("Vendor No.", "Applies-to ID", Open);
                        VendLedgEntry.SetRange("Vendor No.", AccNo);
                        VendLedgEntry.SetRange("Applies-to ID", "Applies-to ID");
                        VendLedgEntry.SetRange(Open, true);
                        if VendLedgEntry.Find('-') then begin
                            VendLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
                            VendLedgEntry."Accepted Payment Tolerance" := 0;
                            VendLedgEntry."Amount to Apply" := 0;
                            VendEntrySetApplID.SetApplId(VendLedgEntry, TempVendLedgEntry, '');
                        end;
                    end else
                        if "Applies-to Doc. No." <> '' then begin
                            VendLedgEntry.SetCurrentkey("Document No.");
                            VendLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                            VendLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                            VendLedgEntry.SetRange("Vendor No.", AccNo);
                            VendLedgEntry.SetRange(Open, true);
                            if VendLedgEntry.Find('-') then begin
                                VendLedgEntry."Accepted Pmt. Disc. Tolerance" := false;
                                VendLedgEntry."Accepted Payment Tolerance" := 0;
                                VendLedgEntry."Amount to Apply" := 0;
                                VendEntryEdit.Run(VendLedgEntry);
                            end;
                        end;
                end;
        end;
    end;


    procedure CheckFixedCurrency(): Boolean
    var
        CurrExchRate: Record "Currency Exchange Rate";
    begin
        CurrExchRate.SetRange("Currency Code", "Currency Code");
        CurrExchRate.SetRange("Starting Date", 0D, "Posting Date");

        if not CurrExchRate.FindLast then
            exit(false);

        if CurrExchRate."Relational Currency Code" = '' then
            exit(
              CurrExchRate."Fix Exchange Rate Amount" =
              CurrExchRate."fix exchange rate amount"::Both);

        if CurrExchRate."Fix Exchange Rate Amount" <>
           CurrExchRate."fix exchange rate amount"::Both
        then
            exit(false);

        CurrExchRate.SetRange("Currency Code", CurrExchRate."Relational Currency Code");
        if CurrExchRate.FindLast then
            exit(
              CurrExchRate."Fix Exchange Rate Amount" =
              CurrExchRate."fix exchange rate amount"::Both);

        exit(false);
    end;


    procedure CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]; Type3: Integer; No3: Code[20]; Type4: Integer; No4: Code[20]; Type5: Integer; No5: Code[20])
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        TableID[1] := Type1;
        No[1] := No1;
        TableID[2] := Type2;
        No[2] := No2;
        TableID[3] := Type3;
        No[3] := No3;
        TableID[4] := Type4;
        No[4] := No4;
        TableID[5] := Type5;
        No[5] := No5;
        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        // "Dimension Set ID" :=
        //   DimMgt.GetDefaultDimID(
        //     TableID, No, "Source Code", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", 0);
    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        TestField("Check Printed", false);
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        TestField("Check Printed", false);
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;


    procedure ShowDimensions()
    begin
        //"Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID", StrSubstNo('%1 %2 %3', "Journal Template Name", "Journal Batch Name", "Line No."),
        //     "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;


    procedure GetFAVATSetup()
    var
        LocalGlAcc: Record "G/L Account";
        FAPostingGr: Record "FA Posting Group";
        FABalAcc: Boolean;
    begin
        if CurrFieldNo = 0 then
            exit;
        if ("Account Type" <> "account type"::"Fixed Asset") and
           ("Bal. Account Type" <> "bal. account type"::"Fixed Asset")
        then
            exit;
        FABalAcc := ("Bal. Account Type" = "bal. account type"::"Fixed Asset");
        if not FABalAcc then begin
            "Gen. Posting Type" := "gen. posting type"::" ";
            "Gen. Bus. Posting Group" := '';
            "Gen. Prod. Posting Group" := '';
            "VAT Bus. Posting Group" := '';
            "VAT Prod. Posting Group" := '';
            "Tax Group Code" := '';
            Validate("VAT Prod. Posting Group");
        end;
        if FABalAcc then begin
            "Bal. Gen. Posting Type" := "bal. gen. posting type"::" ";
            "Bal. Gen. Bus. Posting Group" := '';
            "Bal. Gen. Prod. Posting Group" := '';
            "Bal. VAT Bus. Posting Group" := '';
            "Bal. VAT Prod. Posting Group" := '';
            "Bal. Tax Group Code" := '';
            Validate("Bal. VAT Prod. Posting Group");
        end;
        if not GenJnlBatch.Get("Journal Template Name", "Journal Batch Name") or
           GenJnlBatch."Copy VAT Setup to Jnl. Lines"
        then begin
            if (("FA Posting Type" = "fa posting type"::"Acquisition Cost") or
                ("FA Posting Type" = "fa posting type"::Disposal) or
                ("FA Posting Type" = "fa posting type"::Maintenance)) and
               ("Posting Group" <> '')
            then begin
                if FAPostingGr.Get("Posting Group") then begin
                    if "FA Posting Type" = "fa posting type"::"Acquisition Cost" then begin
                        FAPostingGr.TestField("Acquisition Cost Account");
                        LocalGlAcc.Get(FAPostingGr."Acquisition Cost Account");
                    end;
                    if "FA Posting Type" = "fa posting type"::Disposal then begin
                        FAPostingGr.TestField("Acq. Cost Acc. on Disposal");
                        LocalGlAcc.Get(FAPostingGr."Acq. Cost Acc. on Disposal");
                    end;
                    if "FA Posting Type" = "fa posting type"::Maintenance then begin
                        FAPostingGr.TestField("Maintenance Expense Account");
                        LocalGlAcc.Get(FAPostingGr."Maintenance Expense Account");
                    end;
                    LocalGlAcc.CheckGLAcc;
                    if not FABalAcc then begin
                        "Gen. Posting Type" := LocalGlAcc."Gen. Posting Type";
                        "Gen. Bus. Posting Group" := LocalGlAcc."Gen. Bus. Posting Group";
                        "Gen. Prod. Posting Group" := LocalGlAcc."Gen. Prod. Posting Group";
                        "VAT Bus. Posting Group" := LocalGlAcc."VAT Bus. Posting Group";
                        "VAT Prod. Posting Group" := LocalGlAcc."VAT Prod. Posting Group";
                        "Tax Group Code" := LocalGlAcc."Tax Group Code";
                        Validate("VAT Prod. Posting Group");
                    end else begin
                        ;
                        "Bal. Gen. Posting Type" := LocalGlAcc."Gen. Posting Type";
                        "Bal. Gen. Bus. Posting Group" := LocalGlAcc."Gen. Bus. Posting Group";
                        "Bal. Gen. Prod. Posting Group" := LocalGlAcc."Gen. Prod. Posting Group";
                        "Bal. VAT Bus. Posting Group" := LocalGlAcc."VAT Bus. Posting Group";
                        "Bal. VAT Prod. Posting Group" := LocalGlAcc."VAT Prod. Posting Group";
                        "Bal. Tax Group Code" := LocalGlAcc."Tax Group Code";
                        Validate("Bal. VAT Prod. Posting Group");
                    end;
                end;
            end;
        end;
    end;


    procedure GetTemplate()
    begin
        if not TemplateFound then
            GenJnlTemplate.Get("Journal Template Name");
        TemplateFound := true;
    end;

    local procedure UpdateSalesPurchLCY()
    begin
        "Sales/Purch. (LCY)" := 0;
        if (not "System-Created Entry") and ("Document Type" in ["document type"::Invoice, "document type"::"Credit Memo"]) then begin
            if ("Account Type" in ["account type"::Customer, "account type"::Vendor]) and ("Bal. Account No." <> '') then
                "Sales/Purch. (LCY)" := "Amount (LCY)" + "Bal. VAT Amount (LCY)";
            if ("Bal. Account Type" in ["bal. account type"::Customer, "bal. account type"::Vendor]) and ("Account No." <> '') then
                "Sales/Purch. (LCY)" := -("Amount (LCY)" - "VAT Amount (LCY)");
        end;
    end;


    procedure SetApplyToAmount()
    begin
        if "Account Type" = "account type"::Customer then begin
            CustLedgEntry.SetCurrentkey("Document No.");
            CustLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
            CustLedgEntry.SetRange("Customer No.", "Account No.");
            CustLedgEntry.SetRange(Open, true);
            if CustLedgEntry.Find('-') then
                if CustLedgEntry."Amount to Apply" = 0 then begin
                    CustLedgEntry.CalcFields("Remaining Amount");
                    CustLedgEntry."Amount to Apply" := CustLedgEntry."Remaining Amount";
                    Codeunit.Run(Codeunit::"Cust. Entry-Edit", CustLedgEntry);
                end;
        end else
            if "Account Type" = "account type"::Vendor then begin
                VendLedgEntry.SetCurrentkey("Document No.");
                VendLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                VendLedgEntry.SetRange("Vendor No.", "Account No.");
                VendLedgEntry.SetRange(Open, true);
                if VendLedgEntry.Find('-') then
                    if VendLedgEntry."Amount to Apply" = 0 then begin
                        VendLedgEntry.CalcFields("Remaining Amount");
                        VendLedgEntry."Amount to Apply" := VendLedgEntry."Remaining Amount";
                        Codeunit.Run(Codeunit::"Vend. Entry-Edit", VendLedgEntry);
                    end;
            end;
    end;


    procedure ValidateApplyRequirements(TempGenJnlLine: Record "Gen. Journal Line Approval" temporary)
    var
        ExchAccGLJnlLine: Codeunit "Exchange Acc. G/L Journal Line";
    begin
        if (TempGenJnlLine."Bal. Account Type" = TempGenJnlLine."bal. account type"::Customer) or
           (TempGenJnlLine."Bal. Account Type" = TempGenJnlLine."bal. account type"::Vendor)
        then
            //  ExchAccGLJnlLine.RUN(Rec);

            if TempGenJnlLine."Account Type" = TempGenJnlLine."account type"::Customer then begin
                if TempGenJnlLine."Applies-to ID" <> '' then begin
                    CustLedgEntry.SetCurrentkey("Customer No.", "Applies-to ID", Open);
                    CustLedgEntry.SetRange("Customer No.", TempGenJnlLine."Account No.");
                    CustLedgEntry.SetRange("Applies-to ID", TempGenJnlLine."Applies-to ID");
                    CustLedgEntry.SetRange(Open, true);
                    if CustLedgEntry.Find('-') then
                        repeat
                            if TempGenJnlLine."Posting Date" < CustLedgEntry."Posting Date" then
                                Error(
                                  Text015, TempGenJnlLine."Document Type", TempGenJnlLine."Document No.",
                                  CustLedgEntry."Document Type", CustLedgEntry."Document No.");
                        until CustLedgEntry.Next = 0;
                end else
                    if TempGenJnlLine."Applies-to Doc. No." <> '' then begin
                        CustLedgEntry.SetCurrentkey("Document No.");
                        CustLedgEntry.SetRange("Document No.", TempGenJnlLine."Applies-to Doc. No.");
                        if TempGenJnlLine."Applies-to Doc. Type" <> TempGenJnlLine."applies-to doc. type"::" " then
                            CustLedgEntry.SetRange("Document Type", TempGenJnlLine."Applies-to Doc. Type");
                        CustLedgEntry.SetRange("Customer No.", TempGenJnlLine."Account No.");
                        CustLedgEntry.SetRange(Open, true);
                        if CustLedgEntry.Find('-') then
                            if TempGenJnlLine."Posting Date" < CustLedgEntry."Posting Date" then
                                Error(
                                  Text015, TempGenJnlLine."Document Type", TempGenJnlLine."Document No.",
                                  CustLedgEntry."Document Type", CustLedgEntry."Document No.");
                    end;
            end else
                if TempGenJnlLine."Account Type" = TempGenJnlLine."account type"::Vendor then begin
                    if TempGenJnlLine."Applies-to ID" <> '' then begin
                        VendLedgEntry.SetCurrentkey("Vendor No.", "Applies-to ID", Open);
                        VendLedgEntry.SetRange("Vendor No.", TempGenJnlLine."Account No.");
                        VendLedgEntry.SetRange("Applies-to ID", TempGenJnlLine."Applies-to ID");
                        VendLedgEntry.SetRange(Open, true);
                        repeat
                            if TempGenJnlLine."Posting Date" < VendLedgEntry."Posting Date" then
                                Error(
                                  Text015, TempGenJnlLine."Document Type", TempGenJnlLine."Document No.",
                                  VendLedgEntry."Document Type", VendLedgEntry."Document No.");
                        until VendLedgEntry.Next = 0;
                        if VendLedgEntry.Find('-') then
                          ;
                    end else
                        if TempGenJnlLine."Applies-to Doc. No." <> '' then begin
                            VendLedgEntry.SetCurrentkey("Document No.");
                            VendLedgEntry.SetRange("Document No.", TempGenJnlLine."Applies-to Doc. No.");
                            if TempGenJnlLine."Applies-to Doc. Type" <> TempGenJnlLine."applies-to doc. type"::" " then
                                VendLedgEntry.SetRange("Document Type", TempGenJnlLine."Applies-to Doc. Type");
                            VendLedgEntry.SetRange("Vendor No.", TempGenJnlLine."Account No.");
                            VendLedgEntry.SetRange(Open, true);
                            if VendLedgEntry.Find('-') then
                                if TempGenJnlLine."Posting Date" < VendLedgEntry."Posting Date" then
                                    Error(
                                      Text015, TempGenJnlLine."Document Type", TempGenJnlLine."Document No.",
                                      VendLedgEntry."Document Type", VendLedgEntry."Document No.");
                        end;
                end;
    end;

    local procedure UpdateCountryCodeAndVATRegNo(No: Code[20])
    begin
        if No = '' then begin
            "Country/Region Code" := '';
            "VAT Registration No." := '';
            exit;
        end;

        ReadGLSetup;
        case true of
            ("Account Type" = "account type"::Customer) or ("Bal. Account Type" = "bal. account type"::Customer):
                begin
                    Cust.Get(No);
                    "Country/Region Code" := Cust."Country/Region Code";
                    "VAT Registration No." := Cust."VAT Registration No.";
                end;
            ("Account Type" = "account type"::Vendor) or ("Bal. Account Type" = "bal. account type"::Vendor):
                begin
                    Vend.Get(No);
                    "Country/Region Code" := Vend."Country/Region Code";
                    "VAT Registration No." := Vend."VAT Registration No.";
                end;
        end;
    end;


    procedure JobTaskIsSet(): Boolean
    begin
        exit(("Job No." <> '') and ("Job Task No." <> '') and ("Account Type" = "account type"::"G/L Account"));
    end;


    procedure CreateTempJobJnlLine()
    var
        TmpJobJnlOverallCurrencyFactor: Decimal;
    begin
        TestField("Posting Date");
        Clear(JobJnlLine);
        JobJnlLine.DontCheckStdCost;
        JobJnlLine.Validate("Job No.", "Job No.");
        JobJnlLine.Validate("Job Task No.", "Job Task No.");
        if CurrFieldNo <> FieldNo("Posting Date") then
            JobJnlLine.Validate("Posting Date", "Posting Date")
        else
            JobJnlLine.Validate("Posting Date", xRec."Posting Date");
        JobJnlLine.Validate(Type, JobJnlLine.Type::"G/L Account");
        if "Job Currency Code" <> '' then begin
            if "Posting Date" = 0D then
                CurrencyDate := WorkDate
            else
                CurrencyDate := "Posting Date";

            if "Currency Code" = "Job Currency Code" then
                "Job Currency Factor" := "Currency Factor"
            else
                "Job Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Job Currency Code");
            JobJnlLine.SetCurrencyFactor("Job Currency Factor");
        end;
        JobJnlLine.Validate("No.", "Account No.");
        JobJnlLine.Validate(Quantity, "Job Quantity");

        if "Currency Factor" = 0 then begin
            if "Job Currency Factor" = 0 then
                TmpJobJnlOverallCurrencyFactor := 1
            else
                TmpJobJnlOverallCurrencyFactor := "Job Currency Factor";
        end else begin
            if "Job Currency Factor" = 0 then
                TmpJobJnlOverallCurrencyFactor := 1 / "Currency Factor"
            else
                TmpJobJnlOverallCurrencyFactor := "Job Currency Factor" / "Currency Factor"
        end;

        if "Job Quantity" <> 0 then
            JobJnlLine.Validate("Unit Cost", ((Amount - "VAT Amount") * TmpJobJnlOverallCurrencyFactor) / "Job Quantity");

        if (xRec."Account No." = "Account No.") and (xRec."Job Task No." = "Job Task No.") and ("Job Unit Price" <> 0) then begin
            if JobJnlLine."Cost Factor" = 0 then
                JobJnlLine."Unit Price" := xRec."Job Unit Price";
            JobJnlLine."Line Amount" := xRec."Job Line Amount";
            JobJnlLine."Line Discount %" := xRec."Job Line Discount %";
            JobJnlLine."Line Discount Amount" := xRec."Job Line Discount Amount";
            JobJnlLine.Validate("Unit Price");
        end;
    end;


    procedure UpdatePricesFromJobJnlLine()
    begin
        "Job Unit Price" := JobJnlLine."Unit Price";
        "Job Total Price" := JobJnlLine."Total Price";
        "Job Line Amount" := JobJnlLine."Line Amount";
        "Job Line Discount Amount" := JobJnlLine."Line Discount Amount";
        "Job Unit Cost" := JobJnlLine."Unit Cost";
        "Job Total Cost" := JobJnlLine."Total Cost";
        "Job Line Discount %" := JobJnlLine."Line Discount %";

        "Job Unit Price (LCY)" := JobJnlLine."Unit Price (LCY)";
        "Job Total Price (LCY)" := JobJnlLine."Total Price (LCY)";
        "Job Line Amount (LCY)" := JobJnlLine."Line Amount (LCY)";
        "Job Line Disc. Amount (LCY)" := JobJnlLine."Line Discount Amount (LCY)";
        "Job Unit Cost (LCY)" := JobJnlLine."Unit Cost (LCY)";
        "Job Total Cost (LCY)" := JobJnlLine."Total Cost (LCY)";
    end;

    local procedure CheckNoCardTransactEntryExist(GenJnlLine: Record "Gen. Journal Line Approval")
    var
        // DOPaymentTransLogEntry: Record "DO Payment Trans. Log Entry";
        // DOPaymentTransLogMgt: Codeunit "DO Payment Trans. Log Mgt.";
        DocumentType: Integer;
    begin
        // case GenJnlLine."Document Type" of
        //     GenJnlLine."document type"::Payment:
        //         DocumentType := DOPaymentTransLogEntry."document type"::Payment;
        //     GenJnlLine."document type"::Refund:
        //         DocumentType := DOPaymentTransLogEntry."document type"::Refund;
        // end;
        // if DOPaymentTransLogMgt.FindPostingNotFinishedEntry(DocumentType, GenJnlLine."Document No.", DOPaymentTransLogEntry) then
        //     Error(Text017, DOPaymentTransLogEntry."Transaction Type", GenJnlLine."Document Type", GenJnlLine."Document No.");
    end;


    procedure GetAppliesToDocDueDate(): Date
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        VendLedgEntry: Record "Vendor Ledger Entry";
    begin
        if "Bal. Account Type" in
           ["bal. account type"::Customer, "bal. account type"::Vendor]
        then begin
            AccNo := "Bal. Account No.";
            AccType := "Bal. Account Type";
            Clear(CustLedgEntry);
            Clear(VendLedgEntry);
        end else begin
            AccNo := "Account No.";
            AccType := "Account Type";
            Clear(CustLedgEntry);
            Clear(VendLedgEntry);
        end;

        case AccType of
            Acctype::Customer:
                begin
                    CustLedgEntry.SetCurrentkey("Customer No.", Open, Positive, "Due Date");
                    CustLedgEntry.SetRange("Customer No.", AccNo);
                    CustLedgEntry.SetRange(Open, true);
                    if "Applies-to Doc. No." <> '' then begin
                        CustLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                        CustLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                        if not CustLedgEntry.FindFirst then begin
                            CustLedgEntry.SetRange("Document Type");
                            CustLedgEntry.SetRange("Document No.");
                        end;
                    end else
                        if "Applies-to ID" <> '' then begin
                            CustLedgEntry.SetRange("Applies-to ID", "Applies-to ID");
                            if not CustLedgEntry.FindFirst then
                                CustLedgEntry.SetRange("Applies-to ID");
                        end;
                    exit(CustLedgEntry."Due Date");
                end;
            Acctype::Vendor:
                begin
                    VendLedgEntry.SetCurrentkey("Vendor No.", Open, Positive, "Due Date");
                    VendLedgEntry.SetRange("Vendor No.", AccNo);
                    VendLedgEntry.SetRange(Open, true);
                    if "Applies-to Doc. No." <> '' then begin
                        VendLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                        VendLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                        if not VendLedgEntry.FindFirst then begin
                            VendLedgEntry.SetRange("Document Type");
                            VendLedgEntry.SetRange("Document No.");
                        end;
                    end else
                        if "Applies-to ID" <> '' then begin
                            VendLedgEntry.SetRange("Applies-to ID", "Applies-to ID");
                            if not VendLedgEntry.FindFirst then
                                VendLedgEntry.SetRange("Applies-to ID");
                        end;
                    exit(VendLedgEntry."Due Date");
                end;
        end;
    end;

    local procedure GetCreditCard()
    var
        // DOPaymentTransLogEntry: Record "DO Payment Trans. Log Entry";
    begin
        if "Applies-to Doc. No." = xRec."Applies-to Doc. No." then
            exit;
        if not (("Account Type" = "account type"::Customer) and
                ("Bal. Account Type" = "bal. account type"::"Bank Account"))
        then
            exit;

        if "Applies-to Doc. No." = '' then
            exit;

        if "Document Type" <> "document type"::Refund then
            exit;

        // DOPaymentTransLogEntry.SetRange("Customer No.", "Account No.");
        // DOPaymentTransLogEntry.SetRange("Transaction Type", DOPaymentTransLogEntry."transaction type"::Capture);
        // DOPaymentTransLogEntry.SetRange("Document Type", DOPaymentTransLogEntry."document type"::Payment);
        // DOPaymentTransLogEntry.SetRange("Document No.", "Applies-to Doc. No.");

        // if DOPaymentTransLogEntry.FindFirst then
        //     "Credit Card No." := DOPaymentTransLogEntry."Credit Card No."
        // else
        //     "Credit Card No." := '';
    end;


    procedure SetHideValidation(NewHideValidationDialog: Boolean)
    begin
        HideValidationDialog := NewHideValidationDialog;
    end;

    local procedure GetDefaultICPartnerGLAccNo(): Code[20]
    var
        GLAcc: Record "G/L Account";
        GLAccNo: Code[20];
    begin
        if "IC Partner Code" <> '' then begin
            if "Account Type" = "account type"::"G/L Account" then
                GLAccNo := "Account No."
            else
                GLAccNo := "Bal. Account No.";
            if GLAcc.Get(GLAccNo) then
                exit(GLAcc."Default IC Partner G/L Acc. No")
        end;
    end;


    procedure IsApplied(): Boolean
    begin
        if "Applies-to Doc. No." <> '' then
            exit(true);
        if "Applies-to ID" <> '' then
            exit(true);
        exit(false);
    end;


    procedure DataCaption(): Text[250]
    var
        GenJnlBatch: Record "Gen. Journal Batch";
    begin
        if GenJnlBatch.Get("Journal Template Name", "Journal Batch Name") then
            exit(GenJnlBatch.Name + '-' + GenJnlBatch.Description);
    end;

    local procedure ReadGLSetup()
    begin
        if not GLSetupRead then begin
            GLSetup.Get;
            GLSetupRead := true;
        end;
    end;
}

