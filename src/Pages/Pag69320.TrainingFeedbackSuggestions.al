

page 69320 "Training Feedback Suggestions"
{
    PageType = ListPart;
    SourceTable = "Training Feedback Suggestions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Description';

                }
                field(Facilitator; Rec.Facilitator)
                {
                    ApplicationArea = All;
                    // Visible=false;
                    ToolTip = 'Specifies the value of the Facilitator field.';
                }
                field("Facilitator Punctuality"; Rec."Facilitator Punctuality")
                {
                    ApplicationArea = All;
                    Caption = 'Facilitator Punctuality';
                    ToolTip = 'Specifies the value of the Facilitator Punctuality field.';
                }
                field("Training Userfullness"; Rec."Training Userfullness")
                {
                    ApplicationArea = All;
                    // Visible=false;
                    ToolTip = 'Specifies the value of the Training Userfullness field.';
                }
                field("Facilitator Rating"; Rec."Facilitator Rating")
                {
                    ApplicationArea = All;
                    // Visible=false;
                    ToolTip = 'Specifies the value of the Facilitator Rating field.';
                }
                field("Training Time Allocation"; Rec."Training Time Allocation")
                {
                    ApplicationArea = All;
                    // Visible=false;
                    ToolTip = 'Specifies the value of the Training Time Allocation field.';
                }
                field("Training Materials"; Rec."Training Materials")
                {
                    ApplicationArea = All;
                    // Visible=false;
                    ToolTip = 'Specifies the value of the Training Materials field.';
                }
                field(Interactivity; Rec.Interactivity)
                {
                    ApplicationArea = All;
                    // Visible=false;
                    ToolTip = 'Specifies the value of the Interactivity field.';
                }
                field("Presentation Quality"; Rec."Presentation Quality")
                {
                    ApplicationArea = All;
                    // Visible=false;
                    ToolTip = 'Specifies the value of the Presentation Quality field.';
                }

                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    // Visible=false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

