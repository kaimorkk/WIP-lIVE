

page 75111 "Procurement Committee Types"
{
    CardPageID = "Procurement Comm Types Card";
    PageType = List;
    SourceTable = "Procurement Committee Types";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Title of Appointing Officer"; Rec."Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Staff Allowed"; Rec."Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                }
                field("Min. No. of Members"; Rec."Min. No. of Members")
                {
                    ApplicationArea = Basic;
                }
                field("Mandate Type"; Rec."Mandate Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Appointments Made"; Rec."No. of Appointments Made")
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
            group(ActionGroup9)
            {
                action("Procurement Committe Composition")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Procurement Comm Composition";
                    RunPageLink = "Committee Type" = field("Committee Type");
                }
                action("Procurement Committee Function")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenterLoad;
                    RunObject = Page "Procurement Committee Function";
                    RunPageLink = "Committee Type" = field("Committee Type");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Procurement Committe Composition_Promoted"; "Procurement Committe Composition")
                {
                }
                actionref("Procurement Committee Function_Promoted"; "Procurement Committee Function")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

