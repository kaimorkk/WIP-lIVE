Page 52193933 "Work Shifts1"
{
    Caption = 'Work Shifts1';
    PageType = List;
    SourceTable = "Work Shift";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

