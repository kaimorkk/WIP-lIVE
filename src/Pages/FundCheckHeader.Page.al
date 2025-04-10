Page 50045 "Fund Check Header"
{
    PageType = Card;
    SourceTable = "Fund Check Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Period;Period)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(UserID;"User ID")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000006;"Fund Check Lines")
            {
                SubPageLink = Period=field(Period);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Accounts)
            {
                Caption = 'Accounts';
                action(SuggestAccount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Account';

                    trigger OnAction()
                    begin
                          AccountSugestion.GetPeriod(Rec);
                         AccountSugestion.Run;
                    end;
                }
            }
        }
    }

    var
        AccountSugestion: Report "Accounts Suggestion";
}

