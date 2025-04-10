page 50475 "Workplan Revision Lines1"
{
    Caption = 'Workplan Revision Lines';
    PageType = ListPart;
    SourceTable = "Workplan Revision Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan No field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Budget Item"; Rec."Budget Item")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Item field.', Comment = '%';
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
