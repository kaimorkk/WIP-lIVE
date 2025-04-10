

page 95078 "Overal Risk Level Rating Scale"
{
    PageType = Card;
    SourceTable = "Risk Rating Scale";
    SourceTableView = where("Risk Rating Scale Type" = filter("Overall Risk Rating"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Rating Scale Type field.';
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Scale ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control9; "Overal Risk Rating Scale Lines")
            {
                SubPageLink = "Risk Rating Scale Type" = field("Risk Rating Scale Type"),
                              "Rating Scale ID" = field("Rating Scale ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Rating Scale ID", Rec."Rating Scale ID");
                    Report.Run(95005, true, true, Rec);
                end;
            }
            action("Risk Management Plans")
            {
                ApplicationArea = Basic;
                Image = Planning;
                RunObject = Page "StrategicRisk Management Plans";
                RunPageLink = "Risk Likelihood Rate Scale ID" = field("Rating Scale ID"),
                              Blocked = filter(false);
                ToolTip = 'Executes the Risk Management Plans action.';
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref("Risk Management Plans_Promoted"; "Risk Management Plans")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

