

page 75051 "Bid Evaluation Template"
{
    CardPageID = "Bid Evaluation Template Card";
    Editable = false;
    PageType = List;
    SourceTable = "Bid Scoring Template";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Template type"; Rec."Template type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Default Procurement Type"; Rec."Default Procurement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Procurement Type field.';
                }
                field("Total Preliminary Checks Score"; Rec."Total Preliminary Checks Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Preliminary Checks Score % field.';
                }
                field("Total Technical Evaluation %"; Rec."Total Technical Evaluation %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Technical Evaluation % field.';
                }
                field("Total Financial Evaluation"; Rec."Total Financial Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Financial Evaluation Score % field.';
                }
                field("Total Assigned Score/Weight %"; Rec."Total Assigned Score/Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Assigned Score/Weight % field.';
                }
                field("Default YES Bid Rating Score %"; Rec."Default YES Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default YES Bid Rating Score % field.';
                }
                field("NO Bid Rating Response Value"; Rec."NO Bid Rating Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NO Bid Rating Response Value field.';
                }
                field("Default NO Bid Rating Score %"; Rec."Default NO Bid Rating Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default NO Bid Rating Score % field.';
                }
                field("1-POOR Option Text Bid Score %"; Rec."1-POOR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 1-POOR Option Text Bid Score % field.';
                }
                field("2-FAIR Option Text Bid Score %"; Rec."2-FAIR Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 2-FAIR Option Text Bid Score % field.';
                }
                field("3-GOOD Option Text Bid Score %"; Rec."3-GOOD Option Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 3-GOOD Option Text Bid Score % field.';
                }
                field("4-VERY GOOD  Text Bid Score %"; Rec."4-VERY GOOD  Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 4-VERY GOOD Option Text Bid Score % field.';
                }
                field("5-EXCELLENT Text Bid Score %"; Rec."5-EXCELLENT Text Bid Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the 5-EXCELLENT Option Text Bid Score % field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solicitation Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
            {
                ApplicationArea = Basic;
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

