#pragma warning disable AL0198

codeunit 50015 "EssQueries"
{
    trigger OnRun()


    begin


    end;

    var
        //  tbl_HrPortalUsers: Record HRPortalUsers;
        tbl_employee: Record Employee;
        tbl_IctHelpDesk: Record "ICT Helpdesk";
        tbl_performanceManagementPlan: Record "Performance Management Plan";
        tbl_annualStrategyWorkPlan: Record "Annual Strategy Workplan";
        tbl_strategyWorkPlanLines: Record "Strategy Workplan Lines";
        // tbl_imprestMemo: Record "Imprest Memo";
        tbl_PCObjective: Record "PC Objective";
        tbl_secondaryPCObjective: Record "Secondary PC Objective";
        tbl_PCJobDescription: Record "PC Job Description";
        tbl_hrLeaveApplications: Record "HR Leave Application";
        tbl_performanceDiaryLog: Record "Performance Diary Log";
        tbl_plogLines: Record "Plog Lines";
        tbl_payments: Record payments;
        tbl_performanceContractHeader: Record "Perfomance Contract Header";
        tbl_fuelAndMaintainanceRequisition: Record "Fuel & Maintenance Requisition";
        tbl_portalApprovalEntry: Record "PortalApproval Entry";
        tbl_corporateStrategicPlans: Record "Corporate Strategic Plans";
        tbl_strategyCoreValue: Record "Strategy Core Value";
        tbl_strategicTheme: Record "Strategic Theme";
        tbl_strategicObjective: Record "Strategic Objective";
        tbl_strategy: Record Strategy;
        tbl_strategicInitiative: Record "Strategic Initiative";
        tbl_cspPlannedYears: Record "CSP Planned Years";
        tbl_employeeRequisition: Record "Employee Requisitions";
        tbl_performanceEvalutionDetails: Record "Perfomance Evaluation";
        tbl_purchaseLine: Record "Purchase Line";
        tbl_pvLines: Record "PV Lines";
        tbl_subPCObjective: Record "Sub PC Objective";
        tbl_transportRequisition: Record "Transport Requisition";
        tbl_vehicleDriverAllocation: Record "Vehicle Driver Allocation";
        tbl_approvalCommentLine: Record "Approval Comment Line";
        tbl_approvalEntry: Record "Approval Entry";
        tbl_objectiveEvaluationResult: Record "Objective Evaluation Result";
        tbl_proficiencyEvaluationResult: Record "Proficiency Evaluation Result";
        tbl_evaluationTrainingNeeds: Record "Evaluation Training needs";
        tbl_subPlogLines: Record "Sub Plog Lines";
        tbl_purchaseHeader: Record "Purchase Header";
        // tbl_evaluationPip: Record "Evaluation PIP";
        tbl_imprestLines: Record "Imprest Lines";
        tbl_performancePlanTask: Record "Performance Plan Task";
        tbl_brSurveySection: Record "BR Survey Section";
        tbl_brResponseQuestion: Record "BR Response Question";
        tbl_brResponse: Record "Business Research Response";
        tbl_brResponseSection: Record "BR Response Section";
        tbl_travelStaffRequisition: Record "Travel Requisition Staff";
        tbl_travelNonStaffRequisition: Record "Travel Requisition Non Staff";
        tbl_hrJobApplications: Record "HR Job Applications";
        tbl_ictIssueCategory: Record "ICT Helpdesk Category";
        tbl_resource: Record Resource;
        tbl_payslip: Record "Payroll PeriodX";
        tbl_leaveTypes: Record "HR Leave Types";
        tbl_job: Record Job;
        tbl_responsibilityCenter: Record "Responsibility Center";
        tbl_fleetVehicles: Record "Fleet Vehicles.";
        tbl_serviceItems: Record "Service Items";
        tbl_jobtask: Record "Job Task";
        // tbl_fundcode: Record "Fund Code";
        tbl_workTypes: Record "Work Type";
        tbl_receiptsTypes: Record "Receipts and Payment Types1";
        tbl_procurementSetup: Record "Procurement Setup";
        tbl_procurementPlan: Record "Procurement Plan";
        tbl_unitOfMeasure: Record "Unit of Measure";
        tbl_procurementPlanEntry: Record "Procurement Plan Entry";
        tbl_trainingVendor: Record Vendor;
        tbl_items: Record Item;
        // tbl_projectMembers: Record "Project Members";
        // tbl_casualMembers: Record Casuals;
        // tbl_otherCosts: Record "Other Costs";
        tbl_userSetup: Record "User Setup";
        tbl_dimensionsValue: Record "Dimension Value";
        hrLeaveLedgerEntry: Record "HR Leave Ledger Entries";
        tbl_receiptsHeader: Record "Receipts Header1";
        tbl_itemLedgerEntry: Record "Item Ledger Entry";
        tbl_procurementPlanLines: Record "Procurement Plan Lines";


    procedure fnGetEmployeeDetail(empNumber: Code[30]) data: Text
    begin
        tbl_employee.Reset();
        tbl_employee.SetRange("No.", empNumber);
        if tbl_employee.FindSet(true) then begin
            data := data + tbl_employee."E-Mail" + '*' + tbl_employee."Phone No." + '*' + Format(tbl_employee."Leave Outstanding Bal") + '*' + tbl_employee."ID Number" + '*' + Format(tbl_employee."Study Leave Acc") + '*' + Format(tbl_employee."Sick Leave Acc.") + '*' + Format(tbl_employee."Paternity Leave Acc.") + '*' + Format(tbl_employee."Maternity Leave Acc.") + '*' + Format(tbl_employee."Compassionate Leave Acc.") + '*' + Format(tbl_employee."Annual Leave Account") + '*' + Format(tbl_employee."Allocated Leave Days") + '*' + Format(tbl_employee."Reimbursed Leave Days") + '*' + Format(tbl_employee."Total (Leave Days)") + '*' + Format(tbl_employee."Department Code") + '*' + Format(tbl_employee.Division) + ':';
        end;
        exit(data);
    end;

    procedure fnGetUserDetails(username: Text) data: Text
    var
        loginId: Text;
    begin
        loginId := username;
        tbl_userSetup.Reset();
        tbl_userSetup.SetRange("User ID", loginId);
        if tbl_userSetup.findset(true) then begin
            data += 'success*' + tbl_userSetup."Employee No.";
        end else begin
            data += 'danger*Sorry, we could not proceed. Request the system administrator to set you up in the user setup...';

        end;
        exit(data);
    end;

    procedure loginUser(empNumber: Code[30]) data: Text
    begin
        tbl_employee.reset();

        tbl_employee.SetRange("No.", empNumber);
        if tbl_employee.FindSet(true) then begin
            data := 'success* ' + tbl_employee.FullName + '*' + tbl_employee."Global Dimension 1 Code" + '*' + tbl_employee."ID Number" + '*' + tbl_employee."Directorate Code" + '*' + tbl_employee."Department Code" + '*' + Format(tbl_employee."ICT Help Desk Admin") + '*' + Format(tbl_employee.Gender1) + '*' + tbl_employee."No." + '*' + tbl_employee."Global Dimension 2 Code";
        end;
        exit(data);
    end;

    procedure fnGetMyHeldeskRequests(empNumber: Code[20]) data: Text
    begin
        tbl_IctHelpDesk.Reset();
        tbl_IctHelpDesk.SetRange("Employee No", empNumber);
        if tbl_IctHelpDesk.FindSet(true) then begin
            repeat
                data := data + tbl_IctHelpDesk."Job No." + '*' + tbl_IctHelpDesk."Employee No" + '*' + tbl_IctHelpDesk."Description of the issue" + '*' + Format(tbl_IctHelpDesk."Request Date") + '*' + Format(tbl_IctHelpDesk."Request Time") + '*' + tbl_IctHelpDesk."Escalated To" + '*' + Format(tbl_IctHelpDesk.Status) + '*' + tbl_IctHelpDesk."Assigned To" + '*' + tbl_IctHelpDesk."Action Taken" + '*' + tbl_IctHelpDesk."ICT Issue Category" + '::::';
            until tbl_IctHelpDesk.NEXT = 0;
        end;
        exit(data);

    end;

    procedure fnGetPerformanceManagementPlan() data: Text
    begin
        tbl_performanceManagementPlan.Reset();
        tbl_performanceManagementPlan.SetRange("Evaluation Type", tbl_performanceManagementPlan."Evaluation Type"::"Standard Appraisal/Supervisor Score Only");
        if tbl_performanceManagementPlan.FindSet(true) then begin
            repeat
                data := data + tbl_performanceManagementPlan."Executive Summary" + '*' + Format(tbl_performanceManagementPlan."Start Date") + '*' + Format(tbl_performanceManagementPlan."End Date") + '*' + Format(tbl_performanceManagementPlan."Evaluation Type") + '*' + tbl_performanceManagementPlan.Description + '*' + tbl_performanceManagementPlan.No + '::::';

            until tbl_performanceManagementPlan.Next = 0;
        end;

        exit(data);
    end;

    procedure fnGetAnnualStrategyWorkplan() data: Text
    begin
        tbl_annualStrategyWorkPlan.Reset();
        tbl_annualStrategyWorkPlan.SetRange(tbl_annualStrategyWorkPlan."Current AWP", true);
        tbl_annualStrategyWorkPlan.SetRange(tbl_annualStrategyWorkPlan."Approval Status", tbl_annualStrategyWorkPlan."Approval Status"::Released);
        if tbl_annualStrategyWorkPlan.FindSet(true) then begin
            repeat
                data := data + tbl_annualStrategyWorkPlan.Description + '*' + tbl_annualStrategyWorkPlan.No + '*' + tbl_annualStrategyWorkPlan."Year Reporting Code" + '*' + format(tbl_annualStrategyWorkPlan."Start Date") + '*' + Format(tbl_annualStrategyWorkPlan."End Date") + '*' + Format(tbl_annualStrategyWorkPlan."Current AWP") + '*' + Format(tbl_annualStrategyWorkPlan."Approval Status") + '::::';
            until tbl_annualStrategyWorkPlan.Next = 0;
        end;
        exit(data);
    end;


    procedure fnGetStrategyWorkPlanLines(planNumber: Code[50]; crossCuttingStatus: Boolean) data: Text
    begin
        tbl_strategyWorkPlanLines.Reset();
        tbl_strategyWorkPlanLines.SetRange(No, planNumber);
        // tbl_strategyWorkPlanLines.SetRange(); --> Filter by Cross Cutting
        if tbl_strategyWorkPlanLines.FindSet(true) then begin
            repeat
                data := data + tbl_strategyWorkPlanLines."Activity ID" + '*' + tbl_strategyWorkPlanLines.Description + '*' + tbl_strategyWorkPlanLines."Key Performance Indicator" + '*' + tbl_strategyWorkPlanLines."Unit of Measure" + '*';//+ tbl_strategyWorkPlanLines."Primary Directorate Name" + '*' + tbl_strategyWorkPlanLines."Primary Department Name" + '::::';
            until tbl_strategyWorkPlanLines.Next = 0;
        end;
        exit(data);
    end;

    // procedure fnGetImprestMemo(employeeNumber: Code[50]; status: Boolean) data: Text
    // begin
    //     tbl_imprestMemo.Reset();
    //     tbl_imprestMemo.SetRange(Requestor, employeeNumber);
    //     // tbl_imprestMemo.SetRange(Status, tbl_imprestMemo.Status::Released);
    //     // tbl_imprestMemo.SetRange(Posted, true);
    //     if tbl_imprestMemo.FindSet(true) then begin
    //         repeat
    //             data += tbl_imprestMemo."No." + '*' + format(tbl_imprestMemo.Date) + '*' + tbl_imprestMemo.Subject + '*' + format(tbl_imprestMemo."Total Subsistence Allowance") + '*' + Format(tbl_imprestMemo.Status) + '*' + Format(tbl_imprestMemo."Total Subsistence Allowance") + '*' + Format(tbl_imprestMemo."Imprest Naration") + '*' + Format(tbl_imprestMemo."Start Date") + '*' + Format(tbl_imprestMemo."No. of days") + '*' + Format(tbl_imprestMemo.Job) + '*' + Format(tbl_imprestMemo."Job  Task") + '*' + Format(tbl_imprestMemo."Global Dimension 2 Code") + '::::';
    //         until tbl_imprestMemo.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetPCObjective(PCNumber: Code[30]) data: Text
    begin
        tbl_PCObjective.Reset();
        tbl_PCObjective.SetRange("Workplan No.", PCNumber);
        if tbl_PCObjective.Findset(true) then begin
            repeat
                data := data + tbl_PCObjective."Objective/Initiative" + '*' + format(tbl_PCObjective."Start Date") + '*' + format(tbl_PCObjective."Due Date") + '*' + format(tbl_PCObjective."Imported Annual Target Qty") + '*' + format(tbl_PCObjective."Assigned Weight (%)") + '*' + tbl_PCObjective."Additional Comments" + '*' + Format(tbl_PCObjective."Initiative Type") + '*' + Format(tbl_PCObjective."Unit of Measure") + '*' + Format(tbl_PCObjective."Strategy Plan ID") + '*' + Format(tbl_PCObjective."Year Reporting Code") + '*' + Format(tbl_PCObjective.EntryNo) + '*' + tbl_PCObjective."Outcome Perfomance Indicator" + '*' + Format(tbl_PCObjective."Desired Perfomance Direction") + '*' + Format(tbl_PCObjective."Previous Annual Target Qty") + '::::';
            until tbl_PCObjective.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetSecondaryPCObjective(PCNumber: Code[30]) data: Text
    begin
        tbl_secondaryPCObjective.Reset();
        tbl_secondaryPCObjective.SetRange("Workplan No.", PCNumber);
        if tbl_secondaryPCObjective.FindSet(true) then begin
            repeat
                data := data + tbl_secondaryPCObjective."Objective/Initiative" + '*' + format(tbl_secondaryPCObjective."Start Date") + '*' + format(tbl_secondaryPCObjective."Due Date") + '*' + format(tbl_secondaryPCObjective."Imported Annual Target Qty") + '*' + format(tbl_secondaryPCObjective."Assigned Weight (%)");//+ '*' + tbl_secondaryPCObjective.Comments + ':';
            until tbl_secondaryPCObjective.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPCJobDescription(PCNumber: Code[30]) data: Text
    begin
        tbl_PCJobDescription.Reset();
        tbl_PCJobDescription.SetRange("Workplan No.", PCNumber);
        if tbl_PCJobDescription.FindSet(true) then begin
            repeat
                data := data + tbl_PCJobDescription.Description + '*' + Format(tbl_PCJobDescription."Imported Annual Target Qty") + '*' + format(tbl_PCJobDescription."Assigned Weight (%)") + ':';
            until tbl_PCJobDescription.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetHrLeaveApplications(employeeNumber: Code[30]) data: Text
    begin
        tbl_hrLeaveApplications.Reset();
        tbl_hrLeaveApplications.SetRange("Employee No", employeeNumber);
        //tbl_hrLeaveApplications.SetRange(Status, tbl_hrLeaveApplications.Status::Released);
        if tbl_hrLeaveApplications.FindSet(true) then begin
            repeat
                data += Format(tbl_hrLeaveApplications."Application Code") + '*' + tbl_hrLeaveApplications."Leave Type" + '*' + format(tbl_hrLeaveApplications."Days Applied") + '*' + format(tbl_hrLeaveApplications."Start Date") + '*' + format(tbl_hrLeaveApplications."Return Date") + '*' + Format(tbl_hrLeaveApplications.Status) + '*' + Format(tbl_hrLeaveApplications.Posted) + '*' + Format(tbl_hrLeaveApplications."Date of Exam") + '*' + Format(tbl_hrLeaveApplications."Details of Examination") + '*' + Format(tbl_hrLeaveApplications."E-mail Address") + '*' + Format(tbl_hrLeaveApplications."Cell Phone Number") + '*' + Format(tbl_hrLeaveApplications."Annual Leave Type") + '*' + Format(tbl_hrLeaveApplications.Reliever) + '::::';
            until tbl_hrLeaveApplications.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetLeaveApplicationsDetails(employeeNumber: Code[30]; leaveNo: Code[20]) data: Text
    begin
        tbl_hrLeaveApplications.Reset();
        tbl_hrLeaveApplications.SetRange("Employee No", employeeNumber);
        tbl_hrLeaveApplications.SetRange("Application Code", leaveNo);
        if tbl_hrLeaveApplications.FindSet(true) then begin

            data := Format(tbl_hrLeaveApplications."Application Code") + '*' + tbl_hrLeaveApplications."Leave Type" + '*' + format(tbl_hrLeaveApplications."Days Applied") + '*' + format(tbl_hrLeaveApplications."Start Date") + '*' + format(tbl_hrLeaveApplications."Return Date") + '*' + Format(tbl_hrLeaveApplications.Status) + '*' + Format(tbl_hrLeaveApplications.Posted) + '*' + Format(tbl_hrLeaveApplications."Date of Exam") + '*' + Format(tbl_hrLeaveApplications."Details of Examination") + '*' + Format(tbl_hrLeaveApplications."E-mail Address") + '*' + Format(tbl_hrLeaveApplications."Cell Phone Number") + '*' + Format(tbl_hrLeaveApplications."Annual Leave Type") + '*' + Format(tbl_hrLeaveApplications.Reliever);
        end;
        exit(data);

    end;

    procedure fnGetOnePerformanceLog(logNumber: Code[20]) data: Text
    begin
        tbl_performanceDiaryLog.Reset();
        tbl_performanceDiaryLog.SetRange(No, logNumber);
        if tbl_performanceDiaryLog.FindSet(true) then begin
            data := Format(tbl_performanceDiaryLog."Activity Start Date") + '*' + Format(tbl_performanceDiaryLog."Activity End Date") + '*' + tbl_performanceDiaryLog."AWP ID" + '*' + tbl_performanceDiaryLog."CSP ID" + '*' + tbl_performanceDiaryLog.Description + '*' + Format(tbl_performanceDiaryLog."Year Reporting Code");
        end;
        exit(data);

    end;

    procedure fnGetPerformanceDiaryLog(employeeNumber: Code[30]; plogType: Text; approvalStatus: Text) data: Text
    begin
        tbl_performanceDiaryLog.Reset();
        tbl_performanceDiaryLog.SetRange("Employee No.", employeeNumber);
        if approvalStatus = 'Released' then begin
            tbl_performanceDiaryLog.SetRange(Posted, true);
            tbl_performanceDiaryLog.SetRange("Approval Status", tbl_performanceDiaryLog."Approval Status"::Released);
            //tbl_performanceDiaryLog.SetRange(); --> plog type
            if tbl_performanceDiaryLog.FindSet(true) then begin
                repeat
                    data += tbl_performanceDiaryLog.No + '*' + tbl_performanceDiaryLog.Description + '*' + tbl_performanceDiaryLog."Personal Scorecard ID" + '*' + format(tbl_performanceDiaryLog."Activity Start Date") + '*' + format(tbl_performanceDiaryLog."Activity End Date") + '*' + Format(tbl_performanceDiaryLog."AWP ID") + '*' + Format(tbl_performanceDiaryLog."CSP ID") + '*' + Format(tbl_performanceDiaryLog."Year Reporting Code") + '::::';
                until tbl_performanceDiaryLog.Next = 0;
            end;
            exit(data);

        end else begin
            tbl_performanceDiaryLog.SetRange(Posted, false);
            //tbl_performanceDiaryLog.SetRange("Approval Status", tbl_performanceDiaryLog."Approval Status"::Open);
            if tbl_performanceDiaryLog.FindSet(true) then begin
                repeat
                    data += tbl_performanceDiaryLog.No + '*' + tbl_performanceDiaryLog.Description + '*' + tbl_performanceDiaryLog."Personal Scorecard ID" + '*' + format(tbl_performanceDiaryLog."Activity Start Date") + '*' + format(tbl_performanceDiaryLog."Activity End Date") + '*' + Format(tbl_performanceDiaryLog."Approval Status") + '*' + tbl_performanceDiaryLog."CSP ID" + '::::';
                until tbl_performanceDiaryLog.Next = 0;
            end;
            exit(data);
        end;

    end;

    procedure fnGetPlogLines(employeeNumber: Code[30]; plogNumber: Code[30]) data: Text
    begin
        tbl_plogLines.Reset();
        tbl_plogLines.SetRange("Employee No.", employeeNumber);
        tbl_plogLines.SetRange("PLog No.", plogNumber);
        if tbl_plogLines.FindSet(true) then begin
            repeat
                data := data + tbl_plogLines."Initiative No." + '*' + format(tbl_plogLines."Achieved Date") + '*' + format(tbl_plogLines."Due Date") + '*' + format(tbl_plogLines."Target Qty") + '*' + Format(tbl_plogLines."Achieved Target") + '*' + tbl_plogLines.Comments + '*' + tbl_plogLines."PLog No." + '*' + tbl_plogLines."Personal Scorecard ID" + '*' + tbl_plogLines."Sub Intiative No" + '*' + Format(tbl_plogLines.EntryNo) + '*' + Format(tbl_plogLines."Remaining Targets") + '*' + Format(tbl_plogLines."Unit of Measure") + '*' + Format(tbl_plogLines."Activity Type") + '*' + Format(tbl_plogLines."Planned Date") + ':';
            until tbl_plogLines.Next = 0;
        end;
        exit(data);
    end;
    //!! When using this method. Remember to always check the documentType value passed from the portal. The indexes returned might be different!! --> Amos

    // procedure fnGetPayments(salaryNumber: Code[30]; employeeNumber: Code[30]; documentType: Text; status: Text) data: Text
    // begin
    //     if documentType = 'Standing Imprest' then begin
    //         if status = 'Closed' then begin
    //             tbl_payments.Reset();
    //             tbl_payments.SetRange("Account No.", employeeNumber);
    //             tbl_payments.SetRange("No.", salaryNumber);
    //             tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Standing Imprest");
    //             tbl_payments.SetRange(Status, tbl_payments.Status::Closed);
    //             if tbl_payments.FindSet(true) then begin
    //                 repeat
    //                     data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments."Total Amount") + '*' + Format(tbl_payments.Status) + '::::';
    //                 until tbl_payments.Next = 0;
    //             end;
    //             exit(data);
    //         end else begin
    //             tbl_payments.Reset();
    //             tbl_payments.SetRange("Account No.", employeeNumber);
    //             tbl_payments.SetRange("No.", salaryNumber);
    //             tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Standing Imprest");
    //             if tbl_payments.FindSet(true) then begin
    //                 repeat
    //                     data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments."Total Amount") + '*' + Format(tbl_payments.Status) + '::::';
    //                 until tbl_payments.Next = 0;
    //             end;
    //             exit(data);
    //         end;

    //     end;
    //     if documentType = 'Salary Advance' then begin
    //         if status = 'Open' then begin
    //             tbl_payments.Reset();
    //             tbl_payments.SetRange("Account No.", employeeNumber);
    //             tbl_payments.SetRange("No.", salaryNumber);
    //             tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Salary Advance");
    //             tbl_payments.SetRange(Status, tbl_payments.Status::Open);
    //             if tbl_payments.FindSet(true) then begin
    //                 repeat
    //                     data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '::::';
    //                 until tbl_payments.Next = 0;
    //             end;
    //             exit(data);
    //         end;
    //         if status = 'Closed' then begin
    //             tbl_payments.Reset();
    //             tbl_payments.SetRange("Account No.", employeeNumber);
    //             tbl_payments.SetRange("No.", salaryNumber);
    //             tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Salary Advance");
    //             tbl_payments.SetRange(Status, tbl_payments.Status::Closed);
    //             if tbl_payments.FindSet(true) then begin
    //                 repeat
    //                     data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '::::';
    //                 until tbl_payments.Next = 0;
    //             end;
    //             exit(data);
    //         end;


    //     end;

    //     if documentType = 'Petty Cash' then begin
    //         tbl_payments.Reset();
    //         tbl_payments.SetRange("Account No.", employeeNumber);
    //         tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Petty Cash");
    //         tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::"Petty Cash");
    //         if tbl_payments.FindSet(true) then begin
    //             repeat
    //                 data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Payment Narration") + '::::';
    //             until tbl_payments.Next = 0;
    //         end;
    //         exit(data);

    //     end;

    //     if documentType = 'Petty Cash Surrender' then begin
    //         tbl_payments.Reset();
    //         tbl_payments.SetRange("Account No.", employeeNumber);
    //         tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Petty Cash Surrender");
    //         tbl_payments.SetRange(Status, tbl_payments.Status::Released);
    //         if tbl_payments.FindSet(true) then begin
    //             repeat
    //                 data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' + tbl_payments.Job + tbl_payments."Job Task No" + '*' + Format(tbl_payments."Total Amount") + '::::';
    //             until tbl_payments.Next = 0;
    //         end;
    //         exit(data);

    //     end;
    //     if documentType = 'Staff Claim' then begin
    //         tbl_payments.Reset();
    //         tbl_payments.SetRange("Account No.", employeeNumber);
    //         tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Staff Claim");
    //         if tbl_payments.FindSet(true) then begin
    //             repeat
    //                 data += tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + tbl_payments."Payment Narration" + '*' + format(tbl_payments."Funding Source") + '::::';
    //             until tbl_payments.Next = 0;
    //         end;
    //         exit(data);

    //     end;
    //     if documentType = 'Imprest' then begin
    //         tbl_payments.Reset();
    //         tbl_payments.SetRange("Account No.", employeeNumber);
    //         tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::Imprest);
    //         if tbl_payments.FindSet(true) then begin
    //             repeat
    //                 data += tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' + Format(tbl_payments."Imprest Amount") + '*' + tbl_payments.Payee + '*' + Format(tbl_payments.Surrendered) + '*' + Format(tbl_payments."Payment Narration") + '::::';
    //             until tbl_payments.Next = 0;
    //         end;
    //         exit(data);

    //     end;
    //     if documentType = 'Standing Imprest Surrender' then begin
    //         tbl_payments.Reset();
    //         tbl_payments.SetRange("Account No.", employeeNumber);
    //         tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::"Standing Imprest Surrender");
    //         if tbl_payments.FindSet(true) then begin
    //             repeat
    //                 data := data + tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' + tbl_payments.Payee + '::::';
    //             until tbl_payments.Next = 0;
    //         end;
    //         exit(data);

    //     end;

    //     if documentType = 'Surrender' then begin
    //         tbl_payments.Reset();
    //         tbl_payments.SetRange("Account No.", employeeNumber);
    //         tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::Surrender);
    //         if tbl_payments.FindSet(true) then begin
    //             repeat
    //                 data += tbl_payments."No." + '*' + Format(tbl_payments.Date) + '*' + tbl_payments.Purpose + '*' + Format(tbl_payments."Salary Advance") + '*' + Format(tbl_payments."No of months deducted") + '*' + Format(tbl_payments."Monthly Installment") + '*' + Format(tbl_payments.Status) + '*' + Format(tbl_payments."Job Task No") + '*' + tbl_payments.Job + '*' + Format(tbl_payments."Actual Petty Cash Amount Spent") + '*' + Format(tbl_payments.Posted) + '*' + tbl_payments.Payee + '*' + Format(tbl_payments."Imprest Amount") + '*' + Format(tbl_payments."Imprest Issue Doc. No") + '*' + Format(tbl_payments."Payment Narration") + '::::';
    //             until tbl_payments.Next = 0;
    //         end;
    //         exit(data);
    //     end;
    // end;

    // procedure fnGetPayments(employeeNumber: Code[30]) data: Text
    // begin
    //     tbl_payments.Reset();
    //     tbl_payments.SetRange("Account No.", employeeNumber);
    //     tbl_payments.SetRange(Status, tbl_payments.Status::Released);
    //     tbl_payments.Setrange("Payment Type", tbl_payments."Payment Type"::"Standing Imprest");
    //     if tbl_payments.FindSet(true) then begin
    //         repeat
    //             data := data + Format(tbl_payments.Date) + '*' + tbl_payments."Payment Narration" + '*' + Format(tbl_payments."Imprest Amount") + '::::';
    //         until tbl_payments.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetPerfomanceContractHeader(employeeNumber: Code[30]; documentType: Text; status: Text) data: Text
    begin
        if documentType = 'Individual Scorecard' then begin
            if status = 'Released' then begin
                tbl_performanceContractHeader.Reset();
                tbl_performanceContractHeader.SetRange("Responsible Employee No.", employeeNumber);
                // tbl_performanceContractHeader.SetRange("Score Card Type", tbl_performanceContractHeader."Score Card Type"::Staff);
                tbl_performanceContractHeader.SetRange("Approval Status", tbl_performanceContractHeader."Approval Status"::Released);
                tbl_performanceContractHeader.SetRange("Document Type", tbl_performanceContractHeader."Document Type"::"Individual Scorecard");
                if tbl_performanceContractHeader.FindSet(true) then begin
                    repeat
                        data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + format(tbl_performanceContractHeader."Change Status") + '*' + format(tbl_performanceContractHeader.Status) + '*' + Format(tbl_performanceContractHeader."Approval Status") + '*' + tbl_performanceContractHeader."Employee Name" + '*' + Format(tbl_performanceContractHeader."Department/Center PC ID") + '::::';
                    until tbl_performanceContractHeader.Next = 0;
                    exit(data);
                end;
            end
            else begin
                tbl_performanceContractHeader.Reset();
                tbl_performanceContractHeader.SetRange("Responsible Employee No.", employeeNumber);
                tbl_performanceContractHeader.SetRange("Score Card Type", tbl_performanceContractHeader."Score Card Type"::Staff);
                tbl_performanceContractHeader.SetRange("Document Type", tbl_performanceContractHeader."Document Type"::"Individual Scorecard");
                if tbl_performanceContractHeader.FindSet(true) then begin
                    repeat
                        data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + format(tbl_performanceContractHeader."Change Status") + '*' + format(tbl_performanceContractHeader.Status) + '*' + Format(tbl_performanceContractHeader."Approval Status") + '*' + tbl_performanceContractHeader."Strategy Plan ID" + '::::';
                    until tbl_performanceContractHeader.Next = 0;
                    exit(data);
                end;
            end;
        end;

        if documentType = 'Board/Executive PC' then begin
            tbl_performanceContractHeader.Reset();
            //tbl_performanceContractHeader.SetRange("Responsible Employee No.", employeeNumber);
            tbl_performanceContractHeader.SetRange("Approval Status", tbl_performanceContractHeader."Approval Status"::Released);
            tbl_performanceContractHeader.SetRange("Document Type", tbl_performanceContractHeader."Document Type"::"Board/Executive PC");
            if tbl_performanceContractHeader.FindSet(true) then begin
                repeat
                    data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Strategy Plan ID" + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + Format(tbl_performanceContractHeader."Change Status") + '*' + Format(tbl_performanceContractHeader.Status) + '::::';
                until tbl_performanceContractHeader.Next = 0;
                exit(data);
            end;
        end;

        if documentType = 'Standard Appraisal/Supervisor Score Only' then begin
            tbl_performanceContractHeader.Reset();
            tbl_performanceContractHeader.SetRange("Evaluation Type", tbl_performanceContractHeader."Evaluation Type"::"Standard Appraisal/Supervisor Score Only");
            if tbl_performanceContractHeader.FindSet(true) then begin
                repeat
                    data := data + tbl_performanceContractHeader.No + '*' + tbl_performanceContractHeader.Description + '*' + tbl_performanceContractHeader."Strategy Plan ID" + '*' + tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + format(tbl_performanceContractHeader."End Date") + '*' + Format(tbl_performanceContractHeader."Change Status") + '*' + Format(tbl_performanceContractHeader.Status) + '::::';
                until tbl_performanceContractHeader.Next = 0;
                exit(data);
            end;
        end;
    end;

    procedure fnGetPerformanceContract(contractNumber: Code[30]) data: Text
    begin
        tbl_performanceContractHeader.Reset();
        tbl_corporateStrategicPlans.Reset();
        tbl_performanceContractHeader.SetRange(No, contractNumber);
        if tbl_performanceContractHeader.FindSet(true) then begin
            data := tbl_performanceContractHeader."Annual Reporting Code" + '*' + Format(tbl_performanceContractHeader."Start Date") + '*' + Format(tbl_performanceContractHeader."End Date") + '*' + tbl_corporateStrategicPlans.Description;
        end;
        exit(data);

    end;

    procedure fnGetVehicleMaintainanceRequisition(employeeNumber: Code[30]; status: Text) data: Text
    begin
        if status = 'Approved' then begin
            tbl_fuelAndMaintainanceRequisition.Reset();
            tbl_fuelAndMaintainanceRequisition.SetRange(Status, tbl_fuelAndMaintainanceRequisition.Status::Approved);
            if tbl_fuelAndMaintainanceRequisition.FindSet(true) then begin
                repeat
                    data := data + tbl_fuelAndMaintainanceRequisition."Requisition No" + '*' + tbl_fuelAndMaintainanceRequisition."Vehicle Reg No" + '*' + Format(tbl_fuelAndMaintainanceRequisition."Odometer Reading") + '*' + Format(tbl_fuelAndMaintainanceRequisition."Request Date") + '*' + Format(tbl_fuelAndMaintainanceRequisition.Status) + ':';
                until tbl_fuelAndMaintainanceRequisition.Next = 0;
            end;
            exit(data);
        end else begin
            tbl_fuelAndMaintainanceRequisition.Reset();
            tbl_fuelAndMaintainanceRequisition.SetRange(Status, tbl_fuelAndMaintainanceRequisition.Status::"Pending Approval", tbl_fuelAndMaintainanceRequisition.Status::Open);
            if tbl_fuelAndMaintainanceRequisition.FindSet(true) then begin
                repeat
                    data := data + tbl_fuelAndMaintainanceRequisition."Requisition No" + '*' + tbl_fuelAndMaintainanceRequisition."Vehicle Reg No" + '*' + Format(tbl_fuelAndMaintainanceRequisition."Odometer Reading") + '*' + Format(tbl_fuelAndMaintainanceRequisition."Request Date") + '*' + Format(tbl_fuelAndMaintainanceRequisition.Status) + ':';
                until tbl_fuelAndMaintainanceRequisition.Next = 0;
            end;
            exit(data);
        end;


    end;

    procedure fnGetApprovalEntry(docNumber: Code[30]) data: Text
    begin
        tbl_approvalEntry.Reset();
        tbl_approvalEntry.SetRange("Document No.", docNumber);
        if tbl_approvalEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_approvalEntry."Sequence No.") + '*' + Format(tbl_approvalEntry.Status) + '*' + Format(tbl_approvalEntry."Sender ID") + '*' + Format(tbl_approvalEntry."Approver ID") + '*' + Format(tbl_approvalEntry.Amount) + '*' + Format(tbl_approvalEntry."Due Date") + '*' + Format(tbl_approvalEntry."Date-Time Sent for Approval") + '*' + format(tbl_approvalEntry.Comment) + '*' + Format(tbl_approvalEntry."Table ID") + '*' + Format(tbl_approvalEntry."Record ID to Approve") + '*' + tbl_approvalEntry."Workflow Step Instance ID" + '::::';
            until tbl_approvalEntry.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetRecordsToApprove(approverId: Code[50]) data: Text
    begin
        tbl_approvalEntry.Reset();
        tbl_approvalEntry.SetRange("Approver ID", approverId);
        if tbl_approvalEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_approvalEntry."Sequence No.") + '*' + Format(tbl_approvalEntry.Status) + '*' + Format(tbl_approvalEntry."Sender ID") + '*' + Format(tbl_approvalEntry.Amount) + '*' + Format(tbl_approvalEntry."Due Date") + '*' + Format(tbl_approvalEntry."Date-Time Sent for Approval") + '*' + format(tbl_approvalEntry.Comment) + '*' + Format(tbl_approvalEntry."Record ID to Approve") + '*' + tbl_approvalEntry."Workflow Step Instance ID" + '*' + Format(tbl_approvalEntry."Document No.") + '*' + Format(tbl_approvalEntry.RecordDetails()) + '::::';

            until tbl_approvalEntry.Next = 0;

        end;

    end;

    procedure fnGetCorporateStrategicPlan() data: Text
    begin
        tbl_corporateStrategicPlans.reset();
        tbl_corporateStrategicPlans.SetRange("Approval Status", tbl_corporateStrategicPlans."Approval Status"::Released);
        tbl_corporateStrategicPlans.SetRange("Implementation Status", tbl_corporateStrategicPlans."Implementation Status"::Ongoing);
        repeat
            data += tbl_corporateStrategicPlans.Description + '*' + tbl_corporateStrategicPlans."Primary Theme" + '*' + Format(tbl_corporateStrategicPlans."Duration (Years)") + '*' + tbl_corporateStrategicPlans."Vision Statement" + '*' + tbl_corporateStrategicPlans."Mission Statement" + '*' + Format(tbl_corporateStrategicPlans."Start Date") + '*' + Format(tbl_corporateStrategicPlans."End Date") + '*' + Format(tbl_corporateStrategicPlans."Implementation Status") + '*' + tbl_corporateStrategicPlans.Code + '::::';
        until tbl_corporateStrategicPlans.Next = 0;
        exit(data);


    end;

    procedure fnGetStrategicCoreValues(strategicPlanId: Code[30]) data: Text
    begin
        tbl_strategyCoreValue.Reset();
        tbl_strategyCoreValue.SetRange("Strategic Plan ID", strategicPlanId);
        if tbl_strategyCoreValue.FindSet(true) then begin
            repeat
                data += tbl_strategyCoreValue.Description + '*' + tbl_strategyCoreValue."Core Value" + '::::';
            until tbl_strategyCoreValue.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStrategicObjectives(strategicPlanId: Code[30]) data: Text
    begin
        tbl_strategicObjective.Reset();
        tbl_strategicObjective.SetRange("Strategic Plan ID", strategicPlanId);
        if tbl_strategicObjective.findset(true) then begin
            repeat
                data := data + tbl_strategicObjective."Theme ID" + '*' + tbl_strategicObjective."Objective ID" + '*' + tbl_strategicObjective.Description + '::::';
            until tbl_strategicObjective.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStrategy(strategyID: Code[30]) data: Text
    begin
        tbl_strategy.Reset();
        tbl_strategy.SetRange("Strategic Plan ID", strategyID);
        if tbl_strategy.FindSet(true) then begin
            repeat
                data := data + tbl_strategy."Theme ID" + '*' + tbl_strategy."Objective ID" + '*' + tbl_strategy."Strategy ID" + '*' + tbl_strategy.Description + '::::';
            until tbl_strategy.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStrategicInitiative(strategyID: Code[30]) data: Text
    begin
        tbl_strategicInitiative.Reset();
        tbl_strategicInitiative.SetRange("Strategic Plan ID", strategyID);
        if tbl_strategicInitiative.FindSet(true) then begin
            repeat
                data := data + tbl_strategicInitiative.Description + '*' + Format(tbl_strategicInitiative."Perfomance Indicator") + '*' + Format(tbl_strategicInitiative."Unit of Measure") + '*' + Format(tbl_strategicInitiative."CSP Planned Target") + '*' + tbl_strategicInitiative."Primary Directorate" + '*' + tbl_strategicInitiative."Primary Department" + '::::';
            until tbl_strategicInitiative.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetCspPlannedYear(cspCode: Code[30]) data: Text
    begin
        tbl_cspPlannedYears.Reset();
        tbl_cspPlannedYears.SetRange("CSP Code", cspCode);
        if tbl_cspPlannedYears.FindSet(true) then begin
            repeat
                data := data + tbl_cspPlannedYears."Annual Year Code" + '::::';
            until tbl_cspPlannedYears.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStrategicTheme(strategicPlanId: Code[30]) data: Text
    begin
        tbl_strategicTheme.Reset();
        tbl_strategicTheme.SetRange("Strategic Plan ID", strategicPlanId);
        if tbl_strategicTheme.FindSet(true) then begin
            repeat
                data := data + tbl_strategicTheme."Theme ID" + '*' + tbl_strategicTheme.Description + '*' + Format(tbl_strategicTheme."No. of Strategic Objectives") + '*' + Format(tbl_strategicTheme."No. of Strategies") + '*' + Format(tbl_strategicTheme."No. of Strategic Initiatives") + '::::';

            until tbl_strategicTheme.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetVacantPositions() data: Text
    begin
        tbl_employeeRequisition.Reset();
        tbl_employeeRequisition.SetRange("Closed Application", false);
        if tbl_employeeRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_employeeRequisition."Job ID" + '*' + tbl_employeeRequisition."Job Grade" + '*' + tbl_employeeRequisition."Job Title" + '*' + Format(tbl_employeeRequisition."Required Positions") + '*' + tbl_employeeRequisition."Job Description" + '*' + Format(tbl_employeeRequisition."Requisition Type") + '*' + Format(tbl_employeeRequisition.Status) + '*' + tbl_employeeRequisition."Requisition No." + ':';
            until tbl_employeeRequisition.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetTransportTrips(employeeNumber: Code[30]; status: Text) data: Text
    begin
        tbl_vehicleDriverAllocation.Reset();
        tbl_transportRequisition.Reset();
        tbl_transportRequisition.SetRange("Requested By", employeeNumber);
        // tbl_transportRequisition.SetRange(Status, tbl_transportRequisition.Status::Open);
        if tbl_transportRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_transportRequisition."Transport Requisition No" + '*' + tbl_transportRequisition.Commencement + '*' + tbl_transportRequisition."Vehicle Allocated" + '*' + tbl_transportRequisition."Driver Name" + '*' + Format(tbl_transportRequisition."Date of Request") + '*' + tbl_transportRequisition."Purpose of Trip" + '*' + Format(tbl_transportRequisition.Status) + '::::';
            until tbl_transportRequisition.Next = 0;
        end;
        exit(data);

    end;

    // procedure fnGetPettyCashLines(lineNumber: Code[20]) data: Text
    // begin
    //     tbl_pvLines.Reset();
    //     tbl_pvLines.SetRange(No, lineNumber);
    //     if tbl_pvLines.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_pvLines."Account Type") + '*' + Format(tbl_pvLines."Account No") + '*' + tbl_pvLines."Account Name" + '*' + Format(tbl_pvLines.Amount) + '*' + Format(tbl_pvLines."Line No") + '*' + Format(tbl_pvLines."Type of Expense") + '*' + Format(tbl_pvLines."Remaining Amount") + '*' + tbl_pvLines.Description + '*' + tbl_pvLines."Applies to Doc. No" + '*' + Format(tbl_pvLines.Type) + '*' + Format(tbl_pvLines.Amount) + '::::';
    //         until tbl_pvLines.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetApprovalCommentLine(tableId: Integer; recordToApprove: RecordId) data: Text
    begin
        tbl_approvalCommentLine.Reset();
        tbl_approvalCommentLine.SetRange("Table ID", tableId);
        tbl_approvalCommentLine.SetRange("Record ID to Approve", recordToApprove);
        if tbl_approvalCommentLine.FindSet(true) then begin
            repeat
                data += tbl_approvalCommentLine.Comment + '*' + Format(tbl_approvalCommentLine."User ID") + '*' + Format(tbl_approvalCommentLine."Date and Time") + '::::';
            until tbl_approvalCommentLine.Next = 0;
        end;
        exit(data);

    end;

    procedure getApprovalEntry(documentNumber: Code[30]) data: Text
    begin
        tbl_approvalEntry.reset();
        tbl_approvalEntry.SetRange("Document No.", documentNumber);
        if tbl_approvalEntry.FindSet(true) then begin
            repeat
                data := data + Format(tbl_approvalEntry."Sequence No.") + '*' + Format(tbl_approvalEntry.Status) + '*' + tbl_approvalEntry."Sender ID" + '*' + Format(tbl_approvalEntry."Approver ID") + '*' + Format(tbl_approvalEntry.Amount) + '*' + Format(tbl_approvalEntry."Date-Time Sent for Approval") + '*' + Format(tbl_approvalEntry."Due Date") + '*' + Format(tbl_approvalEntry.Comment) + ':';
            until tbl_approvalEntry.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPurchaseLine(docNumber: Code[30]) data: Text
    begin
        tbl_purchaseLine.Reset();
        tbl_purchaseLine.SetRange("Document No.", docNumber);
        if tbl_purchaseLine.findset(true) then begin
            repeat
                data += Format(tbl_purchaseLine."Line No.") + '*' + tbl_purchaseLine.Description + '*' + Format(tbl_purchaseLine."Unit of Measure") + '*' + Format(tbl_purchaseLine.Quantity) + '*' + Format(tbl_purchaseLine."Direct Unit Cost") + '*' + Format(tbl_purchaseLine.Amount) + '*' + Format(tbl_purchaseLine."Qty. Requested") + '*' + Format(tbl_purchaseLine."Service/Item Code") + '::::';
            until tbl_purchaseLine.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPurchaseHeader(empNumber: Code[30]; documentType: Text) data: Text
    begin
        tbl_purchaseHeader.Reset();
        if documentType = 'Purchase Requisition' then begin
            tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::"Purchase Requisition");
            tbl_purchaseHeader.SetRange("Request-By No.", empNumber);
            if tbl_purchaseHeader.FindSet(true) then begin
                repeat
                    data += tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader.Description + '*' + Format(tbl_purchaseHeader."Requisition Product Group") + '*' + Format(tbl_purchaseHeader."Priority Level") + '*' + Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."PP Planning Category" + '*' + tbl_purchaseHeader."Shortcut Dimension 1 Code" + '*' + tbl_purchaseHeader."Department Code" + '*' + tbl_purchaseHeader.job + '*' + tbl_purchaseHeader."Job Task No." + '*' + Format(tbl_purchaseHeader."Item Category Description") + '::::';
                until tbl_purchaseHeader.Next = 0;
            end;
            exit(data);
        end;

        if documentType = 'Store Requisition' then begin
            tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::"Store Requisition");
            tbl_purchaseHeader.SetRange("Request-By No.", empNumber);
            if tbl_purchaseHeader.FindSet(true) then begin
                repeat
                    data := data + tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader.Description + '*' + Format(tbl_purchaseHeader."Requisition Product Group") + '*' + Format(tbl_purchaseHeader."Priority Level") + '*' + Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."PP Planning Category" + '::::';
                until tbl_purchaseHeader.Next = 0;
            end;
            exit(data);
        end;


    end;


    procedure fnGetSubPCObjective(initiativeNumber: Code[30]; workPlanNumber: Code[30]) data: Text
    begin
        tbl_subPCObjective.Reset();
        tbl_subPCObjective.SetRange("Initiative No.", initiativeNumber);
        tbl_subPCObjective.SetRange("Workplan No.", workPlanNumber);
        if tbl_subPCObjective.FindSet(true) then begin
            repeat
                data := data + tbl_subPCObjective."Objective/Initiative" + '*' + tbl_subPCObjective."Outcome Perfomance Indicator" + '*' + Format(tbl_subPCObjective."Unit of Measure") + '*' + Format(tbl_subPCObjective."Imported Annual Target Qty") + '*' + Format(tbl_subPCObjective."Due Date") + '*' + Format(tbl_subPCObjective."Entry Number") + '*' + Format(tbl_subPCObjective."Initiative No.") + ':';
            until tbl_subPCObjective.Next = 0;
        end;
        exit(data);
    end;


    procedure fnGetObjectiveEvaluationResult(documentNumber: Code[30]) data: Text
    begin
        tbl_objectiveEvaluationResult.Reset();
        tbl_objectiveEvaluationResult.SetRange("Performance Evaluation ID", documentNumber);
        if tbl_objectiveEvaluationResult.FindSet(true) then begin
            repeat
                data := data + tbl_objectiveEvaluationResult."Objective/Initiative" + '*' + Format(tbl_objectiveEvaluationResult."Scale Type") + '*' + Format(tbl_objectiveEvaluationResult."Target Qty") + '*' + Format(tbl_objectiveEvaluationResult."AppraiserReview Qty") + '*' + Format(tbl_objectiveEvaluationResult."Final/Actual Qty") + '*' + Format(tbl_objectiveEvaluationResult."Performance Evaluation ID") + ':';
            until tbl_objectiveEvaluationResult.Next = 0;
        end;
        exit(data);


    end;

    procedure fnGetProficiencyEvaluationResults(docNumber: Code[30]) data: Text
    begin
        tbl_proficiencyEvaluationResult.Reset();
        tbl_proficiencyEvaluationResult.SetRange("Performance Evaluation ID", docNumber);
        if tbl_proficiencyEvaluationResult.FindSet(true) then begin
            repeat
                data := data + Format(tbl_proficiencyEvaluationResult."Scale Type") + '*' + Format(tbl_proficiencyEvaluationResult."Target Qty") + '*' + Format(tbl_proficiencyEvaluationResult."AppraiserReview Qty") + '*' + Format(tbl_proficiencyEvaluationResult."Final/Actual Qty") + '*' + tbl_proficiencyEvaluationResult.Description + ':';
            until tbl_proficiencyEvaluationResult.Next = 0;
        end;
        exit(data);

    end;

    // procedure fnGetEvaluationPip(docNumber: Code[30]) data: Text
    // begin
    //     tbl_evaluationPip.Reset();
    //     tbl_evaluationPip.SetRange("Perfomance Evaluation No", docNumber);
    //     if tbl_evaluationPip.FindSet(true) then begin
    //         repeat
    //             data := data + tbl_evaluationPip."PIP Category" + '*' + tbl_evaluationPip.Description + ':';
    //         until tbl_evaluationPip.Next = 0;
    //     end;
    //     exit(data);

    // end;

    procedure fnGetEvaluationTrainingNeeds(docNumber: Code[30]) data: Text
    begin
        tbl_evaluationTrainingNeeds.Reset();
        tbl_evaluationTrainingNeeds.SetRange("Perfomance Evaluation No", docNumber);
        if tbl_evaluationTrainingNeeds.FindSet(true) then begin
            repeat
                data := data + tbl_evaluationTrainingNeeds."Training Need Category" + '*' + tbl_evaluationTrainingNeeds.Description + ':';
            until tbl_evaluationTrainingNeeds.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetSubPlogLines(scoreCardId: Code[30]; plogNumber: Code[30]; iniativeNumber: Code[30]) data: Text
    begin
        tbl_subPlogLines.Reset();
        tbl_subPlogLines.SetRange("Personal Scorecard ID", scoreCardId);
        tbl_subPlogLines.SetRange("PLog No.", plogNumber);
        tbl_subPlogLines.SetRange("Initiative No.", iniativeNumber);
        if tbl_subPlogLines.FindSet(true) then begin
            repeat
                data := data + tbl_subPlogLines.Description + '*' + Format(tbl_subPlogLines."Planned Date") + '*' + Format(tbl_subPlogLines."Unit of Measure") + '*' + Format(tbl_subPlogLines."Target Qty") + '*' + Format(tbl_subPlogLines."Weight %") + '*' + Format(tbl_subPlogLines."Achieved Date") + '*' + Format(tbl_subPlogLines."Achieved Target") + '*' + tbl_subPlogLines.Comments + '*' + Format(tbl_subPlogLines.EntryNo) + ':';

            until tbl_subPlogLines.Next = 0;
        end;
        exit(data);
    end;


    // procedure fnGetImprestLines(imprestNumber: Code[30]) data: Text
    // begin
    //     tbl_imprestLines.Reset();
    //     tbl_imprestLines.SetRange(No, imprestNumber);
    //     if tbl_imprestLines.FindSet(true) then begin
    //         repeat
    //             data := data + tbl_imprestLines.Purpose + '*' + Format(tbl_imprestLines."Daily Rate") + '*' + Format(tbl_imprestLines."No. of Days") + '*' + Format(tbl_imprestLines.Amount) + '*' + Format(tbl_imprestLines."Line No") + '*' + Format(tbl_imprestLines."Actual Spent") + '::::';
    //         until tbl_imprestLines.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetPerformanceEvaluationDetails(employeeNumber: Code[30]) data: Text
    begin
        tbl_performanceEvalutionDetails.Reset();
        tbl_performanceEvalutionDetails.SetRange("Employee No.", employeeNumber);
        tbl_performanceEvalutionDetails.SetRange(Closed, false);
        tbl_performanceEvalutionDetails.SetRange("Evaluation Type", tbl_performanceEvalutionDetails."Evaluation Type"::"Standard Appraisal/Supervisor Score Only");
        tbl_performanceEvalutionDetails.SetRange("Document Type", tbl_performanceEvalutionDetails."Document Type"::"Performance Appraisal");
        if tbl_performanceEvalutionDetails.FindSet(true) then begin
            repeat
                data := data + tbl_performanceEvalutionDetails.No + '*' + tbl_performanceEvalutionDetails.Description + '*' + Format(tbl_performanceEvalutionDetails."Evaluation Start Date") + '*' + Format(tbl_performanceEvalutionDetails."Evaluation End Date") + '*' + tbl_performanceEvalutionDetails."Performance Mgt Plan ID" + '*' + tbl_performanceEvalutionDetails."Strategy Plan ID" + '*' + Format(tbl_performanceEvalutionDetails."Approval Status") + '*' + Format(tbl_performanceEvalutionDetails."Document Status") + '::::';
            until tbl_performanceEvalutionDetails.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetOnePerformanceEvaluationDetail(employeeNumber: Code[30]; pcNumber: Code[20]) data: Text
    begin
        tbl_performanceEvalutionDetails.Reset();
        tbl_performanceEvalutionDetails.SetRange("Employee No.", employeeNumber);
        tbl_performanceEvalutionDetails.SetRange(No, pcNumber);

        if tbl_performanceEvalutionDetails.FindSet(true) then begin
            repeat
                data := data + tbl_performanceEvalutionDetails.No + '*' + tbl_performanceEvalutionDetails.Description + '*' + Format(tbl_performanceEvalutionDetails."Evaluation Start Date") + '*' + Format(tbl_performanceEvalutionDetails."Evaluation End Date") + '*' + tbl_performanceEvalutionDetails."Performance Mgt Plan ID" + '*' + tbl_performanceEvalutionDetails."Strategy Plan ID" + '*' + Format(tbl_performanceEvalutionDetails."Approval Status") + '*' + Format(tbl_performanceEvalutionDetails."Document Status") + '*' + Format(tbl_performanceEvalutionDetails."Personal Scorecard ID") + '*' + Format(tbl_performanceEvalutionDetails."Supervisor Staff No.") + '::::';
            until tbl_performanceEvalutionDetails.Next = 0;
        end;
        exit(data);
    end;


    procedure fnGetCalendarDetails(performanceId: Code[30]) data: Text
    begin
        tbl_performancePlanTask.Reset();
        tbl_performancePlanTask.SetRange("Performance Mgt Plan ID", performanceId);
        tbl_performancePlanTask.SetRange("Closed?", false);
        tbl_performancePlanTask.SetRange("Published?", true);
        if tbl_performancePlanTask.FindSet(true) then begin
            repeat
                data := data + tbl_performancePlanTask."Performance Mgt Plan ID" + '*' + Format(tbl_performancePlanTask."Task Category") + '*' + tbl_performancePlanTask.Description + '*' + Format(tbl_performancePlanTask."Processing Start Date") + '*' + Format(tbl_performancePlanTask."Processing Due Date");//+ '*' + Format(tbl_performancePlanTask."Calendar Type") + '*' + Format(tbl_performancePlanTask."Event Type") + '*' + tbl_performancePlanTask."Event Agenda" + '*' + tbl_performancePlanTask."Event Name" + '*' + tbl_performancePlanTask."Event Venue" + '*' + tbl_performancePlanTask."Department Code" + ':';
            until tbl_performancePlanTask.Next = 0;
        end;

    end;

    procedure fnGetBRResponseQuestion(documentNumber: Code[20]; sectionCode: Code[20]) data: Text
    begin
        tbl_brResponseQuestion.Reset();
        tbl_brResponseQuestion.SetRange("Survey Response ID", documentNumber);
        tbl_brResponseQuestion.SetRange("Section Code", sectionCode);
        if tbl_brResponseQuestion.FindSet(true) then begin
            repeat
                data := data + tbl_brResponseQuestion.Question + '*' + tbl_brResponseQuestion."General Response Statement" + '*' + Format(tbl_brResponseQuestion."Rating Type") + '*' + Format(tbl_brResponseQuestion."Question ID") + ':';
            until tbl_brResponseQuestion.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetBusinessResearchResponse(participantId: Code[30]) data: Text
    begin
        tbl_brResponse.Reset();
        tbl_brResponse.SetRange("Participant ID", participantId);
        if tbl_brResponse.FindSet(true) then begin
            repeat
                data := data + Format(tbl_brResponse."Document Date") + '*' + tbl_brResponse."Document No." + '*' + tbl_brResponse.Name + '*' + tbl_brResponse.Description + ':';
            until tbl_brResponse.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetBRResponseSection(docNo: Code[30]) data: Text
    begin
        tbl_brResponseSection.Reset();
        tbl_brResponseSection.SetRange("Survey Response ID", docNo);
        if tbl_brResponseSection.FindSet(true) then begin
            repeat
                data := data + tbl_brResponseSection.Description + '*' + Format(tbl_brResponseSection."No. of Questions") + '*' + tbl_brResponseSection."Section Completion Instruction" + '*' + tbl_brResponseSection."Section Code" + ':';
            until tbl_brResponseSection.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetTravelStaffRequisition(docNo: Code[20]) data: Text
    begin
        tbl_travelStaffRequisition.Reset();
        tbl_travelStaffRequisition.SetRange("Req No", docNo);
        if tbl_travelStaffRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_travelStaffRequisition."Employee No" + '*' + tbl_travelStaffRequisition."Employee Name" + '*' + Format(tbl_travelStaffRequisition.EntryNo) + '::::';
            until tbl_travelStaffRequisition.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetTravelNonStaffRequisition(docNo: Code[20]) data: Text
    begin
        tbl_travelNonStaffRequisition.Reset();
        tbl_travelNonStaffRequisition.SetRange("Req No", docNo);
        if tbl_travelNonStaffRequisition.FindSet(true) then begin
            repeat
                data := data + tbl_travelNonStaffRequisition.Name + '*' + tbl_travelNonStaffRequisition."ID No" + '*' + tbl_travelNonStaffRequisition."Phone Number" + '*' + tbl_travelNonStaffRequisition.Position + '*' + Format(tbl_travelNonStaffRequisition.EntryNo) + '::::';
            until tbl_travelNonStaffRequisition.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobApplications(idNumber: Code[30]) data: Text
    begin
        tbl_hrJobApplications.Reset();
        tbl_hrJobApplications.SetRange("ID Number", idNumber);
        if tbl_hrJobApplications.FindSet(true) then begin
            repeat
                data := data + tbl_hrJobApplications."Application No" + '*' + Format(tbl_hrJobApplications."Date Applied") + '*' + tbl_hrJobApplications."Job Applied For" + ':';
            until tbl_hrJobApplications.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetIctHelpDeskIssueCategory() data: Text
    begin
        tbl_ictIssueCategory.Reset();
        repeat
            data += tbl_ictIssueCategory.Code + '*' + tbl_ictIssueCategory.Description + '::::';
        until tbl_ictIssueCategory.Next = 0;
        exit(data);
    end;

    procedure fnGetResource() data: Text
    begin
        tbl_resource.Reset();
        repeat
            data += tbl_resource."No." + '*' + tbl_resource.Name + '*' + Format(tbl_resource.Type) + '::::';
        until tbl_resource.Next = 0;
        exit(data);
    end;

    procedure fnGetPayroll() data: Text
    begin
        tbl_payslip.Reset();
        tbl_payslip.SetRange(Closed, true);
        if tbl_payslip.FindSet(true) then begin
            repeat
                data += Format(tbl_payslip."Starting Date") + '*' + tbl_payslip.Name + ':';
            until tbl_payslip.Next = 0;
        end
    end;

    procedure fnGetEmployees() data: Text
    begin
        tbl_employee.Reset();
        repeat
            data += tbl_employee."No." + '*' + Format(tbl_employee."Employee Posting Group") + '*' + Format(tbl_employee."First Name") + '*' + Format(tbl_employee."Last Name") + '::::';
        until tbl_employee.Next = 0;
        exit(data);
    end;

    procedure fnGetLeaveTypes() data: Text
    begin
        tbl_leaveTypes.Reset();
        repeat
            data += Format(tbl_leaveTypes.Gender) + '*' + Format(tbl_leaveTypes.Code) + '*' + Format(tbl_leaveTypes.Description) + '*' + Format(tbl_leaveTypes.Days) + '::::';
        until tbl_leaveTypes.Next = 0;
        exit(data);

    end;

    // procedure fnGetJobs() data: Text
    // begin
    //     tbl_job.Reset();
    //     tbl_job.SetRange(exchequer, true);
    //     repeat
    //         data += tbl_job."No." + '*' + tbl_job.Description + '*' + Format(tbl_job.exchequer) + '::::';
    //     until tbl_job.Next = 0;
    //     exit(data);
    // end;

    procedure fnGetResponsibilityCenter() data: Text
    begin
        tbl_responsibilityCenter.Reset();

        repeat
            data += Format(tbl_responsibilityCenter.Code) + '*' + tbl_responsibilityCenter.Name + '*' + tbl_responsibilityCenter."Direct Reports To" + '*' + Format(tbl_responsibilityCenter."Operating Unit Type") + '::::';
        until tbl_responsibilityCenter.Next = 0;
        exit(data);
    end;

    procedure fnGetTransportRequisitions(requisitionNumber: Code[20]; employeeNumber: Code[20]) data: Text
    begin
        tbl_transportRequisition.Reset();
        tbl_transportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        tbl_transportRequisition.SetRange("Employee No", employeeNumber);
        if tbl_transportRequisition.FindSet(true) then begin
            repeat
                data += tbl_transportRequisition.Commencement + '*' + tbl_transportRequisition.Destination + '*' + Format(tbl_transportRequisition."Date of Trip") + '*' + Format(tbl_transportRequisition."Journey Route") + '*' + Format(tbl_transportRequisition."Purpose of Trip") + '*' + Format(tbl_transportRequisition.Comments) + '*' + Format(tbl_transportRequisition."No of Days Requested") + '*' + Format(tbl_transportRequisition."Time out") + '*' + Format(tbl_transportRequisition."Approved Imprest Memo");// + '*' + Format(tbl_transportRequisition."Type of Trip") + '::::';
            until tbl_transportRequisition.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetFleetVehicles() data: Text
    begin
        tbl_fleetVehicles.Reset();
        repeat
            data += tbl_fleetVehicles."Registration No." + '*' + tbl_fleetVehicles.Description + '::::';
        until tbl_fleetVehicles.Next = 0;
        exit(data);

    end;

    procedure fnGetServiceItems() data: Text
    begin
        tbl_serviceItems.Reset();
        repeat
            data += tbl_serviceItems."Service Code" + '*' + tbl_serviceItems."Service Name" + '::::';
        until tbl_serviceItems.Next = 0;
        exit(data);
    end;

    procedure fnGetJobTasks(jobNumber: Code[20]) data: Text
    begin
        tbl_jobtask.Reset();
        tbl_jobtask.SetRange("Job No.", jobNumber);
        if tbl_jobtask.FindSet(true) then begin
            repeat
                data += tbl_jobtask."Job Task No." + '*' + tbl_jobtask.Description + '*' + Format(tbl_jobtask."Job Task Type") + '*' + tbl_jobtask."Global Dimension 1 Code" + '::::';
            until tbl_jobtask.Next = 0;
        end;
        exit(data);
    end;

    // procedure fnGetFundCode() data: Text
    // begin
    //     tbl_fundcode.Reset();
    //     repeat
    //         data += Format(tbl_fundcode.Code) + '*' + Format(tbl_fundcode.Description) + '*' + Format(tbl_fundcode."Shortcut Dimension 1 Code") + '*' + Format(tbl_fundcode."Shortcut Dimension 2 Code") + '::::';
    //     until tbl_fundcode.Next = 0;
    //     exit(data);
    // end;

    // procedure fnGetWorkTypes() data: Text
    // begin
    //     tbl_workTypes.Reset();
    //     repeat
    //         data += Format(tbl_workTypes.Code) + '*' + Format(tbl_workTypes.Description) + '*' + Format(tbl_workTypes.Category);// + '*' + Format(tbl_workTypes."International Travel") + '*' + Format(tbl_workTypes."Local Travel") + '::::';
    //     until tbl_workTypes.Next = 0;

    // end;

    procedure fnGetReceiptTypes() data: Text
    begin
        tbl_receiptsTypes.Reset();
        repeat
            data += tbl_receiptsTypes.Code + '*' + tbl_receiptsTypes.Description + '*' + Format(tbl_receiptsTypes.Type) + '::::';
        until tbl_receiptsTypes.Next = 0;
        exit(data);

    end;

    procedure fnGetProcurementSetup() data: Text
    begin
        tbl_procurementSetup.Reset();
        repeat
            data += Format(tbl_procurementSetup."Effective Procurement Plan") + '*' + Format(tbl_procurementSetup."Primary Key") + '::::';
        until tbl_procurementSetup.Next = 0;
        exit(data);
    end;

    procedure fnGetProcurementPlan(planNumber: Code[20]) data: Text
    begin
        tbl_procurementPlan.Reset();
        tbl_procurementPlan.SetRange(Code, planNumber);
        if tbl_procurementPlan.FindSet(true) then begin
            repeat
                data += tbl_procurementPlan.Description + '*' + Format(tbl_procurementPlan.Code) + '::::';
            until tbl_procurementPlan.Next = 0;
        end;
        exit(data);
    end;


    procedure getProcurementSetup() data: Text
    begin
        tbl_procurementSetup.Reset();
        if (tbl_procurementSetup.FindSet) then begin

            repeat

                data += Format(tbl_procurementSetup."Effective Procurement Plan") + '*' + Format(tbl_procurementSetup."Primary Key") + '::::';


            until (tbl_procurementSetup.Next = 0);

        end;

        exit(data);

    end;

    procedure fnGetUnitOfMeasure() data: Text
    begin
        tbl_unitOfMeasure.Reset();
        repeat
            data += tbl_unitOfMeasure.Code + '*' + tbl_unitOfMeasure.Description + '::::';
        until tbl_unitOfMeasure.Next = 0;
        exit(data);
    end;

    procedure fnGetProcurementPlanEntry(planningCategory: Code[20]; region: Code[20]; planNumber: Code[20]) data: Text
    begin
        tbl_procurementPlanEntry.Reset();
        tbl_procurementPlanEntry.SetRange("Procurement Plan ID", planNumber);
        tbl_procurementPlanEntry.SetRange("Planning Category", planningCategory);
        tbl_procurementPlanEntry.SetRange(Region, region);
        // tbl_procurementPlanEntry.SetRange(tbl_procurementPlanEntry."Entry Used", false);
        if tbl_procurementPlanEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_procurementPlanEntry."Entry No.") + '*' + tbl_procurementPlanEntry.Description + '*' + Format(tbl_procurementPlanEntry."Planning Category") + '*' + Format(tbl_procurementPlanEntry.Department) + '*' + Format(tbl_procurementPlanEntry.Directorate);//+ '*' + Format(tbl_procurementPlanEntry."Item Description") + '*' + Format(tbl_procurementPlanEntry.Items) + '*' + Format(tbl_procurementPlanEntry."Line Budget Cost") + '*' + Format(tbl_procurementPlanEntry."Unit Cost") + '*' + Format(tbl_procurementPlanEntry."Unit of Measure") + '*' + Format(tbl_procurementPlanEntry."Requisition Product Group") + '::::';
            until tbl_procurementPlanEntry.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetProcurementPlanLines(procurementPlanID: Code[20]) data: Text
    begin

        tbl_procurementPlanLines.reset();
        // tbl_procurementPlanLines.setrange("Procurement Type", requisitionProductGroup);
        tbl_procurementPlanLines.setrange("Procurement Plan ID", procurementPlanID);
        if tbl_procurementPlanLines.findset(true) then begin
            repeat
                data += Format(tbl_procurementPlanLines."Planning Category") + '*' + Format(tbl_procurementPlanLines.Description);// + '*' + Format(tbl_procurementPlanLines.Budget) + '::::';
            until tbl_procurementPlanLines.Next = 0;
        end;
        exit(data);


    end;


    // procedure fnGetTrainingVendor() data: Text
    // begin
    //     tbl_trainingVendor.Reset();
    //     tbl_trainingVendor.SetRange("Vendor Type", tbl_trainingVendor."Vendor Type"::Trade);
    //     if tbl_trainingVendor.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_trainingVendor."No.") + '*' + tbl_trainingVendor.Name + '::::';
    //         until tbl_trainingVendor.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetPerformancePlanTask(performanceID: Code[20]) data: Text
    begin
        tbl_performancePlanTask.Reset();
        tbl_performancePlanTask.SetRange("Performance Mgt Plan ID", performanceID);
        tbl_performancePlanTask.SetRange("Task Category", tbl_performancePlanTask."Task Category"::"Performance Review");
        if tbl_performancePlanTask.FindSet(true) then begin
            repeat
                data += tbl_performancePlanTask."Performance Mgt Plan ID" + '*' + tbl_performancePlanTask.Description + '*' + Format(tbl_performancePlanTask."Task Code") + '::::';
            until tbl_performancePlanTask.Next = 0;
        end;

        exit(data);
    end;

    procedure fnGetItems() data: Text
    begin
        tbl_items.Reset();
        repeat
            data += tbl_items."No." + '*' + tbl_items.Description + '*' + Format(tbl_items."Indirect Cost %") + '*' + Format(tbl_items."Base Unit of Measure");// + '*' + Format(tbl_items."Procurement Category") + '*' + Format(tbl_items.Inventory) + '::::';
        until tbl_items.Next = 0;
        exit(data);
    end;

    // procedure fnGetProjectMembers(imprestNumber: Code[20]) data: Text
    // begin
    //     tbl_projectMembers.Reset();
    //     tbl_projectMembers.SetRange("Imprest Memo No.", imprestNumber);
    //     if tbl_projectMembers.FindSet(true) then begin
    //         repeat
    //             data += tbl_projectMembers."Work Type" + '*' + Format(tbl_projectMembers."Type of Expense") + '*' + Format(tbl_projectMembers.Name) + '*' + Format(tbl_projectMembers."Time Period") + '*' + Format(tbl_projectMembers."Direct Unit Cost") + '*' + Format(tbl_projectMembers."Total Entitlement") + '*' + Format(tbl_projectMembers."No.") + '*' + Format(tbl_projectMembers.Type) + '*' + Format(tbl_projectMembers."Transport Costs") + '::::';
    //         until tbl_projectMembers.Next = 0;
    //     end;
    //     exit(data);
    // end;

    // procedure fnGetCasuals(imprestNumber: Code[30]) data: Text
    // begin
    //     tbl_casualMembers.Reset();
    //     tbl_casualMembers.SetRange("Imprest Memo No.", imprestNumber);
    //     if tbl_casualMembers.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_casualMembers.Type) + '*' + tbl_casualMembers."Resource No." + '*' + Format(tbl_casualMembers."Work Type") + '*' + Format(tbl_casualMembers."No. Required") + '*' + Format(tbl_casualMembers."No. of Days") + '*' + Format(tbl_casualMembers.Amount) + '*' + Format(tbl_casualMembers."Actual Amount") + '::::';
    //         until tbl_casualMembers.Next = 0;
    //     end;
    //     exit(data);

    // end;

    // procedure fnGetOtherCosts(imprestNumber: Code[20]) data: Text
    // begin
    //     tbl_otherCosts.Reset();
    //     tbl_otherCosts.SetRange("Imprest Memo No.", imprestNumber);
    //     if tbl_otherCosts.FindSet(true) then begin
    //         repeat
    //             data += tbl_otherCosts."Employee Name To Surender" + '*' + tbl_otherCosts.Description + '*' + tbl_otherCosts."Required For" + '*' + Format(tbl_otherCosts."Quantity Required") + '*' + Format(tbl_otherCosts."No. of Days") + '*' + Format(tbl_otherCosts."Unit Cost") + '*' + Format(tbl_otherCosts."Line Amount") + '*' + Format(tbl_otherCosts."Line No.") + '*' + Format(tbl_otherCosts."Type of Expense") + '::::';
    //         until tbl_otherCosts.Next = 0;
    //     end;
    //     exit(data);

    // end;



    procedure fnGetDimensions() data: Text
    begin
        tbl_dimensionsValue.Reset();
        repeat
            data += tbl_dimensionsValue."Dimension Code" + '*' + tbl_dimensionsValue.Code + '*' + tbl_dimensionsValue.Name + '::::';
        until tbl_dimensionsValue.Next = 0;
        exit(data);
    end;

    procedure getLeaveBalance(empNumber: Code[30]) data: Text
    begin
        hrLeaveLedgerEntry.Reset();
        hrLeaveLedgerEntry.SetRange("Staff No.", empNumber);
        if hrLeaveLedgerEntry.FindSet(true) then begin
            repeat
                data += format(hrLeaveLedgerEntry."No. of days1") + '*' + format(hrLeaveLedgerEntry."Leave Type") + '::::';

            until hrLeaveLedgerEntry.Next = 0;

        end;
        exit(data);
    end;

    // procedure fnGetReceipts(employeeNo: Code[20]) data: Text
    // begin
    //     tbl_receiptsHeader.Reset();
    //     // tbl_receiptsHeader.SetRange("Employee No", employeeNo);
    //     if tbl_receiptsHeader.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_receiptsHeader.Posted) + '*' + Format(tbl_receiptsHeader."Fully Allocated") + '*' + Format(tbl_receiptsHeader."Fully Allocated Imprest") + '*' + Format(tbl_receiptsHeader."No.") + '*' + Format(tbl_receiptsHeader."Being Payment of") + '*' + Format(tbl_receiptsHeader."On Behalf Of") + '::::';
    //         until tbl_receiptsHeader.Next = 0;
    //     end;
    //     exit(data);

    // end;

    // procedure fnGetRequisitionDetails(reqNumber: Code[20]) data: Text
    // begin
    //     tbl_payments.Reset;
    //     tbl_payments.SetRange("No.", reqNumber);

    //     if tbl_payments.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_payments."No.") + '*' + Format(tbl_payments."Account No.") + '*' + Format(tbl_payments."Account Type") + '*' + Format(tbl_payments."Account Name") + '*' + Format(tbl_payments."Payment Narration") + '*' + Format(tbl_payments."Imprest Deadline") + '::::';
    //         until tbl_payments.Next = 0;
    //     end;
    //     exit(data);

    // end;

    // procedure fnGetSurrenderedImprests(employeeNumber: Code[30]) data: Text
    // begin
    //     tbl_payments.Reset;
    //     tbl_payments.SetRange("Payment Type", tbl_payments."Payment Type"::Surrender);
    //     tbl_payments.SetRange("Document Type", tbl_payments."Document Type"::Surrender);
    //     tbl_payments.SetRange("Account No.", employeeNumber);
    //     if tbl_payments.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_payments."Imprest Issue Doc. No") + '*' + Format(tbl_payments."Payment Narration") + '::::';

    //         until tbl_payments.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetItemLedgerEntry(itemNo: Code[20]) data: Text
    begin
        tbl_itemLedgerEntry.Reset();
        tbl_itemLedgerEntry.SetRange("Item No.", itemNo);
        if tbl_itemLedgerEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_itemLedgerEntry.Quantity) + '*' + Format(tbl_itemLedgerEntry."Remaining Quantity") + '::::';
            until tbl_itemLedgerEntry.Next = 0;
        end;
        exit(data);

    end;

}