

page 59136 "Fleet Requisition Items"
{
    PageType = ListPart;
    SourceTable = "Fleet Requisition Items";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item Type"; Rec."Item Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Serial Number"; Rec."Serial Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial Number field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Returnable; Rec.Returnable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Returnable field.';
                }
                field("Item Return Date"; Rec."Item Return Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Return Date';
                    ToolTip = 'Specifies the value of the Item Return Date field.';
                }
                field("Remarks/Comments"; Rec."Remarks/Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks/Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

