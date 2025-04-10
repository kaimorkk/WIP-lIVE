

page 69196 "Training Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Training Plan Lines";
    PopulateAllFields = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;

                    end;
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                }
                field("Target Group Code"; Rec."Target Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Target Group"; Rec."Target Group")
                {
                    ApplicationArea = Basic;
                }
                field("Course Duration"; Rec."Course Duration")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submitted Requests";Rec."No. of Submitted Requests")
                {
                    ApplicationArea = Basic;
                    DrillDownPageId = "Need Requests";
                }
                field("Planned No. of Staff"; Rec."Planned No. of Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Course Provider"; Rec."Proposed Course Provider")
                {
                    ApplicationArea = Basic;
                }
                field("Proposed Course Provider Name"; Rec."Proposed Course Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                    Caption = 'Unit Cost';
                    ApplicationArea = Basic;
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remark field.';
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Training Plan Staff Lines")
            {
                ApplicationArea = Basic;
                Image = EntriesList;
                RunObject = Page "Training Plan Staff Lines";
                RunPageLink = "Training Plan Code" = field("Training Plan Code"),
                                "Task No" = field("Task No"),
                                "Year Code" = field("Year Code"),
                              "Course Title" = field("Course Title");
            }
            // action("Training Needs")
            // {
            //     ApplicationArea = Basic;
            //     Image = AllocatedCapacity;
            //     Promoted = true;
            //     Visible = false;
            //     PromotedCategory = Process;
            //     RunObject = Page "Training Needs Register";
            //     RunPageLink = "Training Plan No" = field("Training Plan Code"),
            //                   "Course ID" = field("Course Title");
            //     RunPageMode = View;
            // }
            // action("Course Training Entries")
            // {
            //     ApplicationArea = Basic;
            //     Image = Entries;
            //     Visible = false;
            //     RunObject = Page "Course Budget Allocation";
            //     RunPageLink = "Course ID" = field("Course Title"),
            //                   "Training Plan Id" = field("Training Plan Code");
            // }
        }
    }

    var
        TrainingCoursesSetup: Record "Training Courses Setup";
        TrainingNeedsLines: Record "Training Needs Lines";
        TrainingLinesObjectives: Record "Training Lines Objectives";
        TrainingCoursesNeeds: Record "Training Courses Needs";
        TrainingLinesObjectives1: Record "Training Lines Objectives";
        EntryNo: Integer;
}

#pragma implicitwith restore

