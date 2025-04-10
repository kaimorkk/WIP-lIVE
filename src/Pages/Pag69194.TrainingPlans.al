

page 69194 "Training Plans"
{
    CardPageID = "Training Plan Header";
    Editable = false;
    PageType = List;
    SourceTable = "Training Plan Header";
    SourceTableView = where("Approved Status" = filter(Open | "Pending Approval"));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Status"; Rec."Approved Status")
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
                field("Total Estimated Cost"; Rec."Total Estimated Cost")
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

