Page 52194418 "Fees Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Fees;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(LevyCode;"Levy Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(Limited;Limited)
                {
                    ApplicationArea = Basic;
                }
                field(MinimumAmount;"Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(MaximumAmount;"Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType;"Transaction Type")
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

