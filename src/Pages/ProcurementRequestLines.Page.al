Page 52194215 ProcurementRequestLines
{
    PageType = Card;
    SourceTable = "Procurement Request Lines1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(RequisitionNo; "Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo; "Line No")
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
                field(UnitPrice; "Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlan; "Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlanItem; "Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetLine; "Budget Line")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(AmountLCY; "Amount LCY")
                {
                    ApplicationArea = Basic;
                }
                field(Select; Select)
                {
                    ApplicationArea = Basic;
                }
                field(RequestGenerated; "Request Generated")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
    var
        Purchase: Page "Purchase Invoice";
}

