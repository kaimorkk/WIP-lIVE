page 50484 "Strategy Output"
{
    Caption = 'Strategy Output';
    PageType = List;
    SourceTable = "Strategy Output";
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
                field(Outputs; Rec.Outputs)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Outputs field.', Comment = '%';
                }
                field("Output Indicators"; Rec."Output Indicators")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Output Indicators field.', Comment = '%';
                }
            }
        }
    }
}
