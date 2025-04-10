

page 75097 "Tender Document Source"
{
    PageType = List;
    SourceTable = "Tender Document Source";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Url Link"; Rec."Url Link")
                {
                    ApplicationArea = Basic;
                }
                field("Default IFS Bid Charge Code"; Rec."Default IFS Bid Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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

#pragma implicitwith restore

