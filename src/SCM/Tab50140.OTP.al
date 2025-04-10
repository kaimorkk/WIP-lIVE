table 50140 OTP
{
    Caption = 'OTP';
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }

        field(2; "User ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(3; "OTP Code"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Creation Time"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(5; "Expiration Time"; DateTime)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Used"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Phone Number"; Text[14])
        {

        }
        field(8; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; dtime; Duration)
        {
            DataClassification = ToBeClassified;
        }

        field(10; enteredOtp; Text[10])
        {
            trigger OnValidate()
            var
                MaxLength: Integer;
            begin
                MaxLength := 10;
                if StrLen(enteredOtp) > MaxLength then
                    Error('The OTP cannot exceed %1 characters. Please enter a valid OTP.', MaxLength);

            end;
        }

        field(11; Confirmation; Text[2048])
        {

        }
        field(12; "Table ID"; Integer)
        {

        }
        field(13; "Approval QR Code"; Blob)
        {
            SubType = Bitmap;
            DataClassification = CustomerContent;
        }
        field(14; "OTP Type"; Option)
        {
            OptionMembers = ,Initiator,Approver,Login,Registration;
        }
        field(15; "Approval Sequence"; Integer)
        {

        }
        field(16; "E-Mail"; Text[80])
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

    procedure getEnteredOtp(userId: Code[20]): Text
    var
        EnteredOtp: Text[10];
    begin
        EnteredOtp := '';
        Rec.reset();
        Rec.SetRange("User ID", userId);
        Rec.SetRange(Used, false);
        Rec.FindLast();
        EnteredOtp := Rec.enteredOtp;
        Exit(EnteredOtp);


    end;
}



