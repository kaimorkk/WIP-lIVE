 
table 50022 "Petty Cash Entries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset",Employee;
        }
        field(4; "Account No"; Code[20])
        {
            NotBlank = true;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor;

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
                            Vendor.Get("Account No");
                            "Account Name" := Vendor.Name;
                        end;
                    "account type"::Customer:
                        begin
                            Customer.Get("Account No");
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
                            Employee.Get(No);
                            "Account Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;
                end;
                Validate(Amount);
            end;
        }
        field(5; "Account Name"; Text[70])
        {
        }
        field(6; Description; Text[200])
        {
            Editable = false;
        }
        field(7; Amount; Decimal)
        {
            Editable = false;

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
                PettyCashHeader: Record Payments;
                TotalCommittedAmount: Decimal;
            begin
            end;
        }
        field(8; "Payment Document No."; Code[30])
        {
            Editable = false;
            TableRelation = Payments;
        }
        field(9; "Posted Date"; Date)
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
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        ReceiptRec: Record "Receipts Header1";
        Employee: Record Employee;
        RemainingAmount: Decimal;
        CashReceipt: Decimal;
}

