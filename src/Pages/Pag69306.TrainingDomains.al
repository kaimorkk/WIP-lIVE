

page 69306 "Training Domains"
{
    PageType = List;
    SourceTable = "Training Domains";
    UsageCategory = Administration;
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Courses"; Rec."No. of Courses")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Actual Staff Trained"; Rec."No. of Actual Staff Trained")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Budget Spent"; Rec."Actual Budget Spent")
                {
                    ApplicationArea = Basic;
                }
                field(Synched; Rec.Synched)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

