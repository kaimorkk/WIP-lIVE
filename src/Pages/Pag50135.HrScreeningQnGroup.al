page 50135 "Hr Screening Qn Group"
{
    ApplicationArea = All;
    Caption = 'Hr Screening Qn Group';
    PageType = List;
    SourceTable = "Hr Screening Qn Group";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Header No."; Rec."Header No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Header No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Category"; Rec."Question Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Question Category field.';
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Questions field.';
                }
                field("Template Type"; Rec."Template Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Template Type field.';
                }
                field("Total Weight"; Rec."Total Weight")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Weight field.';
                }
            }
        }
    }
}
