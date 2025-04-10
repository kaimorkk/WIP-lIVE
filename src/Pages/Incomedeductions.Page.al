Page 52193597 "Income deductions"
{
    PageType = List;
    SourceTable = "Income Processing Deductions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(VendorNo;"Vendor No")
                {
                    ApplicationArea = Basic;
                }
                field(LoanNo;"Loan No")
                {
                    ApplicationArea = Basic;
                }
                field(LoanType;"Loan Type")
                {
                    ApplicationArea = Basic;
                }
                field(TotalRepayment;"Total Repayment")
                {
                    ApplicationArea = Basic;
                }
                field(Principal;Principal)
                {
                    ApplicationArea = Basic;
                }
                field(Interest;Interest)
                {
                    ApplicationArea = Basic;
                }
                field(Appraisal;Appraisal)
                {
                    ApplicationArea = Basic;
                }
                field(Penalties;Penalties)
                {
                    ApplicationArea = Basic;
                }
                field(CIDNO;"CID NO")
                {
                    ApplicationArea = Basic;
                }
                field(Source;Source)
                {
                    ApplicationArea = Basic;
                }
                field(KTDANo;"KTDA No.")
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

