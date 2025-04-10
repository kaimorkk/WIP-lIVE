

page 95050 "RMP Role"
{
    PageType = Card;
    SourceTable = "RMP Role";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
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
                field("Risk Management Team"; Rec."Risk Management Team")
                {
                    ApplicationArea = Basic;
                }
                field("Project Team (Internal Staff)"; Rec."Project Team (Internal Staff)")
                {
                    ApplicationArea = Basic;
                }
                field("Project Team(Contractor Staff)"; Rec."Project Team(Contractor Staff)")
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
    }
}

#pragma implicitwith restore

