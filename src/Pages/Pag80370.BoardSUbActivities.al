

page 80370 "Board SUb Activities"
{
    PageType = ListPart;
    SourceTable = "Board Sub Activities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub-Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective/Initiative field.';
                }
                field("Sub-Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Outcome Perfomance Indicator field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Completion Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

