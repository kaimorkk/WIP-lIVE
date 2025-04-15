 
   table 52194035 "Receipt Lines1"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Receipt No."; Code[30])
        {
            trigger OnValidate()
            begin
                GetRecieptHeader;
                InitHeaderDefaults(ReceiptHeader);
            end;
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4; "Account No."; Code[30])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            var
                ReceiptsHeader: Record "Receipts Header1";
            begin
                GetRecieptHeader;
                InitHeaderDefaults(ReceiptHeader);
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
                                //get header
                                ReceiptHeader.Reset;
                                ReceiptHeader.SetRange("No.", "Receipt No.");
                                if ReceiptHeader.FindFirst then begin
                                    if receiptHeader."Received From" = '' then
                                        ReceiptHeader."Received From" := Cust.Name;
                                    if receiptHeader."On Behalf Of" = '' then
                                        ReceiptHeader."On Behalf Of" := Cust.Name;
                                    ReceiptHeader.Modify(true);
                                end
                            end
                        end;
                    "account type"::Vendor:
                        begin
                            if Vendor.Get("Account No.") then
                                "Account Name" := Vendor.Name;
                        end;
                    "account type"::Employee:
                        begin
                            if Emp.Get("Account No.") then
                                "Account Name" := Emp.FullName;
                            //get header
                            ReceiptHeader.Reset;
                            ReceiptHeader.SetRange("No.", "Receipt No.");
                            if ReceiptHeader.FindFirst then begin
                                ReceiptHeader."Received From" := Emp.FullName;
                                ReceiptHeader."On Behalf Of" := Emp.FullName;
                                ReceiptHeader.Modify(true);
                            end

                        end;
                end;
            end;
        }
        field(5; "Account Name"; Text[100])
        {
        }
        field(6; Description; Text[400])
        {
        }
        field(7; "VAT Code"; Code[30])
        {
            TableRelation = "VAT Product Posting Group";
        }
        field(8; "W/Tax Code"; Code[30])
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

            trigger OnValidate()
            begin
                //"Net Amount":=Amount;
                ValidateAmount(false);
            end;
        }
        field(12; "Net Amount"; Decimal)
        {
        }


        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(15; "Currency Code"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;

            trigger OnValidate()
            begin

                //TestImprestSurrenderLock;
                ReceiptHeader.Get("Receipt No.");
                if "Currency Code" <> '' then begin
                    //GetCurrency;
                    if ("Currency Code" <> xRec."Currency Code") or
                       (ReceiptHeader.Date <> ReceiptHeader.Date) or
                       (CurrFieldNo = FieldNo("Currency Code")) or
                       ("Currency Factor" = 0)
                    then
                        "Currency Factor" :=
                          CurrExchRate.ExchangeRate(ReceiptHeader.Date, "Currency Code");
                end else
                    "Currency Factor" := 0;
                Validate("Currency Factor");
                //}
            end;
        }
        field(16; "Currency Factor"; Decimal)
        {
        }
        field(20; "Amount (LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Net Amount":=Amount
            end;
        }
        field(25; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
        }
        field(94; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(95; "Applies to ID"; Code[20])
        {
        }
        field(482; "Applies to Doc. No"; Code[20])
        {

            trigger OnLookup()
            begin
                TestField(Description);
                "Applies to Doc. No" := '';
                Amt := 0;
                // VATAmount:=0;
                //"W/TAmount":=0;

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No.");
                            CustLedger.SetRange(Open, true);
                            CustLedger.CalcFields(CustLedger.Amount);//25
                            if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                if CustLedger."Applies-to ID" <> '' then begin
                                    CustLedger1.Reset;
                                    CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                    CustLedger1.SetRange(CustLedger1."Customer No.", "Account No.");
                                    CustLedger1.SetRange(Open, true);
                                    CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                    if CustLedger1.Find('-') then begin
                                        repeat
                                            CustLedger1.CalcFields(CustLedger1.Amount);
                                            Amt := Amt + Abs(CustLedger1.Amount);
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amt <> Amt then
                                        //ERROR('Amount is not equal to the amount applied on the application PAGE');
                                        if "Gross Amount" = 0 then
                                            "Gross Amount" := Amt;
                                    Validate("Gross Amount");
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    //Insert VAT where applicable
                                    VATEntry.Reset;
                                    VATEntry.SetRange("Transaction No.", VendLedger."Transaction No.");
                                    if VATEntry.Find('-') then
                                        "VAT Code" := VATEntry."VAT Prod. Posting Group";
                                    //

                                end else begin
                                    if "Gross Amount" <> Abs(CustLedger.Amount) then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if "Gross Amount" = 0 then
                                        "Gross Amount" := Abs(CustLedger."Remaining Amount");
                                    Validate("Gross Amount");
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    //"External Document No.":=CustLedger."External Document No.";
                                    //Insert VAT where applicable
                                    VATEntry.Reset;
                                    VATEntry.SetRange("Transaction No.", VendLedger."Transaction No.");
                                    if VATEntry.Find('-') then
                                        "VAT Code" := VATEntry."VAT Prod. Posting Group";
                                    //

                                end;
                            end;
                            Validate("Gross Amount");
                        end;
                end;

                //employees
                case "Account Type" of
                    "account type"::Employee:
                        begin
                            Employee1.Reset;
                            Employee1.SetCurrentkey("Employee No.", Open, "Document No.");
                            Employee1.SetRange("Employee No.", "Account No.");
                            Employee1.SetRange(Open, true);
                            Employee1.CalcFields(Employee1.Amount);
                            if Page.RunModal(5237, Employee1) = Action::LookupOK then begin

                                if Employee1."Employee No." <> '' then begin
                                    //MESSAGE('in2');
                                    EmployeeDet.Reset;
                                    EmployeeDet.SetCurrentkey("Employee No.", "Applies-to ID", Open, Positive);
                                    EmployeeDet.SetRange("Employee No.", "Account No.");
                                    EmployeeDet.SetRange(Open, true);
                                    EmployeeDet.SetRange("Document No.", Employee1."Document No.");
                                    if EmployeeDet.FindSet then begin
                                        //REPEAT
                                        EmployeeDet.CalcFields(EmployeeDet."Remaining Amount");
                                        "Gross Amount" := Abs(EmployeeDet."Remaining Amount");
                                        Amount := Abs(EmployeeDet."Remaining Amount");
                                        Validate(Amount);
                                        "Applies to Doc. No" := EmployeeDet."Document No.";
                                        "Posting Group" := EmployeeDet."Employee Posting Group";
                                    end;
                                end else begin

                                end;
                            end;
                        end;
                end;
            end;

            trigger OnValidate()
            begin
                CustLedger1.Reset;
                CustLedger1.SetRange("Customer No.", "Account No.");
                CustLedger1.SetRange(Open, true);
                CustLedger1.SetRange("Document No.", "Applies to Doc. No");
                if CustLedger1.Find('-') then begin
                    repeat
                        CustLedger1.CalcFields(CustLedger1.Amount);
                        Amt := Amt + Abs(CustLedger1.Amount);
                    until CustLedger1.Next = 0;
                end;
                Amount := Amt;
                "Amount (LCY)" := Amt;
            end;
        }
        field(483; "Gross Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                TestField(Description);
                VATAmount := 0;
                "W/Tax Amount" := 0;

                "VAT Amount" := 0;
                "W/Tax Amount" := 0;

                case "Account Type" of

                    "account type"::Customer:
                        begin
                            if "VAT Code" <> '' then begin
                                if Customer.Get("Account No.") then
                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "VAT Code") then begin
                                        VATAmount := ROUND(("Gross Amount" / (1 + VATSetup."VAT %" / 100) * VATSetup."VAT %" / 100), CSetup."Rounding Precision", Direction);
                                        if VATSetup."VAT %" <> 0 then begin
                                            NetAmount := "Gross Amount" - VATAmount;
                                            "VAT Amount" := VATAmount;
                                            if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                Amount := "Gross Amount" - VATAmount
                                            else
                                                Amount := "Gross Amount";
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No.") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        if CSetup."Post VAT" then//Check IF VAT is to be posted
                                                            Amount := NetAmount
                                                        else
                                                            Amount := "Gross Amount" - "W/TAmount";
                                                    end;
                                            end;
                                        end else begin
                                            Amount := "Gross Amount";
                                            NetAmount := Amount;
                                            if "W/Tax Code" <> '' then begin
                                                if Customer.Get("Account No.") then
                                                    if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                                        "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                                        "W/Tax Amount" := "W/TAmount";
                                                        NetAmount := NetAmount - "W/TAmount";
                                                        Amount := "Gross Amount" - "W/TAmount";
                                                    end;
                                            end;
                                        end;
                                    end;
                            end
                            else begin
                                Amount := "Gross Amount";
                                NetAmount := Amount;
                                if "W/Tax Code" <> '' then begin
                                    if Customer.Get("Account No.") then
                                        if VATSetup.Get(Customer."VAT Bus. Posting Group", "W/Tax Code") then begin
                                            "W/TAmount" := ROUND(NetAmount * VATSetup."VAT %" / 100, CSetup."Rounding Precision", Direction);
                                            "W/Tax Amount" := "W/TAmount";
                                            NetAmount := NetAmount - "W/TAmount";
                                            Amount := "Gross Amount" - "W/TAmount";
                                        end;
                                end;
                            end;
                        end;
                end;

                Validate(Amount);

                //ADD THE DIMENSIONS FROM THE POSTED INVOICES 29/11/2016
                PostedInvLines.Reset;
                PostedInvLines.SetRange(PostedInvLines."Document No.", "Applies to Doc. No");

                if PostedInvLines.Find('-') then begin
                    "Dimension Set ID" := PostedInvLines."Dimension Set ID";

                    ReceiptHeader.Reset;
                    ReceiptHeader.SetRange(ReceiptHeader."No.", "Receipt No.");
                    if ReceiptHeader.Find('-') then begin
                        ReceiptHeader."Dimension Set ID" := "Dimension Set ID";
                        ReceiptHeader."Received From" := "Account Name";
                        ReceiptHeader."On Behalf Of" := "Account Name";
                        ReceiptHeader.Modify;
                    end;
                end;


            end;
        }

        field(484; "Surrender Gl Account"; Code[20])
        {

        }
        field(69000; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(69001; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(69022; "Posting Group"; Code[20])
        {
            Caption = 'Posting Group';
            TableRelation = if ("Account Type" = const(Customer)) "Customer Posting Group"
            else
            if ("Account Type" = const(Vendor)) "Vendor Posting Group"
            else
            if ("Account Type" = const("Fixed Asset")) "FA Posting Group"
            else
            if ("Account Type" = const(Employee)) "Employee Posting Group";
        }
        field(85000; "Transaction Type"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Miscellaneous Transaction Type";

            trigger OnValidate()
            var
                TransactionType: Record "Miscellaneous Transaction Type";
                TXT001: label 'Receipt for';
            begin
                TransactionType.Reset;
                TransactionType.SetRange(Code, "Transaction Type");
                if TransactionType.FindFirst then begin
                    Description := TXT001 + ' ' + TransactionType.Description;
                end
            end;
        }
        field(85001; "Registration No."; Code[30])
        {
            TableRelation = "Examination Account";
            

            trigger OnValidate()
            var
                Examaccount: Record "Examination Account";
            begin
                Examaccount.Reset;
                Examaccount.SetRange("Registration No.", "Registration No.");
                if Examaccount.FindFirst then begin
                    "Account No." := Examaccount."Student Cust No.";
                    Validate("Account No.");
                end
            end;
        }
        field(85009; "Receipt Type"; Code[20])
        {
            Caption = 'Receipt Type';
            DataClassification = CustomerContent;
            ValidateTableRelation = false;
            TableRelation = "Receipts and Payment Types1" where(Type = filter(Receipt));
        }

        field(85010; "Header Receipt Type"; Enum "Receipt Type")
        {
            Caption = 'Header Receipt Type';
            DataClassification = CustomerContent;
        }
        field(86000; Remarks; Text[500])
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(Key1; "Receipt No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Receipt No.", Amount, Description)
        {
        }
    }

    trigger OnInsert()
    var
        ReceiptHeader: Record "Receipts Header1";
    begin
        if ReceiptHeader.Get("Receipt No.") then begin
            if "Global Dimension 1 Code" = '' then
                Validate("Global Dimension 1 Code", ReceiptHeader."Shortcut Dimension 1 Code");
            if "Global Dimension 2 Code" = '' then
                Validate("Global Dimension 2 Code", ReceiptHeader."Shortcut Dimension 2 Code");
            if "Dimension Set ID" <> ReceiptHeader."Dimension Set ID" then
                "Dimension Set ID" := ReceiptHeader."Dimension Set ID";
        end;
    end;

    var
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
        Amt: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        VATSetup: Record "VAT Posting Setup";
        NetAmount: Decimal;
        VATEntry: Record "VAT Entry";
        CSetup: Record "Cash Management Setup";
        Direction: Text[30];
        Customer: Record Customer;
        ApplyCustEntries: Page "Apply Customer Entries";
        PostedInvLines: Record "Sales Invoice Line";
        ReceiptHeader: Record "Receipts Header1";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Employee: Record Employee;
        Employee1: Record "Employee Ledger Entry";
        EmployeeDet: Record "Employee Ledger Entry";
        Emp: Record Employee;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
        //VerifyItemLineDim;
    end;

    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array[8] of Code[20])
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID", ShortcutDimCode);
    end;

    local procedure ValidateAmount(ShouldCheckPaymentTolerance: Boolean)
    var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get;
        "Amount (LCY)" := ROUND(
              CurrExchRate.ExchangeAmtFCYToLCY(
                Today, "Currency Code",
                Amount, "Currency Factor"),
              GLSetup."Unit-Amount Rounding Precision");
    end;

    local procedure GetCurrency()
    begin
    end;

    local procedure GetRecieptHeader()
    begin
        if ReceiptHeader.Get("Receipt No.") then begin
            if ReceiptHeader."Currency Code" = '' then
                Currency.InitRoundingPrecision
            else begin
                ReceiptHeader.TestField("Currency Factor");
                Currency.Get(ReceiptHeader."Currency Code");
                Currency.TestField("Amount Rounding Precision");
            end;
        end;

        OnAfterGetReceiptHeader(Rec, ReceiptHeader);
    end;

    local procedure InitHeaderDefaults(Receipt: Record "Receipts Header1")
    begin
        "Currency Code" := Receipt."Currency Code";
        "Currency Factor" := Receipt."Currency Factor";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetReceiptHeader(var ReceiptLine: Record "Receipt Lines1"; var ReceiptHeader: Record "Receipts Header1")
    begin
    end;
}

