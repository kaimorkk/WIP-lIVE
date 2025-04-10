Page 52193819 "Notification Dates"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Notification Dates1";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(NotificationDateFormula;"Notification Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Notification Date Formula';
                }
                field(AgendasDateFormula;"Agendas Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agendas Date Formula';
                }
                field(CommisionerNoticeFormula;"Commisioner Notice")
                {
                    ApplicationArea = Basic;
                    Caption = 'Commisioner Notice Formula';
                }
                field(OneMonthNotice;"One Month Notice")
                {
                    ApplicationArea = Basic;
                }
                field(TowMonthsNotice;"Tow Months Notice")
                {
                    ApplicationArea = Basic;
                }
                field(ThreeMontsNotice;"Three Monts Notice")
                {
                    ApplicationArea = Basic;
                }
                field(TwoWeeksNotice;"Two Weeks Notice")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("1stQuater";"1st Quater")
                {
                    ApplicationArea = Basic;
                }
                field("2ndQuater";"2nd Quater")
                {
                    ApplicationArea = Basic;
                }
                field("3rdQuater";"3rd Quater")
                {
                    ApplicationArea = Basic;
                }
                field("4thQuater";"4th Quater")
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

