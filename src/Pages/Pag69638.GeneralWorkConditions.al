

page 69638 "General Work Conditions"
{
    PageType = List;
    SourceTable = "Position Work Condition";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Work Condition Category"; Rec."Work Condition Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Condition Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
    }
}

#pragma implicitwith restore

