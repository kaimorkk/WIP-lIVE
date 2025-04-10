

page 95072 "Risk Status Rpt Inciden Action"
{
    PageType = Card;
    SourceTable = "Risk Status Rpt Inciden Action";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Line No."; Rec."Incident Line No.")
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
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field("Owner ID"; Rec."Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date"; Rec."Planned Date")
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

