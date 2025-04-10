Page 50124 "Released PRs-Not Procured"
{
    PageType = List;
    SourceTable = "Requisition Lines1";
    SourceTableView = sorting("Requisition No","Line No")
                      order(descending)
                      where("Request Generated"=const(false),
                            "Requisition Type"=const("Purchase Requisition"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select;Select)
                {
                    ApplicationArea = Basic;
                }
                field(ProcessType;"Process Type")
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionNo;"Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UnitofMeasure;"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field(UnitPrice;"Unit Price")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProcurementPlan;"Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ProcurementPlanItem;"Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(BudgetLine;"Budget Line")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ProcurementMethods)
            {
                Caption = 'Procurement Methods';
                action("Create Direct")
                {
                    ApplicationArea = Basic;
                    Image = createinteraction;

                    trigger OnAction()
                    begin
                        conf:=Confirm('This will enable the lines selected to create LPOs/LSOs with Direct Method. Are you sure you want to continue?');
                        if Format(conf)='Yes' then
                          begin
                             RequisitionLines.Reset;
                             RequisitionLines.SetFilter("Request Generated",'%1',false);
                             RequisitionLines.SetFilter("Procurement Plan","Procurement Plan");
                             RequisitionLines.SetFilter(Select,'%1',true);
                             if RequisitionLines.FindSet then
                              begin
                                procmethodrec.Reset;
                                procmethodrec.Init;
                                end;
                            end;
                    end;
                }
                action("Create RFQ")
                {
                    ApplicationArea = Basic;
                    Image = CreateFinanceChargememo;
                }
                action("Create RFP")
                {
                    ApplicationArea = Basic;
                    Image = CopyToTask;
                }
                action("Create Tender")
                {
                    ApplicationArea = Basic;
                    Image = SuggestItemPrice;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Create Direct_Promoted"; "Create Direct")
                {
                }
                actionref("Create RFQ_Promoted"; "Create RFQ")
                {
                }
                actionref("Create RFP_Promoted"; "Create RFP")
                {
                }
                actionref("Create Tender_Promoted"; "Create Tender")
                {
                }
            }
        }
    }

    var
        conf: Boolean;
        RequisitionLines: Record "Requisition Lines1";
        procmethodrec: Record "Procurement Request1";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RequisitionHeader: Record "Requisition Header1";
}

