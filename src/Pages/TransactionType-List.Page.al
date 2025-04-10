Page 52193547 "Transaction Type - List"
{
    ApplicationArea = Basic;
    CardPageID = "Transaction Type";
    Editable = false;
    PageType = Card;
    SourceTable = "Transaction Types";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
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
            }
        }
        area(factboxes)
        {
            systempart(Control1000000005;Notes)
            {
            }
            systempart(Control1000000004;MyNotes)
            {
            }
            systempart(Control1000000003;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(TransactionTypeCard)
            {
                Caption = 'Transaction Type Card';
                action(Action1000000001)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Type Card';
                    RunObject = Page "Transaction Type";
                    RunPageLink = No=field(No);
                    ShortCutKey = 'Shift+F7';
                }
            }
        }
    }
}

