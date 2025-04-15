 
table 50023 "Prepayment Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            NotBlank = false;
        }
        field(2; Date; Date)
        {
        }
        field(3; Type; Code[20])
        {
        }
        field(4; "Pay Mode"; Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(5; "Cheque No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                IF "Cheque No"<>'' THEN BEGIN
                PV.RESET;
                PV.SETRANGE(PV."Cheque No","Cheque No");
                IF PV.FIND('-') THEN BEGIN
                IF PV."No." <> "No." THEN
                   ERROR(Text002);
                END;
                END;
                */

            end;
        }
        field(6; "Posting Date"; Date)
        {
        }
        field(7; "Bank Code"; Code[20])
        {
        }
        field(8; "Payment Narration"; Text[150])
        {
        }
        field(9; "On behalf of"; Text[150])
        {
        }
        field(10; "Created By"; Code[50])
        {
            Editable = true;
        }
        field(11; Posted; Boolean)
        {
            Editable = true;
        }
        field(12; "Posted By"; Code[50])
        {
            Editable = true;
        }
        field(13; "Posted Date"; Date)
        {
            Editable = true;
        }
        field(14; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(15; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(16; "Time Posted"; Time)
        {
        }
        field(17; "Total Amount"; Decimal)
        {
            CalcFormula = sum("Prepayment Lines".Amount where(No = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(18; "Paying Bank Account"; Code[20])
        {
            TableRelation = if ("Payment Type" = const("Payment Voucher")) "Bank Account" where(Type = const(Bank))
            else
            if ("Payment Type" = const(Imprest)) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Petty Cash")) "Bank Account" where(Type = filter("Petty Cash"))
            else
            if ("Payment Type" = const("Bank Transfer")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Standing Imprest")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Salary Advance")) "Bank Account" where(Type = filter(Bank | "Petty Cash"))
            else
            if ("Payment Type" = const("Standing Imprest Surrender")) "Bank Account" where(Type = filter(Bank | "Petty Cash"));
        }
        field(19; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(20; "Payment Type"; Option)
        {
            OptionCaption = 'Payment Voucher,Imprest,Staff Claim,Imprest Surrender,Petty Cash,Bank Transfer,Petty Cash Surrender,Surrender,Standing Imprest,Salary Advance,Payment Voucher Reversal,Imprest Reversal,Staff Claim Reversal,Imprest Surrender Reversal,Petty Cash Reversal,Bank Transfer Reversal,Petty Cash Surrender Reversal,Surrender Reversal,Standing Imprest Reversal,Salary Advance Reversal,Standing Imprest Surrender';
            OptionMembers = "Payment Voucher",Imprest,"Staff Claim","Imprest Surrender","Petty Cash","Bank Transfer","Petty Cash Surrender",Surrender,"Standing Imprest","Salary Advance","Payment Voucher Reversal","Imprest Reversal","Staff Claim Reversal","Imprest Surrender Reversal","Petty Cash Reversal","Bank Transfer Reversal","Petty Cash Surrender Reversal","Surrender Reversal","Standing Imprest Reversal","Salary Advance Reversal","Standing Imprest Surrender";
        }
        field(21; Currency; Code[20])
        {
            TableRelation = Currency.Code;
        }
        field(22; "No. Series"; Code[20])
        {
        }
        field(23; "Account Type"; Option)
        {
            Editable = true;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(24; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const(Customer)) Customer."No." where("Customer Type" = filter(" "))
            else
            if ("Account Type" = const("Bank Account")) "Bank Account Ledger Entry"
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            begin

                case "Account Type" of
                    "account type"::Customer:
                        begin
                            if Customer.Get("Account No.") then begin
                                "Account Name" := Customer.Name;
                                "Payment Narration" := Customer.Name;
                            end;
                        end;


                end;
            end;
        }
        field(25; "Account Name"; Text[70])
        {
        }
        field(26; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(27; "Start Date"; Date)
        {
        }
        field(28; "End Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ERROR(Text008);
    end;

    trigger OnInsert()
    begin

        CashMgt.Get();
        CashMgt.TestField("Prepayment Nos.");
        if "No." = '' then
            NoSeriesMgt.InitSeries(CashMgt."Prepayment Nos.", xRec."No. Series", 0D, "No.", "No. Series");


        "Created By" := UserId;
        Date := Today;
    end;

    trigger OnRename()
    begin
        if (Status <> Status::Open) then
            Error(Text010);
    end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLAccount: Record "G/L Account";
        Customer: Record Customer;
        Vendor: Record Vendor;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        Amt: Integer;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        UserSetup: Record "User Setup";
        PV: Record Payments;
        CashMgt: Record "Cash Management Setup";
        Text000: label 'Cash management setup does''nt exist';
        Text001: label 'Create an Imprest A/C for Employee No. %1 under the Employee Card \Please contact system Administrator';
        Text002: label 'Cheque No. already exists';
        Text003: label 'There''s no open entry for attaching from an imprest memo for Employee %1';
        Text004: label 'There''s no Approved Imprest Memo under project %1';
        JobRec: Record Job;
        DimMgt: Codeunit DimensionManagement;
        PurchLines: Record "Prepayment Lines";
        PurchLine: Record "Prepayment Lines";
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        ImpHeader: Record Payments;
        ImpLines: Record "Imprest Lines";
        ImpSurrLines: Record "Imprest Lines";
        Text005: label 'Another Project Imprest Requistion No %1 you created is still Open, Please check or reuse it!';
        Text006: label 'Your Imprest account %1 has an Outstanding Balance of %2, Please check or followup on the related surrender!';
        ImpMemo: Record "Imprest Memo";
        Text007: label 'There''s no Surrendered Imprest Memo under project %1';
        cshma: Record "Cash Management Setup";
        Text008: label 'You cannot delete a record once created. Kindly modify the record and reuse it.';
        Text009: label 'You can not edit a posted document. This will create conflicting entries.';
        Text010: label 'You cannot Rename  a document that is pending approval or fully approved.';
        Text011: label 'You are not allowed to raise an Imprest. Contact accounts and finance team';
        Text0005: label 'Project Imprest Surrender No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Text0004: label 'Payment Voucher No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Text0003: label 'Petty Cash  Voucher No. %1 You Created Is still Open. Reuse it to avoid much open documents';
        Amnt: Decimal;
        VATEntry: Record "VAT Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Emp: Record Employee;
        Commitment: Codeunit "Procurement Processing";
        TaskRec: Record "Job Task";
        Employee: Record Employee;
        EmployeeBank: Record "Employee Bank AccountX";
        UsersRec: Record "User Setup";
        AccountingPeriod: Record "Accounting Period";
}

