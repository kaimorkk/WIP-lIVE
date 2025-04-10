

page 69288 "Employee Disciplinary Status."
{
    PageType = List;
    SourceTable = "Employee Disciplinary Status";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Disciplinary Status"; Rec."Disciplinary Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Status field.';
                }
                field("Start Period"; Rec."Start Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Period field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Period"; Rec."End Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Period field.';
                }
                field(Stop; Rec.Stop)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Stop field.';
                }
                field("Effect on Payroll"; Rec."Effect on Payroll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effect on Payroll field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

