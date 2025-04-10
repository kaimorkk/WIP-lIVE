

page 75003 "Procurement Types"
{
    PageType = List;
    SourceTable = "Procurement Types";
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
            group("&Salesperson")
            {
                Caption = '&Salesperson';
                Image = SalesPerson;
                action(RFIs)
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    RunObject = Page "Request For Information";
                    RunPageLink = "Procurement Type" = field(Code);
                }
                action("Invitation For Supply")
                {
                    ApplicationArea = Basic;
                    Image = InwardEntry;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Procurement Type" = field(Code);
                }
                action(Bids)
                {
                    ApplicationArea = Basic;
                    Image = BinLedger;
                    //  RunObject = Page Bidders;
                }
                action("Prequalification Categories")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOpportunity;
                    RunObject = Page "Procurement Categories";
                    RunPageLink = "Procurement Type" = field(Code);
                }
                action("Procurement Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = OutboundEntry;
                    RunObject = Page "Procurement Plan Lines";
                    RunPageLink = "Procurement Type" = field(Code);
                }
                action("Solicitation Types")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    RunObject = Page "Solicitation Procurement Types";
                    RunPageLink = "Procument Type" = field(Code);
                }
                action("Assigned Quotes")
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Procurement Type" = field(Code);
                }
                action("Assigned Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Procurement Type" = field(Code);
                }
                action("Assigned Purchase Agreements")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Procurement Type" = field(Code);
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref(RFIs_Promoted; RFIs)
                {
                }
                actionref("Invitation For Supply_Promoted"; "Invitation For Supply")
                {
                }
                actionref(Bids_Promoted; Bids)
                {
                }
                actionref("Prequalification Categories_Promoted"; "Prequalification Categories")
                {
                }
                actionref("Procurement Plan Entries_Promoted"; "Procurement Plan Entries")
                {
                }
                actionref("Solicitation Types_Promoted"; "Solicitation Types")
                {
                }
                actionref("Assigned Quotes_Promoted"; "Assigned Quotes")
                {
                }
                actionref("Assigned Purchase Orders_Promoted"; "Assigned Purchase Orders")
                {
                }
                actionref("Assigned Purchase Agreements_Promoted"; "Assigned Purchase Agreements")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

