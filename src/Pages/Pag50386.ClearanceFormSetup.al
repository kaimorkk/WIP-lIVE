page 50386 "Clearance Form Setup"
{
    Caption = 'Clearance Form Setup';
    PageType = List;
    SourceTable = "Clearance Form Setup";
    UsageCategory = None;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No field.', Comment = '%';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Section field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
