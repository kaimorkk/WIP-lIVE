page 50474 "Supplementary Line"
{
    Caption = 'Supplementary Lines';
    PageType = ListPart;
    SourceTable = "Supplementary Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Amount field.', Comment = '%';
                }
                field("Adjustment Percentage"; Rec."Adjustment Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Adjustment Percentage field.', Comment = '%';
                }
                field("New Supplementary Ceiling"; Rec."New Supplementary Ceiling")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Supplementary Ceiling field.', Comment = '%';
                }
                field("Applies To All"; Rec."Applies To All")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Applies To All field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(UnitControl)
            {
                Caption = 'Unit Specific Controls';
                ApplicationArea = All;
                RunObject = Page "Unit Specific Controls";
                RunPageLink = No = field(No), "Line No" = field("Line No");
            }
        }
    }
}
