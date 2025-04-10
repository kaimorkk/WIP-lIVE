Page 52194080 "Succession Gaps"
{
    PageType = ListPart;
    SourceTable = "Succession Gaps1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                field(QualificationType;"Qualification Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(QualificationCode;"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Qualification;Qualification)
                {
                    ApplicationArea = Basic;
                }
                field(Priority;Priority)
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

