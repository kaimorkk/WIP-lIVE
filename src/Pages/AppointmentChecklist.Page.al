Page 52194054 "Appointment Checklist"
{
    PageType = ListPart;
    SourceTable = "Appointment Checklist1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Item;Item)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Signed;Signed)
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

