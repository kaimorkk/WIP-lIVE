

Page 52193912 "Employee Transfers History"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee Transfers";
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("Original Station Name"; Rec."Original Station Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Original Station Name field.';
                }

                field("New Station"; Rec."New Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Station field.';
                }
                field("New Sattion Name"; Rec."New Sattion Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Sattion Name field.';
                }
                field("PREV Actual Reporting Date"; Rec."PREV Actual Reporting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PREV Actual Reporting Date field.';
                }
                field("Transfer Date"; Rec."Transfer Date")
                {
                    ApplicationArea = Basic;
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
                field("Transfered By"; Rec."Transfered By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfered By field.';
                }
                field("To Hardship Area?"; Rec."To Hardship Area?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Hardship Area? field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

