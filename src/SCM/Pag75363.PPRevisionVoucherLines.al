page 75363 "PP Revision Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "Procurement Plan Lines";
    SourceTableView = where("Total Quantity" = filter(> 0));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PlanningCategory; "Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                // field(ProcurementType; "Procurement Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(SolicitationType; "Solicitation Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(ProcurementMethod; "Procurement Method")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(PrimarySourceofFunds; "Primary Source of Funds")
                // {
                //     ApplicationArea = Basic;
                // }
                field(TotalQuantity; "Total Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budgeted Cost"; "Total Budgeted Cost")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ProcurementTask)
            {
                Caption = 'Procurement Task';
                Image = Task;
                action(ProcurementPlanningEntries)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Procurement Planning Entries';
                    Image = JobLines;
                    RunObject = Page "PP Revision Voucher Entry";
                    RunPageLink = "Procurement Plan ID" = field("Procurement Plan ID"),
                                  "Planning Category" = field("Planning Category"),
                                  "Document Type" = field("Document Type");
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';

                    trigger OnAction()
                    var
                        ProcurementPlanEntries: Record "Procurement Plan Entry";
                        ProcurementPlanEntry: Page "Procurement Plan Entry";
                    begin

                        // TESTFIELD("Procurement Plan ID");
                        // TESTFIELD("Planning Category");
                        // ProcurementPlanEntries.SETRANGE("Procurement Plan ID","Procurement Plan ID");
                        // ProcurementPlanEntries.SETRANGE("Planning Category","Planning Category");
                        // ProcurementPlanEntries.SETRANGE("Document Type","Document Type");
                        // //JobPlanningLines.SetJobNoVisible(FALSE);
                        // ProcurementPlanEntry.SetProcuremntLineNoVisible(FALSE);
                        // ProcurementPlanEntry.SetProcurementNoVisible(FALSE);
                        // ProcurementPlanEntry.SetProcurementNo("Procurement Plan ID");
                        // //ProcurementPlanEntry."Solicitation Type""Solicitation Type";
                        //
                        // ProcurementPlanEntry.SETTABLEVIEW(ProcurementPlanEntries);
                        // ProcurementPlanEntry.RUN;
                    end;
                }
                action(PurchaseActivityPlan)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Purchase Activity Plan';
                    Image = LineReserve;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';

                    trigger OnAction()
                    var
                        PurchaseActivityPlanEntries: Record "PP Purchase Activity Schedule";
                        PurchaseActivityPlanEntry: Page "PP Purchase Activity Schedule";
                    begin

                        TestField("Procurement Plan ID");
                        TestField("Planning Category");
                        PurchaseActivityPlanEntries.SetRange("Procurement Plan ID", "Procurement Plan ID");
                        PurchaseActivityPlanEntries.SetRange("Planning Category", "Planning Category");
                        PurchaseActivityPlanEntries.SetRange("Document Type", "Document Type");
                        //JobPlanningLines.SetJobNoVisible(FALSE);
                        PurchaseActivityPlanEntry.SetPurchaseActivityLineNoVisible(false);
                        PurchaseActivityPlanEntry.SetPurchaseActivityNo("Procurement Plan ID");
                        PurchaseActivityPlanEntry.SetTableview(PurchaseActivityPlanEntries);
                        PurchaseActivityPlanEntry.Run;
                    end;
                }
            }
        }
    }
}

