

page 69316 "Vendor Training Domains"
{
    PageType = ListPart;
    SourceTable = "Vendor Training Domains";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Domain ID"; Rec."Domain ID")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
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

