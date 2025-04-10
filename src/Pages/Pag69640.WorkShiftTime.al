

page 69640 "Work Shift Time"
{
    PageType = List;
    SourceTable = "Work Shift Time";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                }
                field("Deployment Type"; Rec."Deployment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Work Hrs/Day"; Rec."Minimum Work Hrs/Day")
                {
                    ApplicationArea = Basic;
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
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

