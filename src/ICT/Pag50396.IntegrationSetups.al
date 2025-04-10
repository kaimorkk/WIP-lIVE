page 50396 "Integration Setups"
{
    Caption = 'Integration Setups';
    PageType = List;
    SourceTable = "SMS Setup";
    CardPageId = "SMS Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Primary Key field.', Comment = '%';
                }
                field("Partner ID"; Rec."Partner ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the partner ID field.';
                }
                field(ApiKey; Rec.ApiKey)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the APi Key field.';
                }
                field("Send SMS API URL"; Rec."Send SMS API URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Send SMS API URL field.';
                }
            }
        }
    }
}
