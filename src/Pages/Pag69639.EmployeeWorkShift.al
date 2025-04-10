

page 69639 "Employee Work Shift"
{
    CardPageID = "Work Shift Card";
    PageType = List;
    SourceTable = "Employee Work Shift";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Minimum No of Hrs/Wk"; Rec."Minimum No of Hrs/Wk")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum No of Hrs/Wk field.';
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
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Work Shift Time")
            {
                ApplicationArea = Basic;
                RunObject = Page "Work Shift Time";
                RunPageLink = "Workshift Code" = field(Code);
                Visible = false;
                ToolTip = 'Executes the Work Shift Time action.';
            }
        }
    }
}

#pragma implicitwith restore

