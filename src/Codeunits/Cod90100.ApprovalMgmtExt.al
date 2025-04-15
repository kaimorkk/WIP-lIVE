codeunit 52193490 "Approval Mgmt. Ext"

{
    //Approvals Event Subscriber Codeunit

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Variant: Variant;
        //pavement
        // PavementTestHeader: Record "Pavement Test Header";
        // //project Schedule
        // RoadWorkPlan: Record "Road Work Program";
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //Induction Header
        InductionHeader: Record "Induction Header";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //PV
        Payments: Record payments;
        //"IFS Tender Committee"
        IFSTender: Record "IFS Tender Committee";
        //"Receipts Header1"
        Receipt: Record "Receipts Header1";
        //"Bid Tabulation Header"
        Opinion: Record "Bid Tabulation Header";
        //Item Creation Requests
        // ITM: Record "Item Creation Requests";
        //Airtime
        Airtime: Record "Airtime Allocation Header";
        //"Succession Plan Header"
        SuccessionPlanHeader: Record "Succession Plan Header";
        //"Succession Log Header"
        SuccessionLogHeader: Record "Succession Log Header";
        //ResourceBookingHeader
        ResourceBookingHeader: Record "Resource Booking Header";
        //"Vacancy Announcement"
        Announcement: Record "Vacancy Announcement";
        //Positions
        Positions: Record "Company Positions";
        //HRCOMM
        HRComm: Record "Commitee Appointment Voucher";
        //"Employee Transfers"
        EmpTrans: Record "Employee Transfers";
        //"Employee Acting Position"
        EmpAct: Record "Employee Acting Position";
        // EmpOnboard: Record "HR Employee Onboarding";
        // //Imprest Memo
        // ImprestMemo: Record "Imprest Memo";
        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        //"Maintenance Header"
        // MaintenanceReq: Record "Maintenance Header";
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        FuelCard: Record "Fuel Card";
        VehicleIncident: Record "Vehicle Incident";
        VehicleRqst: Record "Vehicle Request";
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
        Orgstructure: Record "Organization Hierarchy Header";
        Establishment: Record "Staff Establishment Plan";
        PCAHeader: Record "prBasic pay PCA";
        HRLeaveAllocationRequest: Record "HR Leave Allocation Request";
        LeaveApplicationRecall: Record "Leave Application Recall";
        //Inter Bank Transfer
        // InterBankTransfer: Record "Inter Bank Transfer";
        LoanApplication: Record "Loan Application";
        PayrollHeader: Record "Payroll Header";
        // ConsolidatedTrainingNeeds: Record "Consolidated Training Needs";
        MonthlyWorkTicketHdr: Record "Monthly Work Ticket Header";
        HRLeaveApplication: Record "HR Leave Application";
        PRPayrollBuffer: Record "PR Payroll Buffer";
        LeaveJournalVoucher: Record "Leave Journal Voucher";
        TrainingPlanHeader: Record "Training Plan Header";
        TrainingNeedsHeader: Record "Training Needs Header";
        TrainingRequests: Record "Training Requests";
        DisciplineDtls: Record "Discipline Details";
        // TrainingExtension: Record "Training Extension";
        PRTransactionCodes: Record "PR Transaction Codes";
        EmployeeExitHeader: Record "Employee Exit Header";
        HRLeavePlannerHeader: Record "HR Leave Planner Header";
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        AppEntry: Record "Approval Entry";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        BudgetConsHeader: Record "Budget Consolidation Header";
        // BudgReAllocHeader: Record "Budget ReAllocation Header";
        // AuthtoIncurExpend: Record "Auth. Inc. Expend. Header";
        // BatchAuthToIncExpend: Record "Batch. Auth to Incur Expend";
        ExpenseReq: Record "Expense Requisition";
        Commitment: Codeunit Committment;
        // PlanningHeader: Record "Planning Header";
        // ProjectClosure: record "Project Closure";
        ProjectJobs: record job;
        EFTHeader: Record "EFT Header";
        AnnualDisposalPlan: Record "Annual Disposal Plan Header";
        BidRegister: Record "Bid Opening Register";
        // ContratorRequest: Record "Contractor Request Header";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        Direction: Enum "Utilization Direction";
        //Imprest Header Finance
        Imprest: Record "Request Header1";
        LicenceRegistrationForm: Record "Licence Registration Form";
        StaffRegistration: Record "Wip Header Registration";

    begin
        case RecRef.Number of
            //Bid Register
            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Open);
                    StaffRegistration."Approval Status" := StaffRegistration."Approval Status"::Open;
                    StaffRegistration.Modify;
                    Handled := true;
                end;
            Database::"Bid Opening Register":
                begin
                    RecRef.SetTable(BidRegister);
                    BidRegister.Validate(BidRegister."Approval Status", BidRegister."Approval Status"::Open);
                    BidRegister.Modify;
                    Variant := BidRegister;
                    Handled := true;
                end;
            //HR Leave Planner Header
            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(HRLeavePlannerHeader);
                    HRLeavePlannerHeader.Validate(Status, HRLeavePlannerHeader.Status::New);
                    HRLeavePlannerHeader.Modify;
                    Variant := HRLeavePlannerHeader;
                    Handled := true;
                end;
            // //Consolidated Training Needs
            // Database::"Consolidated Training Needs":
            //     begin
            //         RecRef.SetTable(ConsolidatedTrainingNeeds);
            //         ConsolidatedTrainingNeeds.Validate(Status, ConsolidatedTrainingNeeds.Status::Committee);
            //         ConsolidatedTrainingNeeds.Modify;
            //         Variant := ConsolidatedTrainingNeeds;
            //         Handled := true;
            //     end;
            //pr transaction codes
            Database::"PR Transaction Codes":
                begin
                    RecRef.SetTable(PRTransactionCodes);
                    PRTransactionCodes.Validate(Status, PRTransactionCodes.Status::Open);
                    PRTransactionCodes.Modify;
                    Variant := PRTransactionCodes;
                    Handled := true;
                end;
            // //training extension
            // Database::"Training Extension":
            //     begin
            //         RecRef.SetTable(TrainingExtension);
            //         TrainingExtension.Validate(Status, TrainingExtension.Status::Open);
            //         TrainingExtension.Modify;
            //         Variant := TrainingExtension;
            //         Handled := true;
            //     end;
            //training requests
            Database::"Training Requests":
                begin
                    RecRef.SetTable(TrainingRequests);
                    TrainingRequests.Validate(Status, TrainingRequests.Status::Open);
                    TrainingRequests.Modify;
                    Variant := TrainingRequests;
                    Handled := true;
                end;
            //Training Plan Header
            Database::"Training Plan Header":
                begin
                    RecRef.SetTable(TrainingPlanHeader);
                    TrainingPlanHeader.Validate("Approved Status", TrainingPlanHeader."Approved Status"::Open);
                    TrainingPlanHeader.Modify;
                    Variant := TrainingPlanHeader;
                    Handled := true;
                end;
            //training needs header
            Database::"Training Needs Header":
                begin
                    RecRef.SetTable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::Open);
                    TrainingNeedsHeader.Modify;
                    Variant := TrainingNeedsHeader;
                    Handled := true;
                end;
            //leave
            Database::"HR Leave Allocation Request":
                begin
                    RecRef.SetTable(HRLeaveAllocationRequest);
                    HRLeaveAllocationRequest.Validate(Status, HRLeaveAllocationRequest.Status::Open);
                    HRLeaveAllocationRequest.Modify;
                    Variant := HRLeaveAllocationRequest;
                    Handled := true;
                end;
            //leave
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);
                    AppEntry.Reset();
                    AppEntry.SetRange("Document No.", HRLeaveApplication."Application Code");
                    AppEntry.SetRange("Document Type", AppEntry."Document Type"::"Leave Application");
                    AppEntry.SetRange(Status, AppEntry.Status::Canceled);
                    if AppEntry.FindFirst() then
                        HRLeaveApplication.Validate(Status, HRLeaveApplication.Status::Canceled)
                    else
                        HRLeaveApplication.Validate(Status, HRLeaveApplication.Status::Rejected);
                    HRLeaveApplication.Modify;
                    Variant := HRLeaveApplication;
                    Handled := true;
                end;
            //payroll buffer
            Database::"PR Payroll Buffer":
                begin


                    RecRef.SetTable(PRPayrollBuffer);
                    PRPayrollBuffer.Validate(Status, PRPayrollBuffer.Status::Open);
                    PRPayrollBuffer.Modify;
                    Variant := PRPayrollBuffer;
                    Handled := true;



                end;


            //leave adjustment
            Database::"Leave Journal Voucher":
                begin
                    RecRef.SetTable(LeaveJournalVoucher);
                    LeaveJournalVoucher.Validate(Status, LeaveJournalVoucher.Status::Open);
                    LeaveJournalVoucher.Modify;
                    Variant := LeaveJournalVoucher;
                    Handled := true;
                end;
            //Loan Application
            Database::"Loan Application":
                begin
                    RecRef.SetTable(LoanApplication);
                    LoanApplication.Validate("Loan Status", LoanApplication."Loan Status"::Application);
                    LoanApplication.Modify;
                    Variant := LoanApplication;
                    Handled := true;
                end;

            // //Loan Application
            // Database::"Planning Header":
            //     begin
            //         RecRef.SetTable(PlanningHeader);
            //         PlanningHeader.Validate(Status, PlanningHeader.Status::Open);
            //         PlanningHeader.Modify;
            //         Variant := PlanningHeader;
            //         Handled := true;
            //     end;
            //payroll header
            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::Open);
                    PayrollHeader.Modify;
                    Variant := PayrollHeader;
                    Handled := true;
                end;
            //leave application recall
            Database::"Leave Application Recall":
                begin
                    RecRef.SetTable(LeaveApplicationRecall);
                    LeaveApplicationRecall.Validate(Status, LeaveApplicationRecall.Status::Open);
                    LeaveApplicationRecall.Modify;
                    Variant := LeaveApplicationRecall;
                    Handled := true;
                end;
            //Induction Header
            Database::"Induction Header":
                begin
                    RecRef.SetTable(inductionheader);
                    inductionheader.Validate("Approval Status", inductionheader."Approval Status"::Open);
                    inductionheader.Modify;
                    Variant := inductionheader;
                    Handled := true;
                end;
            // //pavement
            // Database::"Pavement Test Header":
            //     begin
            //         RecRef.SetTable(PavementTestHeader);
            //         PavementTestHeader.Validate(Status, PavementTestHeader.Status::Open);
            //         PavementTestHeader.Modify;
            //         Variant := PavementTestHeader;
            //         Handled := true;
            //     end;
            // Database::"Project Closure":
            //     begin
            //         RecRef.SetTable(ProjectClosure);
            //         ProjectClosure.Validate("Approval Status", ProjectClosure."Approval Status"::Open);
            //         ProjectClosure.Modify();
            //         Variant := ProjectClosure;
            //         Handled := true;
            //     end;
            // //Contractor Request
            // Database::"Contractor Request Header":
            //     begin
            //         RecRef.SetTable(ContratorRequest);
            //         ContratorRequest.Validate("Approval Status", ContratorRequest."Approval Status"::Open);
            //         ContratorRequest.Modify;
            //         Variant := ContratorRequest;
            //         Handled := true;
            //     end;

            // Database::"Job":
            //     begin
            //         RecRef.SetTable(ProjectJobs);
            //         ProjectJobs.Validate("Approval Status", ProjectJobs."Approval Status"::Open);
            //         ProjectJobs.Modify();
            //         Variant := ProjectJobs;
            //         Handled := true;
            //     end;

            //PCA
            Database::"prBasic pay PCA":
                begin
                    RecRef.SetTable(PCAHeader);
                    PCAHeader.Validate(Status, PCAHeader.Status::Open);
                    PCAHeader.Modify;
                    Variant := PCAHeader;
                    Handled := true;
                end;
            // //project Schedule
            // Database::"Road Work Program":
            //     begin
            //         RecRef.SetTable(RoadWorkPlan);
            //         // RoadWorkPlan.Validate("Approval Status", RoadWorkPlan."Approval Status"::Open);
            //         RoadWorkPlan.Modify;
            //         // Variant := RoadWorkPlan;
            //         Handled := true;
            //     end;


            //IFRCARD
            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::Open);
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    Handled := true;
                end;

            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Open);
                    procurementplan.Modify;
                    Variant := procurementplan;
                    Handled := true;
                end;
            //RFQ
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Open);
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    Handled := true;
                end;
            //pv
            Database::"payments":
                begin
                    RecRef.SetTable(payments);
                    payments.Validate(Status, payments.Status::Open);
                    payments.Modify;
                    Variant := payments;
                    Handled := true;
                end;

            //"IFS Tender Committee"
            Database::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTender);
                    IFSTender.Validate("Approval Status", IFSTender."Approval Status"::Open);
                    IFSTender.Modify;
                    Variant := IFSTender;
                    Handled := true;
                end;
            //Receipt
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::Open);
                    Receipt.Modify;
                    Variant := Receipt;
                    Handled := true;
                end;
            //Opinion
            Database::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(Opinion);
                    Opinion.Validate("Approval Status", Opinion."Approval Status"::Open);
                    Opinion.Modify;
                    Variant := Opinion;
                    Handled := true;
                end;
            // //Item Creation Requests
            // Database::"Item Creation Requests":
            //     begin
            //         RecRef.SetTable(ITM);
            //         ITM.Validate(Status, ITM.Status::Open);
            //         ITM.Modify;
            //         Variant := ITM;
            //         Handled := true;
            //     end;

            //Airtime
            Database::"Airtime Allocation Header":
                begin
                    RecRef.SetTable(Airtime);
                    Airtime.Validate(Status, Airtime.Status::Open);
                    Airtime.Modify;
                    Variant := Airtime;
                    Handled := true;
                end;

            //ResourceBookingHeader
            Database::"Resource Booking Header":
                begin
                    RecRef.SetTable(ResourceBookingHeader);
                    ResourceBookingHeader.Validate(Status, ResourceBookingHeader.Status::Open);
                    ResourceBookingHeader.Modify;
                    Variant := ResourceBookingHeader;
                    Handled := true;
                end;

            //"SuccessionPlanHeader"
            Database::"Succession Plan Header":
                begin
                    RecRef.SetTable(SuccessionPlanHeader);
                    SuccessionPlanHeader.Validate(Status, SuccessionPlanHeader.Status::Open);
                    SuccessionPlanHeader.Modify;
                    Variant := SuccessionPlanHeader;
                    Handled := true;
                end;
            //"SuccessionLogHeader"
            Database::"Succession Log Header":
                begin
                    RecRef.SetTable(SuccessionLogHeader);
                    SuccessionLogHeader.Validate(Status, SuccessionLogHeader.Status::Open);
                    SuccessionLogHeader.Modify;
                    Variant := SuccessionLogHeader;
                    Handled := true;
                end;
            //"Vacancy Announcement"
            Database::"Vacancy Announcement":
                begin
                    RecRef.SetTable(Announcement);
                    Announcement.Validate("Approval Status", Announcement."Approval Status"::Open);
                    Announcement.Modify;
                    Variant := Announcement;
                    Handled := true;
                end;
            //"Company Positions"
            Database::"Company Positions":
                begin
                    RecRef.SetTable(Positions);
                    Positions.Validate("Approval Status", Positions."Approval Status"::Open);
                    Positions.Modify;
                    Variant := Positions;
                    Handled := true;
                end;
            //HRComm
            Database::"Commitee Appointment Voucher":
                begin
                    RecRef.SetTable(HRComm);
                    HRComm.Validate("Approval Status", HRComm."Approval Status"::Open);
                    HRComm.Modify;
                    Variant := HRComm;
                    Handled := true;
                end;
            //"Employee Transfers"
            Database::"Employee Transfers":
                begin

                    AppEntry.Reset();
                    AppEntry.SetRange("Document No.", EmpTrans."Document No");
                    AppEntry.SetRange(Status, AppEntry.Status::Canceled);
                    if AppEntry.FindFirst() then begin
                        EmpTrans.Validate(Status, EmpTrans.Status::Open);
                        EmpTrans.Modify;
                        // else
                        //     HRLeaveApplication.Validate(Status, HRLeaveApplication.Status::Rejected);
                        // if EmpTrans."Professional Opinion" = '' then begin
                        //     RecRef.SetTable(EmpTrans);
                        //     EmpTrans.Validate(Status, EmpTrans.Status::Open);
                        //     EmpTrans.Modify;
                        //     Variant := EmpTrans;
                        //     Handled := true;

                    end else begin
                        RecRef.SetTable(EmpTrans);
                        EmpTrans.Validate(Status, EmpTrans.Status::Rejected);
                        EmpTrans.SendRejection();
                        EmpTrans.Modify;
                        Variant := EmpTrans;
                        Handled := true;
                    end;
                end;
            //"Employee Acting Position"
            Database::"Employee Acting Position":
                begin
                    RecRef.SetTable(EmpAct);
                    EmpAct.Validate(Status, EmpAct.Status::New);
                    EmpAct.Modify;
                    Variant := EmpAct;
                    Handled := true;
                end;
            // //"Employee Onboarding"
            // Database::"HR Employee Onboarding":
            //     begin
            //         RecRef.SetTable(EmpOnboard);
            //         EmpOnboard.Validate("Document Status", EmpOnboard."Document Status"::New);
            //         EmpOnboard.Modify;
            //         Variant := EmpOnboard;
            //         Handled := true;
            //     end;

            // //Imprest Memo
            // Database::"Imprest Memo":
            //     begin
            //         RecRef.SetTable(ImprestMemo);
            //         ImprestMemo.Validate(Status, ImprestMemo.Status::Open);
            //         ImprestMemo.Modify;
            //         Variant := ImprestMemo;
            //         Handled := true;
            //     end;
            //FleetReq
            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(FleetReq);
                    FleetReq.Validate(Status, FleetReq.Status::Open);
                    FleetReq.Modify;
                    Variant := FleetReq;
                    Handled := true;
                end;

            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.SetTable(FuelReq);
                    FuelReq.Validate(Status, FuelReq.Status::Open);
                    FuelReq.Modify;
                    Variant := FuelReq;
                    Handled := true;
                end;

            //"Fuel Card"
            Database::"Fuel Card":
                begin
                    RecRef.SetTable(FuelCard);
                    FuelCard.Validate(Status, FuelCard.Status::Open);
                    FuelCard.Modify;
                    Variant := FuelCard;
                    Handled := true;
                end;

            // //"Maintenance Header"
            // Database::"Maintenance Header":
            //     begin
            //         RecRef.SetTable(MaintenanceReq);
            //         MaintenanceReq.Validate(Status, MaintenanceReq.Status::Open);
            //         MaintenanceReq.Modify;
            //         Variant := MaintenanceReq;
            //         Handled := true;
            //     end;
            //"HR Asset Transfer Header"
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(HRAssettrans);
                    HRAssettrans.Validate(Status, HRAssettrans.Status::Open);
                    HRAssettrans.Modify;
                    Variant := HRAssettrans;
                    Handled := true;
                end;

            //"Recruitment Plan"
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(Recruiplan);
                    Recruiplan.Validate("Approval Status", Recruiplan."Approval Status"::Open);
                    Recruiplan.Modify;
                    Variant := Recruiplan;
                    Handled := true;
                end;
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitReq);
                    RecruitReq.Validate("Approval Status", RecruitReq."Approval Status"::Open);
                    RecruitReq.Modify;
                    Variant := RecruitReq;
                    Handled := true;
                end;

            // //Interbank Transfer
            // Database::"Inter Bank Transfer":
            //     begin
            //         RecRef.SetTable(InterBankTransfer);
            //         InterBankTransfer.Validate("Approval Status", "Approval Status"::Open);
            //         InterBankTransfer.Modify;
            //         Variant := InterBankTransfer;
            //         Handled := true;
            //     end;
            //Vehicle Request
            Database::"Vehicle Request":
                begin
                    RecRef.SetTable(VehicleRqst);
                    VehicleRqst.Validate(Status, VehicleRqst.Status::Open);
                    VehicleRqst.Modify;
                    Variant := VehicleRqst;
                    Handled := true;
                end;

            //Vehicle Incident
            Database::"Vehicle Incident":
                begin
                    RecRef.SetTable(VehicleIncident);
                    VehicleIncident.Validate(Status, VehicleIncident.Status::Open);
                    VehicleIncident.Modify;
                    Variant := VehicleIncident;
                    Handled := true;
                end;
            //Discipline Details
            Database::"Discipline Details":
                begin
                    RecRef.SetTable(DisciplineDtls);
                    DisciplineDtls.Validate(Status, DisciplineDtls.Status::Open);
                    DisciplineDtls.Modify;
                    Variant := DisciplineDtls;
                    Handled := true;
                end;
            // "Monthly Work Ticket Header"
            Database::"Monthly Work Ticket Header":
                begin
                    RecRef.SetTable(MonthlyWorkTicketHdr);
                    MonthlyWorkTicketHdr.Validate(Status, MonthlyWorkTicketHdr.Status::Open);
                    MonthlyWorkTicketHdr.Modify;
                    Variant := MonthlyWorkTicketHdr;
                    Handled := true;
                end;
            //Corporate Strategic Plans
            Database::"Corporate Strategic Plans":
                begin
                    RecRef.SetTable(CorporateStrategicPlans);
                    CorporateStrategicPlans.Validate("Approval Status", CorporateStrategicPlans."Approval Status"::Open);
                    CorporateStrategicPlans.Modify;
                    Variant := CorporateStrategicPlans;
                    Handled := true;
                end;
            DATABASE::"Organization Hierarchy Header":
                begin
                    RecRef.SETTABLE(Orgstructure);
                    Orgstructure.VALIDATE("Status", Orgstructure.Status::New);
                    Orgstructure.MODIFY;
                    Variant := Orgstructure;
                    Handled := true;
                end;
            DATABASE::"Staff Establishment Plan":
                begin
                    RecRef.SETTABLE(Establishment);
                    Establishment.VALIDATE("Status", Establishment."Status"::New);
                    Establishment.MODIFY;
                    Variant := Establishment;
                    Handled := true;
                end;
            Database::"Employee Exit Header":
                begin
                    RecRef.SETTABLE(EmployeeExitHeader);
                    EmployeeExitHeader.VALIDATE(Status, EmployeeExitHeader.Status::Open);
                    EmployeeExitHeader.MODIFY;
                    Variant := EmployeeExitHeader;
                    Handled := true;
                end;
            DATABASE::"Perfomance Contract Header":
                begin
                    RecRef.SETTABLE(PerfomanceContrHdr);
                    PerfomanceContrHdr.Validate("Approval Status", PerfomanceContrHdr."Approval Status"::Open);
                    PerfomanceContrHdr.Modify();
                    Variant := PerfomanceContrHdr;
                    Handled := true;
                end;
            //Annual Strategy Workplan
            Database::"Annual Strategy Workplan":
                begin
                    RecRef.SETTABLE(AnnualStrategyWorkplan);
                    AnnualStrategyWorkplan.VALIDATE("Approval Status", AnnualStrategyWorkplan."Approval Status"::Open);
                    AnnualStrategyWorkplan.MODIFY;
                    Variant := AnnualStrategyWorkplan;
                    Handled := true;
                end;
            //Budget Consolidation Header
            Database::"Budget Consolidation Header":
                begin
                    RecRef.SETTABLE(BudgetConsHeader);
                    BudgetConsHeader.VALIDATE("Approval Status", BudgetConsHeader."Approval Status"::Open);
                    BudgetConsHeader.MODIFY;
                    Variant := BudgetConsHeader;
                    Handled := true;
                end;
            // //Budget ReAllocation Header
            // Database::"Budget Reallocation Header":
            //     begin
            //         RecRef.SETTABLE(BudgReAllocHeader);
            //         BudgReAllocHeader.VALIDATE("Approval Status", BudgetConsHeader."Approval Status"::Open);
            //         BudgReAllocHeader.MODIFY;
            //         Variant := BudgReAllocHeader;
            //         Handled := true;
            //     end;
            // //Batch Incur Header
            // Database::"Batch. Auth to Incur Expend":
            //     begin
            //         RecRef.SETTABLE(BatchAuthToIncExpend);
            //         BatchAuthToIncExpend.VALIDATE("Approval Status", BatchAuthToIncExpend."Approval Status"::Open);
            //         BatchAuthToIncExpend.MODIFY;
            //         Variant := BatchAuthToIncExpend;
            //         Handled := true;
            //     end;
            // //Incur Header
            // Database::"Auth. Inc. Expend. Header":
            //     begin
            //         RecRef.SETTABLE(AuthtoIncurExpend);
            //         AuthtoIncurExpend.VALIDATE("Approval Status", AuthtoIncurExpend."Approval Status"::Open);
            //         AuthtoIncurExpend.MODIFY;
            //         Variant := AuthtoIncurExpend;
            //         Handled := true;
            //     end;
            // //Expense Requisition
            // Database::"Expense Requisition":
            //     begin
            //         RecRef.SetTable(ExpenseReq);
            //         ExpenseReq.validate("Approval Status", ExpenseReq."Approval Status"::Open);
            //         ExpenseReq.Modify();
            //         Variant := ExpenseReq;
            //         Handled := true;
            //         Commitment.ReverseExpenditureRequisitionCommit(ExpenseReq);
            //     end;
            // //EFT Header
            // Database::"EFT Header":
            //     begin
            //         RecRef.SetTable(EFTHeader);
            //         EFTHeader.Validate(Status, EFTHeader.Status::Open);
            //         EFTHeader.Modify();
            //         Variant := EFTHeader;
            //         Handled := true;
            //     end;
            Database::"Annual Disposal Plan Header":
                begin
                    RecRef.settable(AnnualDisposalPlan);
                    AnnualDisposalPlan.Validate(Status, AnnualDisposalPlan.status::New);
                    AnnualDisposalPlan.modify();
                    Variant := AnnualDisposalPlan;
                    Handled := true;
                end;
            Database::"Request Header1":
                begin
                    RecRef.settable(Imprest);
                    Imprest.Validate(Status, Imprest.status::Open);
                    Imprest.modify();
                    Variant := Imprest;
                    Handled := true;
                end;
            Database::"Purchase Header":
                begin
                    RecRef.settable(PurchaseHeader);
                    PurchaseHeader.Validate(Status, PurchaseHeader.status::Open);
                    PurchaseHeader.modify();
                    Variant := PurchaseHeader;
                    Handled := true;
                end;
            //Licence Registration Form
            Database::"Licence Registration Form":
                begin
                    RecRef.settable(LicenceRegistrationForm);
                    LicenceRegistrationForm.Validate(Status, LicenceRegistrationForm.status::Open);
                    LicenceRegistrationForm.modify();
                    Variant := LicenceRegistrationForm;
                    Handled := true;
                end;

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var

        Variant: Variant;
        // ConsolidatedTrainingNeeds: Record "Consolidated Training Needs";
        LoanApplication: Record "Loan Application";
        //Induction Header
        InductionHeader: Record "Induction Header";
        //pavement
        // PavementTestHeader: Record "Pavement Test Header";
        //purchase
        purchaseheader: Record "Purchase Header";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //pv
        Payments: record payments;
        //"IFS Tender Committee"
        IFSTender: Record "IFS Tender Committee";

        //"Receipts Header1"
        Receipt: Record "Receipts Header1";
        //"Bid Tabulation Header"
        Opinion: Record "Bid Tabulation Header";
        //Item Creation Requests
        // ITM: Record "Item Creation Requests";

        //Airtime
        Airtime: Record "Airtime Allocation Header";
        //"Succession Plan Header"
        SuccessionPlanHeader: Record "Succession Plan Header";
        //"Succession Log Header"
        SuccessionLogHeader: Record "Succession Log Header";
        //ResourceBookingHeader
        ResourceBookingHeader: Record "Resource Booking Header";
        //Positions
        Positions: Record "Company Positions";
        //"Vacancy Announcement"
        Announcement: Record "Vacancy Announcement";
        //"Commitee Appointment Voucher"
        HRComm: Record "Commitee Appointment Voucher";
        //"Employee Transfers"
        EmpTrans: Record "Employee Transfers";
        //"Employee Acting Position"
        EmpAct: Record "Employee Acting Position";
        // EmpOnboard: Record "HR Employee Onboarding";
        // //Imprest Memo
        // ImprestMemo: Record "Imprest Memo";
        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        FuelCard: Record "Fuel Card";
        DisciplineDtls: Record "Discipline Details";
        //"Maintenance Header"
        // MaintenanceReq: Record "Maintenance Header";
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        //Interbank Transfer
        // InterBankTransfer: Record "Inter Bank Transfer";
        VehicleRqst: Record "Vehicle Request";
        VehicleIncident: Record "Vehicle Incident";
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
        Orgstructure: Record "Organization Hierarchy Header";
        Establishment: Record "Staff Establishment Plan";
        PCAHeader: Record "prBasic pay PCA";
        HRLeaveAllocationRequest: Record "HR Leave Allocation Request";
        LeaveApplicationRecall: Record "Leave Application Recall";
        PayrollHeader: Record "Payroll Header";
        HRLeaveApplication: Record "HR Leave Application";
        PRPayrollBuffer: Record "PR Payroll Buffer";
        MonthlyWorkTicketHdr: Record "Monthly Work Ticket Header";
        LeaveJournalVoucher: Record "Leave Journal Voucher";
        TrainingPlanHeader: Record "Training Plan Header";
        TrainingNeedsHeader: Record "Training Needs Header";
        TrainingRequests: Record "Training Requests";
        // TrainingExtension: Record "Training Extension";
        PRTransactionCodes: Record "PR Transaction Codes";
        EmployeeExitHdr: Record "Employee Exit Header";
        HRLeavePlannerHeader: Record "HR Leave Planner Header";
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        BudgetConsHeader: Record "Budget Consolidation Header";
        SPMSetUp: Record "SPM General Setup";
        WorkPlanMgt: Codeunit "Workplan Management";
        // BudgReAllocHeader: Record "Budget ReAllocation Header";
        // AuthtoIncurExpend: Record "Auth. Inc. Expend. Header";
        // BatchAuthToIncExpend: Record "Batch. Auth to Incur Expend";
        ExpenseReq: Record "Expense Requisition";
        // PlanningHeader: Record "Planning Header";
        // ProjectMgmt: Codeunit "Project Management";
        // ProjectClosure: Record "Project Closure";
        Jobs: record Job;
        EFTHeader: Record "EFT Header";
        // ProjectMembers: Record "Project Members";
        // OtherCosts: Record "Other Costs";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        Commitment: Codeunit Committment;
        // PayPost: Codeunit "Payments-Post";
        AnnualDisposalPlan: Record "Annual Disposal Plan Header";
        // ProcMgt: Codeunit "Procurement Management";
        BidRegister: Record "Bid Opening Register";
        // ContractorRequest: Record "Contractor Request Header";
        Direction: Enum "Utilization Direction";
        Imprest: Record "Request Header1";
        LicenceRegistrationForm: Record "Licence Registration Form";
        Count: Integer;
        LicensingPortal: Codeunit "Licensing Portal";
        StaffRegistration: Record "Wip Header Registration";
    begin
        Handled := true;
        case RecRef.Number of
            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Approved);
                    StaffRegistration."Approval Status" := StaffRegistration."Approval Status"::Approved;
                    StaffRegistration.Modify;
                    Handled := true;
                end;
            //BidRegister
            Database::"Bid Opening Register":
                begin
                    RecRef.SetTable(BidRegister);
                    BidRegister.Validate(BidRegister."Approval Status", BidRegister."Approval Status"::Released);
                    BidRegister.Modify;
                    Variant := BidRegister;
                end;
            //HR Leave Planner Header
            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(HRLeavePlannerHeader);
                    HRLeavePlannerHeader.Validate(Status, HRLeavePlannerHeader.Status::Approved);
                    HRLeavePlannerHeader.Modify;
                    Variant := HRLeavePlannerHeader;
                end;
            // //Consolidated Training Needs
            // Database::"Consolidated Training Needs":
            //     begin
            //         RecRef.SetTable(ConsolidatedTrainingNeeds);
            //         ConsolidatedTrainingNeeds.Validate(Status, ConsolidatedTrainingNeeds.Status::Released);
            //         ConsolidatedTrainingNeeds.ValidateStatus(ConsolidatedTrainingNeeds);
            //         ConsolidatedTrainingNeeds.Modify;
            //         Variant := ConsolidatedTrainingNeeds;
            //     end;
            //purchaseheader
            Database::"purchase header":
                begin
                    RecRef.SetTable(purchaseheader);
                    purchaseheader.Validate(Status, purchaseheader.Status::Released);
                    purchaseheader.Modify();
                    Variant := purchaseheader;
                end;
            //PR Transaction Codes
            Database::"PR Transaction Codes":
                begin
                    RecRef.SetTable(PRTransactionCodes);
                    PRTransactionCodes.Validate(Status, PRTransactionCodes.Status::Released);
                    PRTransactionCodes.Modify;
                    Variant := PRTransactionCodes;
                end;
            // //Training Extension
            // Database::"Training Extension":
            //     begin
            //         RecRef.SetTable(TrainingExtension);
            //         TrainingExtension.Validate(Status, TrainingExtension.Status::Approved);
            //         TrainingExtension.Modify;
            //         Variant := TrainingExtension;
            //     end;
            //Training Requests
            Database::"Training Requests":
                begin
                    RecRef.SetTable(TrainingRequests);
                    TrainingRequests.Validate(Status, TrainingRequests.Status::Approved);
                    TrainingRequests.Modify;
                    Variant := TrainingRequests;
                end;
            //Training Plan Header
            Database::"Training Plan Header":
                begin
                    RecRef.SetTable(TrainingPlanHeader);
                    TrainingPlanHeader.Validate("Approved Status", TrainingPlanHeader."Approved Status"::Released);
                    TrainingPlanHeader.Modify;
                    Variant := TrainingPlanHeader;
                end;
            //Training Needs Header
            Database::"Training Needs Header":
                begin
                    RecRef.SetTable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::Released);
                    TrainingNeedsHeader.Modify;
                    Variant := TrainingNeedsHeader;
                end;
            //leave
            Database::"HR Leave Allocation Request":
                begin
                    RecRef.SetTable(HRLeaveAllocationRequest);
                    HRLeaveAllocationRequest.Validate(Status, HRLeaveAllocationRequest.Status::Approved);
                    HRLeaveAllocationRequest.Modify;
                    Variant := HRLeaveAllocationRequest;
                end;
            //leave
            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);
                    HRLeaveApplication.Status := HRLeaveApplication.Status::Released;
                    HRLeaveApplication.ValidateStatus(HRLeaveApplication);
                    HRLeaveApplication.Posted := true;

                    HRLeaveApplication.Modify;
                    Variant := HRLeaveApplication;
                end;
            // //PlanningHeader
            // Database::"Planning Header":
            //     begin
            //         RecRef.SetTable(PlanningHeader);
            //         PlanningHeader.Status := PlanningHeader.Status::Released;
            //         if (PlanningHeader."Design Control Type" in [PlanningHeader."Design Control Type"::Final]) then
            //             ProjectMgmt.FnConsolidateDesignsToOne(PlanningHeader);
            //         PlanningHeader.Modify;
            //         Variant := PlanningHeader;
            //     end;

            // //Contractor Request
            // Database::"Contractor Request Header":
            //     begin
            //         RecRef.SetTable(ContractorRequest);
            //         ContractorRequest."Approval Status" := ContractorRequest."Approval Status"::Approved;
            //         if ContractorRequest."Document Type" in [ContractorRequest."Document Type"::Extension,
            //         ContractorRequest."Document Type"::Amendment,
            //         ContractorRequest."Document Type"::"Claims On Delayed Payments",
            //         ContractorRequest."Document Type"::"Joint Measurement"] then
            //             ContractorRequest.Status := ContractorRequest.Status::CRJ;
            //         ContractorRequest.Modify;
            //         Variant := ContractorRequest;
            //     end;

            // //project Closure
            // Database::"Project Closure":
            //     begin
            //         RecRef.SetTable(ProjectClosure);
            //         ProjectClosure."Approval Status" := ProjectClosure."Approval Status"::Approved;
            //         ProjectClosure.Modify;
            //         if Jobs.Get(ProjectClosure."Project No.") then begin
            //             Jobs."Project Phase" := Jobs."Project Phase"::Closure;
            //             Jobs.Modify();
            //         end;
            //         Variant := ProjectClosure;
            //     end;

            // Database::"Job":
            //     begin
            //         RecRef.SetTable(Jobs);
            //         Jobs."Approval Status" := Jobs."Approval Status"::Released;
            //         Jobs.Modify;
            //         Variant := Jobs;
            //     end;
            //leave adjustment
            Database::"Leave Journal Voucher":
                begin
                    RecRef.SetTable(LeaveJournalVoucher);
                    LeaveJournalVoucher.Validate(Status, LeaveJournalVoucher.Status::Released);
                    LeaveJournalVoucher.Modify;
                    Variant := LeaveJournalVoucher;
                end;
            //payroll buffer
            Database::"PR Payroll Buffer":
                begin
                    RecRef.SetTable(PRPayrollBuffer);
                    PRPayrollBuffer.Validate(Status, PRPayrollBuffer.Status::Released);
                    PRPayrollBuffer.Modify;
                    Variant := PRPayrollBuffer;
                end;
            //Loan Application
            Database::"Loan Application":
                begin
                    RecRef.SetTable(LoanApplication);
                    LoanApplication.Validate("Loan Status", LoanApplication."Loan Status"::Approved);
                    LoanApplication.Modify;
                    Variant := LoanApplication;
                end;
            //Payroll Header
            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::Released);
                    PayrollHeader.Modify;
                    Variant := PayrollHeader;
                end;
            //Leave Application Recall
            Database::"Leave Application Recall":
                begin
                    RecRef.SetTable(LeaveApplicationRecall);
                    LeaveApplicationRecall.Validate(Status, LeaveApplicationRecall.Status::Released);
                    LeaveApplicationRecall.Modify;
                    Variant := LeaveApplicationRecall;
                end;
            //Induction Header
            Database::"Induction Header":
                begin
                    RecRef.SetTable(inductionheader);
                    inductionheader.Validate("Approval Status", inductionheader."Approval Status"::Released);
                    inductionheader.Modify;
                    Variant := inductionheader;
                end;
            // //pavement
            // Database::"Pavement Test Header":
            //     begin
            //         RecRef.SetTable(PavementTestHeader);
            //         PavementTestHeader.Validate(Status, PavementTestHeader.Status::Released);
            //         PavementTestHeader.Modify;
            //         Variant := PavementTestHeader;
            //     end;
            //PCA
            Database::"prBasic pay PCA":
                begin
                    RecRef.SetTable(PCAHeader);
                    PCAHeader.Validate(Status, PCAHeader.Status::Approved);
                    PCAHeader.Modify;
                    Variant := PCAHeader;
                end;

            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::Released);
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                end;
            //procurement plan
            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::Released);
                    procurementplan.Modify;
                    Variant := procurementplan;
                end;

            //rfq
            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::Released);
                    StandardPurchaseCode.Modify;
                    StandardPurchaseCode.CreateBidRegister();
                    Variant := StandardPurchaseCode;
                end;


            //pv
            Database::"Payments":
                begin
                    RecRef.SetTable(Payments);
                    payments.Validate(Status, payments.Status::Released);
                    payments.Modify;
                    Variant := payments;
                end;
            //"IFS Tender Committee"
            Database::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTender);
                    IFSTender.Validate("Approval Status", IFSTender."Approval Status"::Released);
                    IFSTender.Modify;
                    Variant := IFSTender;
                end;
            //"Receipts Header1"
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::Released);
                    Receipt.Modify;
                    Variant := Receipt;
                end;

            //"Bid Tabulation Header"
            Database::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(Opinion);
                    Opinion.Validate("Approval Status", Opinion."Approval Status"::Released);
                    Opinion.Modify;
                    Variant := Opinion;
                end;
            // //Item Creation Requests
            // Database::"Item Creation Requests":
            //     begin
            //         RecRef.SetTable(ITM);
            //         ITM.Validate(Status, ITM.Status::Released);
            //         ITM.Modify;
            //         Variant := ITM;
            //     end;

            //"Airtime Allocation Header"
            Database::"Airtime Allocation Header":
                begin
                    RecRef.SetTable(Airtime);
                    Airtime.Validate(Status, Airtime.Status::Released);
                    Airtime.Modify;
                    Variant := Airtime;
                end;


            //ResourceBookingHeader
            Database::"Resource Booking Header":
                begin
                    RecRef.SetTable(ResourceBookingHeader);
                    ResourceBookingHeader.Validate(Status, ResourceBookingHeader.Status::Released);
                    ResourceBookingHeader.Modify;
                    Variant := ResourceBookingHeader;
                end;
            //SuccessionPlanHeader
            Database::"Succession Plan Header":
                begin
                    RecRef.SetTable(SuccessionPlanHeader);
                    SuccessionPlanHeader.Validate(Status, SuccessionPlanHeader.Status::Released);
                    SuccessionPlanHeader.Modify;
                    Variant := SuccessionPlanHeader;
                end;
            //"SuccessionLogHeader"
            Database::"Succession Log Header":
                begin
                    RecRef.SetTable(SuccessionLogHeader);
                    SuccessionLogHeader.Validate(Status, SuccessionLogHeader.Status::Released);
                    SuccessionLogHeader.Modify;
                    Variant := SuccessionLogHeader;
                end;

            //"Company Positions"
            Database::"Company Positions":
                begin
                    RecRef.SetTable(Positions);
                    Positions.Validate("Approval Status", Positions."Approval Status"::Released);
                    Positions.Modify;
                    Variant := Positions;
                end;
            //"Vacancy Announcement"
            Database::"Vacancy Announcement":
                begin
                    RecRef.SetTable(Announcement);
                    Announcement.Validate("Approval Status", Announcement."Approval Status"::Released);
                    Announcement.Modify;
                    Variant := Announcement;
                end;
            //"Commitee Appointment Voucher"
            Database::"Commitee Appointment Voucher":
                begin
                    RecRef.SetTable(HRComm);
                    HRComm.Validate("Approval Status", HRComm."Approval Status"::Released);
                    HRComm.Modify;
                    Variant := HRComm;
                end;
            //"Employee Transfers"
            Database::"Employee Transfers":
                begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Validate(Status, EmpTrans.Status::Released);
                    //CreateTransferAllowancePayChange(EmpTrans);
                    EmpTrans.Modify;
                    Variant := EmpTrans;
                end;
            //"Employee Acting Position"
            Database::"Employee Acting Position":
                begin
                    RecRef.SetTable(EmpAct);
                    EmpAct.Validate(Status, EmpAct.Status::Approved);
                    EmpAct.Modify;
                    Variant := EmpAct;
                end;
            // //"Employee Onboarding"
            // Database::"HR Employee Onboarding":
            //     begin
            //         RecRef.SetTable(EmpOnboard);
            //         EmpOnboard.Validate("Document Status", EmpOnboard."Document Status"::Approved);
            //         EmpOnboard.Modify;
            //         Variant := EmpOnboard;
            //     end;

            // //Imprest Memo
            // Database::"Imprest Memo":
            //     begin
            //         RecRef.SetTable(ImprestMemo);
            //         ImprestMemo.Validate(Status, ImprestMemo.Status::Released);
            //         ImprestMemo.Modify;

            //         //Update Lines
            //         ProjectMembers.Reset;
            //         ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
            //         if ProjectMembers.FindSet() then
            //             ProjectMembers.ModifyAll(Status, ProjectMembers.Status::Released);
            //         Variant := ImprestMemo;
            //     end;
            //"Transport Requisition"
            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(FleetReq);
                    FleetReq.Validate(Status, FleetReq.Status::Approved);
                    FleetReq.Modify;
                    Variant := FleetReq;
                end;
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.SetTable(FuelReq);
                    FuelReq.Validate(Status, FuelReq.Status::Approved);
                    FuelReq.Modify;
                    Variant := FuelReq;
                end;
            //"Fuel Card"
            Database::"Fuel Card":
                begin
                    RecRef.SetTable(FuelCard);
                    FuelCard.Validate(Status, FuelCard.Status::Approved);
                    FuelCard.Modify;
                    Variant := FuelCard;
                end;
            // //"Maintenance Header"
            // Database::"Maintenance Header":
            //     begin
            //         RecRef.SetTable(MaintenanceReq);
            //         MaintenanceReq.Validate(Status, MaintenanceReq.Status::Approved);
            //         MaintenanceReq.Modify;
            //         Variant := MaintenanceReq;
            //     end;
            //"HR Asset Transfer Header"
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(HRAssettrans);
                    HRAssettrans.Validate(Status, HRAssettrans.Status::Approved);
                    HRAssettrans.Modify;
                    Variant := HRAssettrans;
                end;
            //"Recruitment Plan"
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(Recruiplan);
                    Recruiplan.Validate("Approval Status", Recruiplan."Approval Status"::Released);
                    Recruiplan.Modify;
                    Variant := Recruiplan;
                end;

            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitReq);
                    RecruitReq.Validate("Approval Status", RecruitReq."Approval Status"::Released);
                    RecruitReq.Modify;
                    Variant := RecruitReq;
                end;
            // //Interbank Transfer
            // Database::"Inter Bank Transfer":
            //     begin
            //         RecRef.SetTable(InterBankTransfer);
            //         InterBankTransfer.Validate("Approval Status", InterBankTransfer."Approval Status"::Released);
            //         InterBankTransfer.Modify;
            //         Variant := InterBankTransfer;
            //     end;
            //Vehicle Request
            Database::"Vehicle Request":
                begin
                    RecRef.SetTable(VehicleRqst);
                    VehicleRqst.Validate(Status, VehicleRqst.Status::Approved);
                    VehicleRqst.Modify;
                    Variant := VehicleRqst;
                end;

            //Vehicle Incident
            Database::"Vehicle Incident":
                begin
                    RecRef.SetTable(VehicleIncident);
                    VehicleIncident.Validate(Status, VehicleIncident.Status::Approved);
                    VehicleIncident.Modify;
                    Variant := VehicleIncident;
                end;
            //Discipline Details
            Database::"Discipline Details":
                begin
                    RecRef.SetTable(DisciplineDtls);
                    DisciplineDtls.Validate(Status, DisciplineDtls.Status::Approved);
                    DisciplineDtls.Modify;
                    Variant := DisciplineDtls;
                end;
            //MonthlyWorkTicketHdr
            Database::"Monthly Work Ticket Header":
                begin
                    RecRef.SetTable(MonthlyWorkTicketHdr);
                    MonthlyWorkTicketHdr.Validate(Status, MonthlyWorkTicketHdr.Status::Released);

                    MonthlyWorkTicketHdr.Modify;
                    Variant := MonthlyWorkTicketHdr;
                end;
            //Corporate Strategic Plans
            Database::"Corporate Strategic Plans":
                begin
                    RecRef.SetTable(CorporateStrategicPlans);
                    CorporateStrategicPlans.Validate("Approval Status", CorporateStrategicPlans."Approval Status"::Released);
                    CorporateStrategicPlans.Modify;
                    Variant := CorporateStrategicPlans;
                end;
            DATABASE::"Organization Hierarchy Header":
                begin
                    RecRef.SETTABLE(Orgstructure);
                    Orgstructure.VALIDATE("Status", Orgstructure."Status"::Approved);
                    Orgstructure.MODIFY;
                    Variant := Orgstructure;
                end;
            DATABASE::"Staff Establishment Plan":
                begin
                    RecRef.SETTABLE(Establishment);
                    Establishment.VALIDATE("Status", Establishment."Status"::Approved);
                    Establishment.MODIFY;
                    Variant := Establishment;
                end;
            DATABASE::"Employee Exit Header":
                begin
                    RecRef.SETTABLE(EmployeeExitHdr);
                    EmployeeExitHdr.VALIDATE(Status, EmployeeExitHdr.Status::Approved);
                    EmployeeExitHdr.MODIFY;
                    Variant := EmployeeExitHdr;
                end;
            DATABASE::"Perfomance Contract Header":
                begin
                    RecRef.SETTABLE(PerfomanceContrHdr);
                    PerfomanceContrHdr.Validate("Approval Status", PerfomanceContrHdr."Approval Status"::Released);
                    PerfomanceContrHdr.Modify();
                    Variant := PerfomanceContrHdr;
                end;
            //Annual Strategy WorkPlan
            Database::"Annual Strategy Workplan":
                begin
                    RecRef.SetTable(AnnualStrategyWorkplan);
                    AnnualStrategyWorkplan.Validate("Approval Status", AnnualStrategyWorkplan."Approval Status"::Released);
                    AnnualStrategyWorkplan.Modify;
                    Variant := AnnualStrategyWorkplan;
                    Handled := true;
                    Commit();
                    if SPMSetUp.Get() then begin
                        case
                            AnnualStrategyWorkplan."Planning Budget Type" of
                            AnnualStrategyWorkplan."Planning Budget Type"::Original:
                                begin
                                    if SPMSetUp."AutoCons. Resource Req on Appr" then
                                        AnnualStrategyWorkplan.ConsolidatePlan();
                                end;
                            AnnualStrategyWorkplan."Planning Budget Type"::Supplementary:
                                begin
                                    if SPMSetUp."AutoCons. Spend. Unit on Appr" then
                                        AnnualStrategyWorkplan.ConsolidatePlan();
                                end;
                            AnnualStrategyWorkplan."Planning Budget Type"::"Supplementary 2":
                                begin
                                    if SPMSetUp."AutoCons. Spend. Unit on Appr" then
                                        AnnualStrategyWorkplan.ConsolidatePlan();
                                end;
                        end;
                    end;
                end;
            //Budget Consolidation Header
            Database::"Budget Consolidation Header":
                begin
                    RecRef.SetTable(BudgetConsHeader);
                    BudgetConsHeader.Validate("Approval Status", BudgetConsHeader."Approval Status"::Released);
                    BudgetConsHeader.Modify;
                    Variant := BudgetConsHeader;
                    Handled := true;
                    Commit();

                    //Send to JSC
                    if SPMSetUp.Get() then;
                    case
                        BudgetConsHeader."Planning Budget Type" of
                        BudgetConsHeader."Planning Budget Type"::Original:
                            begin
                                if SPMSetUp."Create Draft Plans on Approval" then
                                    WorkplanMgt.CreateWorkplanFromResourceConsolidation(BudgetConsHeader);
                            end;
                    // BudgetConsHeader."Planning Budget Type"::Supplementary:
                    //     begin
                    //         if SPMSetUp."Send Draft Cons JSC on Appr." then
                    //             WorkPlanMgt.SendDraftWorkplanConsilidationToNAJSCOrMarkApproved(BudgetConsHeader, 0);
                    //     end;
                    end;
                end;
            // //Batch ReAllocation Header
            // Database::"Budget Reallocation Header":
            //     begin
            //         RecRef.SetTable(BudgReAllocHeader);
            //         BudgReAllocHeader.Validate("Approval Status", BudgReAllocHeader."Approval Status"::Approved);
            //         BudgReAllocHeader.Modify;
            //         Handled := true;
            //     end;
            // //Batch Auth to Incur Expenses
            // Database::"Batch. Auth to Incur Expend":
            //     begin
            //         RecRef.SetTable(BatchAuthToIncExpend);
            //         BatchAuthToIncExpend.Validate("Approval Status", BatchAuthToIncExpend."Approval Status"::Released);
            //         BatchAuthToIncExpend.Modify;

            //         AuthtoIncurExpend.Reset();
            //         AuthtoIncurExpend.SetRange("Batch No.", BatchAuthToIncExpend."No.");
            //         if AuthtoIncurExpend.FindSet() then
            //             AuthtoIncurExpend.ModifyAll("Approval Status", AuthtoIncurExpend."Approval Status"::Released);

            //         Handled := true;
            //     end;
            // //Auth to Incur Expense
            // Database::"Auth. Inc. Expend. Header":
            //     begin
            //         RecRef.SetTable(AuthtoIncurExpend);
            //         AuthtoIncurExpend.Validate("Approval Status", AuthtoIncurExpend."Approval Status"::Released);
            //         AuthtoIncurExpend.Modify;
            //         Handled := true;
            //     end;
            // //Expense Requisition
            // Database::"Expense Requisition":
            //     begin
            //         RecRef.SetTable(ExpenseReq);
            //         ExpenseReq.validate("Approval Status", ExpenseReq."Approval Status"::Released);
            //         ExpenseReq.Modify(true);
            //         Handled := true;

            //         SPMSetUp.Get;
            //         if SPMSetUp."Commit Exp. Req. On Approval" then begin
            //             //Run Commit function
            //             Commitment.CommitExpenditureRequisition(ExpenseReq);
            //         end else begin
            //             //Mark as Pending Committment
            //             if ExpenseReq.Status <> ExpenseReq.Status::Committed then begin
            //                 ExpenseReq.validate(Status, ExpenseReq.Status::"Pending Commitment");
            //                 ExpenseReQ.Modify();
            //             end;
            //         end;

            //         //Create Imprest Memo
            //         Commit();
            //         if ExpenseReq."Requires Imprest" then begin
            //             case
            //                 ExpenseReq."Imprest Type" of
            //                 ExpenseReq."Imprest Type"::"Safari Imprest":
            //                     PayPost.CreateImprestMemoFromExpenditureRequest(ExpenseReq);
            //                 ExpenseReq."Imprest Type"::"Special Imprest", ExpenseReq."Imprest Type"::"Standing Imprest":
            //                     PayPost.CreateStandingSpecialImprestFromExpenditureRequest(ExpenseReq);
            //             end;
            //         end;
            //         if ExpenseReq."Requires PRN" then begin
            //             ProcMgt.CreatePurchaseRequisitionFromEXR(ExpenseReq);
            //         end;
            //         if ExpenseReq."Requires Direct Payment" then begin
            //             case
            //                 ExpenseReq."Direct Payment Type" of
            //                 ExpenseReq."Direct Payment Type"::"Staff Claim":
            //                     PayPost.CreateStaffClaimFromExpenditureReq(ExpenseReq);
            //                 ExpenseReq."Direct Payment Type"::"Non Staff Claim":
            //                     PayPost.CreatePurchaseInvoiceFromEXRHeader(ExpenseReq);
            //             end;
            //         end;
            //     end;

            // //EFT Header
            // Database::"EFT Header":
            //     begin
            //         RecRef.SetTable(EFTHeader);

            //         EFTHeader.Validate(Status, EFTHeader.Status::Released);
            //         EFTHeader.Modify();
            //         Handled := true;
            //     end;
            Database::"Annual Disposal Plan Header":
                begin
                    RecRef.settable(AnnualDisposalPlan);
                    AnnualDisposalPlan.Validate(Status, AnnualDisposalPlan.status::Approved);
                    AnnualDisposalPlan.modify();
                    Handled := true;
                end;
            Database::"Request Header1":
                begin
                    RecRef.settable(Imprest);
                    Imprest.Validate(Status, Imprest.status::Released);
                    Imprest.modify();
                    Handled := true;
                end;
            //Licence Registration Form
            Database::"Licence Registration Form":
                begin
                    RecRef.settable(LicenceRegistrationForm);
                    if not LicensingPortal.fnCheckApprovedCategories(LicenceRegistrationForm) then
                        Error('You must approve at least one category before approving the document.');
                    LicenceRegistrationForm.Validate(Status, LicenceRegistrationForm.status::Approved);
                    if LicenceRegistrationForm.modify(true) then begin
                        LicensingPortal.fnNotifyApprovedApplication(LicenceRegistrationForm);
                    end;
                    Handled := true;
                end;
            else begin
                Handled := false;
                Error(UnsupportedRecordTypeErr, RecRef.Caption);

            end;
        end
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        LoanApplication: Record "Loan Application";
        StaffRegistration: Record "Wip Header Registration";
        HRLeavePlannerHeader: Record "HR Leave Planner Header";
        // ConsolidatedTrainingNeeds: Record "Consolidated Training Needs";
        // //pavement
        // PavementTestHeader: Record "Pavement Test Header";
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //RFQ
        StandardPurchaseCode: Record "Standard Purchase Code";
        //pv
        payments: Record payments;
        //Induction Header
        InductionHeader: Record "Induction Header";
        //"IFS Tender Committee"
        IFSTender: Record "IFS Tender Committee";

        //"Receipts Header1"
        Receipt: Record "Receipts Header1";
        //"Bid Tabulation Header"
        Opinion: Record "Bid Tabulation Header";
        //Item Creation Requests
        // ITM: Record "Item Creation Requests";
        //Airtime
        Airtime: Record "Airtime Allocation Header";
        //"Succession Plan Header"

        SuccessionPlanHeader: Record "Succession Plan Header";

        //"Succession Log Header"
        SuccessionLogHeader: Record "Succession Log Header";
        //ResourceBookingHeader
        ResourceBookingHeader: Record "Resource Booking Header";
        //Positions
        Positions: Record "Company Positions";
        //"Vacancy Announcement"
        Announcement: Record "Vacancy Announcement";

        //"Commitee Appointment Voucher"
        HRComm: Record "Commitee Appointment Voucher";
        //"Employee Transfers"
        EmpTrans: Record "Employee Transfers";

        //"Employee Acting Position"
        EmpAct: Record "Employee Acting Position";
        // EmpOnboard: Record "HR Employee Onboarding";
        // //Imprest Memo
        // ImprestMemo: Record "Imprest Memo";
        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        //"Maintenance Header"
        // MaintenanceReq: Record "Maintenance Header";
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        //Interbank Transfer
        // InterBankTransfer: Record "Inter Bank Transfer";
        VehicleRqst: Record "Vehicle Request";
        HRLeaveAllocationRequest: Record "HR Leave Allocation Request";
        LeaveApplicationRecall: Record "Leave Application Recall";
        HRLeaveApplication: Record "HR Leave Application";
        PRPayrollBuffer: Record "PR Payroll Buffer";
        VehicleIncident: Record "Vehicle Incident";
        DisciplineDtls: Record "Discipline Details";
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
        Orgstructure: Record "Organization Hierarchy Header";
        Establishment: Record "Staff Establishment Plan";
        PCAHeader: Record "prBasic pay PCA";
        PayrollHeader: Record "Payroll Header";
        MonthlyWorkTicketHdr: Record "Monthly Work Ticket Header";
        FuelCard: Record "Fuel Card";
        LeaveJournalVoucher: Record "Leave Journal Voucher";
        TrainingNeedsHeader: Record "Training Needs Header";
        TrainingPlanHeader: Record "Training Plan Header";
        TrainingRequests: Record "Training Requests";
        // TrainingExtension: Record "Training Extension";
        PRTransactionCodes: Record "PR Transaction Codes";
        EmployeeExitHeader: Record "Employee Exit Header";
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        BudgetConsHeader: Record "Budget Consolidation Header";
        // BudgReAllocHeader: Record "Budget ReAllocation Header";
        // AuthtoIncurExpend: Record "Auth. Inc. Expend. Header";
        // BatchAuthToIncExpend: Record "Batch. Auth to Incur Expend";
        ExpenseReq: Record "Expense Requisition";
        Commitment: Codeunit Committment;
        // PlannigHeader: Record "Planning Header";
        // ProjectClosure: record "Project Closure";
        Job: record Job;
        EFTHeader: Record "EFT Header";
        AnnualDisposalPlan: Record "Annual Disposal Plan Header";
        BidRegister: record "Bid Opening Register";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        isBankValid: Boolean;
        // ContractorRequest: Record "Contractor Request Header";
        OTPSender: Codeunit "OTP Sender";
        Direction: Enum "Utilization Direction";
        Imprest: Record "Request Header1";
        LicenceRegistrationForm: Record "Licence Registration Form";

    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of
            //BidRegister
            Database::"Bid Opening Register":
                begin
                    RecRef.SetTable(BidRegister);
                    BidRegister.Validate(BidRegister."Approval Status", BidRegister."Approval Status"::"Pending Approval");
                    BidRegister.Modify;
                    Variant := BidRegister;
                    IsHandled := true;
                end;
            //HR Leave Planner Header
            Database::"HR Leave Planner Header":
                begin
                    RecRef.SetTable(HRLeavePlannerHeader);
                    HRLeavePlannerHeader.Validate(Status, HRLeavePlannerHeader.Status::"Pending Approval");
                    HRLeavePlannerHeader.Modify;
                    Variant := HRLeavePlannerHeader;
                    IsHandled := true;
                end;
            // //Consolidated Training Needs

            // Database::"Consolidated Training Needs":
            //     begin
            //         RecRef.SetTable(ConsolidatedTrainingNeeds);
            //         ConsolidatedTrainingNeeds.Validate(Status, ConsolidatedTrainingNeeds.Status::"Pending Approval");
            //         ConsolidatedTrainingNeeds.Modify;
            //         Variant := ConsolidatedTrainingNeeds;
            //         IsHandled := true;
            //     end;
            //PR Transaction Codes

            Database::"PR Transaction Codes":
                begin
                    RecRef.SetTable(PRTransactionCodes);
                    PRTransactionCodes.Validate(Status, PRTransactionCodes.Status::"Pending Approval");
                    PRTransactionCodes.Modify;
                    Variant := PRTransactionCodes;
                    IsHandled := true;
                end;
            // //Training Extension

            // Database::"Training Extension":
            //     begin
            //         RecRef.SetTable(TrainingExtension);
            //         TrainingExtension.Validate(Status, TrainingExtension.Status::"Pending Approval");
            //         TrainingExtension.Modify;
            //         Variant := TrainingExtension;
            //         IsHandled := true;
            //     end;
            //Training Requests

            Database::"Training Requests":
                begin
                    RecRef.SetTable(TrainingRequests);
                    TrainingRequests.Validate(Status, TrainingRequests.Status::"Pending Approval");
                    TrainingRequests.Modify;
                    Variant := TrainingRequests;
                    IsHandled := true;
                end;

            //Training Plan
            Database::"Training Plan Header":
                begin
                    RecRef.SetTable(TrainingPlanHeader);
                    TrainingPlanHeader.Validate("Approved Status", TrainingPlanHeader."Approved Status"::"Pending Approval");
                    TrainingPlanHeader.Modify;
                    Variant := TrainingPlanHeader;
                    IsHandled := true;
                end;
            //Training Needs Header

            Database::"Training Needs Header":
                begin
                    RecRef.SetTable(TrainingNeedsHeader);
                    TrainingNeedsHeader.Validate(Status, TrainingNeedsHeader.Status::"Pending Approval");
                    TrainingNeedsHeader.Modify;
                    Variant := TrainingNeedsHeader;
                    IsHandled := true;
                end;
            //leave

            Database::"HR Leave Allocation Request":
                begin
                    RecRef.SetTable(HRLeaveAllocationRequest);
                    HRLeaveAllocationRequest.Validate(Status, HRLeaveAllocationRequest.Status::"Pending Approval");
                    HRLeaveAllocationRequest.Modify;
                    Variant := HRLeaveAllocationRequest;
                    IsHandled := true;
                end;
            //leave

            Database::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLeaveApplication);
                    HRLeaveApplication.Validate(Status, HRLeaveApplication.Status::"Pending Approval");
                    HRLeaveApplication.Modify;
                    Variant := HRLeaveApplication;
                    IsHandled := true;
                end;

            // //ProjectClosure

            // Database::"Project Closure":
            //     begin
            //         RecRef.SetTable(ProjectClosure);
            //         ProjectClosure.Validate("Approval Status", ProjectClosure."Approval Status"::"Pending Approval");
            //         ProjectClosure.Modify;
            //         Variant := ProjectClosure;
            //         IsHandled := true;
            //     end;

            // //Contractor Request

            // Database::"Contractor Request Header":
            //     begin
            //         RecRef.SetTable(ContractorRequest);
            //         ContractorRequest.Validate("Approval Status", ContractorRequest."Approval Status"::"Pending Approval");
            //         ContractorRequest.Modify;
            //         Variant := ContractorRequest;
            //         IsHandled := true;
            //     end;

            // Database::"Job":
            //     begin
            //         RecRef.SetTable(Job);
            //         Job.Validate("Approval Status", Job."Approval Status"::"Pending Approval");
            //         Job.Modify;
            //         Variant := Job;
            //         IsHandled := true;
            //     end;
            //leave adjustment

            Database::"Leave Journal Voucher":
                begin
                    RecRef.SetTable(LeaveJournalVoucher);
                    LeaveJournalVoucher.Validate(Status, LeaveJournalVoucher.Status::"Pending Approval");
                    LeaveJournalVoucher.Modify;
                    Variant := LeaveJournalVoucher;
                    IsHandled := true;
                end;

            //payroll buffer 
            Database::"PR Payroll Buffer":
                begin
                    RecRef.SetTable(PRPayrollBuffer);
                    PRPayrollBuffer.Validate(Status, PRPayrollBuffer.Status::"Pending Approval");
                    PRPayrollBuffer.Modify;
                    Variant := PRPayrollBuffer;
                    IsHandled := true;
                end;
            //Loan

            Database::"Loan Application":
                begin
                    RecRef.SetTable(LoanApplication);
                    LoanApplication.Validate("Loan Status", LoanApplication."Loan Status"::"Pending Approval");
                    LoanApplication.Modify;
                    Variant := LoanApplication;
                    IsHandled := true;
                end;
            //Payroll Header

            Database::"Payroll Header":
                begin
                    RecRef.SetTable(PayrollHeader);
                    PayrollHeader.Validate(Status, PayrollHeader.Status::"Pending Approval");
                    PayrollHeader.Modify;
                    Variant := PayrollHeader;
                    IsHandled := true;
                end;
            //Leave Application Recall

            Database::"Leave Application Recall":
                begin
                    RecRef.SetTable(LeaveApplicationRecall);
                    LeaveApplicationRecall.Validate(Status, LeaveApplicationRecall.Status::"Pending Approval");
                    LeaveApplicationRecall.Modify;
                    Variant := LeaveApplicationRecall;
                    IsHandled := true;
                end;
            //Induction Header

            Database::"Induction Header":
                begin
                    RecRef.SetTable(inductionheader);
                    inductionheader.Validate("Approval Status", inductionheader."Approval Status"::"Pending Approval");
                    inductionheader.Modify;
                    Variant := inductionheader;
                    IsHandled := true;
                end;
            //pavement

            // Database::"Pavement Test Header":
            //     begin
            //         RecRef.SetTable(PavementTestHeader);
            //         PavementTestHeader.Validate(Status, PavementTestHeader.Status::"Pending Approval");
            //         PavementTestHeader.Modify;
            //         Variant := PavementTestHeader;
            //         IsHandled := true;
            //     end;


            // //pavement

            // Database::"Planning Header":
            //     begin
            //         RecRef.SetTable(PlannigHeader);
            //         PlannigHeader.Validate(Status, PlannigHeader.Status::"Pending Approval");
            //         if PlannigHeader."Design Control Type" in [PlannigHeader."Design Control Type"::Preliminary] then
            //             PlannigHeader."Design Approval Stage" := PlannigHeader."Design Approval Stage"::"Quantity Surveying";
            //         PlannigHeader.Modify;
            //         Variant := PlannigHeader;
            //         IsHandled := true;
            //     end;
            //PCA

            Database::"prBasic pay PCA":
                begin
                    RecRef.SetTable(PCAHeader);
                    PCAHeader.Validate(Status, PCAHeader.Status::"Pending Approval");
                    PCAHeader.Modify;
                    Variant := PCAHeader;
                    IsHandled := true;
                end;

            Database::"Request For Information":
                begin
                    RecRef.SetTable(RequestForInformation);
                    RequestForInformation.Validate(Status, RequestForInformation.Status::"Pending Approval");
                    RequestForInformation.Modify;
                    Variant := RequestForInformation;
                    IsHandled := true;
                end;

            //procurement plan

            Database::"procurement plan":
                begin
                    RecRef.SetTable(procurementplan);
                    procurementplan.Validate("Approval Status", procurementplan."Approval Status"::"Pending Approval");
                    procurementplan.Modify;
                    Variant := procurementplan;
                    IsHandled := true;
                end;
            //rfq

            Database::"Standard Purchase Code":
                begin
                    RecRef.SetTable(StandardPurchaseCode);
                    StandardPurchaseCode.Validate(Status, StandardPurchaseCode.Status::"Pending Approval");
                    StandardPurchaseCode.Modify;
                    Variant := StandardPurchaseCode;
                    IsHandled := true;
                end;
            //pv
            Database::"Payments":

                begin

                    RecRef.SetTable(Payments);
                    payments.Validate(Status, payments.Status::"Pending Approval");
                    payments.Modify;
                    Variant := payments;
                    IsHandled := true;
                end;



            //"IFS Tender Committee"
            Database::"IFS Tender Committee":
                begin
                    RecRef.SetTable(IFSTender);
                    IFSTender.Validate("Approval Status", IFSTender."Approval Status"::"Pending Approval");
                    IFSTender.Modify;
                    Variant := IFSTender;
                    IsHandled := true;
                end;

            //"Receipts Header1"
            Database::"Receipts Header1":
                begin
                    RecRef.SetTable(Receipt);
                    Receipt.Validate(Status, Receipt.Status::"Pending Approval");
                    Receipt.Modify;
                    Variant := Receipt;
                    IsHandled := true;
                end;

            //"Bid Tabulation Header"
            Database::"Bid Tabulation Header":
                begin
                    RecRef.SetTable(Opinion);
                    Opinion.Validate("Approval Status", Opinion."Approval Status"::"Pending Approval");
                    Opinion.Modify;
                    Variant := Opinion;
                    IsHandled := true;
                end;

            // //Item Creation Requests
            // Database::"Item Creation Requests":
            //     begin
            //         RecRef.SetTable(ITM);
            //         ITM.Validate(Status, ITM.Status::"Pending Approval");
            //         ITM.Modify;
            //         Variant := ITM;
            //         IsHandled := true;
            //     end;
            //"Airtime Allocation Header"
            Database::"Airtime Allocation Header":
                begin
                    RecRef.SetTable(Airtime);
                    Airtime.Validate(Status, Airtime.Status::"Pending Approval");
                    Airtime.Modify;
                    Variant := Airtime;
                    IsHandled := true;
                end;
            //ResourceBookingHeader
            Database::"Resource Booking Header":
                begin
                    RecRef.SetTable(ResourceBookingHeader);
                    ResourceBookingHeader.Validate(Status, ResourceBookingHeader.Status::"Pending Approval");
                    ResourceBookingHeader.Modify;
                    Variant := ResourceBookingHeader;
                    IsHandled := true;
                end;
            //SuccessionPlanHeader
            Database::"Succession Plan Header":
                begin
                    RecRef.SetTable(SuccessionPlanHeader);
                    SuccessionPlanHeader.Validate(Status, SuccessionPlanHeader.Status::"Pending Approval");
                    SuccessionPlanHeader.Modify;
                    Variant := SuccessionPlanHeader;
                    IsHandled := true;
                end;

            //SuccessionLogHeader
            Database::"Succession Log Header":
                begin
                    RecRef.SetTable(SuccessionLogHeader);
                    SuccessionLogHeader.Validate(Status, SuccessionLogHeader.Status::"Pending Approval");
                    SuccessionLogHeader.Modify;
                    Variant := SuccessionLogHeader;
                    IsHandled := true;
                end;
            //"Vacancy Announcement"
            Database::"Vacancy Announcement":
                begin
                    RecRef.SetTable(Announcement);
                    Announcement.Validate("Approval Status", Announcement."Approval Status"::"Pending Approval");
                    Announcement.Modify;
                    Variant := Announcement;
                    IsHandled := true;
                end;
            //"Company Positions"
            Database::"Company Positions":
                begin
                    RecRef.SetTable(Positions);
                    Positions.Validate("Approval Status", Positions."Approval Status"::"Pending Approval");
                    Positions.Modify;
                    Variant := Positions;
                    IsHandled := true;
                end;

            //"Commitee Appointment Voucher"
            Database::"Commitee Appointment Voucher":
                begin
                    RecRef.SetTable(HRComm);
                    HRComm.Validate("Approval Status", HRComm."Approval Status"::"Pending Approval");
                    HRComm.Modify;
                    Variant := HRComm;
                    IsHandled := true;
                end;

            //"Employee Transfers"
            Database::"Employee Transfers":
                begin
                    RecRef.SetTable(EmpTrans);
                    EmpTrans.Validate(Status, EmpTrans.Status::"Pending Approval");
                    EmpTrans.Modify;
                    Variant := EmpTrans;
                    IsHandled := true;
                end;

            //"Employee Acting Position"
            Database::"Employee Acting Position":
                begin
                    RecRef.SetTable(EmpAct);
                    EmpAct.Validate(Status, EmpAct.Status::"Pending Approval");
                    EmpAct.Modify;
                    Variant := EmpAct;
                    IsHandled := true;
                end;
            // //"Employee Onboarding"
            // Database::"HR Employee Onboarding":
            //     begin
            //         RecRef.SetTable(EmpOnboard);
            //         EmpOnboard.Validate("Document Status", EmpOnboard."Document Status"::"Pending Approval");
            //         EmpOnboard.Modify;
            //         Variant := EmpOnboard;
            //         IsHandled := true;
            //     end;

            // //Imprest Memo
            // Database::"Imprest Memo":
            //     begin
            //         RecRef.SetTable(ImprestMemo);
            //         ImprestMemo.Validate(Status, ImprestMemo.Status::"Pending Approval");
            //         ImprestMemo.Modify;
            //         Variant := ImprestMemo;
            //         IsHandled := true;
            //     end;
            //"Transport Requisition"
            Database::"Transport Requisition":
                begin
                    RecRef.SetTable(FleetReq);
                    FleetReq.Validate(Status, FleetReq.Status::"Pending Approval");
                    FleetReq.Modify;
                    Variant := FleetReq;
                    IsHandled := true;
                end;
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecRef.SetTable(FuelReq);
                    FuelReq.Validate(Status, FuelReq.Status::"Pending Approval");
                    FuelReq.Modify;
                    Variant := FuelReq;
                    IsHandled := true;
                end;

            //"Fuel Card"
            Database::"Fuel Card":
                begin
                    RecRef.SetTable(FuelCard);
                    FuelCard.Validate(Status, FuelCard.Status::"Pending Approval");
                    FuelCard.Modify;
                    Variant := FuelCard;
                    IsHandled := true;
                end;
            // //"Maintenance Header"
            // Database::"Maintenance Header":
            //     begin
            //         RecRef.SetTable(MaintenanceReq);
            //         MaintenanceReq.Validate(Status, MaintenanceReq.Status::"Pending Approval");
            //         MaintenanceReq.Modify;
            //         Variant := MaintenanceReq;
            //         IsHandled := true;
            //     end;
            //"HR Asset Transfer Header"
            Database::"HR Asset Transfer Header":
                begin
                    RecRef.SetTable(HRAssettrans);
                    HRAssettrans.Validate(Status, HRAssettrans.Status::"Pending Approval");
                    HRAssettrans.Modify;
                    Variant := HRAssettrans;
                    IsHandled := true;
                end;
            //"Recruitment Plan"
            Database::"Recruitment Plan":
                begin
                    RecRef.SetTable(Recruiplan);
                    Recruiplan.Validate("Approval Status", Recruiplan."Approval Status"::"Pending Approval");
                    Recruiplan.Modify;
                    Variant := Recruiplan;
                    IsHandled := true;
                end;
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                begin
                    RecRef.SetTable(RecruitReq);
                    RecruitReq.Validate("Approval Status", RecruitReq."Approval Status"::"Pending Approval");
                    RecruitReq.Modify;
                    Variant := RecruitReq;
                    IsHandled := true;
                end;
            // //Interbank Transfer
            // Database::"Inter Bank Transfer":
            //     begin
            //         RecRef.SetTable(InterBankTransfer);
            //         InterBankTransfer.Validate("Approval Status", InterBankTransfer."Approval Status"::"Pending Approval");
            //         InterBankTransfer.Modify;
            //         Variant := InterBankTransfer;
            //         IsHandled := true;
            //     end;
            //Vehicle Request
            Database::"Vehicle Request":
                begin
                    RecRef.SetTable(VehicleRqst);
                    VehicleRqst.Validate(Status, VehicleRqst.Status::Pending);
                    VehicleRqst.Modify;
                    Variant := VehicleRqst;
                    IsHandled := true;
                end;

            //Vehicle Incident
            Database::"Vehicle Incident":
                begin
                    RecRef.SetTable(VehicleIncident);
                    VehicleIncident.Validate(Status, VehicleIncident.Status::Pending);
                    VehicleIncident.Modify;
                    Variant := VehicleIncident;
                    IsHandled := true;
                end;
            //Discipline Details
            Database::"Discipline Details":
                begin
                    RecRef.SetTable(DisciplineDtls);
                    DisciplineDtls.Validate(Status, DisciplineDtls.Status::Pending);
                    DisciplineDtls.Modify;
                    Variant := DisciplineDtls;
                    IsHandled := true;
                end;
            //Monthly Work Ticket Header
            Database::"Monthly Work Ticket Header":
                begin
                    RecRef.SetTable(MonthlyWorkTicketHdr);
                    MonthlyWorkTicketHdr.Validate(Status, MonthlyWorkTicketHdr.Status::"Pending Approval");
                    MonthlyWorkTicketHdr.Modify;
                    Variant := MonthlyWorkTicketHdr;
                    IsHandled := true;
                end;
            //Corporate Strategic Plans
            Database::"Corporate Strategic Plans":
                begin
                    RecRef.SetTable(CorporateStrategicPlans);
                    CorporateStrategicPlans.Validate("Approval Status", CorporateStrategicPlans."Approval Status"::"Pending Approval");
                    CorporateStrategicPlans.Modify;
                    Variant := CorporateStrategicPlans;
                    IsHandled := true;
                end;
            DATABASE::"Organization Hierarchy Header":
                begin
                    RecRef.SETTABLE(Orgstructure);
                    Orgstructure.VALIDATE("Status", Orgstructure."Status"::"Under Review");
                    Orgstructure.MODIFY;
                    Variant := Orgstructure;
                    IsHandled := true;
                end;
            DATABASE::"Staff Establishment Plan":
                begin
                    RecRef.SETTABLE(Establishment);
                    Establishment.VALIDATE("Status", Establishment."Status"::"Pending Approval");
                    Establishment.MODIFY;
                    Variant := Establishment;
                    IsHandled := true;
                end;
            Database::"Employee Exit Header":
                begin
                    RecRef.SETTABLE(EmployeeExitHeader);
                    EmployeeExitHeader.VALIDATE(Status, EmployeeExitHeader.Status::Pending);
                    EmployeeExitHeader.MODIFY;
                    Variant := EmployeeExitHeader;
                    IsHandled := true;
                end;

            DATABASE::"Perfomance Contract Header":
                begin
                    RecRef.SETTABLE(PerfomanceContrHdr);
                    PerfomanceContrHdr.Validate("Approval Status", PerfomanceContrHdr."Approval Status"::"Pending Approval");
                    PerfomanceContrHdr.Modify();
                    Variant := PerfomanceContrHdr;
                    IsHandled := true;
                end;
            //Annual Strategy Workflow
            Database::"Annual Strategy Workplan":
                begin
                    RecRef.SETTABLE(AnnualStrategyWorkplan);
                    AnnualStrategyWorkplan.VALIDATE("Approval Status", AnnualStrategyWorkplan."Approval Status"::"Pending Approval");
                    AnnualStrategyWorkplan.MODIFY;
                    Variant := AnnualStrategyWorkplan;
                    IsHandled := true;
                end;
            //Budget Consolidation Header
            Database::"Budget Consolidation Header":
                begin
                    RecRef.SETTABLE(BudgetConsHeader);
                    BudgetConsHeader.VALIDATE("Approval Status", BudgetConsHeader."Approval Status"::"Pending Approval");
                    BudgetConsHeader.MODIFY;
                    Variant := BudgetConsHeader;
                    IsHandled := true;
                end;
            // Database::"Budget Reallocation Header":
            //     begin
            //         RecRef.SETTABLE(BudgReAllocHeader);
            //         BudgReAllocHeader.VALIDATE("Approval Status", BudgetConsHeader."Approval Status"::"Pending Approval");
            //         BudgReAllocHeader.MODIFY;
            //         Variant := BudgReAllocHeader;
            //         IsHandled := true;

            //     end;
            // Database::"Batch. Auth to Incur Expend":
            //     begin
            //         RecRef.SETTABLE(BatchAuthToIncExpend);
            //         BatchAuthToIncExpend.VALIDATE("Approval Status", BatchAuthToIncExpend."Approval Status"::"Pending Approval");
            //         BatchAuthToIncExpend.MODIFY;
            //         Variant := BatchAuthToIncExpend;
            //         IsHandled := true;
            //     end;
            // Database::"Auth. Inc. Expend. Header":
            //     begin
            //         RecRef.SETTABLE(AuthtoIncurExpend);
            //         AuthtoIncurExpend.VALIDATE("Approval Status", AuthtoIncurExpend."Approval Status"::"Pending Approval");
            //         AuthtoIncurExpend.MODIFY;
            //         Variant := AuthtoIncurExpend;
            //         IsHandled := true;
            //     end;
            // //Expense Requisition
            // Database::"Expense Requisition":
            //     begin
            //         RecRef.SetTable(ExpenseReq);
            //         ExpenseReq.Validate("Approval Status", ExpenseReq."Approval Status"::"Pending Approval");
            //         ExpenseReq.Modify();
            //         Variant := ExpenseReq;
            //         IsHandled := true;
            //         //Commit Expense Requisition
            //         Commitment.CommitExpenditureRequisition(ExpenseReq);
            //     end;

            // //EFT Header
            // Database::"EFT Header":
            //     begin
            //         RecRef.SetTable(EFTHeader);
            //         EFTHeader.Validate("Status", EFTHeader.Status::"Pending Approval");
            //         EFTHeader.Modify();
            //         Variant := EFTHeader;
            //         IsHandled := true;
            //     end;
            Database::"Annual Disposal Plan Header":
                begin
                    RecRef.settable(AnnualDisposalPlan);
                    AnnualDisposalPlan.Validate(Status, AnnualDisposalPlan.status::"Pending Approval");
                    AnnualDisposalPlan.modify();
                    Variant := AnnualDisposalPlan;
                    IsHandled := true;
                end;
            Database::"Request Header1":
                begin
                    RecRef.settable(Imprest);
                    Imprest.Validate(Status, Imprest.status::"Pending Approval");
                    Imprest.modify();
                    Variant := Imprest;
                    IsHandled := true;
                end;
            Database::"Purchase Header":
                begin
                    RecRef.settable(purchaseheader);
                    purchaseheader.Validate(Status, purchaseheader.status::"Pending Approval");
                    purchaseheader.modify();
                    Variant := purchaseheader;
                    IsHandled := true;
                end;
            //Licence Registration Form
            Database::"Licence Registration Form":
                begin
                    RecRef.settable(LicenceRegistrationForm);
                    LicenceRegistrationForm.Validate(Status, LicenceRegistrationForm.status::"Pending Approval");
                    LicenceRegistrationForm.modify();
                    Variant := LicenceRegistrationForm;
                    IsHandled := true;
                end;
            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::"Pending Approval");
                    StaffRegistration."Approval Status" := StaffRegistration."Approval Status"::"Pending Approval";
                    StaffRegistration.Modify(true);
                    Variant := StaffRegistration;
                    IsHandled := true;
                end;
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]

    procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; var ApprovalEntryArgument: Record "Approval Entry")
    var
        //pavement
        // PavementTestHeader: Record "Pavement Test Header";
        LoanApplication: Record "Loan Application";
        HRLeavePlannerHeader: Record "HR Leave Planner Header";
        // ConsolidatedTrainingNeeds: Record "Consolidated Training Needs";
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //rfq
        StandardPurchaseCode: Record "Standard Purchase Code";
        //Payments
        payments: Record payments;
        //Induction Header
        InductionHeader: Record "Induction Header";
        //"IFS Tender Committee"
        IFSTender: Record "IFS Tender Committee";

        //"Receipts Header1"
        Receipt: Record "Receipts Header1";
        //"Bid Tabulation Header"
        Opinion: Record "Bid Tabulation Header";
        //Item Creation Requests
        // ITM: Record "Item Creation Requests";
        //Airtime
        Airtime: Record "Airtime Allocation Header";
        //"Succession Plan Header"

        SuccessionPlanHeader: Record "Succession Plan Header";

        //"Succession Log Header"
        SuccessionLogHeader: Record "Succession Log Header";
        //ResourceBookingHeader
        ResourceBookingHeader: Record "Resource Booking Header";
        //Positions
        Positions: Record "Company Positions";
        //"Vacancy Announcement"
        Announcement: Record "Vacancy Announcement";
        //HRCOMM
        HRComm: Record "Commitee Appointment Voucher";
        //"Employee Transfers"
        EmpTrans: Record "Employee Transfers";

        //"Employee Acting Position"
        EmpAct: Record "Employee Acting Position";
        // EmpOnboard: Record "HR Employee Onboarding";
        // //Imprest Memo
        // ImprestMemo: Record "Imprest Memo";
        // //InterbankTransfer
        // Interbank: Record "Inter Bank Transfer";
        // //Standing Imprest
        // StandingImprest: Record "Imprest Memo";
        //"Transport Requisition"
        FleetReq: Record "Transport Requisition";
        //"Fuel & Maintenance Requisition"
        FuelReq: Record "Fuel & Maintenance Requisition";
        //"Maintenance Header"
        // MaintenanceReq: Record "Maintenance Header";
        //"HR Asset Transfer Header"
        HRAssettrans: Record "HR Asset Transfer Header";
        //"Recruitment Plan"
        Recruiplan: Record "Recruitment Plan";
        //"Recruitment Requisition Header"
        RecruitReq: Record "Recruitment Requisition Header";
        VehicleRqst: Record "Vehicle Request";
        VehicleIncident: Record "Vehicle Incident";
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
        Orgstructure: Record "Organization Hierarchy Header";
        Establishment: Record "Staff Establishment Plan";
        PCAHeader: Record "prBasic pay PCA";
        HRLeaveAllocationRequest: Record "HR Leave Allocation Request";
        LeaveApplicationRecall: Record "Leave Application Recall";
        PayrollHeader: Record "Payroll Header";
        MonthlyWorkTicketHdr: Record "Monthly Work Ticket Header";
        FuelCard: Record "Fuel Card";
        HRLeaveApplication: Record "HR Leave Application";
        PRPayrollBuffer: Record "PR Payroll Buffer";
        LeaveJournalVoucher: Record "Leave Journal Voucher";
        TrainingPlanHeader: Record "Training Plan Header";
        TrainingNeedsHeader: Record "Training Needs Header";
        TrainingRequests: Record "Training Requests";
        // TrainingExtension: Record "Training Extension";
        PRTransactionCodes: Record "PR Transaction Codes";
        DisciplineDtls: Record "Discipline Details";
        EmployeeExitHeader: Record "Employee Exit header";
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        BudgetConsHeader: Record "Budget Consolidation Header";
        // BudgReAllocHeader: Record "Budget ReAllocation Header";
        // AuthtoIncurExpend: Record "Auth. Inc. Expend. Header";
        // BatchAuthToIncExpend: Record "Batch. Auth to Incur Expend";
        ExpenseReq: Record "Expense Requisition";
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
        // PlannigHeader: Record "Planning Header";
        // ProjectClosure: Record "Project Closure";
        Job: record Job;
        EFTHeader: Record "EFT Header";
        AnnualDisposalPlan: Record "Annual Disposal Plan Header";
        Bidregister: record "Bid Opening Register";
        // ContractorRequest: Record "Contractor Request Header";
        Imprest: Record "Request Header1";
        StaffRegistration: Record "Wip Header Registration";
        LicenceRegistrationForm: Record "Licence Registration Form";
    begin
        ApprovalEntryArgument.INIT;
        ApprovalEntryArgument."Table ID" := RecRef.NUMBER;
        ApprovalEntryArgument."Record ID to Approve" := RecRef.RECORDID;
        ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
        ApprovalEntryArgument."Approval Code" := WorkflowStepInstance."Workflow Code";
        ApprovalEntryArgument."Workflow Step Instance ID" := WorkflowStepInstance.ID;

        case RecRef.NUMBER of
            //Wip
            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    ApprovalEntryArgument."Document No." := StaffRegistration."No.";

                end;
            //Bidregister
            DATABASE::"Bid Opening Register":
                begin
                    RecRef.SETTABLE(Bidregister);
                    ApprovalEntryArgument."Document No." := Bidregister.Code;
                    //ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Planner";
                end;
            //HR Leave Planner Header
            DATABASE::"HR Leave Planner Header":
                begin
                    RecRef.SETTABLE(HRLeavePlannerHeader);
                    ApprovalEntryArgument."Document No." := HRLeavePlannerHeader."Application Code";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Planner";
                end;

            // //HR Leave Planner Header
            // DATABASE::"Planning Header":
            //     begin
            //         RecRef.SETTABLE(PlannigHeader);
            //         ApprovalEntryArgument."Document No." := PlannigHeader.No;
            //         if PlannigHeader."Document Type" in [PlannigHeader."Document Type"::Proposal] then
            //             ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Project Proposal";
            //         if PlannigHeader."Document Type" in [PlannigHeader."Document Type"::Design] then
            //             ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Project Design";
            //     end;

            // //Consolidated Training Needs
            // DATABASE::"Consolidated Training Needs":
            //     begin
            //         RecRef.SETTABLE(ConsolidatedTrainingNeeds);
            //         ApprovalEntryArgument."Document No." := ConsolidatedTrainingNeeds.No;
            //         ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Needs Committee";
            //     end;
            //PR Transaction Codes
            DATABASE::"PR Transaction Codes":
                begin
                    RecRef.SETTABLE(PRTransactionCodes);
                    ApprovalEntryArgument."Document No." := PRTransactionCodes."Transaction Code";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"PR Transaction Codes";
                end;
            // //Training Extension
            // DATABASE::"Training Extension":
            //     begin
            //         RecRef.SETTABLE(TrainingExtension);
            //         ApprovalEntryArgument."Document No." := TrainingExtension."No.";
            //         ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Extension";
            //     end;
            //Training Requests
            DATABASE::"Training Requests":
                begin
                    RecRef.SETTABLE(TrainingRequests);
                    ApprovalEntryArgument."Document No." := TrainingRequests.Code;
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Application";
                end;
            //Training Plan
            DATABASE::"Training Plan Header":
                begin
                    RecRef.SETTABLE(TrainingPlanHeader);
                    ApprovalEntryArgument."Document No." := TrainingPlanHeader.No;
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Plan";
                end;
            // //Training Needs Header
            // DATABASE::"Training Needs Header":
            //     begin
            //         RecRef.SETTABLE(TrainingNeedsHeader);
            //         ApprovalEntryArgument."Document No." := TrainingNeedsHeader.Code;
            //         ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Training Needs";
            //     end;
            //Leave
            DATABASE::"HR Leave Allocation Request":
                begin
                    RecRef.SETTABLE(HRLeaveAllocationRequest);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Adjustment";
                    ApprovalEntryArgument."Document No." := HRLeaveAllocationRequest."No.";
                end;
            //Leave
            DATABASE::"HR Leave Application":
                begin
                    RecRef.SETTABLE(HRLeaveApplication);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Application";
                    ApprovalEntryArgument."Document No." := HRLeaveApplication."Application Code";
                end;
            //leave adjustment
            DATABASE::"Leave Journal Voucher":
                begin
                    RecRef.SETTABLE(LeaveJournalVoucher);
                    ApprovalEntryArgument."Document No." := LeaveJournalVoucher.No;
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Adjustment";
                end;

            // //Contractor Request
            // DATABASE::"Contractor Request Header":
            //     begin
            //         RecRef.SETTABLE(ContractorRequest);
            //         ApprovalEntryArgument."Document No." := ContractorRequest.No;
            //         ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Contractor Request";
            //     end;
            //payroll buffer
            DATABASE::"PR Payroll Buffer":
                begin
                    RecRef.SETTABLE(PRPayrollBuffer);
                    ApprovalEntryArgument."Document No." := PRPayrollBuffer."Payroll-Num";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Payroll Buffer";
                end;

            //Loan
            DATABASE::"Loan Application":
                begin
                    RecRef.SETTABLE(LoanApplication);
                    ApprovalEntryArgument."Document No." := LoanApplication."Loan No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Loan;
                end;

            DATABASE::"Job":
                begin
                    RecRef.SETTABLE(Job);
                    ApprovalEntryArgument."Document No." := Job."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Project Job";
                end;
            //Payroll Header
            DATABASE::"Payroll Header":
                begin
                    RecRef.SETTABLE(PayrollHeader);
                    ApprovalEntryArgument."Document No." := PayrollHeader."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Salary Voucher";
                    PayrollHeader.CalcFields("Gross Pay");
                    ApprovalEntryArgument.Amount := PayrollHeader."Gross Pay";
                end;
            //Leave Application Recall
            DATABASE::"Leave Application Recall":
                begin
                    RecRef.SETTABLE(LeaveApplicationRecall);
                    ApprovalEntryArgument."Document No." := LeaveApplicationRecall."Application No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Recall";
                end;
            //Induction Header
            DATABASE::"Induction Header":
                begin
                    RecRef.SETTABLE(inductionheader);
                    ApprovalEntryArgument."Document No." := inductionheader."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Induction;
                end;
            // //pavement
            // DATABASE::"Pavement Test Header":
            //     begin
            //         RecRef.SETTABLE(PavementTestHeader);
            //         ApprovalEntryArgument."Document No." := PavementTestHeader."Document No.";
            //     end;
            //PCA
            DATABASE::"prBasic pay PCA":
                begin
                    RecRef.SETTABLE(PCAHeader);
                    ApprovalEntryArgument."Document No." := PCAHeader."Change Advice Serial No.";
                    ApprovalEntryArgument.Validate("Employee No.", PCAHeader."Employee Code");
                end;
            //IFRCARD
            DATABASE::"Request For Information":
                begin
                    RecRef.SETTABLE(RequestForInformation);
                    ApprovalEntryArgument."Document No." := RequestForInformation.Code;
                end;

            //procurement plan
            DATABASE::"procurement plan":
                begin
                    RecRef.SETTABLE(procurementplan);
                    ApprovalEntryArgument."Document No." := procurementplan.Code;
                end;

            //rfq
            DATABASE::"Standard Purchase Code":
                begin
                    RecRef.SETTABLE(StandardPurchaseCode);
                    ApprovalEntryArgument."Document Type" := StandardPurchaseCode."Document Status"::Draft;
                    ApprovalEntryArgument."Document No." := StandardPurchaseCode.Code;
                end;

            //pv
            DATABASE::"Payments":
                begin
                    RecRef.SETTABLE(payments);
                    payments.CalcFields("Total Amount");
                    ApprovalEntryArgument."Document No." := payments."No.";
                    ApprovalEntryArgument.Amount := payments."Total Amount";
                end;
            //"IFS Tender Committee"
            DATABASE::"IFS Tender Committee":
                begin
                    RecRef.SETTABLE(IFSTender);
                    ApprovalEntryArgument."Document No." := IFSTender."Document No.";
                end;

            //"Receipts Header1"
            DATABASE::"Receipts Header1":
                begin
                    RecRef.SETTABLE(Receipt);
                    Receipt.CalcFields(Amount, "Amount(LCY)");
                    ApprovalEntryArgument."Document No." := Receipt."No.";
                    ApprovalEntryArgument.Amount := Receipt.Amount;
                    ApprovalEntryArgument."Amount (LCY)" := Receipt."Amount(LCY)";
                end;


            //"Bid Tabulation Header"
            DATABASE::"Bid Tabulation Header":
                begin
                    RecRef.SETTABLE(Opinion);
                    ApprovalEntryArgument."Document No." := Opinion."Code";
                end;

            // //"Item Creation Requests"
            // DATABASE::"Item Creation Requests":
            //     begin
            //         RecRef.SETTABLE(ITM);
            //         ApprovalEntryArgument."Document No." := ITM."No.";
            //     end;

            //"Airtime Allocation Header"
            DATABASE::"Airtime Allocation Header":
                begin
                    RecRef.SETTABLE(Airtime);
                    ApprovalEntryArgument."Document No." := Airtime."No";
                end;

            //ResourceBookingHeader
            DATABASE::"Resource Booking Header":
                begin
                    RecRef.SETTABLE(ResourceBookingHeader);
                    ApprovalEntryArgument."Document No." := ResourceBookingHeader."No";
                end;

            //SuccessionPlanHeader
            DATABASE::"Succession Plan Header":
                begin
                    RecRef.SETTABLE(SuccessionPlanHeader);
                    ApprovalEntryArgument."Document No." := SuccessionPlanHeader.code;
                end;
            //"SuccessionLogHeader"
            DATABASE::"Succession Log Header":
                begin
                    RecRef.SETTABLE(SuccessionLogHeader);
                    ApprovalEntryArgument."Document No." := SuccessionLogHeader."Document No";
                end;


            //"Company Positions"
            DATABASE::"Company Positions":
                begin
                    RecRef.SETTABLE(Positions);
                    ApprovalEntryArgument."Document No." := Positions."Position ID";
                end;
            //"Vacancy Announcement"
            DATABASE::"Vacancy Announcement":
                begin
                    RecRef.SETTABLE(Announcement);
                    ApprovalEntryArgument."Document No." := Announcement."Announcement No.";
                end;

            //"Commitee Appointment Voucher"
            DATABASE::"Commitee Appointment Voucher":
                begin
                    RecRef.SETTABLE(HRComm);
                    ApprovalEntryArgument."Document No." := HRComm."Document No.";
                end;
            //"Employee Transfers"
            DATABASE::"Employee Transfers":
                begin
                    RecRef.SETTABLE(EmpTrans);
                    ApprovalEntryArgument."Document No." := EmpTrans."Document No";
                end;
            //"Employee Acting Position"
            DATABASE::"Employee Acting Position":
                begin
                    RecRef.SETTABLE(EmpAct);
                    ApprovalEntryArgument."Document No." := EmpAct."No";
                end;

            // //"Employee Onboarding"
            // DATABASE::"HR Employee Onboarding":
            //     begin
            //         RecRef.SETTABLE(EmpOnboard);
            //         ApprovalEntryArgument."Document No." := EmpOnboard."Document No";
            //     end;
            // //Imprest memo
            // DATABASE::"Imprest Memo":
            //     begin
            //         RecRef.SETTABLE(ImprestMemo);
            //         ApprovalEntryArgument."Document No." := ImprestMemo."No.";
            //     end;
            //"Transport Requisition"
            DATABASE::"Transport Requisition":
                begin
                    RecRef.SETTABLE(FleetReq);
                    ApprovalEntryArgument."Document No." := FleetReq."Transport Requisition No";
                end;
            //"Fuel & Maintenance Requisition"
            DATABASE::"Fuel & Maintenance Requisition":
                begin
                    RecRef.SETTABLE(FuelReq);
                    ApprovalEntryArgument."Document No." := FuelReq."Requisition No";
                end;
            // //"Maintenance Header"
            // DATABASE::"Maintenance Header":
            //     begin
            //         RecRef.SETTABLE(MaintenanceReq);
            //         ApprovalEntryArgument."Document No." := MaintenanceReq."No";
            //     end;
            //MonthlyWorkTicketHdr
            DATABASE::"Monthly Work Ticket Header":
                begin
                    RecRef.SETTABLE(MonthlyWorkTicketHdr);
                    ApprovalEntryArgument."Document No." := MonthlyWorkTicketHdr."Daily Work Ticket";
                end;
            DATABASE::"Fuel Card":
                begin
                    RecRef.SETTABLE(FuelCard);
                    ApprovalEntryArgument."Document No." := FuelCard.No;
                end;
            // Database::"Project Closure":
            //     begin
            //         RecRef.SetTable(ProjectClosure);
            //         ApprovalEntryArgument."Document No." := ProjectClosure."No.";
            //         ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Project Closure";
            //     end;
            //"HR Asset Transfer Header"
            DATABASE::"HR Asset Transfer Header":
                begin
                    RecRef.SETTABLE(HRAssettrans);
                    ApprovalEntryArgument."Document No." := HRAssettrans."No.";
                end;
            //"Recruitment Plan"
            DATABASE::"Recruitment Plan":
                begin
                    RecRef.SETTABLE(Recruiplan);
                    ApprovalEntryArgument."Document No." := Recruiplan."Document No.";
                end;
            //"Recruitment Requisition Header"
            DATABASE::"Recruitment Requisition Header":
                begin
                    RecRef.SETTABLE(RecruitReq);
                    ApprovalEntryArgument."Document No." := RecruitReq."Document No.";
                end;
            DATABASE::"Vehicle Incident":
                begin
                    RecRef.SETTABLE(VehicleIncident);
                    ApprovalEntryArgument."Document No." := VehicleIncident."Incident No."
                end;
            DATABASE::"Discipline Details":
                begin
                    RecRef.SETTABLE(DisciplineDtls);
                    ApprovalEntryArgument."Document No." := DisciplineDtls."Discipline Detail No.";
                end;
            DATABASE::"Vehicle Request":
                begin
                    RecRef.SETTABLE(VehicleRqst);
                    ApprovalEntryArgument."Document No." := VehicleRqst."Request No.";
                end;
            DATABASE::"Corporate Strategic Plans":
                begin
                    RecRef.SETTABLE(CorporateStrategicPlans);
                    ApprovalEntryArgument."Document No." := CorporateStrategicPlans.Code;
                end;
            DATABASE::"Organization Hierarchy Header":
                begin
                    RecRef.SETTABLE(Orgstructure);
                    ApprovalEntryArgument."Document No." := Orgstructure."Document No";
                end;
            DATABASE::"Staff Establishment Plan":
                begin
                    RecRef.SETTABLE(Establishment);
                    ApprovalEntryArgument."Document No." := Establishment.Code;
                end;
            Database::"Employee Exit Header":
                begin
                    RecRef.SetTable(EmployeeExitHeader);
                    ApprovalEntryArgument."Document No." := EmployeeExitHeader."Document No.";
                end;
            DATABASE::"Perfomance Contract Header":
                begin
                    RecRef.SETTABLE(PerfomanceContrHdr);
                    ApprovalEntryArgument."Document No." := PerfomanceContrHdr.No;
                end;
            Database::"Budget Consolidation Header":
                begin
                    RecRef.SetTable(BudgetConsHeader);
                    ApprovalEntryArgument."Document No." := BudgetConsHeader.Code;
                end;
            // Database::"Auth. Inc. Expend. Header":
            //     begin
            //         RecRef.SetTable(AuthtoIncurExpend);
            //         AuthtoIncurExpend.CalcFields("Amount to Authorize");
            //         ApprovalEntryArgument."Document No." := AuthtoIncurExpend."No.";
            //         ApprovalEntryArgument.Amount := AuthtoIncurExpend."Amount to Authorize";
            //         ApprovalEntryArgument."Amount (LCY)" := AuthtoIncurExpend."Amount to Authorize";
            //     end;
            // Database::"Batch. Auth to Incur Expend":
            //     begin
            //         RecRef.SetTable(BatchAuthToIncExpend);
            //         BatchAuthToIncExpend.CalcFields("Amount to Authorize");
            //         ApprovalEntryArgument."Document No." := BatchAuthToIncExpend."No.";
            //         ApprovalEntryArgument.Amount := BatchAuthToIncExpend."Amount to Authorize";
            //         ApprovalEntryArgument."Amount (LCY)" := BatchAuthToIncExpend."Amount to Authorize";
            //     end;
            Database::"Expense Requisition":
                begin
                    RecRef.SetTable(ExpenseReq);
                    ApprovalEntryArgument."Document No." := ExpenseReq."No.";
                end;
            Database::"Annual Strategy Workplan":
                begin
                    RecRef.SetTable(AnnualStrategyWorkplan);
                    ApprovalEntryArgument."Document No." := AnnualStrategyWorkplan.No;
                    ApprovalEntryArgument.Amount := AnnualStrategyWorkplan.GetBudgetAmount();
                    ApprovalEntryArgument."Amount (LCY)" := ApprovalEntryArgument.Amount;
                end;
            Database::"EFT Header":
                begin
                    RecRef.SetTable(EFTHeader);
                    EFTHeader.CalcFields(Total);
                    ApprovalEntryArgument."Document No." := EFTHeader.No;
                    ApprovalEntryArgument.Amount := EFTHeader.Total;
                    ApprovalEntryArgument."Amount (LCY)" := EFTHeader.Total;
                end;
            Database::"Annual Disposal Plan Header":
                begin
                    RecRef.settable(AnnualDisposalPlan);
                    ApprovalEntryArgument."Document No." := AnnualDisposalPlan.No;
                    // ApprovalEntryArgument.Amount := EFTHeader.Total;
                    // ApprovalEntryArgument."Amount (LCY)" := EFTHeader.Total;
                end;
            Database::"Request Header1":
                begin
                    RecRef.SetTable(Imprest);
                    Imprest.CalcFields("Imprest Amount");
                    ApprovalEntryArgument."Document No." := Imprest."No.";
                    ApprovalEntryArgument.Amount := Imprest."Imprest Amount";
                    ApprovalEntryArgument."Amount (LCY)" := Imprest."Imprest Amount";
                end;
            //Licence Registration Form
            Database::"Licence Registration Form":
                begin
                    RecRef.SetTable(LicenceRegistrationForm);
                    ApprovalEntryArgument."Document No." := LicenceRegistrationForm."No.";
                    ApprovalEntryArgument.Amount := LicenceRegistrationForm.Amount;
                    ApprovalEntryArgument."Amount (LCY)" := LicenceRegistrationForm.Amount;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        //Imprest Header Finance
        Imprest: Record "Request Header1";
        //Licence Registration Form
        LicenceRegistrationForm: Record "Licence Registration Form";
    begin
        case ApprovalEntry."Table ID" of

            //Imprest Header Finance
            Database::"Request Header1":

                if Imprest.Get(ApprovalEntry."Document No.") then begin
                    Imprest.Validate(Status, Imprest.Status::Open);
                    Imprest.Modify();
                end;

            //Licence Registration Form
            Database::"Licence Registration Form":

                if LicenceRegistrationForm.Get(ApprovalEntry."Document No.") then begin
                    LicenceRegistrationForm.Validate(Status, LicenceRegistrationForm.Status::Rejected);
                    LicenceRegistrationForm.Closed := true;
                    LicenceRegistrationForm."Closed By" := UserId;
                    LicenceRegistrationForm.Modify(true);
                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApproveSelectedApprovalRequest', '', false, false)]
    local procedure "Approvals Mgmt._OnBeforeApproveSelectedApprovalRequest"(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    var
        ApprovalEntryVar: Record "Approval Entry";
    begin
        ApprovalEntryVar.Reset();
        ApprovalEntryVar.SetRange("Document No.", ApprovalEntry."Document No.");
        ApprovalEntryVar.SetRange("Sequence No.", ApprovalEntry."Sequence No.");
        ApprovalEntryVar.SetFilter("Approver ID", '<>%1', ApprovalEntry."Approver ID");
        if ApprovalEntryVar.FindSet() then begin
            repeat
                ApprovalEntryVar.Status := ApprovalEntryVar.Status::Canceled;
                ApprovalEntryVar.Modify();
            until ApprovalEntryVar.Next() = 0;
        end;
    end;
}