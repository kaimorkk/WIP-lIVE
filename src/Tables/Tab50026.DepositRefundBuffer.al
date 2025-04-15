 
   table 50026 "Deposit Refund Buffer"
{
    Caption = 'Deposit Refund Buffer';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
            Editable = false;

        }
        field(2; "Invoice Item ID"; Integer)
        {
            Caption = 'Invoice Item ID';
            Editable = false;

        }
        field(3; Price; Decimal)
        {
            Caption = 'Price';
            Editable = false;
        }
        field(4; Total; Decimal)
        {
            Caption = 'Total';
            Editable = false;

        }
        field(5; "Customer Name"; Text[150])
        {
            Caption = 'Customer Name';
            Editable = false;

        }
        field(6; "Bank Account Name"; Text[100])
        {
            Caption = 'Bank Account Name';
            Editable = false;

        }
        field(7; "Branch Id"; Code[20])
        {
            Caption = 'Branch Id';
            Editable = false;

        }
        field(8; "Account Number"; Code[50])
        {
            Caption = 'Account Number';
            Editable = false;

        }
        field(9; "Payment Type"; Integer)
        {
            Caption = 'Payment Type';
            Editable = false;

        }
        field(10; "Receipt No"; Code[20])
        {
            Caption = 'Receipt No';
            Editable = false;

        }
        field(11; "PRN No"; Code[20])
        {
            Caption = 'PRN No';
            Editable = false;

        }
        field(12; "Deposit Id"; Code[20])
        {
            Caption = 'Deposit Id';
            Editable = false;

        }
        field(13; "Mayan File Ref"; Integer)
        {
            Caption = 'Mayan File Ref';
            Editable = false;

        }
        field(14; "File Name"; Text[250])
        {
            Caption = 'File Name';
            Editable = false;

        }
        field(15; "Invoice Id"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(16; "Refunded By"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(17; Fetched; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "PV No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(19; Notified; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(21; Failed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Error Message"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(23; "Bank Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(24; Attachment; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(25; transfered; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Transfered Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Transfered By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Transfered To"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }

    procedure SetBase64(Base64Text: Text; var DepositRefund: Record "Deposit Refund Buffer")
    var
        OutStream: OutStream;
    begin
        Clear(DepositRefund.Attachment);
        DepositRefund.Attachment.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(Base64Text);
        // Modify();
    end;
}
