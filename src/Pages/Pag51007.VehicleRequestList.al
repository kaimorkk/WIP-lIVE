page 51007 "Vehicle Request List"
{
    ApplicationArea = All;
    Caption = 'Motor Vehicle Request List';
    PageType = List;
    SourceTable = "Vehicle Request";
    CardPageId = "Vehicle Request";
    UsageCategory = Lists;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where(Status = filter(Open | Pending));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Request No."; Rec."Request No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request No. field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Type field.';
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested By field.';
                }
                field("Station No."; Rec."Station No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station No. field.';
                }
                field("Station Description"; Rec."Station Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Station Description field.';
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Capacity field.';
                }
                field(Justification; Rec.Justification)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Justification field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Vehicle Issued"; Rec."Vehicle Issued")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Issued field.';
                }
            }
        }
    }
}
