report 50136 "Draft Procurement Plan"
{
    Caption = 'Draft Procurement Plan';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Draft Procurement Plan.rdlc';
    dataset
    {
        dataitem("Annual Strategy Workplan"; "Annual Strategy Workplan")
        {

            RequestFilterFields = "Strategy Plan ID";
            dataitem(WorkplanWorkings; "Workplan Workings")
            {
                DataItemLink = "Strategy Plan ID" = field(No);
                DataItemTableView = where(Type = const(Procurable));

                column(Type; "Type")
                {
                }
                column(ItemNo; "Item No")
                {
                }
                column(Description; Description)
                {
                }
                column(UnitCost; "Unit Cost")
                {
                }
                column(Unit; Unit)
                {
                }
                column(UnitofMeasure; "Unit of Measure")
                {
                }
                column(TotalAmount; "Total Amount")
                {
                }
                column(BudgetItem; "Budget Item")
                {
                }
                column(Q1Quantity; "Q1 Quantity")
                {
                }
                column(Q2Quantity; "Q2 Quantity")
                {
                }
                column(Q3Quantity; "Q3 Quantity")
                {
                }
                column(Q4Quantity; "Q4 Quantity")
                {
                }
                column(Q1Amount; "Q1 Amount")
                {
                }
                column(Q2Amount; "Q2 Amount")
                {
                }
                column(Q3Amount; "Q3 Amount")
                {
                }
                column(Q4Amount; "Q4 Amount")
                {
                }
                column(ItemType; "Item Type")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
