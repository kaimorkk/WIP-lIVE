

page 80055 "Initiative Predecessor"
{
    PageType = List;
    SourceTable = "Initiative Predecessor";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No."; Rec."Workplan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No. field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiative No. field.';
                }
                field("Preceeding Initiative"; Rec."Preceeding Initiative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preceeding Initiative field.';
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

