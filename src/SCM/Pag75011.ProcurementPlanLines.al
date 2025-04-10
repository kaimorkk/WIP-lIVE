

page 75011 "Procurement Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Procurement Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                // field("Procurement Type"; Rec."Procurement Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Solicitation Type"; Rec."Solicitation Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Procurement Method"; Rec."Procurement Method")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Primary Source of Funds"; Rec."Primary Source of Funds")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Total Budgeted Cost"; Rec."Total Budgeted Cost")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Procurement Task")
            {
                Caption = 'Procurement Task';
                Image = Task;
                action(ProcurementPlanningEntries)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Procurement Planning Entries';
                    Image = JobLines;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';
                    RunObject = Page "Procurement Plan Entry";
                    RunPageLink = "Procurement Plan ID" = field("Procurement Plan ID"),
                              "Planning Category" = field("Planning Category");
                    // trigger OnAction()
                    // var
                    //     ProcurementPlanEntries: Record "Procurement Plan Entry";
                    //     ProcurementPlanEntry: Page "Procurement Plan Entry";
                    // begin

                    //     Rec.TestField("Procurement Plan ID");
                    //     Rec.TestField("Planning Category");
                    //     ProcurementPlanEntries.SetRange("Procurement Plan ID", Rec."Procurement Plan ID");
                    //     ProcurementPlanEntries.SetRange("Planning Category", Rec."Planning Category");
                    //     //JobPlanningLines.SetJobNoVisible(FALSE);
                    //     ProcurementPlanEntry.SetProcuremntLineNoVisible(false);
                    //     ProcurementPlanEntry.SetProcurementNoVisible(false);
                    //     ProcurementPlanEntry.SetProcurementNo(Rec."Procurement Plan ID");
                    //     //ProcurementPlanEntry."Solicitation Type""Solicitation Type";

                    //     ProcurementPlanEntry.SetTableview(ProcurementPlanEntries);
                    //     ProcurementPlanEntry.Run;
                    // end;
                }
                // action(PurchaseActivityPlan)
                // {
                //     ApplicationArea = Jobs;
                //     Caption = 'Purchase Activity Plan';
                //     Image = LineReserve;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     ShortCutKey = 'Shift+Ctrl+P';
                //     ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';

                //     trigger OnAction()
                //     var
                //         PurchaseActivityPlanEntries: Record "PP Purchase Activity Schedule";
                //         PurchaseActivityPlanEntry: Page "PP Purchase Activity Schedule";
                //     begin

                //         Rec.TestField("Procurement Plan ID");
                //         Rec.TestField("Planning Category");
                //         PurchaseActivityPlanEntries.SetRange("Procurement Plan ID", Rec."Procurement Plan ID");
                //         PurchaseActivityPlanEntries.SetRange("Planning Category", Rec."Planning Category");
                //         //JobPlanningLines.SetJobNoVisible(FALSE);
                //         PurchaseActivityPlanEntry.SetPurchaseActivityLineNoVisible(false);
                //         PurchaseActivityPlanEntry.SetPurchaseActivityNo(Rec."Procurement Plan ID");
                //         PurchaseActivityPlanEntry.SetTableview(PurchaseActivityPlanEntries);
                //         PurchaseActivityPlanEntry.Run;
                //     end;
                // }
            }
        }
    }
}

#pragma implicitwith restore

