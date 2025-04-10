

page 95133 "Compliance Section Comment"
{
    PageType = Card;
    SourceTable = "Compliance Section Comment";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Framework ID"; Rec."Framework ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework ID field.';
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
                field("Comment No."; Rec."Comment No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

