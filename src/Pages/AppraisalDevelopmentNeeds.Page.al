Page 52194340 "Appraisal Development Needs"
{
    PageType = ListPart;
    SourceTable = "Appraisal Development Needs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DevelopmentNeed;"Development Need")
                {
                    ApplicationArea = Basic;
                }
                field(DevelopmentAction;"Development Action")
                {
                    ApplicationArea = Basic;
                }
                field(Resposibility;Resposibility)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibility';
                }
                field(ByWhen;"By When")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
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

