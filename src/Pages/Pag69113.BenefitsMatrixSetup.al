

page 69113 "Benefits Matrix Setup"
{
    PageType = List;
    SourceTable = "Benefits Matrix Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Benefit Type"; Rec."Benefit Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Type field.';
                }
                field("Benefit Description"; Rec."Benefit Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Description field.';
                }
                field("Beneficiary Category"; Rec."Beneficiary Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Beneficiary Category field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

