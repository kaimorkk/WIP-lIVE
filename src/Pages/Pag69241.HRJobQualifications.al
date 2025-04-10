

page 69241 "HR Job Qualifications"
{
    PageType = List;
    SourceTable = "HR Job Qualifications";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Qualification)
            {
                Caption = 'Qualification';
                action("Q&ualification Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualification Overview';
                    Image = QualificationOverview;
                    RunObject = Page "Qualification Overview";
                    ToolTip = 'Executes the Q&ualification Overview action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                Caption = 'Qualifications', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Q&ualification Overview_Promoted"; "Q&ualification Overview")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

