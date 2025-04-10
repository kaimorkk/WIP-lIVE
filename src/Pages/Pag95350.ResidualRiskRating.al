

page 95350 "Residual Risk Rating"
{
    PageType = List;
    SourceTable = "Residual Risk Rating";

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
                    Visible = false;
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Description';
                }
                field("Residual Risk"; Rec."Residual Risk")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Likelihood Code"; Rec."Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Code"; Rec."Risk Impact Code")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Risk Level Code"; Rec."Overall Risk Level Code")
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
                field("Risk Likelihood Rating"; Rec."Risk Likelihood Rating")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Risk Impact Rating"; Rec."Risk Impact Rating")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Overal Risk Rating"; Rec."Overal Risk Rating")
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
    }
}

#pragma implicitwith restore

