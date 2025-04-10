Page 52193573 Banks
{
    PageType = List;
    SourceTable = Banks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(BankName;"Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(Branch;Branch)
                {
                    ApplicationArea = Basic;
                }
                field(BankCode;"Bank Code")
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

