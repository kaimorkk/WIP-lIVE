page 69388 "Approved Employee Requisitions"
{
    Caption = 'Approved Employee Transfer Requisitions';
    PageType = List;
    CardPageId = "Employee Transfer Requisition";
    SourceTable = "Employee Transfers";
    UsageCategory = None;
    Editable = false;
    SourceTableView = where(Type = const("Employee Requisition"),
                            "Status" = filter(Released));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Requesting Station"; Rec."Requesting Station")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requesting Station field.';
                }
                field("Requesting Station  Name"; Rec."Requesting Station  Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Preferred Station 1 Name field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }

            }
        }
    }
}
