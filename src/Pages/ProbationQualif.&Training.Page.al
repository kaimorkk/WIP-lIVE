Page 52194362 "Probation Qualif. & Training"
{
    PageType = ListPart;
    SourceTable = "Appraisal Lines-Probation";
    SourceTableView = where("Appraisal Heading Type"=const("Qualifications and Training"));

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
            }
        }
    }

    actions
    {
    }
}

