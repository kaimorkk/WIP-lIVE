Page 52193464 "Group Members"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Group Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(IDNo;"ID No.")
                {
                    ApplicationArea = Basic;
                }
                field(MemberName;"Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(ConstituencyCode;"Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(TelephoneNo;"Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field(DOB;DOB)
                {
                    ApplicationArea = Basic;
                }
                field(AgeofMember;"Age of Member")
                {
                    ApplicationArea = Basic;
                }
                field(Memberof;"Member of")
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

