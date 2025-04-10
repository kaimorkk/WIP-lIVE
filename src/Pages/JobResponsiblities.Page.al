Page 52194040 "Job Responsiblities"
{
    PageType = List;
    SourceTable = "Job Responsiblities1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Responsibility;Responsibility)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                }
                field(Remarks;Remarks)
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

