Page 52193577 "EFT Details"
{
    PageType = List;
    SourceTable = "EFT Details";
    SourceTableView = sorting("Header No",No);

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;"Destination Account Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(DestinationAccountNo;"Destination Account No")
                {
                    ApplicationArea = Basic;
                }
                field(DestinationAccountName;"Destination Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(BankNo;"Bank No")
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

