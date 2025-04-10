

page 69220 "Training Applications"
{
    CardPageID = "Training Requisition";
    PageType = List;
    SourceTable = "Training Requests";
    SourceTableView = where(Status = filter(Open | "Pending Approval"), "Funding Source" = const(Internal));


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
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = StrongAccent;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Rec.Provider)
                {
                    ApplicationArea = Basic;
                }

                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Department"; Rec."Employee Department")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Cost"; Rec."Approved Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Start Date"; Rec."Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual End Date"; Rec."Actual End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Created"; Rec."Imprest Created")
                {
                    ApplicationArea = Basic;
                }
                field("Training Plan Cost"; Rec."Training Plan Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                }
                field(Actual; Rec.Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Commitment; Rec.Commitment)
                {
                    ApplicationArea = Basic;
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                }
                field("Local"; Rec."Local")
                {
                    ApplicationArea = Basic;
                }
                field("Requires Flight"; Rec."Requires Flight")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Training Plan No."; Rec."Training Plan No.")
                {
                    ApplicationArea = Basic;
                }
                field("Training Responsibility Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Venue Region Code"; Rec."Training Venue Region Code")
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

