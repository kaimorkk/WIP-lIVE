

page 95354 "Risk Incident Log Action"
{
    PageType = Card;
    SourceTable = "Risk Incident Log Action";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Incident ID"; Rec."Incident ID")
                {
                    ApplicationArea = Basic;
                }
                field("Action Line No."; Rec."Action Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("% Complete"; Rec."% Complete")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer Email"; Rec."Responsible Officer Email")
                {
                    ApplicationArea = Basic;
                }
                field("Task Priority"; Rec."Task Priority")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

