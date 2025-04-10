

page 70048 "Commitee Members"
{
    PageType = ListPart;
    SourceTable = "Commitee Members";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Chair; Rec.Chair)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chair field.';
                }
                field(Secretary; Rec.Secretary)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secretary field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

