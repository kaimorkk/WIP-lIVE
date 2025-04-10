

page 95065 "Risk Status Report Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Status Report Line";

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
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Description';
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategic Pillar Description"; Rec."Strategic Pillar Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Likelihood Code"; Rec."Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Likelihood Rating';
                }
                field("Risk Likelihood Actual Rating"; Rec."Risk Likelihood Actual Rating")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Impact Code"; Rec."Risk Impact Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Impact Rating';
                }
                field("Risk Impact Actual Rating"; Rec."Risk Impact Actual Rating")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Fin. Impact (LCY)"; Rec."Estimate Fin. Impact (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Estimate Delay Impact (Days)"; Rec."Estimate Delay Impact (Days)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Gen. Risk Response Strategy"; Rec."Gen. Risk Response Strategy")
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
                    Editable = false;
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
                action("Risk Ownership")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Ownership';
                    Image = Reuse;
                    RunObject = Page "RMP Line Risk Ownerships";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                }
                action("Risk Status Update")
                {
                    ApplicationArea = Basic;
                    Image = Reuse;
                    RunObject = Page "RMP Line Response Actions";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                }
                action("Job Tasks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Budget';
                    Image = Reuse;
                    RunObject = Page "RMP Line Job Tasks";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                    Visible = false;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    Visible = false;
                }
            }
        }
    }
}

#pragma implicitwith restore

