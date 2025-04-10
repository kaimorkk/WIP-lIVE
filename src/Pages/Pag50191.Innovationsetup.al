page 50191 "Innovation setup"
{
    ApplicationArea = All;
    Caption = 'Innovation setup';
    PageType = Card;
    SourceTable = "e-BR & Innovation Setup";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Employee Survey No. Series"; Rec."Employee Survey No. Series")
                {
                    ToolTip = 'Specifies the value of the Employee Survey No. Series field.', Comment = '%';
                }
                field("Customer Survey No. Series"; Rec."Customer Survey No. Series")
                {
                    ToolTip = 'Specifies the value of the Customer Survey No. Series field.', Comment = '%';
                }
                field("Post-Project Survey No. Series"; Rec."Post-Project Survey No. Series")
                {
                    ToolTip = 'Specifies the value of the Post-Project Survey No. Series field.', Comment = '%';
                }
                field("Stakeholder Survey No. Series"; Rec."Stakeholder Survey No. Series")
                {
                    ToolTip = 'Specifies the value of the Stakeholder Survey No. Series field.', Comment = '%';
                }
                field("Enable Email Alerts"; Rec."Enable Email Alerts")
                {
                    ToolTip = 'Specifies the value of the Enable Email Alerts field.', Comment = '%';
                }
                field("Notification Email"; Rec."Notification Email")
                {
                    ToolTip = 'Specifies the value of the Notification Email field.', Comment = '%';
                }
                field("BR Templates No. Series"; Rec."BR Templates No. Series")
                {
                    ToolTip = 'Specifies the value of the BR Templates No. Series field.', Comment = '%';
                }
                field("Surveys No. Series"; Rec."Surveys No. Series")
                {
                    ToolTip = 'Specifies the value of the Surveys No. Series field.', Comment = '%';
                }
                field("Survey Response No. Series"; Rec."Survey Response No. Series")
                {
                    ToolTip = 'Specifies the value of the Survey Response No. Series field.', Comment = '%';
                }
                field("Custom Surveys No. Series"; Rec."Custom Surveys No. Series")
                {
                    ToolTip = 'Specifies the value of the Custom Surveys No. Series field.', Comment = '%';
                }
            }
        }
    }
}
