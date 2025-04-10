table 50092 "SMS Setup"
{
    Caption = 'SMS Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; "Partner ID"; Text[300])
        {
            Caption = 'Partner ID';
            DataClassification = ToBeClassified;
        }
        field(3; "ApiKey"; Text[2000])
        {
            Caption = 'ApiKey';
            ExtendedDatatype = Masked;
            DataClassification = ToBeClassified;
        }
        field(4; "Shortcode"; Text[300])
        {
            Caption = 'ShortCode';
            DataClassification = ToBeClassified;
        }
        field(5; "Send SMS API URL"; Text[500])
        {
            Caption = 'Send SMS API URL';
            DataClassification = ToBeClassified;
        }

        field(6; "OTPExpiryTime"; Duration)
        {
            DataClassification = ToBeClassified;
        }

        field(7; SharePointUrl; Text[2000])
        {
            DataClassification = ToBeClassified;

        }

        field(8; CourtOrderUrl; Text[2048])
        {
            DataClassification = ToBeClassified;
        }

        field(9; ValidationApi; Text[2048])
        {
            DataClassification = ToBeClassified;
            Caption = 'Bank Validation Api';

        }

        field(10; testBankAccount; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Test Bank Account';
        }
        field(11; testBankCode; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Test Bank Code';
        }

        field(12; scheduleToBank; code[20])
        {
            caption = 'send to bank Approver';
        }
        field(13; "t+1"; Duration)
        {
            Caption = 'T+1 ms';
        }

        field(14; retrieveUrl; Text[200])
        {
            DataClassification = ToBeClassified;
        }

        field(15; "outward ref"; Code[20])
        {
            TableRelation = "No. Series";
        }

        field(16; FtCheckerUrl; Text[200])
        {

        }
        field(17; ThresholdAmount; Decimal)
        {

        }
        field(18; queryTransaction; Text[200])
        {
            Caption = 'Trans Query Api';
        }

        field(19; Terms; Text[2030])
        {
            Caption = 'Terms and Conditions for Payments';
        }

        field(20; "BASE URI"; TEXT[200])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "TOKEN URI"; Text[200])
        {
            DataClassification = ToBeClassified;
        }

        field(22; "CTS URI"; Text[200])
        {
            DataClassification = ToBeClassified;
        }

        field(23; sendkey; Text[200])
        {
            ExtendedDatatype = Masked;
            Caption = 'Outward API Key';
        }
        field(25; sendbankapicode; Text[200])
        {
            Caption = 'Outward API Code';
            ExtendedDatatype = Masked;

        }



        field(24; ByPassWorkingHr; Boolean)
        {
            Caption = 'By Pass Working Hour';
        }


        field(26; restricSendTime; Boolean)
        {
            Caption = 'Restrict Time to 8am';
        }

        field(27; accessTokenKey; Text[250])
        {
            Caption = 'Access Token Key';
            ExtendedDatatype = Masked;

        }

        field(28; AccessTokenCode; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'Token Code';
            ExtendedDatatype = Masked;

        }

        field(29; bankStatementApi; Text[200])
        {
            Caption = 'Bank Statement API';
        }

        field(30; deleteSharepointUrl; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Delete Sharepoint Doc';
        }

        field(31; pvtoSharePoint; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'PV To sharepoint';


        }

        field(32; ByPassValidation; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'ByPassValidation';

        }

        field(33; skipValidation; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Skip Validation';

        }
        field(34; smsMessage; Text[250])
        {
            DataClassification = ToBeClassified;
        }




    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
