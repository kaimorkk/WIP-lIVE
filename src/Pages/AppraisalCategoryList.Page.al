Page 52194119 "Appraisal Category List"
{
    PageType = List;
    SourceTable = "Appraisal Category1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(AppraissalCategory;"Appraissal Category")
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

