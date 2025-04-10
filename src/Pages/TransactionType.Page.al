Page 52193546 "Transaction Type"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Transaction Types";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate;"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;"Created By")
                {
                    ApplicationArea = Basic;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountTypeName;"Account Type Name")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionCategory;"Transaction Category")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionSpan;"Transaction Span")
                {
                    ApplicationArea = Basic;
                }
                field(LowerLimit;"Lower Limit")
                {
                    ApplicationArea = Basic;
                }
                field(UpperLimit;"Upper Limit")
                {
                    ApplicationArea = Basic;
                }
                field(DefaultMode;"Default Mode")
                {
                    ApplicationArea = Basic;
                }
                field(HasSchedule;"Has Schedule")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1000000016)
            {
            }
            part("transaction charges";"Transaction Charges")
            {
                SubPageLink = "Transaction Type"=field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control1000000020;Notes)
            {
            }
            systempart(Control1000000019;MyNotes)
            {
            }
            systempart(Control1000000018;Links)
            {
            }
        }
    }

    actions
    {
    }
}

