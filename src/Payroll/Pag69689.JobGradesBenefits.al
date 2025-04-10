

page 52193713 "Job Grades Benefits"
{
    PageType = List;
    SourceTable = "Scale Benefits";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';
                }
                field("ED Code"; Rec."ED Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ED Code field.';
                }
                field("Based On"; Rec."Based On")
                {
                    ApplicationArea = All;
                    trigger onvalidate()
                    begin
                        if Rec."Based On" = Rec."Based On"::Amount then
                            Rec.Percentage := 0
                        else
                            Rec.Amount := 0;
                    end;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("ED Description"; Rec."ED Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ED Description field.';
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Grades Benefits")
            {
                ApplicationArea = Basic;
                RunObject = Page "Job Grades Benefits";
                ToolTip = 'Executes the Job Grades Benefits action.';
            }
        }
    }
}

#pragma implicitwith restore

