page 50172 "Recruitment Salary Benefits"
{
    ApplicationArea = All;
    Caption = 'Recruitment Salary Benefits';
    PageType = List;
    SourceTable = "Recruitment Salary Benefits";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ED Code"; Rec."ED Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ED Code field.';
                }
                field("ED Description"; Rec."ED Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ED Description field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Based On"; Rec."Based On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Based On field.';
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }

                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
            }
        }
    }
}
