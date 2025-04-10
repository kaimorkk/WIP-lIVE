

page 69703 "Application Declaration"
{
    PageType = List;
    SourceTable = "Application Declaration";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Declaration Statement"; Rec."Declaration Statement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Declaration Statement field.';
                }
                field("Candidate Accepted"; Rec."Candidate Accepted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Accepted field.';
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
    }
}

#pragma implicitwith restore

