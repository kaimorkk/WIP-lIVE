page 50382 "Position Targets"
{
    ApplicationArea = All;
    Caption = 'Position Targets';
    PageType = List;
    SourceTable = "Position Targets";
    UsageCategory = Lists;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Strategic Objective"; Rec."Strategic Objective")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategic Objective field.', Comment = '%';
                }
                field(KPI; Rec.KPI)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the KPI field.', Comment = '%';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit of Measure field.', Comment = '%';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Assigned Weight (%)"; Rec."Assigned Weight (%)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assigned Weight field.';
                }

            }
        }
    }
}
