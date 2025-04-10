codeunit 52193491 "Custom Approvals Codeunit"
{
    //Approval Management Extension

    trigger OnRun()
    begin
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        SkipCheckReleaseRestrictions: Boolean;
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'No related approval workflow is enabled.';
        //HR Leave Planner Header
        OnSendHRLeavePlannerHeaderApprovalRequestTxt: label 'An Approval Request for Leave Plan has been Requested.';
        RunWorkflowOnSendHRLeavePlannerHeaderForApprovalCode: label 'RUNWORKFLOWONSENDHRLEAVEPLANNERHEADERFORAPPROVAL';
        OnCancelHRLeavePlannerHeaderApprovalRequestTxt: label 'An Approval Request for Leave Plan has been Cancelled';
        RunWorkflowOnCancelHRLeavePlannerHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELHRLEAVEPLANNERHEADERFORAPPROVAL';

        //payroll buffer 

        OnSendPrPayrollBufferApprovalRequestTxt: label 'An Approval Request for a pr payroll buffer has been Requested.';
        RunWorkflowOnSendPrPayrollBufferForApprovalCode: label 'RUNWORKFLOWONSENDPRPAYROLLBUFFERFORAPPROVAL';
        OnCancelPrPayrollBufferApprovalRequestTxt: label 'An Approval Request for a Pr Payroll Buffer has been Cancelled';
        RunWorkflowOnCancelPrPayrollBufferForApprovalCode: label 'RUNWORKFLOWONCANCELPRPAYROLLBUFFERFORAPPROVAL';

        //pavement
        OnSendPavementApprovalRequestTxt: label 'Approval of a Pavement Lab Test is requested';
        RunWorkflowOnSendPavementForApprovalCode: label 'RUNWORKFLOWONSENDPAVEMENTFORAPPROVAL';
        OnCancelPavementApprovalRequestTxt: label 'An Approval of a Pavement Lab Test is canceled';
        RunWorkflowOnCancelPavementForApprovalCode: label 'RUNWORKFLOWONCANCELPAVEMENTFORAPPROVAL';

        //_PCA_
        OnSend_PCA_ApprovalRequestTxt: label 'Approval of a _PCA_ is requested';
        RunWorkflowOnSend_PCA_ForApprovalCode: label 'RUNWORKFLOWONSEND_PCA_FORAPPROVAL';
        OnCancel_PCA_ApprovalRequestTxt: label 'An Approval of a _PCA_ is canceled';
        RunWorkflowOnCancel_PCA_ForApprovalCode: label 'RUNWORKFLOWONCANCEL_PCA_FORAPPROVAL';


        //Project Schedule
        OnSendScheduleApprovalRequestTxt: label 'Approval of a Project Schedule is requested';
        RunWorkflowOnSendScheduleForApprovalCode: label 'RUNWORKFLOWONSENDSCHEDULEFORAPPROVAL';
        OnCancelScheduleApprovalRequestTxt: label 'An Approval of a Project Schedule is canceled';
        RunWorkflowOnCancelScheduleForApprovalCode: label 'RUNWORKFLOWONCANCELSCHEDULEFORAPPROVAL';

        //purchase requisition
        OnSendPurchaseApprovalRequestTxt: label 'Approval of a Purchase Requisition is requested';
        RunWorkflowOnSendPurchaseForApprovalCode: label 'RUNWORKFLOWONSENDPURCHASEFORAPPROVAL';
        OnCancelPurchaseApprovalRequestTxt: label 'An Approval of a Purchase Requisition  is canceled';
        RunWorkflowOnCancelPurchaseForApprovalCode: label 'RUNWORKFLOWONCANCELPURCHASEFORAPPROVAL';

        //Purchase Requisition
        // OnSendPurchaseRequisitionApprovalRequestTxt: label 'An Approval Request for Purchase/Store Requisition has been Requested.';
        // RunWorkflowOnSendPurchaseRequisitionForApprovalCode: label 'RUNWORKFLOWONSENDPURCHASEREQUISITIONFORAPPROVAL';
        // RunWorkflowOnCancelPurchaseRequisitionApprovalCode: label 'RUNWORKFLOWONCANCELPURCHASEREQUIAITIONFORAPPROVAL';
        // OnCancelPurchaseRequisitionApprovalRequestTxt: label 'An Approval Request for Purchase/Store Requisition has been Cancelled';


        //ifRcard
        OnSendIFRApprovalRequestTxt: label 'Approval of an IFR is requested';
        RunWorkflowOnSendIFRForApprovalCode: label 'RUNWORKFLOWONSENDIFRFORAPPROVAL';
        OnCancelIFRApprovalRequestTxt: label 'An Approval of An IFR is canceled';
        RunWorkflowOnCancelIFRForApprovalCode: label 'RUNWORKFLOWONCANCELIFRFORAPPROVAL';

        //DraftIFS
        OnSendDraftIFSApprovalRequestTxt: label 'Approval of DraftIFS is requested';
        RunWorkflowOnSendDraftIFSForApprovalCode: label 'RUNWORKFLOWONSENDDRAFTIFSFORAPPROVAL';
        OnCancelDraftIFSApprovalRequestTxt: label 'An Approval of DraftIFS is canceled';
        RunWorkflowOnCancelDraftIFSForApprovalCode: label 'RUNWORKFLOWONCANCELDRAFTIFSFORAPPROVAL';

        //RFQ
        OnSendRFQApprovalRequestTxt: label 'Approval of RFQ is requested';
        RunWorkflowOnSendRFQForApprovalCode: label 'RUNWORKFLOWONRFQFORAPPROVAL';
        OnCancelRFQApprovalRequestTxt: label 'An Approval of RFQ  is canceled';
        RunWorkflowOnCancelRFQForApprovalCode: label 'RUNWORKFLOWONCANCELRFQFORAPPROVAL';

        //Procurement Plan
        OnSendProcPlanApprovalRequestTxt: label 'Approval of Procurement Plan is requested';
        RunWorkflowOnSendProcPlanForApprovalCode: label 'RUNWORKFLOWONPROCPLANFORAPPROVAL';
        OnCancelProcPlanApprovalRequestTxt: label 'An Approval of Procurement Plan is canceled';
        RunWorkflowOnCancelProcPlanForApprovalCode: label 'RUNWORKFLOWONCANCELProcPlanFORAPPROVAL';
        //IFSTender
        OnSendIFSTenderApprovalRequestTxt: label 'Approval of a IFS Tender Committee document  is requested';
        RunWorkflowOnSendIFSTenderForApprovalCode: label 'RUNWORKFLOWONSENDIFSTenderFORAPPROVAL';
        OnCancelIFSTenderApprovalRequestTxt: label 'An Approval of a IFS Tender Committee Document is canceled';
        RunWorkflowOnCancelIFSTenderForApprovalCode: label 'RUNWORKFLOWONCANCELIFSTenderFORAPPROVAL';

        //Receipt
        OnSendReceiptApprovalRequestTxt: label 'Approval of a Receipt document  is requested';
        RunWorkflowOnSendReceiptForApprovalCode: label 'RUNWORKFLOWONSENDReceiptFORAPPROVAL';
        OnCancelReceiptApprovalRequestTxt: label 'An Approval of a Receipt Document is canceled';
        RunWorkflowOnCancelReceiptForApprovalCode: label 'RUNWORKFLOWONCANCELReceiptFORAPPROVAL';

        //Opinion
        OnSendOpinionApprovalRequestTxt: label 'Approval of a Opinion document  is requested';
        RunWorkflowOnSendOpinionForApprovalCode: label 'RUNWORKFLOWONSENDOPINIONFORAPPROVAL';
        OnCancelOpinionApprovalRequestTxt: label 'An Approval of a Opinion Document is canceled';
        RunWorkflowOnCancelOpinionForApprovalCode: label 'RUNWORKFLOWONCANCELOPINIONFORAPPROVAL';

        //Item Creation Requests
        OnSendITMApprovalRequestTxt: label 'Approval of a Item Creation is requested';
        RunWorkflowOnSendITMForApprovalCode: label 'RUNWORKFLOWONSENDITMFORAPPROVAL';
        OnCancelITMApprovalRequestTxt: label 'An Approval of a Item Creation is canceled';
        RunWorkflowOnCancelITMForApprovalCode: label 'RUNWORKFLOWONCANCELITMFORAPPROVAL';


        //Airtime
        OnSendAirtimeApprovalRequestTxt: label 'Approval of a Airtime Allocation document  is requested';
        RunWorkflowOnSendAirtimeForApprovalCode: label 'RUNWORKFLOWONSENDAirtimeFORAPPROVAL';
        OnCancelAirtimeApprovalRequestTxt: label 'An Approval of a Airtime Allocation Document is canceled';
        RunWorkflowOnCancelAirtimeForApprovalCode: label 'RUNWORKFLOWONCANCELAirtimeFORAPPROVAL';

        //ResourceBookingHeader
        OnSendResourceBookingHeaderApprovalRequestTxt: label 'Approval of a ResourceBookingHeader document  is requested';
        RunWorkflowOnSendResourceBookingHeaderForApprovalCode: label 'RUNWORKFLOWONSENDResourceBookingHeaderFORAPPROVAL';
        OnCancelResourceBookingHeaderApprovalRequestTxt: label 'An Approval of a ResourceBookingHeader Document is canceled';
        RunWorkflowOnCancelResourceBookingHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELResourceBookingHeaderFORAPPROVAL';

        //SuccessionLogHeader
        OnSendSuccessionLogHeaderApprovalRequestTxt: label 'Approval of a SuccessionLogHeader document  is requested';
        RunWorkflowOnSendSuccessionLogHeaderForApprovalCode: label 'RUNWORKFLOWONSENDSuccessionLogHeaderFORAPPROVAL';
        OnCancelSuccessionLogHeaderApprovalRequestTxt: label 'An Approval of a SuccessionLogHeader Document is canceled';
        RunWorkflowOnCancelSuccessionLogHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELSuccessionLogHeaderFORAPPROVAL';

        //SuccessionPlanHeader
        OnSendSuccessionPlanHeaderApprovalRequestTxt: label 'Approval of a SuccessionPlanHeader document  is requested';
        RunWorkflowOnSendSuccessionPlanHeaderForApprovalCode: label 'RUNWORKFLOWONSENDSuccessionPlanHeaderFORAPPROVAL';
        OnCancelSuccessionPlanHeaderApprovalRequestTxt: label 'An Approval of a SuccessionPlanHeader Document is canceled';
        RunWorkflowOnCancelSuccessionPlanHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELSuccessionPlanHeaderFORAPPROVAL';

        //Positions
        OnSendPositionsApprovalRequestTxt: label 'Approval of a Positions document  is requested';
        RunWorkflowOnSendPositionsForApprovalCode: label 'RUNWORKFLOWONSENDPositionsFORAPPROVAL';
        OnCancelPositionsApprovalRequestTxt: label 'An Approval of a Positions Document is canceled';
        RunWorkflowOnCancelPositionsForApprovalCode: label 'RUNWORKFLOWONCANCELPositionsFORAPPROVAL';
        //Announcement
        OnSendAnnouncementApprovalRequestTxt: label 'Approval of a Announcement document  is requested';
        RunWorkflowOnSendAnnouncementForApprovalCode: label 'RUNWORKFLOWONSENDAnnouncementFORAPPROVAL';
        OnCancelAnnouncementApprovalRequestTxt: label 'An Approval of a Announcement Document is canceled';
        RunWorkflowOnCancelAnnouncementForApprovalCode: label 'RUNWORKFLOWONCANCELAnnouncementFORAPPROVAL';

        //HRComm
        OnSendHRCommApprovalRequestTxt: label 'Approval of a HR Commitee Appointment Voucher document  is requested';
        RunWorkflowOnSendHRCommForApprovalCode: label 'RUNWORKFLOWONSENDHRCommFORAPPROVAL';
        OnCancelHRCommApprovalRequestTxt: label 'An Approval of a HR Commitee Appointment Voucher Document is canceled';
        RunWorkflowOnCancelHRCommForApprovalCode: label 'RUNWORKFLOWONCANCELHRCommFORAPPROVAL';
        //EmpTrans
        OnSendEmpTransApprovalRequestTxt: label 'Approval of a Employee Transfer document  is requested';
        RunWorkflowOnSendEmpTransForApprovalCode: label 'RUNWORKFLOWONSENDEmpTransFORAPPROVAL';
        OnCancelEmpTransApprovalRequestTxt: label 'An Approval of a Employee Transfer Document is canceled';
        RunWorkflowOnCancelEmpTransForApprovalCode: label 'RUNWORKFLOWONCANCELEmpTransFORAPPROVAL';
        //EmpAct
        OnSendEmpActApprovalRequestTxt: label 'Approval of a Employee Acting Position document  is requested';
        RunWorkflowOnSendEmpActForApprovalCode: label 'RUNWORKFLOWONSENDEmpActFORAPPROVAL';
        OnCancelEmpActApprovalRequestTxt: label 'An Approval of a Employee Acting Position Document is canceled';
        RunWorkflowOnCancelEmpActForApprovalCode: label 'RUNWORKFLOWONCANCELEmpActFORAPPROVAL';
        //EmpOnboarding
        OnSendEmpOnboardApprovalRequestTxt: label 'Approval of a Employee onboarding document  is requested';
        RunWorkflowOnSendEmpOnboardForApprovalCode: label 'RUNWORKFLOWONSENDEMPLOYEEONBOARDINGFORAPPROVAL';
        OnCancelEmpOnboardApprovalRequestTxt: label 'An Approval of a Employee onboarding Document is canceled';
        RunWorkflowOnCancelEmpOnboardForApprovalCode: label 'RUNWORKFLOWONCANCELEMPLOYEEONBOARDINGFORAPPROVAL';
        //PV
        OnSendPVApprovalRequestTxt: label 'Approval of a payments document  is requested';
        RunWorkflowOnSendPVForApprovalCode: label 'RUNWORKFLOWONSENDPVFORAPPROVAL';
        OnCancelPVApprovalRequestTxt: label 'An Approval of a Payments Document is canceled';
        RunWorkflowOnCancelPVForApprovalCode: label 'RUNWORKFLOWONCANCELPVFORAPPROVAL';

        //Imprest Memo
        OnSendIMApprovalRequestTxt: label 'Approval of an ImprestMemo Request is requested';
        RunWorkflowOnSendIMForApprovalCode: label 'RUNWORKFLOWONSENDIMFORAPPROVAL';
        OnCancelIMApprovalRequestTxt: label 'An Approval of ImprestMemo Request is canceled';
        RunWorkflowOnCancelIMForApprovalCode: label 'RUNWORKFLOWONCANCELIMFORAPPROVAL';
        //RecruitReq
        OnSendRecruitReqApprovalRequestTxt: label 'Approval of an Recruitment Requisition is requested';
        RunWorkflowOnSendRecruitReqForApprovalCode: label 'RUNWORKFLOWONSENDRecruitReqFORAPPROVAL';
        OnCancelRecruitReqApprovalRequestTxt: label 'An Approval of Recruitment Requisition is canceled';
        RunWorkflowOnCancelRecruitReqForApprovalCode: label 'RUNWORKFLOWONCANCELRecruitReqFORAPPROVAL';
        //Recruiplan
        OnSendRecruiplanApprovalRequestTxt: label 'Approval of an Recruitment plan Request is requested';
        RunWorkflowOnSendRecruiplanForApprovalCode: label 'RUNWORKFLOWONSENDRecruitplanFORAPPROVAL';
        OnCancelRecruiplanApprovalRequestTxt: label 'An Approval of Recruitment plan Request is canceled';
        RunWorkflowOnCancelRecruiplanForApprovalCode: label 'RUNWORKFLOWONCANCELRecruitplanFORAPPROVAL';
        //MaintenanceReq
        OnSendMaintenanceReqApprovalRequestTxt: label 'Approval of an MaintenanceReq Request is requested';
        RunWorkflowOnSendMaintenanceReqForApprovalCode: label 'RUNWORKFLOWONSENDMaintenanceReqFORAPPROVAL';
        OnCancelMaintenanceReqApprovalRequestTxt: label 'An Approval of MaintenanceReq Request is canceled';
        RunWorkflowOnCancelMaintenanceReqForApprovalCode: label 'RUNWORKFLOWONCANCELMaintenanceReqFORAPPROVAL';
        //FuelReq
        OnSendFuelReqApprovalRequestTxt: label 'Approval of an Fuel Request is requested';
        RunWorkflowOnSendFuelReqForApprovalCode: label 'RUNWORKFLOWONSENDFuelFORAPPROVAL';
        OnCancelFuelReqApprovalRequestTxt: label 'An Approval of Fuel Request is canceled';
        RunWorkflowOnCancelFuelReqForApprovalCode: label 'RUNWORKFLOWONCANCELFuelFORAPPROVAL';

        //FleetReq
        OnSendFleetReqApprovalRequestTxt: label 'Approval of an Fleet Request is requested';
        RunWorkflowOnSendFleetReqForApprovalCode: label 'RUNWORKFLOWONSENDFleetReqFORAPPROVAL';
        OnCancelFleetReqApprovalRequestTxt: label 'An Approval of Fleet Request is canceled';
        RunWorkflowOnCancelFleetReqForApprovalCode: label 'RUNWORKFLOWONCANCELFleetReqFORAPPROVAL';

        //Interbank Transfers
        OnSendITApprovalRequestTxt: label 'Approval of an Interbank Transfer is requested';
        RunWorkflowOnSendITForApprovalCode: label 'RUNWORKFLOWONSENDITFORAPPROVAL';
        OnCancelITApprovalRequestTxt: label 'An Approval of an Interbank Transfer is canceled';
        RunWorkflowOnCancelITForApprovalCode: label 'RUNWORKFLOWONCANCELITFORAPPROVAL';

        //Asset Transfer
        OnSendAssetTransferApprovalRequestTxt: label 'An Approval of an Asset Transfer is requested';
        RunWorkflowOnSendAssetTransferForApprovalCode: label 'RUNWORKFLOWONSENDASSETTRANSFERFORAPPROVAL';
        OnCancelAssetTransferApprovalRequestTxt: label 'An Approval of an Asset Transfer is canceled';
        RunWorkflowOnCancelAssetTransferForApprovalCode: label 'RUNWORKFLOWONCANCELASSETTRANSFERFORAPPROVAL';
        // Jobs 
        OnSendHrJobsApprovalRequestTxt: label 'An Approval Request for a Job Position has been requested.';
        RunWorkflowOnSendHrJobsForApprovalCode: label 'RUNWORKFLOWONSENDHRJOBSFORAPPROVAL';
        OnCancelHrJobsApprovalRequestTxt: label 'An Approval Request for a Job Position has been cancelled.';
        RunWorkflowOnCancelHrJobsForApprovalCode: label 'RUNWORKFLOWONCANCELHRJOBSFORAPPROVAL';

        //Project Jobs
        OnSendProjectJobsApprovalRequestTxt: label 'An Approval Request for a Project Job has been requested.';
        RunWorkflowOnSendProjectJobsForApprovalCode: label 'RUNWORKFLOWONSENDPROJECTJOBSSFORAPPROVAL';
        OnCancelProjectJobsApprovalRequestTxt: label 'An Approval Request for a Project Job has been cancelled.';
        RunWorkflowOnCancelProjectJobsForApprovalCode: label 'RUNWORKFLOWONCANCELPROJECTJOBSFORAPPROVAL';

        //Employee Requisition
        OnSendHrEmployeeReqApprovalRequestTxt: label 'An Approval request for Employee Requsition is Requested.';
        RunWorkflowOnSendHrEmployeeReqForApprovalCode: label 'RUNWORKFLOWONSENDHREMPLOYEEREQFORAPPROVAL';
        OnCancelHrEmployeeReqApprovalRequestTxt: label 'An Approval request for Employee Requsition is Cancelled';
        RunWorkflowOnCancelHrEmployeeReqForApprovalCode: label 'RUNWORKFLOWONCANCELHREMPLOYEEREQFORAPPROVAL';
        //Leave
        OnSendHRLeaveAllocationRequestApprovalRequestTxt: label 'An Approval Request for HR Leave Allocation Request has been Requested.';
        RunWorkflowOnSendHRLeaveAllocationRequestForApprovalCode: label 'RUNWORKFLOWONSENDHRLEAVEALLOCATIONREQUESTFORAPPROVAL';
        OnCancelHRLeaveAllocationRequestApprovalRequestTxt: label 'An Approval Request for HR Leave Allocation Request has been Cancelled';
        RunWorkflowOnCancelHRLeaveAllocationRequestForApprovalCode: label 'RUNWORKFLOWONCANCELHRLEAVEALLOCATIONREQUESTFORAPPROVAL';

        //Contractor Request
        OnSendContractorRequestApprovalRequestTxt: label 'An Approval Request for Contractor Request has been Requested.';
        RunWorkflowOnSendContractorRequestForApprovalCode: label 'RUNWORKFLOWONSENDCONTRACTORREQUESTFORAPPROVAL';
        OnCancelContractorRequestApprovalRequestTxt: label 'An Approval Request for Contractor Request has been Cancelled';
        RunWorkflowOnCancelContractorRequestForApprovalCode: label 'RUNWORKFLOWONCANCELCONTRACTORREQUESTFORAPPROVAL';
        //Leave Application Recall
        OnSendLeaveApplicationRecallApprovalRequestTxt: label 'An Approval Request for Leave Application Recall has been Requested.';
        RunWorkflowOnSendLeaveApplicationRecallForApprovalCode: label 'RUNWORKFLOWONSENDLEAVEAPPLICATIONRECALLFORAPPROVAL';
        OnCancelLeaveApplicationRecallApprovalRequestTxt: label 'An Approval Request for Leave Application Recall has been Cancelled';
        RunWorkflowOnCancelLeaveApplicationRecallForApprovalCode: label 'RUNWORKFLOWONCANCELLEAVEAPPLICATIONRECALLFORAPPROVAL';
        //Loan Application
        OnSendLoanApplicationApprovalRequestTxt: label 'An Approval Request for Loan application has been Requested.';
        RunWorkflowOnSendLoanApplicationForApprovalCode: label 'RUNWORKFLOWONSENDLOANAPPLICATIONFORAPPROVAL';
        OnCancelLoanApplicationApprovalRequestTxt: label 'An Approval Request for Loan Application has been Cancelled';
        RunWorkflowOnCancelLoanApplicationForApprovalCode: label 'RUNWORKFLOWONCANCELLOANAPPLICATIONFORAPPROVAL';

        //Training Requisition
        OnSendHrTrainingApprovalRequestTxt: label 'An Approval Request for Training application has been Requested.';
        RunWorkflowOnSendHrTrainingForApprovalCode: label 'RUNWORKFLOWONSENDHRTRAININGFORAPPROVAL';
        OnCancelHrTrainingApprovalRequestTxt: label 'An Approval Request for Training Application has been Cancelled';
        RunWorkflowOnCancelHrTrainingForApprovalCode: label 'RUNWORKFLOWONCANCELHRTRAININGFORAPPROVAL';

        //Vehicle Request
        OnSendVehicleRequestApprovalRequestTxt: label 'An Approval for Vehicle Request has been Requested.';
        RunWorkflowOnSendVehicleRequestForApprovalCode: label 'RUNWORKFLOWONSENDVEHICLEREQUESTFORAPPROVAL';
        OnCancelVehicleRequestApprovalRequestTxt: label 'An Approval for Vehicle Request has been Cancelled';
        RunWorkflowOnCancelVehicleRequestForApprovalCode: label 'RUNWORKFLOWONCANCELVEHICLEREQUESTFORAPPROVAL';

        // Vehicle Incident
        OnSendVehicleIncidentApprovalRequestTxt: label 'An Approval Request for Vehicle Incident has been Requested.';
        RunWorkflowOnSendVehicleIncidentForApprovalCode: label 'RUNWORKFLOWONSENDVEHICLEINCIDENTFORAPPROVAL';
        OnCancelVehicleIncidentApprovalRequestTxt: label 'An Approval Request for Vehicle Incident has been Cancelled';
        RunWorkflowOnCancelVehicleIncidentForApprovalCode: label 'RUNWORKFLOWONCANCELVEHICLEINCIDENTFORAPPROVAL';

        // Discipline Details
        OnSendDisciplineDetailsApprovalRequestTxt: label 'An Approval Request for Discipline Details has been Requested.';
        RunWorkflowOnSendDisciplineDetailsForApprovalCode: label 'RUNWORKFLOWONSENDDISCIPLINEDETAILSFORAPPROVAL';
        OnCancelDisciplineDetailsApprovalRequestTxt: label 'An Approval Request for Discipline Details has been Cancelled';
        RunWorkflowOnCancelDisciplineDetailsForApprovalCode: label 'RUNWORKFLOWONCANCELDISCIPLINEDETAILSFORAPPROVAL';


        // Fuel Card
        OnSendFuelCardApprovalRequestTxt: label 'An Approval Request for Fuel Card has been Requested.';
        RunWorkflowOnSendFuelCardForApprovalCode: label 'RUNWORKFLOWONSENDFUELCARDFORAPPROVAL';
        OnCancelFuelCardApprovalRequestTxt: label 'An Approval Request for Fuel Card has been Cancelled';
        RunWorkflowOnCancelFuelCardForApprovalCode: label 'RUNWORKFLOWONCANCELVEHICLEINCIDENTFORAPPROVAL';

        // Work Ticket
        OnSendWorkTicketApprovalRequestTxt: label 'An Approval Request for Work Ticket has been Requested.';
        RunWorkflowOnSendWorkTicketForApprovalCode: label 'RUNWORKFLOWONSENDWORKTICKETFORAPPROVAL';
        OnCancelWorkTicketApprovalRequestTxt: label 'An Approval Request for work Ticket has been Cancelled';
        RunWorkflowOnCancelWorkTicketForApprovalCode: label 'RUNWORKFLOWONCANCELWORKTICKETFORAPPROVAL';


        // Corporate strategic plans

        OnSendCorporateStrategicPlanApprovalRequestTxt: label 'An Approval Request for a Corporate Strategic Plan has been Requested.';
        RunWorkflowOnSendCorporateStrategicPlanForApprovalCode: label 'RUNWORKFLOWONSENDCORPORATESTRATEGICPLANFORAPPROVAL';
        OnCancelCooperateStrategicPlanApprovalRequestTxt: label 'An Approval Request for a Corporate Strategic Plan has been Cancelled';
        RunWorkflowOnCancelCorporateStrategicPlanForApprovalCode: label 'RUNWORKFLOWONCANCELCORPORATESTRATEGICPLANFORAPPROVAL';

        // Organization Structure

        OnSendOrganizationStructureApprovalRequestTxt: label 'An Approval Request for an Organization Structure has been Requested.';
        RunWorkflowOnSendOrganizationStructureForApprovalCode: label 'RUNWORKFLOWONSENDORGANIZATIONSTRUCTUREFORAPPROVAL';
        OnCancelOrganizationStructureApprovalRequestTxt: label 'An Approval Request for an Organization Structure has been Cancelled';
        RunWorkflowOnCancelOrganizationStructureForApprovalCode: label 'RUNWORKFLOWONCANCELORGANIZATIONSTRUCTUREFORAPPROVAL';

        // Staff Establishment

        OnSendStaffEstablishmentApprovalRequestTxt: label 'An Approval Request for a Staff Establishment has been Requested.';
        RunWorkflowOnSendStaffEstablishmentForApprovalCode: label 'RUNWORKFLOWONSENDSTAFFESTABLISHMENTFORAPPROVAL';
        OnCancelStaffEstablishmentApprovalRequestTxt: label 'An Approval Request for a Staff Establishment has been Cancelled';
        RunWorkflowOnCancelStaffEstablishmentForApprovalCode: label 'RUNWORKFLOWONCANCELSTAFFESTABLISHMENTFORAPPROVAL';


        //Induction Header
        OnSendInductionHeaderApprovalRequestTxt: label 'Approval of Induction Header is requested';
        RunWorkflowOnSendInductionHeaderForApprovalCode: label 'RUNWORKFLOWONINDUCTIONHEADERFORAPPROVAL';
        OnCancelInductionHeaderApprovalRequestTxt: label 'An Approval of Induction Header is canceled';
        RunWorkflowOnCancelInductionHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELINDUCTIONHEADERFORAPPROVAL';
        //Payroll Header
        OnSendPayrollHeaderApprovalRequestTxt: label 'An Approval Request for Salary Voucher has been Requested.';
        RunWorkflowOnSendPayrollHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPAYROLLHEADERFORAPPROVAL';
        OnCancelPayrollHeaderApprovalRequestTxt: label 'An Approval Request for Salary Voucher has been Cancelled';
        RunWorkflowOnCancelPayrollHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPAYROLLHEADERFORAPPROVAL';
        //Consolidated Training Needs
        OnSendConsolidatedTrainingNeedsApprovalRequestTxt: label 'An Approval Request for Consolidated Training Needs has been Requested.';
        RunWorkflowOnSendConsolidatedTrainingNeedsForApprovalCode: label 'RUNWORKFLOWONSENDCONSOLIDATEDTRAININGNEEDSFORAPPROVAL';
        OnCancelConsolidatedTrainingNeedsApprovalRequestTxt: label 'An Approval Request for Consolidated Training Needs has been Cancelled';
        RunWorkflowOnCancelConsolidatedTrainingNeedsForApprovalCode: label 'RUNWORKFLOWONCANCELCONSOLIDATEDTRAININGNEEDSFORAPPROVAL';

        //Leave
        OnSendHrLeaveApprovalRequestTxt: label 'An Approval Request for Leave application has been Requested.';
        RunWorkflowOnSendHrLeaveForApprovalCode: label 'RUNWORKFLOWONSENDHRLEAVEFORAPPROVAL';
        OnCancelHrLeaveApprovalRequestTxt: label 'An Approval Request for Leave Application has been Cancelled';
        RunWorkflowOnCancelHrLeaveForApprovalCode: label 'RUNWORKFLOWONCANCELHRLEAVEFORAPPROVAL';
        //leave adjustment
        OnSendLeaveJournalVoucherApprovalRequestTxt: label 'An Approval Request for a Leave adjustment has been Requested.';
        RunWorkflowOnSendLeaveJournalVoucherForApprovalCode: label 'RUNWORKFLOWONSENDLEAVEJOURNALVOUCHERFORAPPROVAL';
        OnCancelLeaveJournalVoucherApprovalRequestTxt: label 'An Approval Request for a Leave adjustment has been Cancelled';
        RunWorkflowOnCancelLeaveJournalVoucherForApprovalCode: label 'RUNWORKFLOWONCANCELLEAVEJOURNALVOUCHERFORAPPROVAL';
        //Training Plan Header
        OnSendTrainingPlanHeaderApprovalRequestTxt: label 'Approval of Training Plan Header is requested';
        RunWorkflowOnSendTrainingPlanHeaderForApprovalCode: label 'RUNWORKFLOWONTRAININGPLANHEADERFORAPPROVAL';
        OnCancelTrainingPlanHeaderApprovalRequestTxt: label 'An Approval of Training Plan Header is canceled';
        RunWorkflowOnCancelTrainingPlanHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGPLANHEADERFORAPPROVAL';
        //Training Needs Header
        OnSendTrainingNeedsHeaderApprovalRequestTxt: label 'An Approval Request for Training Needs Header has been Requested.';
        RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode: label 'RUNWORKFLOWONSENDTRAININGNEEDSHEADERFORAPPROVAL';
        OnCancelTrainingNeedsHeaderApprovalRequestTxt: label 'An Approval Request for Training Needs Header has been Cancelled';
        RunWorkflowOnCancelTrainingNeedsHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGNEEDSHEADERFORAPPROVAL';
        //Training Requests
        OnSendTrainingRequestsApprovalRequestTxt: label 'An Approval Request for Training Request has been Requested.';
        RunWorkflowOnSendTrainingRequestsForApprovalCode: label 'RUNWORKFLOWONSENDTRAININGREQUESTSFORAPPROVAL';
        OnCancelTrainingRequestsApprovalRequestTxt: label 'An Approval Request for Training Request has been Cancelled';
        RunWorkflowOnCancelTrainingRequestsForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGREQUESTSFORAPPROVAL';
        //Training Extension
        OnSendTrainingExtensionApprovalRequestTxt: label 'An Approval Request for Training Extension has been Requested.';
        RunWorkflowOnSendTrainingExtensionForApprovalCode: label 'RUNWORKFLOWONSENDTRAININGEXTENSIONFORAPPROVAL';
        OnCancelTrainingExtensionApprovalRequestTxt: label 'An Approval Request for Training Extension has been Cancelled';
        RunWorkflowOnCancelTrainingExtensionForApprovalCode: label 'RUNWORKFLOWONCANCELTRAININGEXTENSIONFORAPPROVAL';
        //PR Transaction Codes
        OnSendPRTransactionCodesApprovalRequestTxt: label 'An Approval Request for a PR Transaction Code has been Requested.';
        RunWorkflowOnSendPRTransactionCodesForApprovalCode: label 'RUNWORKFLOWONSENDPRTRANSACTIONCODESFORAPPROVAL';
        OnCancelPRTransactionCodesApprovalRequestTxt: label 'An Approval Request for a PR Transaction Code has been Cancelled';
        RunWorkflowOnCancelPRTransactionCodesForApprovalCode: label 'RUNWORKFLOWONCANCELPRTRANSACTIONCODESFORAPPROVAL';

        // Employee Exit;

        OnSendEmployeeExitHeaderApprovalRequestTxt: label 'An Approval Request for an Employee Exit Header has been Requested.';
        RunWorkflowOnSendEmployeeExitHeaderForApprovalCode: label 'RUNWORKFLOWONSENDEMPLOYEEEXITHEADERFORAPPROVAL';
        OnCancelEmployeeExitHeaderApprovalRequestTxt: label 'An Approval Request for a Employee Exit Header has been Cancelled';
        RunWorkflowOnCancelEmployeeExitHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELEMPLOYEEEXITHEADERFORAPPROVAL';

        // Performance Contract Header;

        OnSendPerformanceContractHeaderApprovalRequestTxt: label 'An Approval Request for a Performance Contract Header has been Requested.';
        RunWorkflowOnSendPerformanceContractHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPERFORMANCECONTRACTHEADERFORAPPROVAL';
        OnCancelPerformanceContractHeaderApprovalRequestTxt: label 'An Approval Request for a Performance Contract Header has been Cancelled';
        RunWorkflowOnCancelPerformanceContractHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPERFORMANCECONTRACTHEADERFORAPPROVAL';
        //Annual Strategy Workplan
        OnSendAnnualStrateyWorkplanApprovalRequestTxt: label 'An Approval Request for an Annual Strategy Workplan has been Requested.';
        RunWorkflowOnSendAnnualStrategyWorkplanForApprovalCode: label 'RUNWORKFLOWONSENDANNUALSTRATEGYWORKPLANFORAPPROVAL';
        OnCancelAnnualStrategyWorkplanApprovalRequestTxt: label 'An Approval Request for an Annual Strategy Workplan has been Cancelled';
        RunWorkflowOnCancelAnnualStrategyWorkplanForApprovalCode: label 'RUNWORKFLOWONCANCELANNUALSTRATEGYWORKPLANFORAPPROVAL';

        //Budget Consolidation Header 
        OnSendBudgetConsolidationApprovalRequestTxt: label 'An Approval Request for a Budget Consolidation has been Requested.';
        RunWorkflowOnSendBudgetConsolidationForApprovalCode: label 'RUNWORKFLOWONSENDBUDGETCONSOLIDATIONFORAPPROVAL';
        OnCancelBudgetConsolidationApprovalRequestTxt: label 'An Approval Request for a Budget Consolidation has been Cancelled';
        RunWorkflowOnCancelBudgetConsolidationForApprovalCode: label 'RUNWORKFLOWONCANCELBUDGETCONSOLIDATIONFORAPPROVAL';

        //Budget ReAllocation Header
        OnSendBudgetReAllocationApprovalRequestTxt: label 'An Approval Request for a Budget ReAllocation has been Requested.';
        RunWorkflowOnSendBudgetReAllocationForApprovalCode: label 'RUNWORKFLOWONSENDBUDGETREALLOCATIONFORAPPROVAL';
        OnCancelBudgetReAllocationApprovalRequestTxt: label 'An Approval Request for a Budget ReAllocation has been Cancelled';
        RunWorkflowOnCancelBudgetReAllocationForApprovalCode: label 'RUNWORKFLOWONCANCELBUDGETREALLOCATIONFORAPPROVAL';

        //Batch Auth Incur. Expense
        OnSendBatchAuthIncurExpApprovalRequestTxt: label 'An Approval Request for a Batch Authorization to Incur Expense has been Requested.';
        RunWorkflowOnSendBatchAuthIncExpForApprovalCode: label 'RUNWORKFLOWONSENDBATCHAUTHINCEXPFORAPPROVAL';
        OnCancelBatchAuthIncExpApprovalRequestTxt: label 'An Approval Request for a Budget Authorization to Incur Expense has been Cancelled';
        RunWorkflowOnCancelBatchAuthExpForApprovalCode: label 'RUNWORKFLOWONCANCELBATCHAUTHINCEXPFORAPPROVAL';

        //Auth Incur. Expense
        OnSendAuthIncurExpApprovalRequestTxt: label 'An Approval Request for a Authorization to Incur Expense has been Requested.';
        RunWorkflowOnSendAuthIncExpForApprovalCode: label 'RUNWORKFLOWONSENDAUTHINCEXPFORAPPROVAL';
        OnCancelAuthIncExpApprovalRequestTxt: label 'An Approval Request for a Authorization to Incur Expense has been Cancelled';
        RunWorkflowOnCancelAuthExpForApprovalCode: label 'RUNWORKFLOWONCANCELAUTHINCEXPFORAPPROVAL';
        //Expense Requisition
        OnSendExpenseRequisitionApprovalRequestTxt: label 'An Approval Request for an Expense Requisition has been Requested.';
        RunWorkflowOnSendExpenseRequisitionForApprovalCode: label 'RUNWORKFLOWONSENDEXPENSEREQUISITIONFORAPPROVAL';
        OnCancelExpenseRequisitionApprovalRequestTxt: label 'An Approval Request for an Expense Requisition has been Cancelled';
        RunWorkflowOnCancelExpenseRequisitionForApprovalCode: label 'RUNWORKFLOWONCANCELEXPENSEREQUISITIONFORAPPROVAL';

        //PlannigHeader
        OnSendPlanningHeaderApprovalRequestTxt: label 'Approval of a Plaining Header is requested';
        RunWorkflowOnSendPlanningHeaderForApprovalCode: label 'RUNWORKFLOWONSENDPLANNINGHEADERFORAPPROVAL';
        OnCancelPlanningHeaderApprovalRequestTxt: label 'An Approval of planning header is canceled';
        RunWorkflowOnCancelPlanningHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELPLANNINGHEADERFORAPPROVAL';

        //Project Closure
        OnSendProjectClosureApprovalRequestTxt: label 'Approval of a Project Closure is requested';
        RunWorkflowOnSendProjectClosureForApprovalCode: label 'RUNWORKFLOWONSENDPROJECTCLOSUREFORAPPROVAL';
        OnCancelProjectClosureApprovalRequestTxt: label 'An Approval of Project Closure is canceled';
        RunWorkflowOnCancelProjectClosureForApprovalCode: label 'RUNWORKFLOWONCANCELPROJECTCLOSUREFORAPPROVAL';

        //EFT Header
        OnSendEFTHeaderApprovalRequestTxt: label 'Approval of a EFT Header is requested';
        RunWorkflowOnSendEFTHeaderForApprovalCode: label 'RUNWORKFLOWONSENDEFTHEADERFORAPPROVAL';
        OnCancelEFTHeaderApprovalRequestTxt: label 'An Approval of EFT Header is canceled';
        RunWorkflowOnCancelEFTHeaderForApprovalCode: label 'RUNWORKFLOWONCANCELEFTHEADERFORAPPROVAL';
        //Annual Disposal Plan
        OnSendAnnualDisposalPlanApprovalRequestTxt: label 'Approval of an Annual Dispoasl Plan is requested';
        RunWorkflowOnSendAnnualDisposalPlanForApprovalCode: label 'RUNWORKFLOWONSENDANNUALDISPOSALPLANFORAPPROVAL';
        OnCancelAnnualDisposalPlanApprovalRequestTxt: label 'An Approval of an Annual Disposal Plan is canceled';
        RunWorkflowOnCancelAnnualDisposalPlanForApprovalCode: label 'RUNWORKFLOWONCANCELANNUALDISPOSALPLANFORAPPROVAL';
        //OpenRegister
        OnSendBidRegisterPlanApprovalRequestTxt: label 'Approval of an Bid Register is requested';
        RunWorkflowOnSendBidRegisterForApprovalCode: label 'RUNWORKFLOWONSENDBIDREGISTERPLANFORAPPROVAL';
        OnCancelBidRegisterPlanApprovalRequestTxt: label 'An Approval of an Bid Register is canceled';
        RunWorkflowOnCancelBidRegisterForApprovalCode: label 'RUNWORKFLOWONCANCELBIDREGISTERPLANFORAPPROVAL';
        //Imprest Header Finance
        OnSendImprestApprovalRequestTxt: label 'Approval of an Imprest is requested';
        RunWorkflowOnSendImprestForApprovalCode: label 'RUNWORKFLOWONSENDIMPRESTFORAPPROVAL';
        OnCancelImprestApprovalRequestTxt: label 'An Approval of an Imprest is cancelled';
        RunWorkflowOnCancelImprestForApprovalCode: label 'RUNWORKFLOWONCANCELIMPRESTFORAPPROVAL';
        //Licence Registration Form
        OnSendLicenceRegistrationFormApprovalRequestTxt: label 'Approval of an Licence Registration Form is requested';
        RunWorkflowOnSendLicenceRegistrationFormForApprovalCode: label 'RUNWORKFLOWONSENDLICENCEREGISTRATIONFORMFORAPPROVAL';
        OnCancelLicenceRegistrationFormApprovalRequestTxt: label 'An Approval of an Licence Registration Form is cancelled';
        RunWorkflowOnCancelLicenceRegistrationFormForApprovalCode: label 'RUNWORKFLOWONCANCELLICENCEREGISTRATIONFORMFORAPPROVAL';


    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            //Bid Register
            DATABASE::"Bid Opening Register":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBidRegisterForApprovalCode));


            //HR Leave Planner Header
            DATABASE::"HR Leave Planner Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRLeavePlannerHeaderForApprovalCode));

            //HR Leave Planner Header
            DATABASE::"Job":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProjectJobsForApprovalCode));

            //Consolidated Training Needs
            // DATABASE::"Consolidated Training Needs":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendConsolidatedTrainingNeedsForApprovalCode));

            //PR Transaction Codes
            DATABASE::"PR Transaction Codes":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPRTransactionCodesForApprovalCode));

            // //Training Extension
            // DATABASE::"Training Extension":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingExtensionForApprovalCode));

            //Training Requests
            DATABASE::"Training Requests":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingRequestsForApprovalCode));

            //Training Needs Header
            DATABASE::"Training Needs Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode));
            //Training Plan Header
            Database::"Training Plan Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendTrainingPlanHeaderForApprovalCode));

            // //pavement
            // Database::"Pavement Test Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPavementForApprovalCode));

            // //PlanningHeader
            // Database::"Planning Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPlanningHeaderForApprovalCode));

            // //Project Closure
            // Database::"Project Closure":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProjectClosureForApprovalCode));

            //PCA
            Database::"prBasic pay PCA":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSend_PCA_ForApprovalCode));

            // //pROJECT SCHEDULE
            // Database::"Road Work Program":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendScheduleForApprovalCode));
            // //Induction Header
            // Database::"Induction Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendInductionHeaderForApprovalCode));
            //IFRCARD
            Database::"Request For Information":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIFRForApprovalCode));
            // //DraftIFS

            //procurement Plan
            Database::"Procurement Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendProcPlanForApprovalCode));
            //RFQ
            Database::"Standard Purchase Code":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRFQForApprovalCode));
            //PV
            Database::Payments:
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPVForApprovalCode));
            // //"IFS Tender Committee"
            // Database::"IFS Tender Committee":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIFSTenderForApprovalCode));

            //"Receipts Header1"
            Database::"Receipts Header1":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendReceiptForApprovalCode));
            //"Bid Tabulation Header"
            Database::"Bid Tabulation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendOpinionForApprovalCode));

            // //Item Creation Requests
            // Database::"Item Creation Requests":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendITMForApprovalCode));


            //"Airtime Allocation Header"
            Database::"Airtime Allocation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAirtimeForApprovalCode));

            //ResourceBookingHeader
            Database::"Resource Booking Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendResourceBookingHeaderForApprovalCode));


            //SuccessionPlanHeader
            Database::"Succession Plan Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSuccessionPlanHeaderForApprovalCode));
            //"SuccessionLogHeader"
            Database::"Succession Log Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendSuccessionLogHeaderForApprovalCode));

            //Positions
            Database::"Company Positions":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPositionsForApprovalCode));
            //Announcement
            Database::"Vacancy Announcement":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAnnouncementForApprovalCode));

            //HRComm
            Database::"Commitee Appointment Voucher":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRCommForApprovalCode));

            //"Employee Transfers"
            Database::"Employee Transfers":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmpTransForApprovalCode));
            //"Employee Acting Position"
            Database::"Employee Acting Position":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmpActForApprovalCode));
            // //"Employee OnBoarding"
            // Database::"HR Employee Onboarding":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmpOnboardForApprovalCode));

            // //Imprest Memo
            // Database::"Imprest Memo":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendIMForApprovalCode));
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRecruitReqForApprovalCode));
            //"Recruitment Plan"
            Database::"Recruitment Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendRecruiplanForApprovalCode));
            // //MaintenanceReq
            // Database::"Maintenance Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendMaintenanceReqForApprovalCode));

            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFuelReqForApprovalCode));
            //FleetReq
            Database::"Transport Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFleetReqForApprovalCode));

            // //Interbank Transfer
            // Database::"Inter Bank Transfer":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendITForApprovalCode));
            //Asset Transfer.
            DATABASE::"HR Asset Transfer Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAssetTransferForApprovalCode));
            //Leave
            DATABASE::"HR Leave Allocation Request":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHRLeaveAllocationRequestForApprovalCode));

            // //Contractor
            // DATABASE::"Contractor Request Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendContractorRequestForApprovalCode));
            //Leave Application Recall
            DATABASE::"Leave Application Recall":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeaveApplicationRecallForApprovalCode));
            //Loan
            DATABASE::"Loan Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLoanApplicationForApprovalCode));

            //Vehicle Request
            DATABASE::"Vehicle Request":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendVehicleRequestForApprovalCode));

            //Vehicle Incident
            DATABASE::"Vehicle Incident":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendVehicleIncidentForApprovalCode));

            //Discipline Details
            DATABASE::"Discipline Details":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendDisciplineDetailsForApprovalCode));

            //Fuel Card
            DATABASE::"Fuel Card":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendFuelCardForApprovalCode));

            // Corperate Strategic Plan
            DATABASE::"Corporate Strategic Plans":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendCorporateStrategicPlanForApprovalCode));
            // Corperate Strategic Plan
            DATABASE::"Organization Hierarchy Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendOrganizationStructureForApprovalCode));
            // Corperate Strategic Plan
            DATABASE::"Staff Establishment Plan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendStaffEstablishmentForApprovalCode));
            //Payroll Header
            DATABASE::"Payroll Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPayrollHeaderForApprovalCode));
            // Monthly work ticket
            DATABASE::"Monthly Work Ticket Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendWorkTicketForApprovalCode));
            //Leave
            DATABASE::"HR Leave Application":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendHrLeaveForApprovalCode));
            //payroll buffer 
            DATABASE::"PR Payroll Buffer":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPrPayrollBufferForApprovalCode));
            //leave adjustment
            DATABASE::"Leave Journal Voucher":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLeaveJournalVoucherForApprovalCode));

            //  Employee Exit
            DATABASE::"Employee Exit Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEmployeeExitHeaderForApprovalCode));
            //  Performance Contract Header
            DATABASE::"Perfomance Contract Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPerformanceContractHeaderForApprovalCode));

            //Annual Strategy Workplan
            Database::"Annual Strategy Workplan":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAnnualStrategyWorkplanForApprovalCode));

            //Budget Consolidation
            Database::"Budget Consolidation Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBudgetConsolidationForApprovalCode));

            // //Budget ReAllocation Header
            // Database::"Budget Reallocation Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBudgetReAllocationForApprovalCode));

            // //Batch Auth to Incur Expense
            // Database::"Batch. Auth to Incur Expend":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendBatchAuthIncExpForApprovalCode));

            // // Auth to Incur Expense
            // Database::"Auth. Inc. Expend. Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAuthIncExpForApprovalCode));

            //Expense Requisition
            Database::"Expense Requisition":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendExpenseRequisitionForApprovalCode));
            //EFT Header
            Database::"EFT Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendEFTHeaderForApprovalCode));
            // //Annual Disposal Plan
            // Database::"Annual Disposal Plan Header":
            //     exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendAnnualDisposalPlanForApprovalCode));
            //Imprest Header Finance
            Database::"Request Header1":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendImprestForApprovalCode));
            Database::"Licence Registration Form":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendLicenceRegistrationFormForApprovalCode));
            //pURCHASE
            Database::"Purchase Header":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnSendPurchaseForApprovalCode));
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelDocApprovalRequest(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin
        //Bidregister
        WorkFlowEventHandling.AddEventToLibrary(
            RunWorkflowOnSendBidRegisterForApprovalCode, DATABASE::"Bid Opening Register", OnSendBidRegisterPlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBidRegisterForApprovalCode, DATABASE::"Bid Opening Register", OnCancelBidRegisterPlanApprovalRequestTxt, 0, false);

        //HR Leave Planner Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendHRLeavePlannerHeaderForApprovalCode, DATABASE::"HR Leave Planner Header", OnSendHRLeavePlannerHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelHRLeavePlannerHeaderForApprovalCode, DATABASE::"HR Leave Planner Header", OnCancelHRLeavePlannerHeaderApprovalRequestTxt, 0, false);

        //Annual Strategy Workplan
        WorkFlowEventHandling.AddEventToLibrary(
         RunWorkflowOnSendAnnualStrategyWorkplanForApprovalCode, DATABASE::"Annual Strategy Workplan", OnSendAnnualStrateyWorkplanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAnnualStrategyWorkplanForApprovalCode, DATABASE::"Annual Strategy Workplan", OnCancelAnnualStrategyWorkplanApprovalRequestTxt, 0, false);

        //Budget Consolidation
        WorkFlowEventHandling.AddEventToLibrary(
         RunWorkflowOnSendBudgetConsolidationForApprovalCode, DATABASE::"Budget Consolidation Header", OnSendBudgetConsolidationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBudgetConsolidationForApprovalCode, DATABASE::"Budget Consolidation Header", OnCancelBudgetConsolidationApprovalRequestTxt, 0, false);

        // //Budget ReAllocation
        // WorkFlowEventHandling.AddEventToLibrary(
        //  RunWorkflowOnSendBudgetReAllocationForApprovalCode, DATABASE::"Budget Reallocation Header", OnSendBudgetReAllocationApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        //  RunWorkflowOnCancelBudgetReAllocationForApprovalCode, DATABASE::"Budget Reallocation Header", OnCancelBudgetReAllocationApprovalRequestTxt, 0, false);

        // //Batch Auth to Incur 
        // WorkFlowEventHandling.AddEventToLibrary(
        //       RunWorkflowOnSendBatchAuthIncExpForApprovalCode, DATABASE::"Batch. Auth to Incur Expend", OnSendBatchAuthIncurExpApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        //       RunWorkflowOnCancelBatchAuthExpForApprovalCode, DATABASE::"Batch. Auth to Incur Expend", OnCancelBatchAuthIncExpApprovalRequestTxt, 0, false);

        // //Auth to Incur Header
        // WorkFlowEventHandling.AddEventToLibrary(
        //       RunWorkflowOnSendAuthIncExpForApprovalCode, DATABASE::"Auth. Inc. Expend. Header", OnSendAuthIncurExpApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        //       RunWorkflowOnCancelAuthExpForApprovalCode, DATABASE::"Auth. Inc. Expend. Header", OnCancelAuthIncExpApprovalRequestTxt, 0, false);
        //Expense Requsition
        WorkFlowEventHandling.AddEventToLibrary(
              RunWorkflowOnSendExpenseRequisitionForApprovalCode, DATABASE::"Expense Requisition", OnSendExpenseRequisitionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
              RunWorkflowOnCancelExpenseRequisitionForApprovalCode, DATABASE::"Expense Requisition", OnCancelExpenseRequisitionApprovalRequestTxt, 0, false);
        // //Consolidated Training Needs
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendConsolidatedTrainingNeedsForApprovalCode, DATABASE::"Consolidated Training Needs", OnSendConsolidatedTrainingNeedsApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelConsolidatedTrainingNeedsForApprovalCode, DATABASE::"Consolidated Training Needs", OnCancelConsolidatedTrainingNeedsApprovalRequestTxt, 0, false);

        // //Pavement
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendPavementForApprovalCode, Database::"Pavement Test Header", OnSendPavementApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelPavementForApprovalCode, Database::"Pavement Test Header", OnCancelPavementApprovalRequestTxt, 0, false);


        //Pavement
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendProjectJobsForApprovalCode, Database::"Job", OnSendProjectJobsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProjectJobsForApprovalCode, Database::"Job", OnCancelProjectJobsApprovalRequestTxt, 0, false);

        // //Contractor Request
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendContractorRequestForApprovalCode, Database::"Contractor Request Header", OnSendContractorRequestApprovalRequestTxt,0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelContractorRequestForApprovalCode, Database::"Contractor Request Header", OnCancelContractorRequestApprovalRequestTxt, 0, false);

        // //PlanningHeader
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendPlanningHeaderForApprovalCode, Database::"Planning Header", OnSendPlanningHeaderApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelPlanningHeaderForApprovalCode, Database::"Planning Header", OnCancelPlanningHeaderApprovalRequestTxt, 0, false);

        // //Project Closure
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendProjectClosureForApprovalCode, Database::"Project Closure", OnSendProjectClosureApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelProjectClosureForApprovalCode, Database::"project Closure", OnCancelProjectClosureApprovalRequestTxt, 0, false);
        //_PCA_
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSend_PCA_ForApprovalCode, Database::"prBasic pay PCA", OnSend_PCA_ApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancel_PCA_ForApprovalCode, Database::"prBasic pay PCA", OnCancel_PCA_ApprovalRequestTxt, 0, false);
        //Induction Header
        WorkFlowEventHandling.AddEventToLibrary(
      RunWorkflowOnSendInductionHeaderForApprovalCode, DATABASE::"Induction Header", OnSendInductionHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelInductionHeaderForApprovalCode, DATABASE::"Induction Header", OnCancelInductionHeaderApprovalRequestTxt, 0, false);


        // //project schedule
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendScheduleForApprovalCode, Database::"Road Work Program", OnSendScheduleApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelScheduleForApprovalCode, Database::"Road Work Program", OnCancelScheduleApprovalRequestTxt, 0, false);


        //IFPCARD
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendIFRForApprovalCode, Database::"Request For Information", OnSendIFRApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelIFRForApprovalCode, Database::"Request For Information", OnCancelIFRApprovalRequestTxt, 0, false);

        //RFQ
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRFQForApprovalCode, Database::"Standard Purchase Code", OnSendRFQApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRFQForApprovalCode, Database::"Standard Purchase Code", OnCancelRFQApprovalRequestTxt, 0, false);

        //PV
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPVForApprovalCode, Database::"Payments", OnSendPVApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPVForApprovalCode, Database::"Payments", OnCancelPVApprovalRequestTxt, 0, false);


        //"IFS Tender Committee"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendIFSTenderForApprovalCode, Database::"IFS Tender Committee", OnSendIFSTenderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelIFSTenderForApprovalCode, Database::"IFS Tender Committee", OnCancelIFSTenderApprovalRequestTxt, 0, false);


        //"Receipts Header1"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendReceiptForApprovalCode, Database::"Receipts Header1", OnSendReceiptApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelReceiptForApprovalCode, Database::"Receipts Header1", OnCancelReceiptApprovalRequestTxt, 0, false);
        //"Bid Tabulation Header"

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendOpinionForApprovalCode, Database::"Bid Tabulation Header", OnSendOpinionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelOpinionForApprovalCode, Database::"Bid Tabulation Header", OnCancelOpinionApprovalRequestTxt, 0, false);

        // //Item Creation Requests
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendITMForApprovalCode, Database::"Item Creation Requests", OnSendITMApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelITMForApprovalCode, Database::"Item Creation Requests", OnCancelITMApprovalRequestTxt, 0, false);


        //"Airtime Allocation Header"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAirtimeForApprovalCode, Database::"Airtime Allocation Header", OnSendAirtimeApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAirtimeForApprovalCode, Database::"Airtime Allocation Header", OnCancelAirtimeApprovalRequestTxt, 0, false);

        //ResourceBookingHeader
        WorkFlowEventHandling.AddEventToLibrary(
                RunWorkflowOnSendResourceBookingHeaderForApprovalCode, Database::"Resource Booking Header", OnSendResourceBookingHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelResourceBookingHeaderForApprovalCode, Database::"Resource Booking Header", OnCancelResourceBookingHeaderApprovalRequestTxt, 0, false);

        //SuccessionPlanHeader
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSuccessionPlanHeaderForApprovalCode, Database::"Succession Plan Header", OnSendSuccessionPlanHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSuccessionPlanHeaderForApprovalCode, Database::"Succession Plan Header", OnCancelSuccessionPlanHeaderApprovalRequestTxt, 0, false);
        //SuccessionLogHeader
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendSuccessionLogHeaderForApprovalCode, Database::"Succession Log Header", OnSendSuccessionLogHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelSuccessionLogHeaderForApprovalCode, Database::"Succession Log Header", OnCancelSuccessionLogHeaderApprovalRequestTxt, 0, false);


        //"Company Positions"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPositionsForApprovalCode, Database::"Company Positions", OnSendPositionsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPositionsForApprovalCode, Database::"Company Positions", OnCancelPositionsApprovalRequestTxt, 0, false);

        //"Vacancy Announcement"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAnnouncementForApprovalCode, Database::"Vacancy Announcement", OnSendAnnouncementApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAnnouncementForApprovalCode, Database::"Vacancy Announcement", OnCancelAnnouncementApprovalRequestTxt, 0, false);

        //"Commitee Appointment Voucher"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendHRCommForApprovalCode, Database::"Commitee Appointment Voucher", OnSendHRCommApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelHRCommForApprovalCode, Database::"Commitee Appointment Voucher", OnCancelHRCommApprovalRequestTxt, 0, false);

        //"Employee Transfers"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEmpTransForApprovalCode, Database::"Employee Transfers", OnSendEmpTransApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEmpTransForApprovalCode, Database::"Employee Transfers", OnCancelEmpTransApprovalRequestTxt, 0, false);

        //"Employee Acting Position"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEmpActForApprovalCode, Database::"Employee Acting Position", OnSendEmpActApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEmpActForApprovalCode, Database::"Employee Acting Position", OnCancelEmpActApprovalRequestTxt, 0, false);

        // //"Employee Onboarding"
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendEmpOnboardForApprovalCode, Database::"HR Employee Onboarding", OnSendEmpOnboardApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelEmpOnboardForApprovalCode, Database::"HR Employee Onboarding", OnCancelEmpOnboardApprovalRequestTxt, 0, false);

        // //Imprest Memo
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendIMForApprovalCode, Database::"Imprest Memo", OnSendIMApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelIMForApprovalCode, Database::"Imprest Memo", OnCancelIMApprovalRequestTxt, 0, false);
        //"Recruitment Requisition Header"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRecruitReqForApprovalCode, Database::"Recruitment Requisition Header", OnSendRecruitReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRecruitReqForApprovalCode, Database::"Recruitment Requisition Header", OnCancelRecruitReqApprovalRequestTxt, 0, false);
        //"Recruitment Plan"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendRecruiplanForApprovalCode, Database::"Recruitment Plan", OnSendRecruiplanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelRecruiplanForApprovalCode, Database::"Recruitment Plan", OnCancelRecruiplanApprovalRequestTxt, 0, false);
        // //"Maintenance Header"
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendMaintenanceReqForApprovalCode, Database::"Maintenance Header", OnSendMaintenanceReqApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        //      RunWorkflowOnCancelMaintenanceReqForApprovalCode, Database::"Maintenance Header", OnCancelMaintenanceReqApprovalRequestTxt, 0, false);
        //"Fuel & Maintenance Requisition"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFuelReqForApprovalCode, Database::"Fuel & Maintenance Requisition", OnSendFuelReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFuelReqForApprovalCode, Database::"Fuel & Maintenance Requisition", OnCancelFuelReqApprovalRequestTxt, 0, false);

        //"Transport Requisition"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendFleetReqForApprovalCode, Database::"Transport Requisition", OnSendFleetReqApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFleetReqForApprovalCode, Database::"Transport Requisition", OnCancelFleetReqApprovalRequestTxt, 0, false);

        // //Interbank Transfer
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendITForApprovalCode, Database::"Inter Bank Transfer", OnSendITApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelITForApprovalCode, Database::"Inter Bank Transfer", OnCancelITApprovalRequestTxt, 0, false);

        //Asset 
        WorkFlowEventHandling.AddEventToLibrary(
               RunWorkflowOnSendAssetTransferForApprovalCode, DATABASE::"HR Asset Transfer Header", OnSendAssetTransferApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
       RunWorkflowOnCancelAssetTransferForApprovalCode, DATABASE::"HR Asset Transfer Header", OnCancelAssetTransferApprovalRequestTxt, 0, false);

        //Procurement Plan
        WorkFlowEventHandling.AddEventToLibrary(
      RunWorkflowOnSendProcPlanForApprovalCode, DATABASE::"Procurement Plan", OnSendProcPlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelProcPlanForApprovalCode, DATABASE::"Procurement Plan", OnCancelProcPlanApprovalRequestTxt, 0, false);

        //Leave
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendHRLeaveAllocationRequestForApprovalCode, DATABASE::"HR Leave Allocation Request", OnSendHRLeaveAllocationRequestApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelHRLeaveAllocationRequestForApprovalCode, DATABASE::"HR Leave Allocation Request", OnCancelHRLeaveAllocationRequestApprovalRequestTxt, 0, false);
        // Leave Application Recall
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLeaveApplicationRecallForApprovalCode, DATABASE::"Leave Application Recall", OnSendLeaveApplicationRecallApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLeaveApplicationRecallForApprovalCode, DATABASE::"Leave Application Recall", OnCancelLeaveApplicationRecallApprovalRequestTxt, 0, false);
        //Loan
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLoanApplicationForApprovalCode, DATABASE::"Loan Application", OnSendLoanApplicationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLoanApplicationForApprovalCode, DATABASE::"Loan Application", OnCancelLoanApplicationApprovalRequestTxt, 0, false);

        // Vehicle Request

        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendVehicleRequestForApprovalCode, DATABASE::"Vehicle Request", OnSendVehicleRequestApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelVehicleRequestForApprovalCode, DATABASE::"Vehicle Request", OnCancelVehicleRequestApprovalRequestTxt, 0, false);

        //Vehicle Incident
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendVehicleIncidentForApprovalCode, DATABASE::"Vehicle Incident", OnSendVehicleIncidentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelVehicleIncidentForApprovalCode, DATABASE::"Vehicle Incident", OnCancelVehicleIncidentApprovalRequestTxt, 0, false);

        //Discipline Details
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendDisciplineDetailsForApprovalCode, DATABASE::"Discipline Details", OnSendDisciplineDetailsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelDisciplineDetailsForApprovalCode, DATABASE::"Discipline Details", OnCancelDisciplineDetailsApprovalRequestTxt, 0, false);

        // Corporate Strategic Plans
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendCorporateStrategicPlanForApprovalCode, DATABASE::"Corporate Strategic Plans", OnSendCorporateStrategicPlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelCorporateStrategicPlanForApprovalCode, DATABASE::"Corporate Strategic Plans", OnCancelCooperateStrategicPlanApprovalRequestTxt, 0, false);

        // Organization Structure
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendOrganizationStructureForApprovalCode, DATABASE::"Organization Hierarchy Header", OnSendOrganizationStructureApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelOrganizationStructureForApprovalCode, DATABASE::"Organization Hierarchy Header", OnCancelOrganizationStructureApprovalRequestTxt, 0, false);

        // Staff Establishment
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendStaffEstablishmentForApprovalCode, DATABASE::"Staff Establishment Plan", OnSendStaffEstablishmentApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelStaffEstablishmentForApprovalCode, DATABASE::"Staff Establishment Plan", OnCancelStaffEstablishmentApprovalRequestTxt, 0, false);
        //Payroll Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPayrollHeaderForApprovalCode, DATABASE::"Payroll Header", OnSendPayrollHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPayrollHeaderForApprovalCode, DATABASE::"Payroll Header", OnCancelPayrollHeaderApprovalRequestTxt, 0, false);

        //payroll buffer
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPrPayrollBufferForApprovalCode, DATABASE::"PR Payroll Buffer", OnSendPrPayrollBufferApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPrPayrollBufferForApprovalCode, DATABASE::"PR Payroll Buffer", OnCancelPrPayrollBufferApprovalRequestTxt, 0, false);

        // wEventHandling.AddEventToLibrary(
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendWorkTicketForApprovalCode, DATABASE::"Monthly Work Ticket Header", OnSendWorkTicketApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelWorkTicketForApprovalCode, DATABASE::"Monthly Work Ticket Header", OnCancelWorkTicketApprovalRequestTxt, 0, false);

        //Fuel Card
        WorkFlowEventHandling.AddEventToLibrary(
         RunWorkflowOnSendFuelCardForApprovalCode, DATABASE::"Fuel Card", OnSendFuelCardApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelFuelCardForApprovalCode, DATABASE::"Fuel Card", OnCancelFuelCardApprovalRequestTxt, 0, false);
        //Leave
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendHrLeaveForApprovalCode, DATABASE::"HR Leave Application", OnSendHrLeaveApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelHrLeaveForApprovalCode, DATABASE::"HR Leave Application", OnCancelHrLeaveApprovalRequestTxt, 0, false);

        //leave adjustment
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLeaveJournalVoucherForApprovalCode, DATABASE::"Leave Journal Voucher", OnSendLeaveJournalVoucherApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLeaveJournalVoucherForApprovalCode, DATABASE::"Leave Journal Voucher", OnCancelLeaveJournalVoucherApprovalRequestTxt, 0, false);
        //Training Needs Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode, DATABASE::"Training Needs Header", OnSendTrainingNeedsHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTrainingNeedsHeaderForApprovalCode, DATABASE::"Training Needs Header", OnCancelTrainingNeedsHeaderApprovalRequestTxt, 0, false);
        //Training Plan Header
        WorkFlowEventHandling.AddEventToLibrary(
      RunWorkflowOnSendTrainingPlanHeaderForApprovalCode, DATABASE::"Training Plan Header", OnSendTrainingPlanHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTrainingPlanHeaderForApprovalCode, DATABASE::"Training Plan Header", OnCancelTrainingPlanHeaderApprovalRequestTxt, 0, false);
        //Training Requests
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendTrainingRequestsForApprovalCode, DATABASE::"Training Requests", OnSendTrainingRequestsApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelTrainingRequestsForApprovalCode, DATABASE::"Training Requests", OnCancelTrainingRequestsApprovalRequestTxt, 0, false);
        // //Training Extension
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendTrainingExtensionForApprovalCode, DATABASE::"Training Extension", OnSendTrainingExtensionApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelTrainingExtensionForApprovalCode, DATABASE::"Training Extension", OnCancelTrainingExtensionApprovalRequestTxt, 0, false);
        //PR Transaction Codes
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPRTransactionCodesForApprovalCode, DATABASE::"PR Transaction Codes", OnSendPRTransactionCodesApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPRTransactionCodesForApprovalCode, DATABASE::"PR Transaction Codes", OnCancelPRTransactionCodesApprovalRequestTxt, 0, false);

        //Employee Exit Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEmployeeExitHeaderForApprovalCode, DATABASE::"Employee Exit Header", OnSendEmployeeExitHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEmployeeExitHeaderForApprovalCode, DATABASE::"Employee Exit Header", OnCancelEmployeeExitHeaderApprovalRequestTxt, 0, false);

        //"Perfomance Contract Header"
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPerformanceContractHeaderForApprovalCode, DATABASE::"Perfomance Contract Header", OnSendPerformanceContractHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPerformanceContractHeaderForApprovalCode, DATABASE::"Perfomance Contract Header", OnCancelPerformanceContractHeaderApprovalRequestTxt, 0, false);

        //Annual Strategy Workplan
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendAnnualStrategyWorkplanForApprovalCode, DATABASE::"Annual Strategy Workplan", OnSendAnnualStrateyWorkplanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelAnnualStrategyWorkplanForApprovalCode, DATABASE::"Annual Strategy Workplan", OnCancelAnnualStrategyWorkplanApprovalRequestTxt, 0, false);

        //Budget Consolidation
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendBudgetConsolidationForApprovalCode, DATABASE::"Budget Consolidation Header", OnSendBudgetConsolidationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelBudgetConsolidationForApprovalCode, DATABASE::"Budget Consolidation Header", OnCancelBudgetConsolidationApprovalRequestTxt, 0, false);

        // //Budget ReAllocation
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendBudgetReAllocationForApprovalCode, DATABASE::"Budget Reallocation Header", OnSendBudgetReAllocationApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        //  RunWorkflowOnCancelBudgetReAllocationForApprovalCode, DATABASE::"Budget Reallocation Header", OnCancelBudgetReAllocationApprovalRequestTxt, 0, false);

        // //Batch Auth to Incur 
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendBatchAuthIncExpForApprovalCode, DATABASE::"Batch. Auth to Incur Expend", OnSendBatchAuthIncurExpApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelBatchAuthExpForApprovalCode, DATABASE::"Batch. Auth to Incur Expend", OnCancelBatchAuthIncExpApprovalRequestTxt, 0, false);

        // //Auth to Incur Header
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnSendAuthIncExpForApprovalCode, DATABASE::"Auth. Inc. Expend. Header", OnSendAuthIncurExpApprovalRequestTxt, 0, false);
        // WorkFlowEventHandling.AddEventToLibrary(
        // RunWorkflowOnCancelAuthExpForApprovalCode, DATABASE::"Auth. Inc. Expend. Header", OnCancelAuthIncExpApprovalRequestTxt, 0, false);
        //Expense Requsition
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendExpenseRequisitionForApprovalCode, DATABASE::"Expense Requisition", OnSendExpenseRequisitionApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelExpenseRequisitionForApprovalCode, DATABASE::"Expense Requisition", OnCancelExpenseRequisitionApprovalRequestTxt, 0, false);
        //EFT Header
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEFTHeaderForApprovalCode, DATABASE::"EFT Header", OnSendEFTHeaderApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEFTHeaderForApprovalCode, DATABASE::"EFT Header", OnCancelEFTHeaderApprovalRequestTxt, 0, false);
        //Annual Disposal Plan
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendEFTHeaderForApprovalCode, DATABASE::"Annual Disposal Plan Header", OnSendAnnualDisposalPlanApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelEFTHeaderForApprovalCode, DATABASE::"Annual Disposal Plan Header", OnCancelAnnualDisposalPlanApprovalRequestTxt, 0, false);
        //Imprest Header Finance
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendImprestForApprovalCode, DATABASE::"Request Header1", OnSendImprestApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelImprestForApprovalCode, DATABASE::"Request Header1", OnCancelImprestApprovalRequestTxt, 0, false);
        //Licence Registration Form
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendLicenceRegistrationFormForApprovalCode, DATABASE::"Licence Registration Form", OnSendLicenceRegistrationFormApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelLicenceRegistrationFormForApprovalCode, DATABASE::"Licence Registration Form", OnCancelLicenceRegistrationFormApprovalRequestTxt, 0, false);
        //Purchase
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnSendPurchaseForApprovalCode, Database::"Purchase Header", OnSendPurchaseApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(
        RunWorkflowOnCancelPurchaseForApprovalCode, Database::"Purchase Header", OnCancelPurchaseApprovalRequestTxt, 0, false);
    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnSendDocForApproval', '', false, false)]
    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            //BidRegister
            DATABASE::"Bid Opening Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBidRegisterForApprovalCode, Variant);
            //HR Leave Planner Header
            DATABASE::"HR Leave Planner Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRLeavePlannerHeaderForApprovalCode, Variant);

            // //Consolidated Training Needs
            // DATABASE::"Consolidated Training Needs":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendConsolidatedTrainingNeedsForApprovalCode, Variant);

            //PR Transaction Codes
            DATABASE::"PR Transaction Codes":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPRTransactionCodesForApprovalCode, Variant);

            // //Training Extension
            // DATABASE::"Training Extension":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingExtensionForApprovalCode, Variant);

            //Training Requests
            DATABASE::"Training Requests":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingRequestsForApprovalCode, Variant);

            //Training Plan Header
            Database::"Training Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingPlanHeaderForApprovalCode, Variant);
            //Training Needs Header
            DATABASE::"Training Needs Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendTrainingNeedsHeaderForApprovalCode, Variant);

            // //Pavement
            // Database::"Pavement Test Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendPavementForApprovalCode, Variant);

            //Project Job
            Database::"Job":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectJobsForApprovalCode, Variant);

            // //PlanningHeader
            // Database::"Planning Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendPlanningHeaderForApprovalCode, Variant);

            // //Project Closure
            // Database::"Project Closure":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendProjectClosureForApprovalCode, Variant);

            //PCA
            Database::"prBasic pay PCA":
                WorkflowManagement.HandleEvent(RunWorkflowOnSend_PCA_ForApprovalCode, Variant);
            // //Project schedule
            // Database::"Road Work Program":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendScheduleForApprovalCode, Variant);
            //Induction Header
            Database::"Induction Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendInductionHeaderForApprovalCode, Variant);

            //IFRCARD
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIFRForApprovalCode, Variant);
            //Procurement Plan
            Database::"Procurement Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendProcPlanForApprovalCode, Variant);
            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRFQForApprovalCode, Variant);
            //PV
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPVForApprovalCode, Variant);
            //"IFS Tender Committee"
            Database::"IFS Tender Committee":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendIFSTenderForApprovalCode, Variant);
            //"Receipts Header1"
            Database::"Receipts Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendReceiptForApprovalCode, Variant);

            //"Bid Tabulation Header"
            Database::"Bid Tabulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendOpinionForApprovalCode, Variant);

            // //Item Creation Requests
            // Database::"Item Creation Requests":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendITMForApprovalCode, Variant);

            //"Airtime Allocation Header"
            Database::"Airtime Allocation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAirtimeForApprovalCode, Variant);

            //"ResourceBookingHeader"
            Database::"Resource Booking Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendResourceBookingHeaderForApprovalCode, Variant);
            //"SuccessionPlanHeader"
            Database::"Succession Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSuccessionPlanHeaderForApprovalCode, Variant);
            //"SuccessionLogHeader"
            Database::"Succession Log Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendSuccessionLogHeaderForApprovalCode, Variant);
            //Positions
            Database::"Company Positions":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPositionsForApprovalCode, Variant);

            //"Vacancy Announcement"
            Database::"Vacancy Announcement":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAnnouncementForApprovalCode, Variant);

            //HRComm
            Database::"Commitee Appointment Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRCommForApprovalCode, Variant);
            //"Employee Transfers"
            Database::"Employee Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmpTransForApprovalCode, Variant);

            //"Employee Acting Position"
            Database::"Employee Acting Position":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmpActForApprovalCode, Variant);

            // //"Employee Onboarding"
            // Database::"HR Employee Onboarding":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendEmpOnboardForApprovalCode, Variant);

            // //Imprest Memo
            // Database::"Imprest Memo":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendIMForApprovalCode, Variant);

            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRecruitReqForApprovalCode, Variant);

            //"Recruitment Plan"
            Database::"Recruitment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendRecruiplanForApprovalCode, Variant);
            // //"Maintenance Header"
            // Database::"Maintenance Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendMaintenanceReqForApprovalCode, Variant);
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFuelReqForApprovalCode, Variant);

            //"Transport Requisition"
            Database::"Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFleetReqForApprovalCode, Variant);

            // //Interbank Transfer
            // Database::"Inter Bank Transfer":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendITForApprovalCode, Variant);
            //Asset Transfer
            DATABASE::"HR Asset Transfer Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAssetTransferForApprovalCode, Variant);
            //Leave
            DATABASE::"HR Leave Allocation Request":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHRLeaveAllocationRequestForApprovalCode, Variant);
            //Leave Application Recall
            DATABASE::"Leave Application Recall":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveApplicationRecallForApprovalCode, Variant);
            //Loan
            DATABASE::"Loan Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLoanApplicationForApprovalCode, Variant);

            //Vehicle Request
            DATABASE::"Vehicle Request":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendVehicleRequestForApprovalCode, Variant);

            //Vehicle Incident
            DATABASE::"Vehicle Incident":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendVehicleIncidentForApprovalCode, Variant);

            //Discipline Details
            DATABASE::"Discipline Details":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendDisciplineDetailsForApprovalCode, Variant);

            //Fuel Card
            DATABASE::"Fuel Card":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendFuelCardForApprovalCode, Variant);

            //Monthly Work Ticket Header
            DATABASE::"Monthly Work Ticket Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendWorkTicketForApprovalCode, Variant);

            //Corporate Strategic Plans
            DATABASE::"Corporate Strategic Plans":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendCorporateStrategicPlanForApprovalCode, Variant);
            //Organization Structure
            DATABASE::"Organization Hierarchy Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendOrganizationStructureForApprovalCode, Variant);
            //Staff Establishment
            DATABASE::"Staff Establishment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendStaffEstablishmentForApprovalCode, Variant);
            //Payroll Header
            DATABASE::"Payroll Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPayrollHeaderForApprovalCode, Variant);
            //Leave
            DATABASE::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendHrLeaveForApprovalCode, Variant);

            // //Contractor Request
            // DATABASE::"Contractor Request Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendContractorRequestForApprovalCode, Variant);

            //leave adjustment
            DATABASE::"Leave Journal Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveJournalVoucherForApprovalCode, Variant);

            //Employee Exit
            DATABASE::"Employee Exit Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEmployeeExitHeaderForApprovalCode, Variant);

            DATABASE::"PR Payroll Buffer":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPrPayrollBufferForApprovalCode, Variant);

            //Perfomance Contract Header
            DATABASE::"Perfomance Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPerformanceContractHeaderForApprovalCode, Variant);

            //Annual Strategy Workplan
            Database::"Annual Strategy Workplan":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAnnualStrategyWorkplanForApprovalCode, Variant);
            //Budget Consolidation
            Database::"Budget Consolidation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendBudgetConsolidationForApprovalCode, Variant);
            // //Budget ReAllocation
            // Database::"Budget Reallocation Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendBudgetReAllocationForApprovalCode, Variant);
            // //Batch Auth to Incur Expense
            // Database::"Batch. Auth to Incur Expend":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendBatchAuthIncExpForApprovalCode, Variant);
            // //Auth Incur Expense
            // Database::"Auth. Inc. Expend. Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnSendAuthIncExpForApprovalCode, Variant);
            //Expense Requsition
            Database::"Expense Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendExpenseRequisitionForApprovalCode, Variant);
            //EFT Header
            Database::"EFT Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendEFTHeaderForApprovalCode, Variant);
            //Annual Disposal Plan
            Database::"Annual Disposal Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendAnnualDisposalPlanForApprovalCode, Variant);
            //Imprest Header Finance
            Database::"Request Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendImprestForApprovalCode, Variant);
            //Licence Registration Form
            Database::"Licence Registration Form":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendLicenceRegistrationFormForApprovalCode, Variant);
            //Purchase
            Database::"Purchase Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnSendPurchaseForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit", 'OnCancelDocApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            //Bid Register
            Database::"Bid Opening Register":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBidRegisterForApprovalCode, Variant);
            //HR Leave Planner Header
            Database::"HR Leave Planner Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRLeavePlannerHeaderForApprovalCode, Variant);

            // //Consolidated Training Needs
            // Database::"Consolidated Training Needs":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelConsolidatedTrainingNeedsForApprovalCode, Variant);

            //PR Transaction Codes
            Database::"PR Transaction Codes":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPRTransactionCodesForApprovalCode, Variant);

            //Training Extension
            // Database::"Training Extension":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelTrainingExtensionForApprovalCode, Variant);

            //Training Requests
            Database::"Training Requests":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTrainingRequestsForApprovalCode, Variant);

            //Training Plan Header
            Database::"Training Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTrainingPlanHeaderForApprovalCode, Variant);
            //Training Needs Header
            Database::"Training Needs Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelTrainingNeedsHeaderForApprovalCode, Variant);

            //pavement
            // Database::"Pavement Test Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelPavementForApprovalCode, Variant);

            // //Plaining
            // Database::"Planning Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelPlanningHeaderForApprovalCode, Variant);

            // //Contractor Request
            // Database::"Contractor Request Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelContractorRequestForApprovalCode, Variant);


            //Plaining
            Database::"Job":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProjectJobsForApprovalCode, Variant);

            // //Plaining
            // Database::"Project Closure":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelprojectClosureForApprovalCode, Variant);

            //PCA
            Database::"prBasic pay PCA":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancel_PCA_ForApprovalCode, Variant);
            //project Schedule
            // Database::"Road Work Program":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelScheduleForApprovalCode, Variant);
            //Induction Header
            Database::"Induction Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelInductionHeaderForApprovalCode, Variant);

            //IFRCARD
            Database::"Request For Information":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFRForApprovalCode, Variant);
            //procurement plan
            Database::"procurement plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelProcPlanForApprovalCode, Variant);

            //RFQ
            Database::"Standard Purchase Code":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRFQForApprovalCode, Variant);
            //pv
            Database::"Payments":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPVForApprovalCode, Variant);
            //"IFS Tender Committee"
            Database::"IFS Tender Committee":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelIFSTenderForApprovalCode, Variant);
            //"Receipts Header1"
            Database::"Receipts Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelReceiptForApprovalCode, Variant);

            //"Bid Tabulation Header"
            Database::"Bid Tabulation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelOpinionForApprovalCode, Variant);

            // //Item Creation Requests
            // Database::"Item Creation Requests":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelITMForApprovalCode, Variant);

            //"Airtime Allocation Header"
            Database::"Airtime Allocation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAirtimeForApprovalCode, Variant);

            // //ResourceBookingHeader
            // Database::"Resource Booking Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelResourceBookingHeaderForApprovalCode, Variant);
            //SuccessionPlanHeader
            Database::"Succession Plan Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSuccessionPlanHeaderForApprovalCode, Variant);
            //SuccessionLogHeader
            Database::"Succession Log Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelSuccessionLogHeaderForApprovalCode, Variant);
            //Positions
            Database::"Company Positions":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPositionsForApprovalCode, Variant);
            //Positions
            Database::"Vacancy Announcement":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAnnouncementForApprovalCode, Variant);
            //"Commitee Appointment Voucher"
            Database::"Commitee Appointment Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRCommForApprovalCode, Variant);
            //"Employee Transfers"
            Database::"Employee Transfers":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmpTransForApprovalCode, Variant);
            //"Employee Acting Position"
            Database::"Employee Acting Position":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmpActForApprovalCode, Variant);

            // //"Employee Onboarding"
            // Database::"HR Employee Onboarding":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmpOnboardForApprovalCode, Variant);
            // //Imprest Memo
            // Database::"Imprest Memo":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelIMForApprovalCode, Variant);
            //"Recruitment Requisition Header"
            Database::"Recruitment Requisition Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecruitReqForApprovalCode, Variant);

            //"Recruitment Plan"
            Database::"Recruitment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelRecruiplanForApprovalCode, Variant);
            //"Maintenance Header"
            // Database::"Maintenance Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelMaintenanceReqForApprovalCode, Variant);
            //"Fuel & Maintenance Requisition"
            Database::"Fuel & Maintenance Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFuelReqForApprovalCode, Variant);

            //"Transport Requisition"
            Database::"Transport Requisition":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFleetReqForApprovalCode, Variant);
            //Interbank Transfer
            // Database::"Inter Bank Transfer":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelITForApprovalCode, Variant);
            // //Asset Transfer
            // Database::"HR Asset Transfer Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelAssetTransferForApprovalCode, Variant);
            //Leave
            Database::"HR Leave Allocation Request":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHRLeaveAllocationRequestForApprovalCode, Variant);
            //Leave Application Recall
            Database::"Leave Application Recall":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLeaveApplicationRecallForApprovalCode, Variant);
            //Leave
            Database::"Loan Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLoanApplicationForApprovalCode, Variant);

            //Vehicle Request
            Database::"Vehicle Request":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelVehicleRequestForApprovalCode, Variant);
            //Vehicle Incident
            Database::"Vehicle Incident":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelVehicleIncidentForApprovalCode, Variant);
            //Discipline Details
            Database::"Discipline Details":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelDisciplineDetailsForApprovalCode, Variant);

            //Fuel Card
            Database::"Fuel Card":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelFuelCardForApprovalCode, Variant);

            // Monthly work ticket header
            Database::"Monthly Work Ticket Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelWorkTicketForApprovalCode, Variant);

            //Corporate Strategic Plans
            Database::"Corporate Strategic Plans":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelCorporateStrategicPlanForApprovalCode, Variant);
            //Organization Structure
            Database::"Organization Hierarchy Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelOrganizationStructureForApprovalCode, Variant);
            //Staff Establishment
            Database::"Staff Establishment Plan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelStaffEstablishmentForApprovalCode, Variant);
            //Payroll Header
            Database::"Payroll Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPayrollHeaderForApprovalCode, Variant);
            //Leave
            Database::"HR Leave Application":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelHrLeaveForApprovalCode, Variant);
            //leave adjustment
            Database::"Leave Journal Voucher":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLeaveJournalVoucherForApprovalCode, Variant);
            //Employee Exit Header
            Database::"Employee Exit Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEmployeeExitHeaderForApprovalCode, Variant);

            //payroll buffer
            Database::"PR Payroll Buffer":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPrPayrollBufferForApprovalCode, Variant);

            //"Perfomance Contract Header"
            Database::"Perfomance Contract Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPerformanceContractHeaderForApprovalCode, Variant);
            //Annual Strategy Workplan
            Database::"Annual Strategy Workplan":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelAnnualStrategyWorkplanForApprovalCode, Variant);
            //Budget Consolidation Header
            Database::"Budget Consolidation Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelBudgetConsolidationForApprovalCode, Variant);
            // //Budget ReAllocation Header
            // Database::"Budget Reallocation Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelBudgetReAllocationForApprovalCode, Variant);
            // //Batch Auth Incur Header
            // Database::"Batch. Auth to Incur Expend":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelBatchAuthExpForApprovalCode, Variant);
            // //Auth Inc Header
            // Database::"Auth. Inc. Expend. Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelAuthExpForApprovalCode, Variant);
            // //Expense Requsition
            // Database::"Expense Requisition":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelExpenseRequisitionForApprovalCode, Variant);
            //EFT Header
            Database::"EFT Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelEFTHeaderForApprovalCode, Variant);
            //Annual DISPOSAL plan
            // Database::"Annual Disposal Plan Header":
            //     WorkflowManagement.HandleEvent(RunWorkflowOnCancelAnnualDisposalPlanForApprovalCode, Variant);
            //Imprest Header Finance
            Database::"Request Header1":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelImprestForApprovalCode, Variant);
            //Licence Registration Form
            Database::"Licence Registration Form":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelLicenceRegistrationFormForApprovalCode, Variant);
            //purchase
            Database::"Purchase Header":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelPurchaseForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;


    procedure GetDocApprovers(RecID: RecordID; var PreparedBy: Record "User SetUp"; var ApprovedBy: Record "User Setup"; var Dates: array[2] of DateTime)
    var
        ApprovalEntry: Record "Approval Entry";


    begin
        clear(PreparedBy);
        clear(ApprovedBy);
        clear(Dates);


        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Record ID to Approve", RecID);
        if ApprovalEntry.FindSet() then begin
            if PreparedBy.Get(ApprovalEntry."Sender ID") then;
            Dates[1] := ApprovalEntry."Date-Time Sent for Approval";
        end;
        //Approver
        ApprovalEntry.Reset();
        ApprovalEntry.SetCurrentKey("Sequence No.");
        ApprovalEntry.SetRange("Record ID to Approve", RecID);
        if ApprovalEntry.FindLast() then begin
            if ApprovalEntry.Status = ApprovalEntry.Status::Approved then begin
                if ApprovedBy.Get(ApprovalEntry."Last Modified By User ID") then;
                Dates[2] := ApprovalEntry."Last Date-Time Modified";
            end;
        end;
        PreparedBy.Validate("Employee No.");
        ApprovedBy.Validate("Employee No.");
        // PreparedBy.CalcFields("User Signature");
        // ApprovedBy.CalcFields("User Signature");
    end;

    procedure GetDocApprovers(RecID: RecordID; var PreparedBy: Record "User SetUp"; var CheckedBy: Record "User Setup"; var ApprovedBy: Record "User Setup"; var Dates: array[3] of DateTime)
    var
        ApprovalEntry: Record "Approval Entry";
        LastSequenceId: Integer;
    begin
        clear(PreparedBy);
        clear(ApprovedBy);
        clear(Dates);

        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Record ID to Approve", RecID);
        if ApprovalEntry.FindSet() then begin
            if PreparedBy.Get(ApprovalEntry."Sender ID") then;
            Dates[1] := ApprovalEntry."Date-Time Sent for Approval";
        end;

        //Approver
        ApprovalEntry.Reset();
        ApprovalEntry.SetCurrentKey("Sequence No.");
        ApprovalEntry.SetRange("Record ID to Approve", RecID);
        if ApprovalEntry.FindLast() then begin
            LastSequenceID := ApprovalEntry."Sequence No.";

            if ApprovalEntry.Status = ApprovalEntry.Status::Approved then begin
                if ApprovedBy.Get(ApprovalEntry."Approver ID") then;
                Dates[3] := ApprovalEntry."Last Date-Time Modified";
            end;
        end;
        //Checked By
        ApprovalEntry.Reset();
        ApprovalEntry.SetRange("Record ID to Approve", RecID);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);
        ApprovalEntry.SetFilter("Sequence No.", '<>%1', LastSequenceId);
        if ApprovalEntry.FindLast() then begin
            if CheckedBy.Get(ApprovalEntry."Approver ID") then;
            Dates[2] := ApprovalEntry."Last Date-Time Modified";
        end else begin
            //Sender equals to checker if first approval
            ApprovalEntry.Reset();
            ApprovalEntry.SetRange("Record ID to Approve", RecID);
            ApprovalEntry.SetFilter("Sequence No.", '<>%1', LastSequenceId);
            if ApprovalEntry.IsEmpty() then begin
                if CheckedBy.Get(PreparedBy."User ID") then;
                Dates[2] := Dates[1];
            end;
        end;
        //Approver
        PreparedBy.Validate("Employee No.");
        ApprovedBy.Validate("Employee No.");
        CheckedBy.Validate("Employee No.");
        // PreparedBy.CalcFields("User Signature");
        // ApprovedBy.CalcFields("User Signature");
        // CheckedBy.CalcFields("User Signature");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Enum Assignment Management", 'OnGetPurchApprovalDocumentType', '', true, true)]

    local procedure OnGetPurchApprovalDocumentType(PurchDocumentType: Enum "Purchase Document Type"; var ApprovalDocumentType: Enum "Approval Document Type"; var IsHandled: Boolean)
    begin
        case PurchDocumentType of
            PurchDocumentType::"Store Requisition":
                IsHandled := true;
            PurchDocumentType::"Purchase Requisition":
                IsHandled := true;
        end;
    end;


    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    local procedure Table39_No_OnBeforeValidateQuantityBase2(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Store Requisition" then begin
                IsHandled := true;
            end;

        end;
    end;

    [EventSubscriber(ObjectType::table, 39, 'OnBeforeValidateQuantityBase', '', false, false)]
    local procedure Table39_No_OnBeforeValidateQuantityBase21(CallingFieldNo: Integer; var IsHandled: Boolean; var PurchaseLine: Record "Purchase Line"; xPurchaseLine: Record "Purchase Line")
    begin

        with PurchaseLine do begin
            if "Document Type" = "Document Type"::"Purchase Requisition" then begin
                IsHandled := true;
            end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
    local procedure "Release Purchase Document_OnBeforeReleasePurchaseDoc"(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean; var SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean)
    begin
        PurchaseHeader.Validate(Status, PurchaseHeader.Status::Released);
        //PurchaseHeader.CreateBidRegister();
        PurchaseHeader.modify();
        IsHandled := true;
    end;

    var
    // HRLeaveApplication: Record "HR Leave Application";

    [IntegrationEvent(false, false)]
    procedure OnSendDocForApproval(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry");
    var
        ApprEntry: Record "Approval Entry";
    begin
        ApprEntry.Reset;
        ApprEntry.SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
        // ApprEntry.SetRange("Sequence No.", ApprovalEntry."Sequence No.");
        ApprEntry.SetFilter("Entry No.", '<>%1', ApprovalEntry."Entry No.");
        ApprEntry.SetFilter(Status, '<>%1', ApprovalEntry.Status::Approved);
        if ApprEntry.FindSet() then
            repeat
                ApprEntry.Validate(Status, ApprEntry.Status::Rejected);
                ApprEntry.Modify(true);
            until ApprEntry.Next() = 0;

    end;
}




