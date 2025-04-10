Page 52193584 "Salaries Buffer - Processed"
{
    PageType = List;
    SourceTable = "Salary Processing Buffer";
    SourceTableView = where(Processed=const(true));

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
                field(Processed;Processed)
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
                field(Reversed;Reversed)
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
            }
        }
    }

    actions
    {
    }
}

