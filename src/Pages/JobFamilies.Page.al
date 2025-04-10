Page 52194421 "Job Families"
{
    PageType = List;
    SourceTable = "Job Families";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CategoryCode;"Category Code")
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

