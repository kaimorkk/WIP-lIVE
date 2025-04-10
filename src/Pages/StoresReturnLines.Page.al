Page 52193562 "Stores Return Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Stores Return Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ProcurementPlanItem; "Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(UnitofMeasure; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(QuantityApproved; "Quantity Approved")
                {
                    ApplicationArea = Basic;
                }
                field(QuantityinStore; "Quantity in Store")
                {
                    ApplicationArea = Basic;
                }
                field(UnitPrice; "Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
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

