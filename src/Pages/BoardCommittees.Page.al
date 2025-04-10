Page 52193818 "Board Committees"
{
    Editable = true;
    PageType = ListPart;
    SourceTable = "Commisioner Committee1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = true;
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(BoardMemberName;"Commisioner Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Member Name';
                }
                field(Attended;Attended)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount;"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(BoardMemberTax;"Commissioner Tax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Member Tax>';
                }
            }
        }
    }

    actions
    {
    }
}

