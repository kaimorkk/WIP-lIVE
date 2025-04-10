table 52193428 "Non-Payroll Payments"
{
    Caption = 'Non-Payroll Payments';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(2; "Transaction Code"; Code[20])
        {
            Caption = 'Transaction Code';
            TableRelation = "PR Transaction Codes"."Transaction Code";
            trigger OnValidate()
            begin
                if TransC.Get("Transaction Code") then begin
                    "Transaction Name" := TransC."Transaction Name";
                    if TransC.Vendor <> '' then
                        "Account Type" := "Account Type"::Vendor else
                        "Account Type" := "Account Type"::"GL Account";

                end

            end;
        }
        field(3; "GL Account"; Code[20])
        {
            Caption = 'Account';
            TableRelation = if ("Account Type" = const("GL Account")) "G/L Account"."No."
            else
            if ("Account Type" = const(Vendor)) Vendor."No.";
        }
        field(4; "Payroll Period"; Code[20])
        {
            Caption = 'Payroll Period';
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(5; "Salary Voucher"; Code[20])
        {
            Caption = 'Salary Voucher';
            TableRelation = "Payroll Header";
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; Description; Text[1000])
        {
            Caption = 'Description';
        }
        field(8; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }
        field(9; "Date Created"; DateTime)
        {
            Caption = 'Date Created';
        }
        field(10; "Transaction Name"; Text[2000])
        {
            Caption = 'Transaction Name';
            // TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(11; "Account Type"; Option)
        {
            OptionMembers = ,"GL Account",Vendor;
        }
    }
    keys
    {
        key(PK; "Entry No", "Transaction Code", "GL Account", "Payroll Period", "Salary Voucher")
        {
            Clustered = true;
        }
    }
    var
        TransC: Record "PR Transaction Codes";
}
