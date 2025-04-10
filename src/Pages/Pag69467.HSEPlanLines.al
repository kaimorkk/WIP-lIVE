

page 69467 "HSE Plan Lines"
{
    PageType = ListPart;
    SourceTable = "HSE Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Hazard ID"; Rec."Hazard ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Hazard ID field.';
                }
                field("Hazard Type"; Rec."Hazard Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Hazard Category"; Rec."Hazard Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Category field.';
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Risk Management Plan ID field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
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
                field("Risk Likelihood Rating ScaleID"; Rec."Risk Likelihood Rating ScaleID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rating ScaleID field.';
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
                field("Risk Impact Rating"; Rec."Risk Impact Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Impact Rating field.';
                }
                field("Overall Risk Rating"; Rec."Overall Risk Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Risk Rating field.';
                }
                field("Overall Risk Level Code"; Rec."Overall Risk Level Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Risk Level Code field.';
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
                action("Hazard Control Measures")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    RunObject = Page "HSE Plan Line Hazard Controls";
                    //  RunPageLink = "Plan ID" = field("Plan ID"),
                    //             "Hazard ID" = field("Hazard ID");
                    ToolTip = 'Executes the Hazard Control Measures action.';
                }
                action("Risk Identification Entries")
                {
                    ApplicationArea = Basic;
                    Image = Entries;
                    ToolTip = 'Executes the Risk Identification Entries action.';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

