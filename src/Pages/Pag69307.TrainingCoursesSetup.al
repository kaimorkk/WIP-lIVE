

page 69307 "Training Courses Setup"
{
    PageType = List;
    SourceTable = "Training Courses Setup";
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
                field(Descritpion; Rec.Descritpion)
                {
                    ApplicationArea = Basic;
                }
                field(Domain; Rec.Domain)
                {
                    ApplicationArea = Basic;

                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Domain Name field.';
                }

                field("No. of Staff Trained"; Rec."No. of Staff Trained")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field("Skill Type"; Rec."Skill Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Skill Type field.';
                }
                field("Skill Description"; Rec."Skill Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Skill Description field.';
                }
                field("Course Duration"; Rec."Course Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Duration';
                    ToolTip = 'Specifies the value of the Course Duration field.';
                }
                field(LMS; Rec.LMS)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the LMS field.';
                }
                field(Trainer; Rec.Trainer)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trainer field.';
                }
                field("Trainer Name"; Rec."Trainer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trainer Name field.';
                }
                field(Bonded; Rec.Bonded)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bonded field.';
                }
                field("Bonding Penalty"; Rec."Bonding Penalty")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bonding Penalty field.';
                }
                field("Bonding Period"; Rec."Bonding Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bonding Period field.';
                }
                field("Budget Spent"; Rec."Budget Spent")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Synched; Rec.Synched)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Synched field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Needs To be Addressed")
            {
                ApplicationArea = Basic;
                Image = AllocatedCapacity;
                RunObject = Page "Training Courses Needs";
                RunPageLink = "Course Code" = field(Code);
            }
            action("Eligible Grades")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                RunObject = Page "Eligible Grades";
                RunPageLink = Course = field(Code);
            }
            action("Eligible Positions")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                RunObject = Page "Eligible Positions";
                RunPageLink = Course = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Needs To be Addressed_Promoted"; "Needs To be Addressed")
                {
                }
                actionref("Eligible Grades_Promoted"; "Eligible Grades")
                {
                }
                actionref("Eligible Positions_Promoted"; "Eligible Positions")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

