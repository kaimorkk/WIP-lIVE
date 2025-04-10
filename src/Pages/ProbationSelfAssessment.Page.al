Page 52194361 "Probation Self Assessment"
{
    PageType = ListPart;
    SourceTable = "Appraisal Lines-Probation";
    SourceTableView = where("Appraisal Heading Type"=const("Self Assessment"));

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

