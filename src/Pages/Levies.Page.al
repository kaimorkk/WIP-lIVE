Page 52194306 Levies
{
    PageType = Card;
    SourceTable = Levy;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(LevyNo;LevyNo)
                {
                    ApplicationArea = Basic;
                }
                field(LevyTypeCode;LevyTypeCode)
                {
                    ApplicationArea = Basic;
                }
                field("Scheme No.";"CustomerNo.")
                {
                    ApplicationArea = Basic;
                }
                field("Shceme Name";Name)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(AssociatedLevyReferenceNo;"AssociatedLevyReference No")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(DueDate;DueDate)
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;PostingDate)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        d: Date;
}

