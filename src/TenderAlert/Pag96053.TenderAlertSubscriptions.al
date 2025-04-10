page 96053 "Tender Alert Subscriptions"
{
    ApplicationArea = All;
    Caption = 'Tender Alert Subscriptions';
    PageType = List;
    SourceTable = "Tender Alert Subscriptions";
    UsageCategory = None;
    DeleteAllowed = false;
    CardPageId = "Tender Alert Subscription";
    Editable = false;

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
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Subscription Type"; Rec."Subscription Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subscription Type field.', Comment = '%';
                }
                field("Has Expiry"; Rec."Has Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Expiry field.', Comment = '%';
                }
                field("Expiry Period"; Rec."Expiry Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiry Period field.', Comment = '%';
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
