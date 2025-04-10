

page 69716 "Close Ended Qn Type"
{
    PageType = List;
    SourceTable = "Close Ended Qn Type";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Type ID"; Rec."Type ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Default Responses"; Rec."No. of Default Responses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Default Responses field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {

            action("Question Options")
            {
                ApplicationArea = Basic;
                Image = AvailableToPromise;
                RunObject = Page "Question Option";
                RunPageLink = "Type ID" = field("Type ID");
                ToolTip = 'Executes the Evaluation Sections action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Question Options_Promoted"; "Question Options")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

