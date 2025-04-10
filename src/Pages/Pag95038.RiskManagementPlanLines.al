

page 95038 "Risk Management Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Management Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Category';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strategic Pillars';
                    Editable = true;
                }
                field("Risk Likelihood Code"; Rec."Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Likelihood Rating"; Rec."Risk Likelihood Rating")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Risk Likelihood Actual Rating"; Rec."Risk Likelihood Actual Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Code"; Rec."Risk Impact Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Rating"; Rec."Risk Impact Rating")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Risk Impact Actual Rating"; Rec."Risk Impact Actual Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Risk Level Code"; Rec."Overall Risk Level Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Overal Risk Rating"; Rec."Overal Risk Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Heat Zone"; Rec."Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Risk Appetite"; Rec."Risk Appetite")
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
                                  "Risk ID" = field("Risk ID"),
                                  "Risk Title" = field("Risk Title");
                }
                action("Risk Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    RunObject = Page "RMP Line Response Actions";
                    RunPageLink = "Risk ID" = field("Risk ID"),
                                  "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No");
                }
                action("Line Dimensions")
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Dimension Set Entries";
                    Visible = false;
                }
                action("Residuall Risk Rating")
                {
                    ApplicationArea = Basic;
                    Image = Image;
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

