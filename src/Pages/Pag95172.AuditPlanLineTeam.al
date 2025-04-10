

page 95172 "Audit Plan Line Team"
{
    PageType = Card;
    SourceTable = "Audit Plan Line Team";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Engagement Line No."; Rec."Engagement Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Line No. field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Audit Team Type"; Rec."Audit Team Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Team Type field.';
                }
                field("Engagement Role"; Rec."Engagement Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Role field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Default Audit Location ID"; Rec."Default Audit Location ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Audit Location ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Blocekd; Rec.Blocekd)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocekd field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

