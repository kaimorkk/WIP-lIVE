Page 52193448 "Share Transfer Lines"
{
    AutoSplitKey = false;
    PageType = ListPart;
    SourceTable = "Share Transfer Lines";

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
                field(SourceMemberNo;"Source Member No.")
                {
                    ApplicationArea = Basic;
                }
                field(SourceMemberName;"Source Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(SourceProductCode;"Source Product Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(DestinationMemberNo;"Destination Member No.")
                {
                    ApplicationArea = Basic;
                }
                field(DestinationMemberName;"Destination Member Name")
                {
                    ApplicationArea = Basic;
                }
                field(DestinationProductCode;"Destination Product Code")
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

