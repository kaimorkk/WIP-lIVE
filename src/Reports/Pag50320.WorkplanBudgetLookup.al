page 50375 "Workplan Budget Lookup"
{
    Caption = 'Workplan Budget Lookup';
    PageType = List;
    SourceTable = "Workplan Budget Line";
    UsageCategory = None;
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activity ID field.', Comment = '%';
                }
                field("Input Description"; "Input Description")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Budget Item"; Rec."Budget Item")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Item field.';
                }
                field("Budget Item Description"; Rec."Budget Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Item Description field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 4 Code field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 5 Code field.';
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shorcut Dimension 6 Code field.';
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                }
                field("Q1 Amount"; Rec."Q1 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q1 Amount field.';
                }
                field("Q2 Amount"; Rec."Q2 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q2 Amount field.';
                }
                field("Q3 Amount"; Rec."Q3 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q3 Amount field.';
                }
                field("Q4 Amount"; Rec."Q4 Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Q4 Amount field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
        }
    }
}
