 
    table 50024 "Prepayment Lines"
{
    DrillDownPageID = "Imprest Lines";
    LookupPageID = "Imprest Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = "Prepayment Header";
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
            if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            begin

                if Employee.Get("Account No.") then begin
                    "Account Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
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
        field(11; "Employee Contribution"; Decimal)
        {
        }
        field(12; "Employer Contribution"; Decimal)
        {

            trigger OnValidate()
            begin
                Amount := "Employee Contribution" + "Employer Contribution";
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
        Text000: label 'Please insert the imprest date';
        Text001: label 'You have Exceeded Budget for G/L Account No %1 By %2 Budget Available %3 CommittedAmount %4';
        Text002: label 'You cannot delete this document! Document number No. %1 Is already approved or pending approval.';
        Employee: Record Employee;
}

