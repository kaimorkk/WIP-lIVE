Page 52193462 "Bosa Product Card"
{
    PageType = Card;
    SourceTable = "Bosa Products";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(ProductName;"Product Name")
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
                    Visible = false;
                }
                field(DefaultGrouping;"Default Grouping")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccountNo;"G/L Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccountName;"G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(UsedtoGuaranteeLoans;"Used to Guarantee Loans")
                {
                    ApplicationArea = Basic;
                }
                field(ShareCapital;"Share Capital")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Others)
            {
                Caption = 'Others';
                field(MaxNonContributionPeriods;"Max. Non Contribution Periods")
                {
                    ApplicationArea = Basic;
                }
                field(MinContribution;"Min. Contribution")
                {
                    ApplicationArea = Basic;
                }
                field(Dividends;Dividends)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
           
            part(Control1000000007;"Dimensions FactBox")
            {
                SubPageLink = "Table ID"=const(51507096),
                              "No."=field(Code);
                Visible = false;
            }
            systempart(Control1000000006;Links)
            {
                Visible = true;
            }
            systempart(Control1000000005;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

