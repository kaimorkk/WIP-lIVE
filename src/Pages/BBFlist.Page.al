Page 52193500 "BBF list"
{
    PageType = List;
    SourceTable = "BBF Paid Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EntryNo;"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(MemberNo;"Member No")
                {
                    ApplicationArea = Basic;
                }
                field(StaffNo;"Staff No")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(AmountTaken;"Amount Taken")
                {
                    ApplicationArea = Basic;
                }
                field(AmountPaid;"Amount Paid")
                {
                    ApplicationArea = Basic;
                }
                field(Year;Year)
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

