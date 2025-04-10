Page 52193859 "PPA Lines"
{
    PageType = ListPart;
    SourceTable = "PPA Parties1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(PPANo;"PPA No.")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                    AutoFormatType = 10000;
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(PartyNo;"Party No")
                {
                    ApplicationArea = Basic;
                }
                field(PartyName;"Party Name")
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

