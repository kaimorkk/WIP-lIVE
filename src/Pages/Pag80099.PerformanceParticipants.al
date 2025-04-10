

page 80099 "Performance Participants"
{
    PageType = List;
    SourceTable = "Performance Participant";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Doc No."; Rec."Performance Doc No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

