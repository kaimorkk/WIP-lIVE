page 50333 "Tyre Requisition Lines"
{
    Caption = 'Tyre Requisition Lines';
    PageType = ListPart;
    SourceTable = "Tyre Requisition";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Tyre size Requested"; Rec."Tyre size Requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tyre size field.';
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity Requested field.';
                }
                field("Quantity Issued"; Rec."Quantity Issued")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity Issued field.';
                }
            }
        }
    }
}
