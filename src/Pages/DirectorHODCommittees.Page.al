Page 52193817 "Director/HOD Committees"
{
    Editable = true;
    PageType = ListPart;
    SourceTable = "HoD Committee1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = true;
                Enabled = true;
                field(HoDcode;"HoD code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(HodName;"Hod Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Attended;Attended)
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

