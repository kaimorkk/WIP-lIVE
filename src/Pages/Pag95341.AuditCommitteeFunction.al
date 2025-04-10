

page 95341 "Audit Committee Function"
{
    PageType = List;
    SourceTable = "Audit Committee Function";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Type field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Act Reference"; Rec."Act Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'PPDA Act reference';
                    Visible = false;
                    ToolTip = 'Specifies the value of the PPDA Act reference field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

