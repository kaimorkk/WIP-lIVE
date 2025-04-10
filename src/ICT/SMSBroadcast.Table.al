Table 51939 "SMS Broadcast"
{

    fields
    {
        field(1; EntryNo; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No';
        }
        field(2; Date; Date)
        {
        }
        field(3; "SMS Message"; Text[500])
        {
        }
        field(4; "Posted By"; Code[20])
        {
        }
        field(5; Posted; Boolean)
        {
        }

        field(6; PaymentMessage; Boolean)
        {

        }
        field(7; PhoneNumber; code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(8; isSent; Boolean)
        {

            DataClassification = ToBeClassified;
        }
        field(9; "E-Mail"; Code[100])
        {
            DataClassification = ToBeClassified;
        }

        field(10; failed; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(12; accountName; Text[200])
        {
            Caption = 'Account Name';
        }

        field(13; amountPaid; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount Paid';
        }
        field(11; pvNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'PV Number';
        }

        field(14; sendSMS; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; ErrorMessage; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(16; emailSent; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'isEmailSent';
        }

        field(17; isInvalidForSMS; Boolean)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

