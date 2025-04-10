table 96059 "Alert Transaction Entries"
{
    Caption = 'Alert Transaction Entries';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Alert Transaction Entries";
    LookupPageId = "Alert Transaction Entries";
    
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Transaction Code"; Code[20])
        {
            Caption = 'Transaction Code';

            trigger OnValidate()
            var
                Entries: Record "Alert Transaction Entries";
                Err001: Label 'An entry with a similar transaction code exits.';
            begin
                Entries.Reset();
                Entries.SetRange("Transaction Code", Rec."Transaction Code");
                if Entries.FindFirst() then
                    Error(Err001);
            end;
        }
        field(3; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = "Tender Alert Portal Users";
        }
        field(4; "Transaction Date"; DateTime)
        {
            Caption = 'Transaction Date & Time';
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(6; "Transaction Type"; Option)
        {
            Caption = 'Transaction Type';
            OptionMembers = ,Credit,Debit;
        }
        field(7; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Currency; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Bill Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Bill Ref No."; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Client MSISDN"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Client Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Client E-Mail"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Client ID No."; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Status; Option)
        {
            OptionMembers = ,Pending,Paid,Failed;
        }
        field(17; "Alert No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Entries.Reset();
        if Entries.FindLast() then
            Rec."Entry No." := Entries."Entry No." + 1
        else
            Rec."Entry No." := 1;

        "Document Date" := Today;
    end;

    var
        Entries: Record "Alert Transaction Entries";
        PortalUsers: Record "Tender Alert Portal Users";
        TAlertSetup: Record "Tender Alert Setups";
        NoSeries: Codeunit "No. Series";

}
