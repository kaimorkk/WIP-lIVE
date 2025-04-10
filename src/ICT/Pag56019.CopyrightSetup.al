

page 56019 "Copyright Setup"
{
    PageType = Card;
    SourceTable = "Copyright Setup";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Applicant Nos"; Rec."Applicant Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Nos field.';
                }
                field("Complains Nos"; Rec."Complains Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complains Nos field.';
                }
                field("Case Nos"; Rec."Case Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Nos field.';
                }
                field("Court Attendance Nos"; Rec."Court Attendance Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Attendance Nos field.';
                }
                field("Case File Movement Nos"; Rec."Case File Movement Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case File Movement Nos field.';
                }
                field("Document Registration Nos"; Rec."Document Registration Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Registration Nos field.';
                }
                field("Copyright Registration Nos."; Rec."Copyright Registration Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright Registration Nos. field.';
                }
                field("CMO Registration Nos"; Rec."CMO Registration Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CMO Registration Nos field.';
                }
                field("CMO Renewal Nos"; Rec."CMO Renewal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CMO Renewal Nos field.';
                }
                field("Internal Memo Nos"; Rec."Internal Memo Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Memo Nos field.';
                }
                field("Customer FeedBack Nos"; Rec."Customer FeedBack Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer FeedBack Nos field.';
                }
                field("Visitor Pass Nos"; Rec."Visitor Pass Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Visitor Pass Nos field.';
                }
            }
            group("Authentication Devices")
            {
                Caption = 'Authentication Devices';
                field("Authentication Nos"; Rec."Authentication Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authentication Nos field.';
                }
                field("APSD Minimum Quantity"; Rec."APSD Minimum Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the APSD Minimum Quantity field.';
                }
                field("APSD Default Unit Price"; Rec."APSD Default Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the APSD Default Unit Price field.';
                }
                field("Default APSD Item"; Rec."Default APSD Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default APSD Item field.';
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("Copyright Amount"; Rec."Copyright Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright Amount field.';
                }
                field("Gen. Bus Posting Group"; Rec."Gen. Bus Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Bus Posting Group field.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Posting Group field.';
                }
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource field.';
                }
            }
            group(Authorization)
            {
                Caption = 'Authorization';
                field("user id"; Rec."user id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Authorizing User Id';
                    ToolTip = 'Specifies the value of the Authorizing User Id field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

