

page 69110 "Welfare Contributions"
{
    CardPageID = "Welfare Contribution Header";
    PageType = List;
    SourceTable = "Hr Welfare Header";
    SourceTableView = where("Welfare Type" = filter(Contribution));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contribution No"; Rec."Welfare No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
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
            action("Import Contributions")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

