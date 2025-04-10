

page 95230 "Audit Template Default Risk Li"
{
    PageType = ListPart;
    SourceTable = "Audit Template Default Risk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Line Risk ID"; Rec."Line Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Risk ID field.';
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Title field.';
                }
                field("Risk Category"; Rec."Risk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Category field.';
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
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Register Type field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Gen. Risk Response Strategy"; Rec."Gen. Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Risk Response Strategy field.';
                }
                field("No. of Controls"; Rec."No. of Controls")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Controls field.';
                }
                field("No. of Audit Procedures"; Rec."No. of Audit Procedures")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Procedures field.';
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
                action("Audit Template Default Control")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    RunObject = Page "Audit Template Defaul Controls";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Risk ID" = field("Line Risk ID");
                    ToolTip = 'Executes the Audit Template Default Control action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

