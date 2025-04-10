page 50479 "OTP Dialog"
{
    Caption = 'OTP Dialog';
    PageType = StandardDialog;
    ApplicationArea = All;
    SourceTable = "SMS Setup";
    UsageCategory = Administration;


    layout
    {
        area(Content)
        {
            // field(Terms; Rec.Terms)
            // {

            //     Caption = 'Terms and Conditions';
            //     MultiLine = true;
            //     Editable = false;

            // }
            field(Otp; OTPInput)
            {
                Caption = 'Enter OTP Code';
            }

            field(OtpExpiry; OTPExpiry)
            {
                Caption = 'OTP Expires in ... ';
                ApplicationArea = All;
                Editable = false;
            }


        }
    }

    var
        OTPInput: Text;
        OTPExpiry: Datetime;
        OTPExpiryTimeSnds: Datetime;
        Confirmation: Text;


    trigger OnOpenPage()
    begin

        OTPExpiryTimeSnds := CurrentDateTime + 300000;

        OTPExpiry := OTPExpiryTimeSnds;


    end;

    procedure getOTP(): text
    begin
        exit(OTPInput);
    end;
}
