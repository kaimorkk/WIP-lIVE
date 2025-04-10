

page 95018 "Risk Category"
{
    PageType = Card;
    SourceTable = "Risk Category";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic Pillars';
                }
                field("Addditiona Comments"; Rec."Addditiona Comments")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Triggers"; Rec."No. of Risk Triggers")
                {
                    ApplicationArea = Basic;
                }
                field("No of Strategic Risks"; Rec."No of Strategic Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Operational Risks"; Rec."No of Operational Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No of Project Risks"; Rec."No of Project Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Incidents"; Rec."No. of Incidents")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Risk Triggers")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerBill;
                RunObject = Page "Risk Category Triggers";
                RunPageLink = "Risk Category ID" = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Risk Triggers_Promoted"; "Risk Triggers")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

