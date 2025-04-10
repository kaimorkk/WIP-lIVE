

page 95131 "Compliance Framework Section"
{
    PageType = Card;
    SourceTable = "Compliance Framework Section";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Comments"; Rec."No. of Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

