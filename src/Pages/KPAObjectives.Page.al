Page 52194129 "KPA Objectives"
{
    PageType = ListPart;
    SourceTable = "KPA Objectives1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(KPACode;"KPA Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(KPADescription;"KPA Description")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

