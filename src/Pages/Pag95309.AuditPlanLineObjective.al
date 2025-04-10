

page 95309 "Audit PlanLine Objective"
{
    PageType = List;
    SourceTable = "Audit PlanLine Objective";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Objective ID field.';
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
    }
}

#pragma implicitwith restore

