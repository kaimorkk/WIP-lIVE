codeunit 57011 "Page Management Ext"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        PageID := GetConditionalCardPageID(RecordRef);
    end;

    procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    var
        PV: Record "Payments";
        Payments: Record Payments;
        // imprest: Record "Imprest Memo";
        Corporate: Record "Corporate Strategic Plans";
        // pavement: Record "Pavement Test Header";
        ifp: record "Request For Information";
        pplan: record "Procurement Plan";
        PURCHREQ: Record "Purchase Header";
        Gbatch: record 232;
        Payroll: record "Payroll Header";
        //  measure: record "Measurement &  Payment Header";
        comm: record "ifs tender committee";
        //"IFS Tender Committee"
        IFSTender: Record "IFS Tender Committee";
        Recruitreq: Record "Recruitment Requisition Header";
        //"Receipts Header1"
        Receipt: Record "Receipts Header1";
        //ResourceBookingHeader
        ResourceBookingHeader: Record "Resource Booking Header";
        Recruitplan: Record "Recruitment Plan";
        //"Succession Plan Header"
        SuccessionPlanHeader: Record "Succession Plan Header";
        //"Succession Log Header"
        SuccessionLogHeader: Record "Succession Log Header";
        //"Employee Transfers"
        EmpTrans: Record "Employee Transfers";
        HRComm: Record "Commitee Appointment Voucher";
        //"Employee Acting Position"
        EmpAct: Record "Employee Acting Position";
        // Budget: Record "Budget Header";
        // TS: Record "Consultant Time Sheet";
        // BankRec: Record "Bank Acc. Reconciliation";
        Orgstructure: Record "Organization Hierarchy Header";
        Establishment: Record "Staff Establishment Plan";
        EmpActing: Record "Employee Acting Position";
        InductionHeader: Record "Induction Header";
        VehicleRqst: Record "Vehicle Request";
        VehicleIncident: Record "Vehicle Incident";
        Positions: Record "Company Positions";
        TransportReq: Record "Transport Requisition";
        FuelMaintReq: Record "Fuel & Maintenance Requisition";
        FuelCard: Record "Fuel Card";
        LoanApp: Record "Loan Application";
        PCAHeader: Record "prBasic pay PCA";
        HRLeaveAllocationRequest: Record "HR Leave Allocation Request";
        LeaveApplicationRecall: Record "Leave Application Recall";
        HRLeaveApplication: Record "HR Leave Application";
        PRPayrollBuffer: Record "PR Payroll Buffer";
        LeaveJournalVoucher: Record "Leave Journal Voucher";
        TrainingPlanHeader: Record "Training Plan Header";
        TrainingNeedsHeader: Record "Training Needs Header";
        TrainingRequests: Record "Training Requests";
        // TrainingExtension: Record "Training Extension";
        DisciplineDtls: Record "Discipline Details";
        ReceiptH: Record "Receipts Header1";
        EmployeeExitHeader: Record "Employee Exit Header";
        PerfomanceContrHdr: Record "Perfomance Contract Header";
        AnnualStrategy: Record "Annual Strategy WorkPlan";
        BudgetConsolidationHeader: Record "Budget Consolidation Header";
        // BatchAuthIncExp: Record "Batch. Auth to Incur Expend";
        // AuthIncExp: Record "Auth. Inc. Expend. Header";
        // BudgReAllocHeader: Record "Budget Reallocation Header";
        // EmployeeOnBoard: Record "HR Employee Onboarding";
        Airtime: Record "Airtime Allocation Header";
        // PlanningHeader: Record "Planning Header";
        AnnualDisposalPlan: Record "Annual Disposal Plan Header";
        // ContractorRequest: Record "Contractor Request Header";
        PrTransaction: Record "PR Transaction Codes";
        Imprest: Record "Request Header1";
        LicenceRegForm: Record "Licence Registration Form";
    begin
        case RecordRef.Number of
            database::"Gen. Journal Batch":
                begin
                    RecordRef.SetTable(Gbatch);
                    exit(Page::"General Journal")
                end;
            Database::"prBasic pay PCA":
                begin
                    RecordRef.SetTable(PCAHeader);
                    if PCAHeader."Document Type" = PCAHeader."Document Type"::PCA then
                        exit(Page::prPayChangeAdvice)
                    else
                        if PCAHeader."Document Type" = PCAHeader."Document Type"::"Payroll Data" then
                            exit(Page::"Payroll Data Form")
                end;
            Database::"HR Leave Allocation Request":
                begin
                    RecordRef.SetTable(HRLeaveAllocationRequest);
                    exit(Page::"HR Leave Requests")
                end;
            Database::"Leave Application Recall":
                begin
                    RecordRef.SetTable(LeaveApplicationRecall);
                    exit(Page::"Leave Application Recall Card")
                end;
            // Database::"PR Payroll Buffer":
            //     begin
            //         RecordRef.SetTable(PRPayrollBuffer);
            //         exit(Page::"Payroll Buffer Form")
            //     end;
            Database::"HR Leave Application":
                begin
                    RecordRef.SetTable(HRLeaveApplication);
                    exit(Page::"Leave Applications Card")
                end;
            Database::"Leave Journal Voucher":
                begin
                    RecordRef.SetTable(LeaveJournalVoucher);
                    exit(Page::"Leave Adjustment Voucher")
                end;
            Database::"Training Plan Header":
                begin
                    RecordRef.SetTable(TrainingPlanHeader);
                    exit(Page::"Training Plan Header")
                end;
            Database::"Training Needs Header":
                begin
                    RecordRef.SetTable(TrainingNeedsHeader);
                    exit(Page::"Training Need Request")
                end;
            Database::"Training Requests":
                begin
                    RecordRef.SetTable(TrainingRequests);
                    exit(Page::"Training Requisition")
                end;
            // Database::"Training Extension":
            //     begin
            //         RecordRef.SetTable(TrainingExtension);
            //         exit(Page::"Training Extension Card")
            //     end;

            // Database::"Planning Header":
            //     begin
            //         RecordRef.SetTable(PlanningHeader);
            //         if PlanningHeader."Document Type" in [PlanningHeader."Document Type"::Design] then
            //             exit(Page::"Design Control Card");
            //         if PlanningHeader."Document Type" in [PlanningHeader."Document Type"::Proposal] then
            //             exit(Page::"Design Control Card");
            //     end;


            // Database::"Contractor Request Header":
            //     begin
            //         RecordRef.SetTable(ContractorRequest);
            //         case ContractorRequest."Document Type" of
            //             ContractorRequest."Document Type"::Instructions:
            //                 exit(Page::"Instruction Request Card");
            //             ContractorRequest."Document Type"::Approval:
            //                 exit(Page::"Approval Request Card");
            //             ContractorRequest."Document Type"::Amendment:
            //                 exit(Page::"Amendmend Request Card");
            //             ContractorRequest."Document Type"::"Hos Requests":
            //                 exit(Page::"HOS Requests card");
            //             ContractorRequest."Document Type"::Payments:
            //                 exit(Page::"Payment Request Card");
            //             ContractorRequest."Document Type"::"Joint Measurement":
            //                 exit(Page::"Joint Measurement Request Card");
            //             ContractorRequest."Document Type"::Extension:
            //                 exit(Page::"Extension Request Card");
            //             ContractorRequest."Document Type"::"Claims On Delayed Payments":
            //                 exit(Page::"Delayed Payment Request Card");
            //         end;
            //     end;



            // database::"Payments":
            //     begin
            //         RecordRef.SetTable(PV);
            //         case
            //             pv."Payment Type" of
            //             pv."Payment Type"::"Payment Voucher":
            //                 begin
            //                     case
            //                         PV."PV Type" of
            //                         PV."PV Type"::" ", PV."PV Type"::Normal:
            //                             exit(Page::"Payment Voucher");
            //                         PV."PV Type"::Retention:
            //                             exit(Page::"Retention Movt Card");
            //                         PV."PV Type"::"Retention Payment":
            //                             exit(Page::"Retention Payment Card");
            //                         PV."PV Type"::Tax:
            //                             exit(Page::"Tax Payment Voucher Card");
            //                         PV."PV Type"::Payroll:
            //                             exit(Page::"Payroll Payment Voucher Card");
            //                         PV."PV Type"::Refund:
            //                             begin
            //                                 case
            //                                     PV."Refund Policy" of
            //                                     PV."Refund Policy"::"Full Refund":
            //                                         exit(Page::"Full Refund Voucher");
            //                                     PV."Refund Policy"::Forfeiture:
            //                                         exit(Page::"Forfeiture Refund Voucher");
            //                                     PV."Refund Policy"::"Full Utilization":
            //                                         exit(Page::"Full Utilization Voucher");
            //                                     PV."Refund Policy"::"Partial Utilization":
            //                                         exit(Page::"Partil Util Refund Voucher");
            //                                 end;
            //                             end;
            //                         Pv."PV Type"::"Revenue Sweep Voucher":
            //                             exit(Page::"Revenue Account Sweep Card");
            //                     end;
            //                 end;
            //             pv."Payment Type"::"Surrender":
            //                 exit(Page::"Imprest Surrender");
            //             pv."Payment Type"::Imprest:
            //                 exit(Page::"Imprest Requisition");
            //             pv."Payment Type"::"Staff Claim":
            //                 exit(Page::"Staff Claim");
            //             pv."Payment Type"::"Petty Cash":
            //                 exit(Page::"Petty Cash Voucher");
            //             pv."Payment Type"::"Petty Cash Surrender":
            //                 exit(Page::"Petty Cash Surrender");
            //             pv."Payment Type"::"Bank Transfer":
            //                 exit(Page::"Bank Transfer");
            //             pv."Payment Type"::"Standing Imprest":
            //                 exit(page::"Standing Imprest Requsition");
            //             pv."Payment Type"::"Special Imprest":
            //                 exit(Page::"Special Imprests");
            //             pv."Payment Type"::"Imprest Surrender":
            //                 exit(page::"Imprest Surrender");
            //         end;
            //     end;
            database::"Organization Hierarchy Header":
                begin
                    RecordRef.SetTable(Orgstructure);
                    if Orgstructure."Structure Type" = Orgstructure."Structure Type"::Administrative then
                        exit(Page::"Organization Hierarchy Header")
                    else
                        if Orgstructure."Structure Type" = Orgstructure."Structure Type"::Functional then
                            exit(Page::"Organization Hierarchy Header")
                end;
            database::"Staff Establishment Plan":
                begin
                    RecordRef.SetTable(Establishment);
                    if Establishment."Establishment Type" = Establishment."Establishment Type"::Global then
                        exit(Page::"Staff Establishment Plan")
                    else
                        if Establishment."Establishment Type" = Establishment."Establishment Type"::Functional then
                            exit(Page::"Functional Establishment Plan")
                end;
            Database::"Company Positions":
                begin
                    RecordRef.SetTable(Positions);
                    exit(Page::"Position Card")
                end;
            // database::"Loan Application":
            //     begin
            //         RecordRef.SetTable(LoanApp);
            //         if LoanApp."Loan Category" = LoanApp."Loan Category"::"Other Loan" then
            //             exit(Page::"Loan Applications Card")
            //         else
            //             if LoanApp."Loan Category" = LoanApp."Loan Category"::Advance then
            //                 exit(Page::"Salary Advance Card")
            //             else
            //                 if LoanApp."Loan Category" = LoanApp."Loan Category"::"Car Loan" then
            //                     exit(Page::"Car Loan Application Card")
            //     end;

            //Recruitplan
            database::"Recruitment Plan":
                begin
                    RecordRef.SetTable(Recruitplan);
                    if Recruitplan."Recruitment Plan Type" = Recruitplan."Recruitment Plan Type"::"Annual HR Plan" then
                        exit(Page::"Recruitment Plan")
                    else
                        if Recruitplan."Recruitment Plan Type" = Recruitplan."Recruitment Plan Type"::"Functional Plan" then
                            exit(Page::"Functional Recruitment Plan")
                end;

            Database::"Corporate Strategic Plans":
                begin
                    RecordRef.SetTable(Corporate);
                    exit(Page::"All CSP CARD")
                end;
            // Database::"Pavement Test Header":
            //     begin
            //         RecordRef.SetTable(pavement);
            //         exit(Page::"Pavement Lab Test")
            //     end;

            Database::"Payroll Header":
                begin
                    RecordRef.SetTable(Payroll);
                    exit(Page::"Payroll Header")
                end;
            Database::"Recruitment Requisition Header":
                begin
                    RecordRef.SetTable(Recruitreq);
                    exit(Page::"Recruitment Requisition")
                end;
            // Database::"Measurement &  Payment Header":
            //     begin
            //         RecordRef.SetTable(measure);
            //         exit(Page::"Advance Payment Certificate")
            //     end;
            Database::"Commitee Appointment Voucher":
                begin
                    RecordRef.SetTable(HRComm);
                    exit(Page::"Commitee Appointment Voucher")
                end;
            Database::"PR Transaction Codes":
                begin
                    RecordRef.SetTable(PrTransaction);
                    exit(Page::"PR Transaction Code Card")
                end;
            Database::"Request For Information":
                begin
                    RecordRef.SetTable(ifp);
                    exit(Page::"IFP Card")
                end;
            Database::"Procurement Plan":
                begin
                    RecordRef.SetTable(pplan);
                    exit(Page::"Procurement Plan Card")
                end;
            Database::"ifs tender committee":
                begin
                    RecordRef.SetTable(comm);
                    exit(Page::"IFS Tender Committee Card")
                end;
            // Database::"Receipts Header1":
            //     begin
            //         RecordRef.SetTable(Receipt);
            //         case
            //             Receipt."Receipt Type" of
            //             Receipt."Receipt Type"::Deposit:
            //                 exit(Page::"Deposit Receipt");
            //             Receipt."Receipt Type"::Fee:
            //                 exit(Page::"Revenue Receipt Card");
            //             Receipt."Receipt Type"::"Retention Receipt":
            //                 exit(Page::"Retention Receipt Card");
            //             Receipt."Receipt Type"::Utilization:
            //                 exit(Page::"Utilization Receipt Card");
            //             else
            //                 exit(Page::Receipt);
            //         end;
            //     end;
            // Database::"Resource Booking Header":
            //     begin
            //         RecordRef.SetTable(ResourceBookingHeader);
            //         exit(Page::"Reservation Request Card")
            //     end;
            Database::"Succession Plan Header":
                begin
                    RecordRef.SetTable(SuccessionPlanHeader);
                    exit(Page::"Succession Plan Card")
                end;
            Database::"Succession Log Header":
                begin
                    RecordRef.SetTable(SuccessionLogHeader);
                    exit(Page::"Succession Log Card")
                end;
            Database::"Employee Acting Position":
                begin
                    RecordRef.SetTable(EmpAct);
                    exit(Page::"Employee Promotion Card")
                end;
            Database::"Employee Transfers":
                begin
                    RecordRef.SetTable(EmpTrans);
                    if EmpTrans.Type = EmpTrans.Type::"Self initiated" then
                        // exit(Page::"Transfer Opinion Card")
                        exit(Page::"Awaiting HR Action")
                    else
                        if EmpTrans.Type = EmpTrans.Type::"Management initiated" then
                            exit(Page::"Awaiting HR Actioning")
                end;
            Database::"Purchase Header":
                begin

                    RecordRef.SetTable(PURCHREQ);
                    if PURCHREQ."Document Type" = PURCHREQ."Document Type"::Order then
                        exit(Page::"Purchase Order");

                    if PURCHREQ."Document Type" = PURCHREQ."Document Type"::"Purchase Requisition" then begin
                        if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::Standard then
                            exit(Page::"Standard Purchase Requisition")
                        else
                            if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::"Project Works" then
                                exit(Page::"Projects Works PRNs")

                    end;

                    if PURCHREQ."Document Type" = PURCHREQ."Document Type"::"Store Requisition" then begin
                        if PURCHREQ."Requisition Type" = PURCHREQ."Requisition Type"::Tyre then
                            exit(Page::"Tyre Requisition Card")
                        else
                            exit(Page::"Store Requisition")
                    end;
                end;
            // Database::"Imprest Memo":
            //     begin
            //         RecordRef.SetTable(imprest);
            //         exit(Page::"Imprest Memo")
            //     end;
            database::"Employee Acting Position":
                begin
                    RecordRef.SetTable(EmpActing);
                    if EmpActing."Promotion Type" = EmpActing."Promotion Type"::"Acting Position" then
                        exit(Page::"Acting Position Card")
                    else
                        if EmpActing."Promotion Type" = EmpActing."Promotion Type"::Promotion then
                            exit(Page::"Employee Promotion Card")
                end;
            Database::"Vehicle Request":
                begin
                    RecordRef.SetTable(VehicleRqst);
                    exit(Page::"Vehicle Request")
                end;
            Database::"Vehicle Incident":
                begin
                    RecordRef.SetTable(VehicleIncident);
                    exit(Page::"Vehicle Incident Card")
                end;
            Database::"Discipline Details":
                begin
                    RecordRef.SetTable(DisciplineDtls);
                    exit(Page::"Discipline Details")
                end;
            Database::"Transport Requisition":
                begin
                    RecordRef.SetTable(TransportReq);
                    exit(Page::"Fleet Requisition Card")
                end;
            Database::"Fuel & Maintenance Requisition":
                begin
                    RecordRef.SetTable(FuelMaintReq);
                    exit(Page::"Maintenance Request")
                end;
            Database::"Fuel Card":
                begin
                    RecordRef.SetTable(FuelCard);
                    exit(Page::"Fuel Card")
                end;
            Database::"Employee Exit Header":
                begin
                    RecordRef.SetTable(EmployeeExitHeader);
                    exit(Page::"Employee Exit Voucher");
                end;
            DATABASE::"Perfomance Contract Header":
                begin
                    RecordRef.SetTable(PerfomanceContrHdr);
                    exit(Page::"Individual Scorecard");
                end;
            // //Annual Strategy Workplan
            // Database::"Annual Strategy Workplan":
            //     begin
            //         RecordRef.SetTable(AnnualStrategy);
            //         case
            //             AnnualStrategy."Planning Budget Type" of
            //             AnnualStrategy."Planning Budget Type"::Original:
            //                 exit(Page::"Functional AWP Card");
            //             AnnualStrategy."Planning Budget Type"::Supplementary:
            //                 exit(Page::"Draft Workplan Card");
            //         End;
            //     end;
            // Database::"Budget Consolidation Header":
            //     begin
            //         RecordRef.SetTable(BudgetConsolidationHeader);
            //         case
            //                BudgetConsolidationHeader."Planning Budget Type" of
            //             BudgetConsolidationHeader."Planning Budget Type"::Original:
            //                 exit(Page::"Resource Req. Cons Header");
            //             BudgetConsolidationHeader."Planning Budget Type"::Supplementary:
            //                 exit(Page::"Draft Workplan Cons. Card");
            //         End;
            //     end;
            // //Budget ReAllocation Header
            // Database::"Budget Reallocation Header":
            //     begin
            //         RecordRef.SetTable(BudgReAllocHeader);
            //         case
            //             BudgReAllocHeader."Entry Type" of
            //             BudgReAllocHeader."Entry Type"::"Re-Allocation":
            //                 exit(Page::"Budget Reallocation Header");
            //             BudgReAllocHeader."Entry Type"::Supplementary:
            //                 exit(Page::"Supplementary Budget Card");
            //         end;
            //     end;

            // //Batch AIE
            // Database::"Batch. Auth to Incur Expend":
            //     begin
            //         RecordRef.SetTable(BatchAuthIncExp);
            //         exit(Page::"Batch Auth To Incur Exp Card");
            //     end;

            // //Auth Inc Expenditure
            // Database::"Auth. Inc. Expend. Header":
            //     begin
            //         RecordRef.SetTable(AuthIncExp);
            //         case
            //             AuthIncExp.Type of
            //             AuthIncExp.Type::Default:
            //                 exit(page::"Auth. to Incur Header");
            //             AuthIncExp.Type::Custom:
            //                 exit(Page::"Special AIE Card");
            //         end;
            //     end;
            // Database::"HR Employee Onboarding":
            //     begin

            //         RecordRef.SetTable(EmployeeOnBoard);
            //         case
            //             EmployeeOnBoard."Entry Type" of
            //             EmployeeOnBoard."Entry Type"::Modification:
            //                 exit(Page::"Employee Modification Card");
            //             EmployeeOnBoard."Entry Type"::"New Record":
            //                 exit(Page::"HR Employee Onboarding");
            //         end;
            //     end;
            Database::"Airtime Allocation Header":
                begin
                    RecordRef.SetTable(Airtime);
                    exit(Page::"Airtime Allowance Card");
                end;
            // //Expense Requisition
            // Database::"Expense Requisition":
            //     exit(Page::"Expense Requisition Card");
            // //EFT Header
            // Database::"EFT Header":
            //     exit(Page::"Electronic Funds Transfer");
            //Annual Disposal Plan
            Database::"Annual Disposal Plan Header":
                exit(Page::"Disposal Plan Header");

            DATABASE::"Request Header1":
                begin
                    RecordRef.SetTable(Imprest);
                    exit(Page::"Imprest Header Finance");
                end;
            Database::"Licence Registration Form":
                begin
                    RecordRef.SetTable(LicenceRegForm);
                    if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Registration then
                        exit(Page::"Licence Registration Form")
                    else
                        if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Renewal then
                            exit(Page::"Licence Renewal Form")
                    // else
                    //     if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Restoration then
                    //         exit(Page::"Licence Registration Form")
                    else
                        if LicenceRegForm."Application Type" = LicenceRegForm."Application Type"::Category then
                            exit(Page::"Licence Categories Form Card")
                end;
        end;
    end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    // local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    // begin
    //     PageID := GetConditionalCardPageID(RecordRef);


    // end;




    // local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    // var
    //     PV: Record "Payments";
    //     Payments: Record Payments;
    //     PurchaseHeader: Record "Purchase Header";
    // // Budget: Record "Budget Header";
    // // TS: Record "Consultant Time Sheet";
    // // BankRec: Record "Bank Acc. Reconciliation";
    // begin
    //     case RecordRef.Number of
    //         database::"Payments":
    //             begin
    //                 RecordRef.SetTable(PV);
    //                 exit(Page::"Payment Voucher")
    //             end;
    //     end;
    // end;

    //PRN AND STORE REQ-mTR
    /*
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnBeforeGetConditionalCardPageID', '', false, false)]
        local procedure OnBeforeGetConditionalCardPageID(RecRef: RecordRef; var CardPageID: Integer; var IsHandled: Boolean);
        begin
            CardPageID := GetConditionalCardPageID2(RecRef);
        end;

        local procedure GetConditionalCardPageID2(RecRef: RecordRef): Integer
        var
            CardPageID: Integer;
            IsHandled: Boolean;
        begin
            IsHandled := false;
            OnBeforeGetConditionalCardPageID(RecRef, CardPageID, IsHandled);
            if IsHandled then
                exit(CardPageID);

            case RecRef.Number of
                DATABASE::"Purchase Header":
                    exit(GetPurchaseHeaderPageID(RecRef));
            end;
        end;

        local procedure GetPurchaseHeaderPageID(RecRef: RecordRef): Integer
        var
            PurchaseHeader: Record "Purchase Header";
        begin
            RecRef.SetTable(PurchaseHeader);
            case PurchaseHeader."Document Type" of
                PurchaseHeader."Document Type"::Quote:
                    exit(PAGE::"Purchase Quote");
                PurchaseHeader."Document Type"::Order:
                    exit(PAGE::"Purchase Order");
                PurchaseHeader."Document Type"::Invoice:
                    exit(PAGE::"Purchase Invoice");
                PurchaseHeader."Document Type"::"Credit Memo":
                    exit(PAGE::"Purchase Credit Memo");
                PurchaseHeader."Document Type"::"Blanket Order":
                    exit(PAGE::"Blanket Purchase Order");
                PurchaseHeader."Document Type"::"Return Order":
                    exit(PAGE::"Purchase Return Order");
                PurchaseHeader."Document Type"::"Store Requisition":
                    exit(PAGE::"Store Requisition");
                PurchaseHeader."Document Type"::"Purchase Requisition":
                    exit(PAGE::"Standard Purchase Requisition");
            end;

        end;
        */
}
