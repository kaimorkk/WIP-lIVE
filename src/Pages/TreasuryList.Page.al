Page 52193539 "Treasury List"
{
    ApplicationArea = Basic;
    CardPageID = "Treasury Card";
    PageType = List;
    SourceTable = "Bank Account";
    // SourceTableView = where("Account Type"=const(Treasury));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                // field(CashierID;"Cashier ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(MaximumTellerWithholding;"Maximum Teller Withholding")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(MaxWithdrawalLimit;"Max Withdrawal Limit")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(MaxDepositLimit;"Max Deposit Limit")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005; Links)
            {
                Visible = true;
            }
            systempart(Control1000000004; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

