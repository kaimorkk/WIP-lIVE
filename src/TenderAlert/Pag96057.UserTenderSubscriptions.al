page 96057 "User Tender Subscriptions"
{
    ApplicationArea = All;
    Caption = 'User Tender Subscriptions';
    PageType = List;
    SourceTable = "User Tender Subscriptions";
    UsageCategory = None;
    Editable = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    CardPageId = "User Tender Subscription";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                }
            }
        }
    }
}
