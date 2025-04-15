namespace ALProjectLIWPA.ALProjectLIWPA;


page 50080 "Pay Mode"
{
    PageType = List;
    SourceTable = "Pay Mode";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Default; Rec.Default)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("IFT Code"; "IFT Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(isEF; Rec.isEF)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the isEF field.', Comment = '%';
                }



                field(Threshold; Rec.Threshold)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Threshold Amount';
                }
            }
        }
    }
    actions
    {
    }
}

