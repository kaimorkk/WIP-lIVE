

page 69450 "HSE Plan Section"
{
    PageType = Card;
    SourceTable = "HSE Plan Section";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Section Type"; Rec."Section Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Revision Date"; Rec."Revision Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revision Date field.';
                }
                field("No. of Comments"; Rec."No. of Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Comments field.';
                }
                field("No. of Initiatives"; Rec."No. of Initiatives")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Initiatives field.';
                }
                field("No. of Guiding Principle Stmts"; Rec."No. of Guiding Principle Stmts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Guiding Principle Stmts field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

