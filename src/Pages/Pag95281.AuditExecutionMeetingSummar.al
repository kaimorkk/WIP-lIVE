

page 95281 "Audit Execution Meeting Summar"
{
    PageType = List;
    SourceTable = "Audit Execution Meeting Summar";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Discussed field.';
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summary Notes field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

