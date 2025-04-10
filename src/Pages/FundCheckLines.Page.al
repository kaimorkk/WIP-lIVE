Page 50046 "Fund Check Lines"
{
    PageType = ListPart;
    SourceTable = "Fund Check Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(AccountNo;"Account No.")
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
                field(Check;Check)
                {
                    ApplicationArea = Basic;
                }
                field(Period;Period)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period Start';
                }
                field(PeriodEnd;"Period End")
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

