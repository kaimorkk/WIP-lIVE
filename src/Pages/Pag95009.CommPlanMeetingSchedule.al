

page 95009 "Comm Plan Meeting Schedule"
{
    PageType = Card;
    SourceTable = "Comm Plan Meeting Schedule";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Meeting ID"; Rec."Meeting ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting ID field.';
                }
                field("Communication Type"; Rec."Communication Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Meeting Medium"; Rec."Meeting Medium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Medium field.';
                }
                field("Primary Owner"; Rec."Primary Owner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Owner field.';
                }
                field("Planned Meeting Date"; Rec."Planned Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Meeting Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

