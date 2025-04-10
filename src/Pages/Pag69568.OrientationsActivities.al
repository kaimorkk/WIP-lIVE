page 69568 "Orientations Activities"
{
    // ApplicationArea = All;
    Caption = 'Orientations Activities';
    PageType = ListPart;
    SourceTable = "Orientations Activities";
    // UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Content/Course"; Rec."Content/Course")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Content/Course field.';
                }
                field(Objectives; Rec.Objectives)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Objectives field.';
                }
                field(Facilitator; Rec.Facilitator)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Facilitator field.';
                }
                field("Facilitator Name"; Rec."Facilitator Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Facilitator Name field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Time field.';
                }

                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
            }
        }
    }
}
