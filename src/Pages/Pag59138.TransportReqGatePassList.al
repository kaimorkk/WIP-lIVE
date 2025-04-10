

page 59138 "Transport Req Gate Pass List"
{
    CardPageID = "Fleet Req Gate Pass Card";
    PageType = List;
    SourceTable = "Transport Req Gate Pass";
    SourceTableView = where(Status = filter(Open | "Pending Approval" | Rejected | Cancelled));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Gate Pass Serial No"; Rec."Gate Pass Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Gate Pass")
            {
                ApplicationArea = Basic;
                //       RunObject = Report "Gate Pass";
            }
        }
    }
}

#pragma implicitwith restore

