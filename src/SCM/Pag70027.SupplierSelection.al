

page 70027 "Supplier Selection"
{
    PageType = List;
    SourceTable = "Supplier Selection1";

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
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Receiver; Rec.Receiver)
                {
                    ApplicationArea = Basic;
                }
                field(Awarded; Rec.Awarded)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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

