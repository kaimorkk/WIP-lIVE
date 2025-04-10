table 96014 "E-Citizen Payment Entries"
{
    Caption = 'E-Citizen Payment Entries';
    DataClassification = ToBeClassified;
    DrillDownPageId = "E-Citizen Payment Entries";
    LookupPageId = "E-Citizen Payment Entries";
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Transaction Code"; Code[50])
        {
            Caption = 'Transaction Code';

            trigger OnValidate()
            var
                Err001: Label 'An entry with the Transaction Code: %1 already exists.';
            begin
                Payments.Reset();
                Payments.SetRange("Transaction Code", Rec."Transaction Code");
                if Payments.FindSet() then
                    Error(Err001, Payments."Transaction Code");
            end;
        }
        field(3; "Transaction Date"; DateTime)
        {
            Caption = 'Transaction Date';
        }
        field(4; "Account Name"; Text[400])
        {
            Caption = 'Account Name';
        }
        field(5; "Account No."; Text[30])
        {
            Caption = 'Account No.';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; "Licence Document No."; Code[20])
        {
            Caption = 'Licence Document No.';
            //TableRelation = "Licence Registration Form"."No.";
        }
        field(8; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            //TableRelation = "Licence Registration Form"."Invoice No.";
        }
        field(9; "Document Date"; DateTime)
        {
            Caption = 'Document Date';
        }
        field(10; "Payment Type"; Enum "Receipt Types")
        {
            //OptionMembers = ,Licensing,"Tender Alert";
        }
        field(11; "Fee Type"; Option)
        {
            OptionMembers = ,"Licensing Fee","Processing Fee";
        }
        field(12; fetched; Boolean)
        {
            DataClassification=CustomerContent;
        }
        field(13; failed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';
        }
        field(15; "User ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.","Transaction Code")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Payments.Reset();
        if Payments.FindLast() then
            Rec."Entry No." := Payments."Entry No." + 1
        else
            Rec."Entry No." := 1
    end;

    var
        Payments: Record "E-Citizen Payment Entries";
}
