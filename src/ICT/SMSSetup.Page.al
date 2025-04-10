page 50323 "SMS Setup"
{
    ApplicationArea = All;
    Caption = 'Integration/Outward Setup';
    PageType = Card;
    SourceTable = "SMS Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';



                field(scheduleToBank; Rec.scheduleToBank)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the send to bank Approver field.', Comment = '%';
                    Visible = false;
                }

                field("Send SMS API URL"; Rec."Send SMS API URL")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Send SMS API URL field.';
                }
                field(ApiKey; Rec.ApiKey)
                {
                    ToolTip = 'Specifies the value of the APi Key field.';

                    MultiLine = true;

                    ExtendedDatatype = Masked;
                    ApplicationArea = All;
                }
                field("Partner ID"; Rec."Partner ID")
                {
                    ToolTip = 'Specifies the value of the partner ID field.';
                    ApplicationArea = All;
                }

                field(Shortcode; Rec.Shortcode)
                {
                    ToolTip = 'Specifies the value of the Shortcode field.';
                    ApplicationArea = All;
                }

                field(SharePointUrl; Rec.SharePointUrl)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SharePointUrl field.', Comment = '%';
                }
                field(CourtOrderUrl; Rec.CourtOrderUrl)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CourtOrderUrl field.', Comment = '%';
                }
                field(ValidationApi; Rec.ValidationApi)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bank Validation Api field.', Comment = '%';
                }
                field(testBankAccount; Rec.testBankAccount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Test Bank Account field.', Comment = '%';
                    Visible = false;
                }
                field(testBankCode; Rec.testBankCode)
                {
                    ApplicationArea = All;
                    Caption = 'Send to Bank Approver';
                    ToolTip = 'Specifies the value of the Test Bank Code field.', Comment = '%';
                    Visible = false;

                }

                field("T+1"; Rec."t+1")
                {
                    Caption = 'T+1 ms';
                }

                field(retrieveUrl; Rec.retrieveUrl)
                {

                }

                field("outward ref"; Rec."outward ref")
                {
                    Caption = 'OutwardPayment Ref No';
                }

                field(FtCheckerUrl; Rec.FtCheckerUrl)
                {
                    Caption = 'FT Checker Url';
                }

                field(ThresholdAmount; Rec.ThresholdAmount)
                {
                    Caption = 'Threshold Amount T+1';
                }

                field(queryTransaction; Rec.queryTransaction)
                {

                }

                field(Terms; Rec.Terms)
                {

                }

                field(smsMessage; Rec.smsMessage)
                {
                    ApplicationArea = All;
                    Caption = 'Payment Message';
                    ToolTip = 'Specifies the value of the smsMessage field.', Comment = '%';
                }

                field("BASE URI"; Rec."BASE URI")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BASE URI field.', Comment = '%';
                    caption = 'Outward Payment URI';
                }
                field("CTS URI"; Rec."CTS URI")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CTS URI field.', Comment = '%';
                    Caption = 'CTS Outward Payment Pushback';
                }
                field("TOKEN URI"; Rec."TOKEN URI")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the TOKEN URI field.', Comment = '%';
                    Caption = 'Access Token URI';

                }

                field(sendkey; Rec.sendkey)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outward API Key field.', Comment = '%';
                }
                field(sendbankapicode; Rec.sendbankapicode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outward API Code field.', Comment = '%';
                }
                field(restricSendTime; Rec.restricSendTime)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Restrict Time to 8am field.', Comment = '%';
                }
                field(isWorkingHr; Rec.ByPassWorkingHr)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the By Pass Working Hour field.', Comment = '%';
                }
                field(accessTokenKey; Rec.accessTokenKey)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Access Token Key field.', Comment = '%';
                }
                field(AccessTokenCode; Rec.AccessTokenCode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Token Code field.', Comment = '%';
                }
                field(bankStatementApi; Rec.bankStatementApi)
                {
                    ApplicationArea = All;
                }
                field(deleteSharepointUrl; Rec.deleteSharepointUrl)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delete Sharepoint Doc field.', Comment = '%';
                }

                field(pvtoSharePoint; Rec.pvtoSharePoint)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PV To sharepoint field.', Comment = '%';
                }

                field(ByPassValidation; Rec.ByPassValidation)
                {
                    ApplicationArea = All;
                    ToolTip = 'By Pass Standard Chartered';


                }










            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.RESET;
        IF NOT Rec.GET THEN BEGIN
            Rec.INIT;
            Rec.INSERT;
        END;
    end;
}
