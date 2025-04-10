page 70476 "Unit Specific Controls"
{
    Caption = 'Unit Specific Controls';
    PageType = ListPart;
    SourceTable = "Unit Specific Controls";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Admin Unit"; Rec."Admin Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admin Unit field.', Comment = '%';
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan No field.', Comment = '%';
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Name field.', Comment = '%';
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Amount field.', Comment = '%';
                }
                field("Supplementary Ceiling"; Rec."Supplementary Ceiling")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supplementary Ceiling field.', Comment = '%';
                }
            }
        }
    }
}
