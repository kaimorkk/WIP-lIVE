Page 52193931 "Survey Stage List"
{
    Editable = true;
    PageType = List;
    SourceTable = "Survey Stage1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Stage;Stage)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

