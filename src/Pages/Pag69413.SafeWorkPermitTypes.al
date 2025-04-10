

page 69413 "Safe Work Permit Types"
{
    CardPageID = "Safe Work Permit Type";
    Editable = false;
    PageType = List;
    SourceTable = "Safe Work Permit Type";
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
                field("No. of Safe Work Permit Apps"; Rec."No. of Safe Work Permit Apps")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Compl Reports"; Rec."No. of Safe Work Compl Reports")
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

