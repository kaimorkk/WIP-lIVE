page 96059 "User Tender Subscription"
{
    ApplicationArea = All;
    Caption = 'User Tender Subscription';
    PageType = Document;
    SourceTable = "User Tender Subscriptions";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("Subscription ID"; Rec."Subscription ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subscription ID field.', Comment = '%';
                }
                field("Subscription Date"; Rec."Subscription Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subscription Date field.', Comment = '%';
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Date field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
            part("User Alert Preferences"; "User Alert Preferences")
            {
                ApplicationArea = Basic;
                Caption = 'User Alert Preferences';
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
}
