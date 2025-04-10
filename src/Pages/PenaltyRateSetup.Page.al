Page 52194304 "Penalty Rate Setup"
{
    PageType = Card;
    SourceTable = "Penalty Rates";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(PenaltyRate;PenaltyRate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Penalty Rate';
                }
                field(LeviesCreditPeriod;LeviesCreditPeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Levies Credit Period';
                }
                field(MaxLegalDays;MaxLegalDays)
                {
                    ApplicationArea = Basic;
                    Caption = 'Maximum Legal Days';
                }
            }
        }
    }

    actions
    {
    }
}

