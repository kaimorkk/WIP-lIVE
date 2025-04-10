

page 80162 "Commitee Objectives"
{
    PageType = ListPart;
    SourceTable = "Commitee Objectives";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee ID"; Rec."Committee ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Committee ID field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field(Achievement; Rec.Achievement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achievement field.';
                }
                field("Responsible Person"; Rec."Responsible Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Person field.';
                }
                field("Date Achieved"; Rec."Date Achieved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Achieved field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

