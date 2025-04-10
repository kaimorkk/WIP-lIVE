

page 69504 "Emergency Drill Evacuation Lin"
{
    PageType = ListPart;
    SourceTable = "Emergency Drill Evacuation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evacuation Procedure ID"; Rec."Evacuation Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Procedure ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Compliance Status"; Rec."Compliance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Status field.';
                }
                field("Drill Obeservations"; Rec."Drill Obeservations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Obeservations field.';
                }
                field("No. of Recommended Actions"; Rec."No. of Recommended Actions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Recommended Actions field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

