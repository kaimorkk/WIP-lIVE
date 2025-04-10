page 52193977 "Leave Adjustment List"
{
    Caption = 'Leave Adjustment List';
    PageType = List;
    SourceTable = "Leave Journal Voucher";
    CardPageId = "Leave Adjustment Voucher";
    SourceTableView = where(Posted = const(false));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Batch Name"; Rec."Batch Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch Name field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
