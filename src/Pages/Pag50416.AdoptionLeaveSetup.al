page 50416 "Adoption Leave Setup"
{
    ApplicationArea = All;
    Caption = 'Adoption Leave Setup';
    PageType = List;
    SourceTable = "Adoption Leave Setup";
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field("Min Age"; Rec."Min Age")
                {
                    ToolTip = 'Specifies the value of the Min Age field.';
                    ApplicationArea = All;
                }
                field("Max Age"; Rec."Max Age")
                {
                    ToolTip = 'Specifies the value of the Max Age field.';
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.';
                    ApplicationArea = All;
                }
                field(Days; Rec.Days)
                {
                    ToolTip = 'Specifies the value of the Days field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
