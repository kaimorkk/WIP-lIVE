

page 69308 "TrainingL Needs"
{
    CardPageID = "Training Courses Needs";
    PageType = List;
    SourceTable = "Training Courses Needs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                }
                field("Training Need Code"; Rec."Training Need Code")
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

