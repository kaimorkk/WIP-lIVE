Page 52193716 "Petty Cash Lines111"
{
    PageType = List;
    SourceTable = "Petty Cash Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
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

