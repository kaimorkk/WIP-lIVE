

page 75296 "IFS Purchase Activity Schedule"
{
    PageType = List;
    SourceTable = "IFS Purchase Activity Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan ID field.';
                }
                field("PP Entry"; Rec."PP Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PP Entry field.';
                }
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Category field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Default Planned Duration(Days)"; Rec."Default Planned Duration(Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Planned Duration(Days) field.';
                }
                field("Actual Duration (Days)"; Rec."Actual Duration (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Duration (Days) field.';
                }
                field("Planned Dates"; Rec."Planned Dates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Dates field.';
                }
                field("Actual Dates"; Rec."Actual Dates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Dates field.';
                }
                field("Line no"; Rec."Line no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line no field.';
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solicitation Type field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

