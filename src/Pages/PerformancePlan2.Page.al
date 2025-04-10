Page 52194123 "Performance Plan2"
{
    PageType = Card;
    SourceTable = "Appraisal Performance1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Competence;Competence)
                {
                    ApplicationArea = Basic;
                }
                field(AppraisersRemarks;"Appraisers Remarks")
                {
                    ApplicationArea = Basic;
                }
                field(AppraiseeRemarks;"Appraisee Remarks")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        AppraisalTypes: Record "Appraisal Types1";
}

