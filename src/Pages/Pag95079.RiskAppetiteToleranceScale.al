

page 95079 "Risk Appetite/Tolerance Scale"
{
    PageType = Card;
    SourceTable = "Risk Rating Scale";
    SourceTableView = where("Risk Rating Scale Type" = filter("Risk Appetite Rating"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control9; "Risk Appeti Rating Scale Lines")
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

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Rating Scale ID", Rec."Rating Scale ID");
                    Report.Run(95006, true, true, Rec);
                end;
            }
            action("Risk Management Plans")
            {
                ApplicationArea = Basic;
                Image = Planning;
                RunObject = Page "StrategicRisk Management Plans";
                RunPageLink = "Risk Likelihood Rate Scale ID" = field("Rating Scale ID"),
                              Blocked = filter(false);
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

