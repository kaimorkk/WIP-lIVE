Page 52194175 "Transport Non Employee Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Travelling Non Employees1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    NotBlank = false;
                }
            }
        }
    }

    actions
    {
    }
}

