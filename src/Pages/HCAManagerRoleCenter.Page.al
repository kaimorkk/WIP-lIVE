Page 52194388 "HCA Manager Role Center"
{
    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                systempart(Control1901420308;Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                part(Control8;"My Job Queue")
                {
                    Visible = false;
                }
                systempart(Control1901377608;MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group(EmployeeManager)
            {
                Caption = 'Employee Manager';
                action("Staff Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Information';
                    RunObject = Report StaffInformation;
                }
                action(StaffAppointmentByGender)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Appointment By Gender';
                    RunObject = Report StaffAppointmentGender;
                }
                action(StaffAppointedbyPayrollNumber)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Appointed by PayrollNumber>';
                    RunObject = Report StaffAppointedbyPayrollNumber;
                }
                action(StaffAppointedbyGrade)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Appointed by Grade';
                    RunObject = Report StaffAppointedbyGrade;
                }
                action(StaffAppointedbyDOB)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Appointed by DOB';
                    RunObject = Report StaffAppointedbyDOB;
                }
                // action(StaffAppointedbyJobTitle)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Staff Appointed byJobTitle';
                //     RunObject = Report UnknownReport51511425;
                // }
                // action(StaffJobDescription)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Staff Job Description';
                //     RunObject = Report UnknownReport51511426;
                // }
                // action(StaffAppointedbyethnic)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Staff Appointed by ethnic';
                //     RunObject = Report UnknownReport51511427;
                // }
                // action("Staff Appointed_County")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Staff Appointed_County';
                //     RunObject = Report UnknownReport51511431;
                // }
                // action("Staff Qualifications")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Staff Qualifications';
                //     RunObject = Report UnknownReport51511432;
                // }
                // action(StaffAppointedRelatives)
                // {
                //     ApplicationArea = Basic;
                //     RunObject = Report UnknownReport51511433;
                // }
                action("Staff Length of Service")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Length of Service';
                    RunObject = Report "Employees Length of Service";
                }
                action(StaffListandSkillsAudit)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff List and Skills Audit';
                    RunObject = Report "Staff List and Skills Audit";
                }
            }
            group(LeaveManager)
            {
                Caption = 'Leave Manager';
                action("<Report Leave Balance1>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Balance';
                    RunObject = Report "Leave Balance 1";
                }
                action(LeaveAnalysis)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Analysis';
                    RunObject = Report "Individual Leave analysis";
                }
                action(EmployeeAbsenceReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Absence Report';
                    RunObject = Report "Employee Absence Report";
                }
                action(LeaveRecallsReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Recalls Report';
                    RunObject = Report "Leave Recall List";
                }
                action("Staff On Leave")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff On Leave';
                    RunObject = Report StaffOnLeave;
                }
                action(StaffDueForLeave)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Due For Leave';
                    RunObject = Report StaffDueForLeave;
                }
                action(StaffLeaveAwaitingApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Leave Awaiting Approval';
                    RunObject = Report StaffLeaveAwaitingApproval;
                }
            }
            group(PerformanceManagement)
            {
                Caption = 'Performance Management';
                action(EmployeeAppraisalList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Appraisal List';
                    RunObject = Report "Employee Appraisal List";
                }
                action(PerformanceAppraisal)
                {
                    ApplicationArea = Basic;
                    Caption = 'Performance Appraisal';
                    RunObject = Report "Employee Appraisal List";
                }
            }
            group(Training)
            {
                Caption = 'Training';
                action(IndividualTrainingPlanReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Individual Training Plan Report';
                    RunObject = Report "Annual Training Plan";
                }
                action("Training Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Cost';
                    RunObject = Report "Training Costs";
                }
                action(TrainingBondStatus)
                {
                    ApplicationArea = Basic;
                    RunObject = Report TrainingBondStatus;
                }
                action(TrainingEvaluationReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Evaluation Report';
                    RunObject = Report "Training Evaluation Report";
                }
                action(TrainingReportFeedbackList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Training Report Feedback List';
                    RunObject = Report "Submitted Training Report";
                }
            }
            group(FleetManagement)
            {
                Caption = 'Fleet Management';
                action(TransportRequestsReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transport Requests Report';
                    RunObject = Report "Transport Report";
                }
                action(MotorReport)
                {
                    ApplicationArea = Basic;
                    Caption = 'Motor Report';
                    RunObject = Report "Motor Report";
                }
                action("Vehicle Servicing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vehicle Servicing';
                    RunObject = Report "Vehicle Servicing";
                }
                action("Vehicle fuel consumption")
                {
                    ApplicationArea = Basic;
                    RunObject = Report "Vehicle Fuel Consumption";
                }
            }
            group(Employee)
            {
                Caption = 'Employee';
                action(EmployeeList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee List';
                    RunObject = Report "Employee - List";
                }
                // action(EmployeeStatutoryNumbers)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employee Statutory Numbers';
                //     RunObject = Report UnknownReport51511032;
                // }
            }
            group(MyReports)
            {
                Caption = 'My Reports';
                action(MyPayslip)
                {
                    ApplicationArea = Basic;
                    Caption = 'My Payslip';
                    RunObject = Report "New Payslipx1";
                }
            }
            action("Accounts Payable Aging")
            {
                ApplicationArea = Basic;
                Caption = 'Accounts Payable Aging>';
                RunObject = Report "Aged Accounts Payable";
            }
        }
        area(embedding)
        {
        }
        area(sections)
        {
        }
        area(creation)
        {
            action(HumanResourcesSetup)
            {
                ApplicationArea = Basic;
                Caption = 'Human Resources Setup';
                RunObject = Page "Human Resources Setup";
            }
        }
        area(navigation)
        {
        }
    }
}

