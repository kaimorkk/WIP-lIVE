Page 52193578 "Salaries Buffer"
{
    PageType = List;
    SourceTable = "Salary Processing Buffer";
    SourceTableView = where(Processed=const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(StaffNo;"Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field(BranchReff;"Branch Reff.")
                {
                    ApplicationArea = Basic;
                }
                field(IDNo;"ID No.")
                {
                    ApplicationArea = Basic;
                }
                field(OriginalAccountNo;"Original Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNotFound;"Account Not Found")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo;"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                }
                field(MultipleSalary;"Multiple Salary")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Import)
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000018)
            {
            }
            action("Confirm Account Names")
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000020)
            {
            }
            action("Check for Multiple Salary")
            {
                ApplicationArea = Basic;
            }
            action("Generate Salaries/Allowances Batch")
            {
                ApplicationArea = Basic;
                Caption = 'h';
            }
            separator(Action1000000023)
            {
            }
            action("Generate Advance Batch")
            {
                ApplicationArea = Basic;
            }
            separator(Action1000000025)
            {
            }
            action("Mark as processed")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

