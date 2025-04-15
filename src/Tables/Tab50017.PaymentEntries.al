 
table 50017 "Payment Entries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = Payments;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Date; Date)
        {
        }
        field(4; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee,Resource';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee,Resource;
        }
        field(5; "Account No"; Code[20])
        {
            Editable = true;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const(Employee)) Employee
            else
            if ("Account Type" = filter(Resource)) Resource;

            trigger OnValidate()
            begin

                case "Account Type" of
                    "account type"::"G/L Account":
                        begin
                            GLAccount.Get("Account No");
                            GLAccount.TestField("Direct Posting", true);
                            "Account Name" := GLAccount.Name;
                        end;
                    "account type"::Vendor:
                        begin
                            if Vendor.Get("Account No") then;
                            "Account Name" := Vendor.Name;
                        end;
                    "account type"::Customer:
                        begin
                            if Customer.Get("Account No") then;
                            "Account Name" := Customer.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            Bank.Get("Account No");
                            "Account Name" := Bank.Name;
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            FixedAsset.Get("Account No");
                            "Account Name" := FixedAsset.Description;
                        end;
                    "account type"::Employee:
                        begin
                            Employee.Get("Account No");
                            "Account Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;
                    "account type"::Resource:
                        begin
                            Resource.Get("Account No");
                            "Account Name" := Resource.Name;
                        end;
                end;
                Validate("W/Tax Amount");
            end;
        }
        field(6; "Account Name"; Text[100])
        {
        }
        field(7; Amount; Decimal)
        {
            Editable = true;

            trigger OnValidate()
            var
                GLAccount: Record "G/L Account";
                GenLedSetup: Record "General Ledger Setup";
                BudgetAmount: Decimal;
                Expenses: Decimal;
                BudgetAvailable: Decimal;
                Committments: Record "Committment Entries";
                CommittedAmount: Decimal;
                CommitmentEntries: Record "Committment Entries";
                PVHeader: Record Payments;
                TotalCommittedAmount: Decimal;
            begin
            end;
        }
        field(8; "W/Tax Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" + "Other Costs";
            end;
        }
        field(9; "Net Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Net Amount" := Amount - "W/Tax Amount" + "Other Costs";
            end;
        }
        field(10; "Bank Name"; Text[100])
        {
        }
        field(11; "Branch Name"; Text[100])
        {
        }
        field(12; "Bank Branch No."; Text[20])
        {
            NotBlank = false;
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";
        }
        field(13; "Bank Account No."; Text[50])
        {
        }
        field(14; "Bank Code"; Code[30])
        {
            TableRelation = "Employee Bank AccountX";
        }
        field(15; PIN; Text[30])
        {
        }
        field(16; "BNK Account"; Code[50])
        {
        }
        field(17; "Mpesa Mobile No"; Code[12])
        {
        }
        field(18; "Other Costs"; Decimal)
        {
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
        CSetups: Record "Cash Management Setup";
        Direction: Text[30];
        WTVATAmount: Decimal;
        VATSetup2: Record "VAT Posting Setup";
        VATEntry: Record "VAT Entry";
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
        RecPayTypes: Record "Receipts and Payment Types1";
        PHead: Record Payments;
        TransType: Record "Receipts and Payment Types1";
        sclaims: Record Payments;
        CashMgt: Record "Cash Management Setup";
        Text001: label 'Amount Paid For document No. %1 Cannot be more than The Net Amount. Kindly Check.';
        Text002: label 'Remaining Amount in document No. %1 Cannot be less than 0. Please verify that you have correctly specified the Amount paid.';
        PVHeader: Record Payments;
        pInvoice: Record "Purch. Inv. Line";
        bcommitments: Record "Commitment Entries";
        Item: Record Item;
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
        tExpense: Record "Receipts and Payment Types1";
        fAsset: Record "Fixed Asset";
        Employee: Record Employee;
        Resource: Record Resource;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
    end;


    procedure GetCurrency()
    begin
    end;


    procedure ShowDimensions()
    begin
        /*
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2 %3',"Payment Type","No.","Line No."));
        //VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */

    end;


    procedure CalculateTax()
    var
        CalculationType: Option VAT,"W/Tax",Retention;
        TotalTax: Decimal;
        TaxCalc: Codeunit "Tax Calculation";
    begin

    end;
}

