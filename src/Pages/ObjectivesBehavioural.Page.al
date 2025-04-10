Page 52194350 "Objectives Behavioural"
{
    PageType = ListPart;
    SourceTable = "Appraisal Objectives Lines1";
    SourceTableView = where("Appraisal Heading Type"=const("Behavioural Competencies"));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Objective';
                }
                field(Measure;Measure)
                {
                    ApplicationArea = Basic;
                    Caption = 'Measure';
                }
                field(TimeFrame;"Agreed Target Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time Frame ';
                }
                field(Weighting;"Weighting(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Weighting';
                }
            }
        }
    }

    actions
    {
    }
}

