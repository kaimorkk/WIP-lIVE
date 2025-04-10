Page 52193808 "Case Hearing Alert!!!"
{
    PageType = Card;
    SourceTable = "Litigation Schedule1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(HearingDate;"Hearing Date")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Time;Time)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(Details;Details)
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
                field(LitigationCode;"Litigation Code")
                {
                    ApplicationArea = Basic;
                    Style = Attention;
                    StyleExpr = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(View)
            {
                ApplicationArea = Basic;
                Caption = 'View';

                trigger OnAction()
                begin
                    Litigation.Reset;
                    Litigation.SetRange(Litigation."Case No.","Litigation Code");
                    Page.Run(51511038,Litigation);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(View_Promoted; View)
                {
                }
            }
        }
    }

    var
        Litigation: Record Litigations1;
}

