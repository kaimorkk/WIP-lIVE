

page 75251 "IFS Prebid Summary Note"
{
    PageType = List;
    SourceTable = "IFS Prebid Summary Note";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Prebid Register ID"; Rec."Prebid Register ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prebid Register ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Discussed field.';
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summary Notes field.';
                }
                field("Referenced Section of Tender"; Rec."Referenced Section of Tender")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referenced Section of Tender Document field.';
                }
                field("Referenced Clause of Tender"; Rec."Referenced Clause of Tender")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referenced Clause of Tender Document field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

