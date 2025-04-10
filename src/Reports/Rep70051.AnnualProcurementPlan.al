report 70051 "Annual Procurement Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Annual Procurement Plan.rdlc';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Procurement Plan"; "Procurement Plan")
        {
            column(logo; CompanyInf.Picture)
            {
            }
            column(YearCode; YearCode)
            {

            }
            // column(AdminUnitName_ProcurementPlan; "Admin Unit Name")
            // {
            // }
            column(companyname; CompanyInf.Name)
            {
            }
            column(Code_ProcurementPlan; "Procurement Plan".Code)
            {
            }
            column(Description_ProcurementPlan; "Procurement Plan".Description)
            {
            }
            column(CorporateStrategicPlanID_ProcurementPlan; "Procurement Plan"."Corporate Strategic Plan ID")
            {
            }
            column(FinancialBudgetID_ProcurementPlan; "Procurement Plan"."Financial Budget ID")
            {
            }
            column(FinancialYearCode_ProcurementPlan; "Procurement Plan"."Financial Year Code")
            {
            }
            column(StartDate_ProcurementPlan; "Procurement Plan"."Start Date")
            {
            }
            column(EndDate_ProcurementPlan; "Procurement Plan"."End Date")
            {
            }
            column(CreatedBy_ProcurementPlan; "Procurement Plan"."Created By")
            {
            }
            column(DateCreated_ProcurementPlan; "Procurement Plan"."Date Created")
            {
            }
            column(TimeCreated_ProcurementPlan; "Procurement Plan"."Time Created")
            {
            }
            column(PlanType_ProcurementPlan; "Procurement Plan"."Plan Type")
            {
            }
            column(ApprovalStatus_ProcurementPlan; "Procurement Plan"."Approval Status")
            {
            }
            column(NoSeries_ProcurementPlan; "Procurement Plan"."No. Series")
            {
            }
            column(EchequerJobID_ProcurementPlan; "Procurement Plan"."Echequer Job ID")
            {
            }
            column(TotalBudgetGoods_ProcurementPlan; "Procurement Plan"."Total Budget (Goods)")
            {
            }
            column(TotalBudgetWorks_ProcurementPlan; "Procurement Plan"."Total Budget (Works)")
            {
            }
            column(TotalBudgetServices_ProcurementPlan; "Procurement Plan"."Total Budget (Services)")
            {
            }
            column(TotalBudgetedSpend_ProcurementPlan; "Procurement Plan"."Total Budgeted Spend")
            {
            }
            column(TotalActualWorks_ProcurementPlan; "Procurement Plan"."Total Actual (Works)")
            {
            }
            column(TotalActualServices_ProcurementPlan; "Procurement Plan"."Total Actual (Services)")
            {
            }
            column(TotalActualSpend_ProcurementPlan; "Procurement Plan"."Total Actual Spend")
            {
            }
            column(Spend_ProcurementPlan; "Procurement Plan"."Spend %")
            {
            }
            column(DepartmentFilter_ProcurementPlan; "Procurement Plan"."Department Filter")
            {
            }
            column(BudgetPlanPosted_ProcurementPlan; "Procurement Plan"."Budget Plan Posted")
            {
            }
            column(TotalActualGoods_ProcurementPlan; "Procurement Plan"."Total Actual (Goods)")
            {
            }
            column(GlobalDimension1Code_ProcurementPlan; "Procurement Plan"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_ProcurementPlan; "Procurement Plan"."Global Dimension 2 Code")
            {
            }
            column(GlobalDimension3Code_ProcurementPlan; "Procurement Plan"."Global Dimension 3 Code")
            {
            }
            column(ConsolidatedProcurementPlan_ProcurementPlan; "Procurement Plan"."Consolidated Procurement Plan")
            {
            }
            column(PlanningResponsibilityCenter_ProcurementPlan; "Procurement Plan"."Planning Responsibility Center")
            {
            }
            column(TotalPRNCommitments_ProcurementPlan; "Procurement Plan"."Total PRN Commitments")
            {
            }
            column(TotalContractCommitments_ProcurementPlan; "Procurement Plan"."Total Contract Commitments")
            {
            }
            column(TotalPOCommitments_ProcurementPlan; "Procurement Plan"."Total PO Commitments")
            {
            }
            column(TotalPurchaseCommitments_ProcurementPlan; "Procurement Plan"."Total Purchase Commitments")
            {
            }
            // column(TotalPurchaseInvoices_ProcurementPlan; "Procurement Plan"."Total Purchase Invoices")
            // {
            // }
            // column(TotalPurchaseCreditMemos_ProcurementPlan; "Procurement Plan"."Total Purchase Credit Memos")
            // {
            // }
            column(TotalActualCosts_ProcurementPlan; "Procurement Plan"."Total Actual Costs")
            {
            }
            column(AvailableProcurementBudget_ProcurementPlan; "Procurement Plan"."Available Procurement Budget")
            {
            }
            column(DocumentDate_ProcurementPlan; "Procurement Plan"."Document Date")
            {
            }
            column(DimensionSetID_ProcurementPlan; "Procurement Plan"."Dimension Set ID")
            {
            }
            column(Blocked_ProcurementPlan; "Procurement Plan".Blocked)
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup2."Employee Name")
            {
            }
            column(DateExamined; ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            dataitem("Procurement Plan Entry"; "Procurement Plan Entry")
            {
                DataItemLink = "Procurement Plan ID" = field(Code);
                DataItemTableView = where(Blocked = filter(false));
                column(MarginofPreference_ProcurementPlanEntry; "Margin of Preference")
                {
                }
                column(UnitofMeasure_ProcurementPlanEntry; "Unit of Measure")
                {
                }
                column(Q1Amount_ProcurementPlanEntry; "Q1 Amount")
                {
                }
                column(Q2Amount_ProcurementPlanEntry; "Q2 Amount")
                {
                }
                column(Q3Amount_ProcurementPlanEntry; "Q3 Amount")
                {
                }
                column(Q4Amount_ProcurementPlanEntry; "Q4 Amount")
                {
                }
                column(Youth_ProcurementPlanEntry; "Youth %")
                {
                }
                column(YouthAmount_ProcurementPlanEntry; "Youth Amount")
                {
                }
                column(Women_ProcurementPlanEntry; "Women %")
                {
                }
                column(WomenAmount_ProcurementPlanEntry; "Women Amount")
                {
                }
                column(PWD_ProcurementPlanEntry; "PWD %")
                {
                }
                column(PWDAmount_ProcurementPlanEntry; "PWD Amount")
                {
                }
                column(AGPO_ProcurementPlanEntry; "AGPO %")
                {
                }
                column(AGPOAmount_ProcurementPlanEntry; "AGPO Amount")
                {
                }
                column(CitizenContractors_ProcurementPlanEntry; "Citizen Contractors %")
                {
                }
                column(PlanItemNo_ProcurementPlanEntry; "Plan Item No")
                {
                }
                column(ProcurementPlanID_ProcurementPlanEntry; "Procurement Plan Entry"."Procurement Plan ID")
                {
                }
                column(EntryNo_ProcurementPlanEntry; "Procurement Plan Entry"."Entry No.")
                {
                }
                column(PlanningCategory_ProcurementPlanEntry; "Procurement Plan Entry"."Planning Category")
                {
                }
                column(WorkPlanProjectID_ProcurementPlanEntry; "Procurement Plan Entry"."Work Plan Project ID")
                {
                }
                column(Description_ProcurementPlanEntry; "Procurement Plan Entry".Description)
                {
                }
                column(ProcurementType_ProcurementPlanEntry; "Procurement Plan Entry"."Procurement Type")
                {
                }
                column(SolicitationType_ProcurementPlanEntry; "Procurement Plan Entry"."Solicitation Type")
                {
                }
                column(ProcurementMethod_ProcurementPlanEntry; "Procurement Plan Entry"."Procurement Method")
                {
                }
                column(PreferenceReservationCode_ProcurementPlanEntry; "Procurement Plan Entry"."Preference/Reservation Code")
                {
                }
                column(FundingSourceID_ProcurementPlanEntry; "Procurement Plan Entry"."Funding Source ID")
                {
                }
                column(PlanningDate_ProcurementPlanEntry; "Procurement Plan Entry"."Planning Date")
                {
                }
                column(Quantity_ProcurementPlanEntry; "Procurement Plan Entry".Quantity)
                {
                }
                column(UnitCost_ProcurementPlanEntry; "Procurement Plan Entry"."Unit Cost")
                {
                }
                column(LineBudgetCost_ProcurementPlanEntry; "Procurement Plan Entry"."Line Budget Cost")
                {
                }
                column(Region_ProcurementPlanEntry; "Procurement Plan Entry".Region)
                {
                }
                column(Directorate_ProcurementPlanEntry; "Procurement Plan Entry".Directorate)
                {
                }
                column(Department_ProcurementPlanEntry; "Procurement Plan Entry".Department)
                {
                }
                column(Constituency_ProcurementPlanEntry; "Procurement Plan Entry".Constituency)
                {
                }
                column(RoadNo_ProcurementPlanEntry; "Procurement Plan Entry"."Road No.")
                {
                }
                column(RoadName_ProcurementPlanEntry; "Procurement Plan Entry"."Road Name")
                {
                }
                column(GlobalDimension1Code_ProcurementPlanEntry; "Procurement Plan Entry"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_ProcurementPlanEntry; "Procurement Plan Entry"."Global Dimension 2 Code")
                {
                }
                column(ProcurementStartDate_ProcurementPlanEntry; "Procurement Plan Entry"."Procurement Start Date")
                {
                }
                column(ProcurementEndDate_ProcurementPlanEntry; "Procurement Plan Entry"."Procurement End Date")
                {
                }
                column(ProcurementDurationDays_ProcurementPlanEntry; "Procurement Plan Entry"."Procurement Duration (Days)")
                {
                }
                column(BusinessUnitCode_ProcurementPlanEntry; "Procurement Plan Entry"."Business Unit Code")
                {
                }
                column(UserID_ProcurementPlanEntry; "Procurement Plan Entry"."User ID")
                {
                }
                column(LastDateModified_ProcurementPlanEntry; "Procurement Plan Entry"."Last Date Modified")
                {
                }
                column(WorkplanTaskNo_ProcurementPlanEntry; "Procurement Plan Entry"."Workplan Task No.")
                {
                }
                column(ProjectCombinedProcBudget_ProcurementPlanEntry; "Procurement Plan Entry"."Project_Combined Proc Budget")
                {
                }
                column(RequisitionProductGroup_ProcurementPlanEntry; "Procurement Plan Entry"."Requisition Product Group")
                {
                }
                column(ProcurementUse_ProcurementPlanEntry; "Procurement Plan Entry"."Procurement Use")
                {
                }
                column(InvitationNoticeType_ProcurementPlanEntry; "Procurement Plan Entry"."Invitation Notice Type")
                {
                }
                column(DimensionSetID_ProcurementPlanEntry; "Procurement Plan Entry"."Dimension Set ID")
                {
                }
                column(BudgetControlJobNo_ProcurementPlanEntry; "Procurement Plan Entry"."Budget Control Job No")
                {
                }
                column(BudgetControlJobTaskNo_ProcurementPlanEntry; "Procurement Plan Entry"."Budget Account")
                {
                }
                column(StartChainageKm_ProcurementPlanEntry; "Procurement Plan Entry"."Start Chainage(Km)")
                {
                }
                column(EndChainageKm_ProcurementPlanEntry; "Procurement Plan Entry"."End Chainage(Km)")
                {
                }
                column(SectionLengthKm_ProcurementPlanEntry; "Procurement Plan Entry"."Section Length(Km)")
                {
                }
                column(Posted_ProcurementPlanEntry; "Procurement Plan Entry".Posted)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 70098);
                ApprovalEntries.SetRange("Document No.", "Procurement Plan".Code);
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver[1]) then
                                UserSetup.CalcFields(Picture);

                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[2]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[3]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[4]) then
                                UserSetup3.CalcFields(Picture);
                        end;
                    until
                   ApprovalEntries.Next = 0;

                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
        //CompanyInf.CALCFIELDS(Name);
    end;

    trigger OnPostReport()
    begin
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
        //CompanyInf.CALCFIELDS(Name);
    end;

    trigger OnPreReport()
    var
        Cuurentyear: Record "CSP Planned Years";




    begin
        YearCode := '';
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
        Cuurentyear.Reset();
        Cuurentyear.SetRange(Current, true);
        if Cuurentyear.FindFirst() then
            YearCode := Cuurentyear."CSP Code";

        //CompanyInf.CALCFIELDS(Name);
    end;

    var
        CompanyInf: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        YearCode: Text;
        i: Integer;
}

