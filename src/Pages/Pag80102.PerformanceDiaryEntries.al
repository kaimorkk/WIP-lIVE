

page 80102 "Performance Diary Entries"
{
    PageType = List;
    SourceTable = "Performance Diary Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Number"; Rec."Line Number")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Entry Type"; Rec."Performance Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Diary Source"; Rec."Diary Source")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Case ID"; Rec."Disciplinary Case ID")
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

