Page 52194365 "Appraiser & Appraiser Comments"
{
    PageType = ListPart;
    SourceTable = "Appraisal Lines-Probation";
    SourceTableView = where("Appraisal Heading Type"=filter("Appraiser's Comments"|"Appraisee's Comments"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                }
            }
        }
    }

    actions
    {
    }
}

