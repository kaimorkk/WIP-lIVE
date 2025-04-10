

page 95030 "Risk Likelihood Rating Scale"
{
    PageType = Card;
    SourceTable = "Risk Rating Scale";
    SourceTableView = where("Risk Rating Scale Type" = filter("Likelihood Rating"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
            part(Control9; "Risk Likeli Rating Scale Lines")
            {
                Caption = 'Likelihood Rating Codes';
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
                    Report.Run(95001, true, true, Rec);
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

