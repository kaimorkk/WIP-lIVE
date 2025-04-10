

page 69227 "Training Cost"
{
    PageType = List;
    SourceTable = "Training Cost";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cost Category"; Rec."Cost Category")
                {
                    ApplicationArea = Basic;
                }
                field("Cost Item"; Rec."Cost Item")
                {
                    ApplicationArea = Basic;
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Service/Item Code"; Rec."Service/Item Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Total Amount';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

