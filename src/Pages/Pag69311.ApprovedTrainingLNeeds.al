

page 69311 "Approved TrainingL Needs"
{
    CardPageID = "Approved Training Needs Header";
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
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("Training Need Code"; Rec."Training Need Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Need Code field.';
                }
                // field(Status; Status)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Status field.';
                // }
                // field(Blocked; Blocked)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Blocked field.';
                // }
                // field("Created By"; "Created By")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created By field.';
                // }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created On field.';
                // }
                // field("No. of Needs"; "No. of Needs")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. of Needs field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

