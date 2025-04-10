

page 95099 "Project Register Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Management Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Likelihood Code"; Rec."Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Code"; Rec."Risk Impact Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Fin. Impact (LCY)"; Rec."Estimate Fin. Impact (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Delay Impact (Days)"; Rec."Estimate Delay Impact (Days)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Operational (Days)"; Rec."Operational (Days)")
                {
                    ApplicationArea = Basic;
                }
                field(Reputational; Rec.Reputational)
                {
                    ApplicationArea = Basic;
                }
                field("Legal or Compliance"; Rec."Legal or Compliance")
                {
                    ApplicationArea = Basic;
                }
                field("Health & Safety"; Rec."Health & Safety")
                {
                    ApplicationArea = Basic;
                }
                field("Gen. Risk Response Strategy"; Rec."Gen. Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                }
                field("Date Raised"; Rec."Date Raised")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Status"; Rec."Risk Status")
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed"; Rec."Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Likelihood Rating"; Rec."Risk Likelihood Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Rating"; Rec."Risk Impact Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Overal Risk Rating"; Rec."Overal Risk Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Risk Level Code"; Rec."Overall Risk Level Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Heat Zone"; Rec."Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                action("Risk Ownership")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    RunObject = Page "RMP Line Risk Ownerships";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                }
                action("Risk Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    RunObject = Page "RMP Line Response Actions";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                }
                action("Job Tasks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget';
                    Image = JobLines;
                    RunObject = Page "RMP Line Job Tasks";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Dimension Set Entries";
                    Visible = false;
                }
                action("Residual Risk")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Residual Risk Rating";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID"),
                                  "Risk Title" = field("Risk Title");
                }
                action("Existing Controls")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Existing Control Measures";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID"),
                                  "Risk Title" = field("Risk Title");
                    Visible = false;
                }
            }
        }
    }
}

#pragma implicitwith restore

