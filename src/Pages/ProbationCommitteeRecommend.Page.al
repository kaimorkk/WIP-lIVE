Page 52194370 "Probation Committee Recommend"
{
    PageType = ListPart;
    SourceTable = "Appraisal Lines-Probation";
    SourceTableView = where("Appraisal Heading Type"=const("Committee Recommendations"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                }
                field(Selection;Selection)
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

