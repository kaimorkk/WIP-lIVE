page 70152 "PMMU Output Activities"
{
    ApplicationArea = All;
    Caption = 'PMMU Output Activities';
    PageType = List;
    SourceTable = "PMMU Output Activities";
    UsageCategory = Lists;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Strategy Output Code"; Rec."Strategy Output Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Strategy Output Code field.', Comment = '%';
                }
                field(Activities; Rec.Activities)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Activities field.', Comment = '%';
                }
                field("Sub Weights"; Rec."Sub Weights")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Weights field.';
                }
                field("Achieved Targets"; Rec."Achieved Targets")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Achieved Targets field.';
                }


            }
        }
    }
}
