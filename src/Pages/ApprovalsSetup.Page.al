Page 52193524 "Approvals Setup"
{
    PageType = List;
    SourceTable = "Approvals Set Up";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ApprovalType;"Approval Type")
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000003;Stage)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(DurationHr;"Duration (Hr)")
                {
                    ApplicationArea = Basic;
                }
                field(Station;Station)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Users)
            {
                ApplicationArea = Basic;
                RunObject = Page "Approvals Users Setup";
                RunPageLink = "Approval Type"=field("Approval Type"),
                              Stage=field(Stage);
            }
        }
    }
}

