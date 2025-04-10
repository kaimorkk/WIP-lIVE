

page 69698 "Job Application Requirements"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Job Application Requirements";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Candidates Response"; Rec."Candidates Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidates Response field.';
                }
                field("No. of AutoMatched"; Rec."No. of AutoMatched")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of AutoMatched Qualification field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Application Evidence")
            {
                ApplicationArea = Basic;
                Image = Evaluate;
                RunObject = Page "Requirements Evidence";
                RunPageLink = "Application No." = field("Application No."),
                              "Requirement ID" = field("Requirement ID");
                RunPageMode = View;
                ToolTip = 'Executes the Job Application Evidence action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Job Application Evidence_Promoted"; "Job Application Evidence")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

