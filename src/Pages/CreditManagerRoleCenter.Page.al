Page 52193473 "Credit Manager Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                // part(Control1000000002;"Loans List-Bosa")
                // {
                // }
            }
            group(Control1900724708)
            {
                part("<My Member List>"; "My Members")
                {
                }
                // part("<My Loan List>";"My Loan Product List")
                // {
                // }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(CustomerOrderSummary)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - &Order Summary';
                Image = "Report";
                RunObject = Report "Customer - Order Summary";
            }
            action(CustomerTop10List)
            {
                ApplicationArea = Basic;
                Caption = 'Customer - &Top 10 List';
                Image = "Report";
                RunObject = Report "Customer - Top 10 List";
            }
            separator(Action17)
            {
            }
            action(SalesStatistics)
            {
                ApplicationArea = Basic;
                Caption = 'S&ales Statistics';
                Image = "Report";
                RunObject = Report "Sales Statistics";
            }
            separator(Action22)
            {
            }
            action(CampaignDetails)
            {
                ApplicationArea = Basic;
                Caption = 'Campaign - &Details';
                Image = "Report";
                RunObject = Report "Campaign - Details";
            }
        }
        area(embedding)
        {
            action(Open)
            {
                ApplicationArea = Basic;
                Caption = 'Open';
                Image = Edit;
                RunObject = Page "Sales Order List";
                RunPageView = where(Status = filter(Open));
                ShortCutKey = 'Return';
            }
            action(SalesInvoices)
            {
                ApplicationArea = Basic;
                Caption = 'Sales Invoices';
                Image = Invoice;
                RunObject = Page "Sales Invoice List";
            }
            action(Action16)
            {
                ApplicationArea = Basic;
                Caption = 'Open';
                Image = Edit;
                RunObject = Page "Sales Invoice List";
                RunPageView = where(Status = filter(Open));
                ShortCutKey = 'Return';
            }
            action(Items)
            {
                ApplicationArea = Basic;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
            }
            action(Contacts)
            {
                ApplicationArea = Basic;
                Caption = 'Contacts';
                Image = CustomerContact;
                RunObject = Page "Contact List";
            }
            action("<Page Member List>")
            {
                ApplicationArea = Basic;
                Caption = 'Member List';
                Image = Customer;
                Visible = false;
                // RunObject = Page "Member List";
            }
            action(Segments)
            {
                ApplicationArea = Basic;
                Caption = 'Segments';
                Image = Segment;
                RunObject = Page "Segment List";
            }
            action(Todos)
            {
                ApplicationArea = Basic;
                Caption = 'To-dos';
                Image = TaskList;
                RunObject = Page "Task List";
            }
            action(Teams)
            {
                ApplicationArea = Basic;
                Caption = 'Teams';
                Image = TeamSales;
                RunObject = Page Teams;
            }
        }
        area(sections)
        {
            group(AdministrationSalesPurchase)
            {
                Caption = 'Administration Sales/Purchase';
                Image = AdministrationSalesPurchases;
                action(SalespeoplePurchasers)
                {
                    ApplicationArea = Basic;
                    Caption = 'Salespeople/Purchasers';
                    RunObject = Page "Salespersons/Purchasers";
                }
                action(CustInvoiceDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cust. Invoice Discounts';
                    RunObject = Page "Cust. Invoice Discounts";
                }
                action(VendInvoiceDiscounts)
                {
                    ApplicationArea = Basic;
                    Caption = 'Vend. Invoice Discounts';
                    RunObject = Page "Vend. Invoice Discounts";
                }
                action(ItemDiscGroups)
                {
                    ApplicationArea = Basic;
                    Caption = 'Item Disc. Groups';
                    RunObject = Page "Item Disc. Groups";
                }
            }
        }
        area(processing)
        {
            separator(Action48)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
        }
    }
}

