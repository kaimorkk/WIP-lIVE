Page 52193439 "EFT Header List"
{
    ApplicationArea = Basic;
    // CardPageID = "EFT Card";
    PageType = List;
    SourceTable = "EFT Header";
    SourceTableView = where(Transferred = filter(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(PayeeBankName; "Payee Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(Transferred; Transferred)
                {
                    ApplicationArea = Basic;
                }
                field(DateTransferred; "Date Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(TimeTransferred; "Time Transferred")
                {
                    ApplicationArea = Basic;
                }
                field(TransferredBy; "Transferred By")
                {
                    ApplicationArea = Basic;
                }
                field(DateEntered; "Date Entered")
                {
                    ApplicationArea = Basic;
                }
                field(TimeEntered; "Time Entered")
                {
                    ApplicationArea = Basic;
                }
                field(EnteredBy; "Entered By")
                {
                    ApplicationArea = Basic;
                }
                field(TransactingBranch; "Transacting Branch")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000021; Notes)
            {
            }
            systempart(Control1000000020; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }
        }
    }

    actions
    {
    }
}

