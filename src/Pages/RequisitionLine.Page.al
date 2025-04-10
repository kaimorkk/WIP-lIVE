Page 52193889 "Requisition Line"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Requisition Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ProcurementPlanItem;"Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionNo;"Requisition No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(UnitofMeasure;"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                // field(UnitPrice;"Unit Price")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Availableamount;"Available amount")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedBudgetAmount;"Approved Budget Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CommitmentAmount;"Commitment Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ActualExpense;"Actual Expense")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ProcurementPlan;"Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetLine;"Budget Line")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnModifyRecord(): Boolean
    begin
           Header.SetRange(Header."No.","Requisition No");
           if Header.Status<>Header.Status::Open then
           Error('You cannot make changes at this stage');
    end;

    var
        Header: Record "Requisition Header1";
}

