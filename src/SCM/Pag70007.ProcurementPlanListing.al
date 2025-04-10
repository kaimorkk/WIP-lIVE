

page 70007 "Procurement Plan Listing"
{
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Plan1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Plan Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost"; Rec."Estimated Cost")
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

