

page 56060 "CRM Setup List"
{
    Caption = 'CRM Setup';
    PageType = Card;
    SourceTable = "Crm General Setup.";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Lead Nos"; Rec."Lead Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Nos field.';
                }
                field("General Enquiries Nos"; Rec."General Enquiries Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Enquiries Nos field.';
                }
                field("Cases nos"; Rec."Cases nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cases nos field.';
                }
                field("Crm logs Nos"; Rec."Crm logs Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Crm logs Nos field.';
                }
                field("Training Nos"; Rec."Training Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Nos field.';
                }
                field("Customer App Nos"; Rec."Customer App Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer App Nos field.';
                }
                field("Customer Feedback Nos"; Rec."Customer Feedback Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Feedback Nos field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

