
table 56009 "Commitment Entries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Commitment No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                IF "Commitment No" <> xRec."Commitment No" THEN BEGIN
                    GenLedgerSetup.GET();
                    NoSeriesMgt.TestManual( GenLedgerSetup."Commitment No");
                     "Commitment No" := '';
                END;
                 */

            end;
        }
        field(2; "Commitment Date"; Date)
        {
        }
        field(3; "Commitment Type"; Option)
        {
            OptionMembers = Committmemt,"Committment Reversal",Encumberence,Attachment;
        }
        field(4; Account; Code[20])
        {
        }
        field(5; "Committed Amount"; Decimal)
        {
        }
        field(6; User; Code[50])
        {
        }
        field(7; "Document No"; Code[20])
        {
        }
        field(8; InvoiceNo; Code[20])
        {
        }
        field(9; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; No; Code[20])
        {
        }
        field(11; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(12; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(13; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(14; "Line No."; Integer)
        {
        }
        field(15; "Account No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset";
        }
        field(16; "Account Name"; Text[100])
        {
        }
        field(17; Description; Text[250])
        {
        }
        field(18; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(19; "Uncommittment Date"; Date)
        {
        }
        field(20; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(22; "Shortcut Dimension 4 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(23; "Shortcut Dimension 5 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(24; "Shortcut Dimension 6 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(25; "Shortcut Dimension 7 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(26; "Shortcut Dimension 8 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8));
        }
        field(27; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28; "EXR No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "EXR Line No."; Integer)
        {
            Description = 'Expenditure Requisition Line No.';
            DataClassification = ToBeClassified;
        }
        field(30; "Source RecordID"; RecordID)
        {
            DataClassification = ToBeClassified;
        }
        field(31; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
        Key(key2; "Account No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Shortcut Dimension 3 Code", "Shortcut Dimension 4 Code", "Shortcut Dimension 5 Code",
                "Shortcut Dimension 6 Code", "Shortcut Dimension 7 Code", "Shortcut Dimension 8 Code", "Commitment Type", "Commitment Date")
        {
            SumIndexFields = Amount;
        }
        Key(Key3; "EXR No.", "EXR Line No.")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

