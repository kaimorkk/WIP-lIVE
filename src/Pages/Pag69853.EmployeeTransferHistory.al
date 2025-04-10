page 69853 "Employee  Transfer History"
{
    Caption = 'Employee  Transfer History';

    PageType = List;
    CardPageId = "Employee Transfer";
    SourceTable = "Employee Transfers";
    UsageCategory = None;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTableView = WHERE("Status" = filter(Released));

    layout
    {
        area(content)
        {
            repeater(General)
            {


                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = All;
                    caption = 'Previous Station';
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
                    caption = 'Previous Station Name';
                    ToolTip = 'Specifies the value of the Original Station Name field.';
                }
                field("New Station"; Rec."New Station")
                {
                    ApplicationArea = All;
                    caption = 'Station Transfered To';
                    ToolTip = 'Specifies the value of the New Station field.';
                }
                field("PREV Actual Reporting Date"; Rec."PREV Actual Reporting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PREV Actual Reporting Date field.';
                }
                field("Transfer Date"; Rec."Transfer Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Date field.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reporting Date field.';
                }
                field("Actual Reporting Date"; Rec."Actual Reporting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Actual Reporting Date field.';
                }
                field("New Sattion Name"; Rec."New Sattion Name")
                {
                    ApplicationArea = All;
                    caption = 'Station Name Transfered To';
                    ToolTip = 'Specifies the value of the New Sattion Name field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    Caption = 'Transfer Request No';
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("To Hardship Area?"; Rec."To Hardship Area?")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the To Hardship Area? field.';
                }


            }
        }
    }
}
