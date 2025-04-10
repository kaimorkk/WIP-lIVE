page 70122 "OTP Card"
{
    Caption = 'OTP Card';
    PageType = Card;
    SourceTable = OTP;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("OTP Code"; Rec."OTP Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OTP Code field.', Comment = '%';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone Number field.', Comment = '%';
                }
                field("Expiration Time"; Rec."Expiration Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Expiration Time field.', Comment = '%';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Confirmation; Rec.Confirmation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Confirmation field.', Comment = '%';
                }

                field(Used; Rec.Used)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Used field.', Comment = '%';
                }
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Table ID field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field(dtime; Rec.dtime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the dtime field.';
                }
                field(enteredOtp; Rec.enteredOtp)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the enteredOtp field.';
                }
            }
            group("Digital Signature")
            {
                field("Approval QR Code"; Rec."Approval QR Code")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Approval QR Code field.', Comment = '%';
                }
            }
        }
    }
}
