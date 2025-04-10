

page 69695 "Hobby Types"
{
    PageType = List;
    SourceTable = "Hobby Type";
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Hobby Categgory"; Rec."Hobby Categgory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hobby Categgory field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Employees"; Rec."No. of Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Employees field.';
                }
                field("No. of Job Applicants"; Rec."No. of Job Applicants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Job Applicants field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
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

