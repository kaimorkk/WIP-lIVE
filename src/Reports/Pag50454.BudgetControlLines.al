page 50454 "Budget Control Lines"
{
    Caption = 'Budget Control Lines';
    PageType = ListPart;
    SourceTable = "Budget Control Lines";
    DeleteAllowed = false;
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
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Budget field.', Comment = '%';
                }
                field("Current Balance"; Rec."Current Balance")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Current Balance field.', Comment = '%';
                }
                field("Cut Percentage"; Rec."Cut Percentage")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cut Percentage field.', Comment = '%';
                }
                field("New Budget Balance"; Rec."New Budget Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the New Budget Balance field.', Comment = '%';
                }
                field("Quarter budget"; Rec."Quarter budget")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter budget field.', Comment = '%';
                }
                field("Quarter After Cut"; Rec."Quarter After Cut")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Qtr Amount After Cut field.', Comment = '%';
                }
                field("Quarter Access Percent"; Rec."Quarter Access Percent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter Access Percent field.', Comment = '%';
                }
                field("Quarter Access Amount"; Rec."Quarter Access Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter Access Amount field.', Comment = '%';
                }
            }
        }
    }
}
