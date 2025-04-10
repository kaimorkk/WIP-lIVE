

page 75004 "Solicitation Type"
{
    PageType = List;
    SourceTable = "Solicitation Type";
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
                field("Default Procurement Method"; Rec."Default Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Set"; Rec."Supplier Set")
                {
                    ApplicationArea = Basic;
                }
                field("Preliminary RFI"; Rec."Preliminary RFI")
                {
                    ApplicationArea = Basic;
                }
                field("Default Bid Selection Method"; Rec."Default Bid Selection Method")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Evaluation Template"; Rec."Bid Evaluation Template")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Invitations"; Rec."No. of Invitations")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup28)
            {
                Image = SalesPerson;
                action("Solicitation Schedule")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    RunObject = Page "Solicitation Activity Schedule";
                    RunPageLink = "Solicitation Type ID" = field(Code);
                }
                action(RFIs)
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    RunObject = Page "Request For Information";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Invitation For Supply")
                {
                    ApplicationArea = Basic;
                    Image = InwardEntry;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action(Quotes)
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Purchase Agreements")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Procurement Types")
                {
                    ApplicationArea = Basic;
                    Image = Allocate;
                    RunObject = Page "Solicitation Procurement Types";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Procurement Activities")
                {
                    ApplicationArea = Basic;
                    Image = CapacityLedger;
                    RunObject = Page "Solicitation Activity Schedule";
                    RunPageLink = "Solicitation Type ID" = field(Code);
                }
                action("Procurement plan entries")
                {
                    ApplicationArea = Basic;
                    Image = EntriesList;
                    RunObject = Page "Procurement Plan Entry";
                    RunPageLink = "Solicitation Type" = field(Code);
                }
                action("Submitted Bids")
                {
                    ApplicationArea = Basic;
                    Image = Bin;
                    //  RunObject = Page Bidders;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Submitted Bids_Promoted"; "Submitted Bids")
                {
                }
                actionref("Solicitation Schedule_Promoted"; "Solicitation Schedule")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(RFIs_Promoted; RFIs)
                {
                }
                actionref("Invitation For Supply_Promoted"; "Invitation For Supply")
                {
                }
                actionref(Quotes_Promoted; Quotes)
                {
                }
                actionref("Purchase Orders_Promoted"; "Purchase Orders")
                {
                }
                actionref("Purchase Agreements_Promoted"; "Purchase Agreements")
                {
                }
                actionref("Procurement Types_Promoted"; "Procurement Types")
                {
                }
                actionref("Procurement Activities_Promoted"; "Procurement Activities")
                {
                }
                actionref("Procurement plan entries_Promoted"; "Procurement plan entries")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

