

page 95024 "Risk Management Role"
{
    PageType = Card;
    SourceTable = "Risk Management Role";

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
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Def Responsibilities"; Rec."No. of Def Responsibilities")
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
            action("Risk Responsibilities")
            {
                ApplicationArea = Basic;
                Caption = 'Risk Responsibilities';
                Image = Restore;
                RunObject = Page "Risk Mgt. Responsibilities";
                RunPageLink = "Role ID" = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Risk Responsibilities_Promoted"; "Risk Responsibilities")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

