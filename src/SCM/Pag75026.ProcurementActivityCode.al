

page 75026 "Procurement Activity Code"
{
    PageType = List;
    SourceTable = "Procurement Activity Code";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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
        area(navigation)
        {
            action("Procurement Plan Schedule")
            {
                ApplicationArea = Basic;
                Image = Planning;
                RunObject = Page "PP Purchase Activity Schedule";
                RunPageLink = "Activity Code" = field("Activity Code");
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Procurement Plan Schedule_Promoted"; "Procurement Plan Schedule")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

