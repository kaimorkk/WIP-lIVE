

page 56110 "Confirm Verdict"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Case Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Verdict; Rec.Verdict)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Status field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        Rec.TestField(Verdict);
    end;
}

#pragma implicitwith restore

