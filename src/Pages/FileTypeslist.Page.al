Page 52193797 "File Types list"
{
    CardPageID = "File Types";
    Editable = false;
    PageType = List;
    SourceTable = "File Types1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(TypeCode;"Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Files;Files)
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

