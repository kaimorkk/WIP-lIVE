Page 52194317 "Contract Intake CheckList"
{
    PageType = ListPart;
    SourceTable = "Contract Intake Checklist";

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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Complied;Complied)
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

