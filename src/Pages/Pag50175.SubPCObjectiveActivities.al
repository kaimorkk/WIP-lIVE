page 50175 "Sub PC Objective Activities"
{
    Caption = 'Sub PC Objective Activities';
    PageType = ListPart;
    SourceTable = "Sub PC Objective Activities";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Sub Activity"; Rec."Sub Activity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sub Activity field.';
                }
            }
        }
    }
}
