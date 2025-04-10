Page 52193545 "Account Notices"
{
    PageType = Card;
    SourceTable = "Account Notices";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"GL Account")
                {
                    ApplicationArea = Basic;
                }
                field(Penalty;Penalty)
                {
                    ApplicationArea = Basic;
                }
                field(UsePercentage;"Use Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(PercentageOfAmount;"Percentage Of Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Minimum;Minimum)
                {
                    ApplicationArea = Basic;
                }
                field(Maximum;Maximum)
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

