

page 70030 "Tender Supplier"
{
    PageType = List;
    SourceTable = "Tender Suppliers";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field(Awarded; Rec.Awarded)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Supplier Selection")
            {
                Caption = 'Supplier Selection';
                action("Generate Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate Order';

                    trigger OnAction()
                    begin
                        Rec.CreateQuote(Rec);
                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

