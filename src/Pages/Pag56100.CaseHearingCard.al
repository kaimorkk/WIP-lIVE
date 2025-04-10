

page 56100 "Case Hearing Card"
{
    PageType = Card;
    SourceTable = "Case Hearing";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Entry"; Rec."Case Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Entry field.';
                }
                field("Last Hearing Date"; Rec."Last Hearing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Hearing Date field.';
                }
                field(Progress; Rec.Progress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Progress field.';
                }
                field("Next Hearing Date"; Rec."Next Hearing Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next Mention  Date';
                    ToolTip = 'Specifies the value of the Next Mention  Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

