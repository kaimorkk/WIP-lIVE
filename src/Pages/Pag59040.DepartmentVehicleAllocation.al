

page 59040 "Department Vehicle Allocation"
{
    PageType = List;
    SourceTable = "Department Vehicle Allocation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

