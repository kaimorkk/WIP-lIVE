

page 80096 "Objective Comments"
{
    PageType = List;
    SourceTable = "PC Objective Comment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No field.';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective ID field.';
                }
                field("Comment/Additional Notes"; Rec."Comment/Additional Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment/Additional Notes field.';
                }
                field("Last Update Date"; Rec."Last Update Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Update Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

