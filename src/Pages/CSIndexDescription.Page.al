Page 52193855 "CS Index Description"
{
    PageType = ListPart;
    SourceTable = "Custorme Survey Index1";
    SourceTableView = where("Survey Type"=const("Customer Statement"));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Statement;Statement)
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

