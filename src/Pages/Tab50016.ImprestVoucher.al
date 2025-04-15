 
table 50016 "Imprest Voucher Lines"
{
    DrillDownPageID = "Imprest Lines";
    LookupPageID = "Imprest Lines";
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
        field(3; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = filter(Employee)) Employee;

            trigger OnValidate()
            begin

                case "Account Type" of
                    "account type"::Vendor:
                        begin
                            Vendor.Get("Account No.");
                            "Account Name" := Vendor.Name;
                        end;
                    "account type"::Customer:
                        begin
                            Customer.Get("Account No.");
                            "Account Name" := Customer.Name;
                        end;
                    "account type"::"Bank Account":
                        begin
                            Bank.Get("Account No.");
                            "Account Name" := Bank.Name;
                        end;
                    "account type"::"Fixed Asset":
                        begin
                            FixedAsset.Get("Account No.");
                            "Account Name" := FixedAsset.Description;
                        end;
                    "account type"::Employee:
                        begin
                            Employee.Get("Account No.");
                            "Account Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;
                end;
                Validate(Amount);
            end;
        }
        field(5; "Account Name"; Text[100])
        {
        }
        field(6; Description; Text[200])
        {
        }
        field(7; Amount; Decimal)
        {
            FieldClass = Normal;

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
                ImprestHeader: Record Payments;
                TotalCommittedAmount: Decimal;
            begin
                Amount := "Imprest Subsistence" + "Imprest Other Costs" + "Imprest Transport";

                PVHeader.Reset;
                PVHeader.SetRange(PVHeader."No.", No);
                if PVHeader.FindSet then begin
                    DateValue := PVHeader.Date;
                    if PVHeader."Currency Code" <> '' then begin
                        PVHeader.TestField("Currency Factor");
                        CashMgt.Get;
                        "Amount LCY" :=
                           ROUND(
                             CurrExchRate.ExchangeAmtFCYToLCY(
                               DateValue, PVHeader."Currency Code",
                               Amount, PVHeader."Currency Factor"),
                             CashMgt."Rounding Precision");
                    end else
                        "Amount LCY" := Amount;
                end;
            end;
        }
        field(8; "Applies- to Doc. No."; Code[20])
        {
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(11; "Actual Spent"; Decimal)
        {
        }
        field(12; "Remaining Amount"; Decimal)
        {
        }
        field(13; Committed; Boolean)
        {
        }
        field(14; "Advance Type"; Code[20])
        {
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));
        }
        field(15; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(16; "Currency Factor"; Decimal)
        {
        }
        field(17; "Amount LCY"; Decimal)
        {
        }
        field(18; "Expense Type"; Option)
        {
            OptionCaption = 'Accountable Expenses,Non-Accountable Expenses';
            OptionMembers = "Accountable Expenses","Non-Accountable Expenses";
        }
        field(19; "Work Type"; Code[20])
        {
            TableRelation = "Work Type";
        }
        field(20; "Resource No."; Code[20])
        {
            TableRelation = Resource;
        }
        field(21; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));
        }
        field(22; Project; Code[20])
        {
            CalcFormula = lookup(Payments.Project where("No." = field(No)));
            FieldClass = FlowField;
        }
        field(23; "Due Date"; Date)
        {
        }
        field(24; "Imprest Holder"; Code[20])
        {
            Editable = false;
            TableRelation = Customer."No.";
        }
        field(42; "Job No."; Code[20])
        {
            CalcFormula = lookup(Payments.Project where("Imprest Issue Doc. No" = field(No)));
            FieldClass = FlowField;
        }
        field(54; Purpose; Text[250])
        {
            NotBlank = true;
        }
        field(79; "Budgetary Control A/C"; Boolean)
        {
        }
        field(88; Destination; Code[20])
        {
            TableRelation = "Work Type";
        }
        field(89; "Daily Rate"; Decimal)
        {
        }
        field(90; "No. of Days"; Integer)
        {
        }
        field(91; Subsistence; Boolean)
        {
        }
        field(92; "Cash Receipt Amount"; Decimal)
        {
        }
        field(93; "Receipt No."; Code[20])
        {
            TableRelation = "Receipts Header1" where("Fully Allocated Imprest" = const(false),
                                                      Posted = const(true),
                                                      "Fully Allocated" = const(false));
        }
        field(94; "Fully Allocated"; Boolean)
        {
        }
        field(1001; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Project));
        }
        field(1004; "Job Quantity"; Decimal)
        {
            AccessByPermission = TableData Job = R;
            Caption = 'Job Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(50000; Status; Option)
        {
            CalcFormula = lookup(Payments.Status where("No." = field(No)));
            Editable = true;
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,Closed;
        }
        field(50001; "Job Task Description"; Text[250])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(50002; "Payment Type"; Option)
        {
            CalcFormula = lookup(Payments."Payment Type" where("No." = field(No)));
            FieldClass = FlowField;
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender";
        }
        field(50003; "Imprest Subsistence"; Decimal)
        {
        }
        field(50004; "Imprest Transport"; Decimal)
        {
        }
        field(50005; "Imprest Other Costs"; Decimal)
        {
        }
        field(50006; "Imprest Memo No."; Code[30])
        {
            TableRelation = "Imprest Memo";
        }
        field(50007; "Mobile Phone No."; Text[15])
        {
            CalcFormula = lookup(Employee."Mobile Phone No." where("No." = field("Account No.")));
            Caption = 'Mobile Phone No.';
            Editable = false;
            ExtendedDatatype = PhoneNo;
            FieldClass = FlowField;
        }
        field(50008; Reverse; Boolean)
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
        Amt: Decimal;
        ImprestHeader: Record Payments;
        TransType: Record "Receipts and Payment Types1";
        CashMgt: Record "Cash Management Setup";
        Text000: label 'Please insert the imprest date';
        Text001: label 'You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4';
        ReceiptRec: Record "Receipts Header1";
        Text002: label 'You cannot delete this document! Document number No. %1 Is already approved or pending approval.';
        PVHeader: Record Payments;
        Employee: Record Employee;
        CurrExchRate: Record "Currency Exchange Rate";
        DateValue: Date;
        PurchSetup: Record "Cash Management Setup";


    procedure UpdateEntries(ImpLines: Record "Imprest Lines")
    var
        ProjectMembers: Record "Project Members";
        LineNo: Integer;
        ProjectMembers2: Record "Project Members";
        Casuals: Record Casuals;
        OtherCosts: Record "Other Costs";
        PaymentRec: Record Payments;
    begin
    end;

    procedure AssistEdit(OldVend: Record "Imprest Voucher Lines"): Boolean
    var
        Vend: Record "Imprest Voucher Lines";
    begin
        with Vend do begin
            Vend := Rec;
            /*PurchSetup.GET;
            PurchSetup.TESTFIELD("Vendor Nos.");
            IF NoSeriesMgt.SelectSeries(PurchSetup."Vendor Nos.",OldVend."No. Series","No. Series") THEN BEGIN
              PurchSetup.GET;
              PurchSetup.TESTFIELD("Vendor Nos.");
              NoSeriesMgt.SetSeries("No.");*/
            Rec := Vend;
            exit(true);
            // END;
        end;

    end;
}

