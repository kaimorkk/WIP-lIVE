

page 95057 "New Risk Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "New Risk Voucher Line";

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
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Category field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Risk Source ID"; Rec."Risk Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Source ID field.';
                }
                field("Risk Likelihood Code"; Rec."Risk Likelihood Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Code field.';
                }
                field("Risk Impact Code"; Rec."Risk Impact Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Code field.';
                }
                field("Risk Impact Type"; Rec."Risk Impact Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Type field.';
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rate Scale ID field.';
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Rating Scale ID field.';
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Risk Rating Scale ID field.';
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Appetite Rating Scale ID field.';
                }
                field("Risk Likelihood Rating"; Rec."Risk Likelihood Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rating field.';
                }
                field("Risk Likelihood Actual Rating"; Rec."Risk Likelihood Actual Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Actual Rating field.';
                }
                field("Risk Impact Actual Rating"; Rec."Risk Impact Actual Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Actual Rating field.';
                }
                field("Risk Impact Rating"; Rec."Risk Impact Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Rating field.';
                }
                field("Overal Risk Rating"; Rec."Overal Risk Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overal Risk Rating field.';
                }
                field("Overall Risk Level Code"; Rec."Overall Risk Level Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Risk Level Code field.';
                }
                field("Risk Heat Zone"; Rec."Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Heat Zone field.';
                }
                field("Risk Status"; Rec."Risk Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Status field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field("Estimate Fin. Impact (LCY)"; Rec."Estimate Fin. Impact (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Fin. Impact (LCY) field.';
                }
                field("Estimate Delay Impact (Days)"; Rec."Estimate Delay Impact (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Delay Impact (Days) field.';
                }
                field("Gen. Risk Response Strategy"; Rec."Gen. Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Risk Response Strategy field.';
                }
                field("Date Raised"; Rec."Date Raised")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Raised field.';
                }
                field("No. of Planed Risk Resp. Actns"; Rec."No. of Planed Risk Resp. Actns")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planed Risk Resp. Actns field.';
                }
                field("No. of Impacted Project Tasks"; Rec."No. of Impacted Project Tasks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Impacted Project Tasks field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line Functions")
            {
                action("Risk Ownership")
                {
                    ApplicationArea = Basic;
                    Image = Reuse;
                    RunObject = Page "New Risk Line Ownerships";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                    ToolTip = 'Executes the Risk Ownership action.';
                }
                action("Risk Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = Reuse;
                    RunObject = Page "New Risk Line Response Actions";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                    ToolTip = 'Executes the Risk Response Actions action.';
                }
                action("Job Tasks")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Risk Line Job Tasks';
                    Image = Reuse;
                    RunObject = Page "New Risk Line Job Tasks";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  "Risk ID" = field("Risk ID");
                    Visible = false;
                    ToolTip = 'Executes the New Risk Line Job Tasks action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    Visible = false;
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

