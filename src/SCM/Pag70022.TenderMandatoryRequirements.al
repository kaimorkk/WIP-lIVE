

page 70022 "Tender Mandatory Requirements"
{
    PageType = Card;
    SourceTable = "Tender Mandatory Requirements";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Rec.Description)
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

#pragma implicitwith restore

