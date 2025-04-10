PageExtension 52193574 pageextension52193574 extends "Human Resources Setup" 
{
    Caption = 'Human Resources Setup';

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Human Resources Setup"(Page 5233)".

    layout
    {
      
        addfirst(Numbering)
        {
            
            field("Grievance Nos"; Rec."Grievance Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Grievance Nos field.';
            }
            field("Fleet Accident Nos."; Rec."Fleet Accident Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Fleet Accident Nos. field.';
            }
            field("Excess Leave Days No"; Rec."Excess Leave Days No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Excess Leave Days No field.';
            }
            field("Employee Absentism"; Rec."Employee Absentism")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee Absentism field.';
            }
            field("Cover Selection Nos"; Rec."Cover Selection Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Cover Selection Nos field.';
            }
            field("Conveyance Nos"; Rec."Conveyance Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Conveyance Nos field.';
            }
            
            field("Keys Request Nos"; Rec."Keys Request Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Keys Request Nos field.';
            }
            
            field("Leave Plan Nos"; Rec."Leave Plan Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Leave Plan Nos field.';
            }
            
            field("Maintenance Req Nos"; Rec."Maintenance Req Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Maintenance Req Nos field.';
            }
            field("Medical Claim Nos"; Rec."Medical Claim Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Medical Claim Nos field.';
            }

            field("Payroll Period"; Rec."Payroll Period")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payroll Period field.';
            }
           
            field("Training Need Nos"; Rec."Training Need Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Training Need Nos field.';
            }
        }
        addafter("Employee Nos.")
        {
            field("Cadre  Nos."; Rec."Cadre  Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Acting Nos"; Rec."Acting Nos")
            {
                ApplicationArea = Basic;
            }
            field("Employee Onboarding Nos"; Rec."Employee Onboarding Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee Onboarding Nos field.';
            }

            field("Dependants Change Nos."; Rec."Dependants Change Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Dependants Change Nos. field.';
            }
            field("Medical Cards Replacement"; Rec."Medical Cards Replacement")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Medical Cards Replacement field.';
            }
            field("Retirement Age"; Rec."Retirement Age")
            {
                ApplicationArea = Basic;
            }

            field("Training Course Nos"; Rec."Training Course Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Training Course Nos field.';
            }
            field("Annual Training Plan"; Rec."Annual Training Plan")
            {
                ApplicationArea = Basic;
            }
            field("Overtime Payroll Code"; Rec."Overtime Payroll Code")
            {
                ApplicationArea = Basic;
            }
            field("Overtime Req Nos."; Rec."Overtime Req Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Portal Reports File Path"; Rec."Portal Reports File Path")
            {
                Caption = 'ESS Reports Files Path';
                ApplicationArea = Basic;
            }
            field("Reports File Path"; Rec."Reports File Path")
            {
                Caption = 'E-Recruitment Files Path';
                ApplicationArea = Basic;
            }
            field("E-Recruitment Portal Link"; Rec."E-Recruitment Portal Link")
            {
                ApplicationArea = Basic;
            }
            field("Organization Hierachy Nos"; Rec."Organization Hierachy Nos")
            {
                ApplicationArea = Basic;
            }
            field("Staff Establishment No.s"; Rec."Staff Establishment No.s")
            {
                ApplicationArea = Basic;
            }
            field("Scoresheet Template Nos."; Rec."Scoresheet Template Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Orientation Invitation Nos."; Rec."Orientation Invitation Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Insurance Claim Nos."; Rec."Insurance Claim Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Exit HandOver Nos"; Rec."Exit HandOver Nos")
            {
                ApplicationArea = Basic;
            }
            field("Exit Final Dues Nos"; Rec."Exit Final Dues Nos")
            {
                ApplicationArea = Basic;
            }
            field("Exit voucher Nos"; Rec."Exit voucher Nos")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Base Unit of Measure")
        {
            field("Loan Product Type Nos.";"Loan Product Type Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Tax Relief Amount";"Tax Relief Amount")
            {
                ApplicationArea = Basic;
            }
            field("Applicants Nos.";"Applicants Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Working Hours";"Working Hours")
            {
                ApplicationArea = Basic;
            }
            field("Disciplinary Cases Nos.";"Disciplinary Cases Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Telephone Request Nos";"Telephone Request Nos")
            {
                ApplicationArea = Basic;
            }
            field("Recruitment Needs Nos.";"Recruitment Needs Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Resource Request Nos";"Resource Request Nos")
            {
                ApplicationArea = Basic;
            }
            field("Appraisal Objective Nos";"Appraisal Objective Nos")
            {
                ApplicationArea = Basic;
            }
            field("Qualification Days (Leave)";"Qualification Days (Leave)")
            {
                ApplicationArea = Basic;
            }
            field("Appraisal Nos";"Appraisal Nos")
            {
                ApplicationArea = Basic;
            }
            field("Owner occupier interest";"Owner occupier interest")
            {
                ApplicationArea = Basic;
            }
            field("Employee Training Need Nos";"Employee Training Need Nos")
            {
                ApplicationArea = Basic;
            }
            field("Incidences Nos";"Incidences Nos")
            {
                ApplicationArea = Basic;
            }
            field("JobApplication Nos";"JobApplication Nos")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Handover Nos."; Rec."Handover Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Airtime Allocation Nos"; Rec."Airtime Allocation Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Airtime Allocation Nos field.';
            }
            field("Rating Nos."; Rec."Rating Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Medical Claims Nos"; Rec."Medical Claims Nos")
            {
                ApplicationArea = Basic;
            }
            field("Leave Application Nos.";"Leave Application Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Leave Recall Nos";"Leave Recall Nos")
            {
                ApplicationArea = Basic;
            }
            field("Base Calendar"; Rec."Base Calendar")
            {
                ApplicationArea = Basic;
            }
            field("Base Calender Code";"Base Calender Code")
            {
                ApplicationArea = Basic;
            }
            field("Leave Template"; Rec."Leave Template")
            {
                ApplicationArea = Basic;
            }
            field("Leave Batch"; Rec."Leave Batch")
            {
                ApplicationArea = Basic;
            }
            field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
            {
                ApplicationArea = Basic;
            }
            field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
            {
                ApplicationArea = Basic;
            }
            field("Leave Adjustment Nos."; Rec."Leave Adjustment Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Leave Adjustment Nos. field.';
            }
            field("Leave Planner Nos."; Rec."Leave Planner Nos.")
            {
                ApplicationArea = Basic;
            }
            field("GratuityPercentage."; Rec."Gratuity Percentage.")
            {
                ApplicationArea = Basic;
            }
            field("Quarterly Appraisal Nos."; Rec."Quarterly Appraisal Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Annual Appraisal Nos."; Rec."Annual Appraisal Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Plaintiff Nos"; Rec."Plaintiff Nos")
            {
                ApplicationArea = Basic;
            }
            field("Defendant Nos"; Rec."Defendant Nos")
            {
                ApplicationArea = Basic;
            }
            field("Account No (Training)"; Rec."Account No (Training)")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Account No (Training) field.';
            }
            field("Training Need Nos."; Rec."Training Need Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Training Evaluation Nos";"Training Evaluation Nos")
            {
                ApplicationArea = Basic;
            }
            field("Training Request Nos";"Training Request Nos")
            {
                ApplicationArea = Basic;
            }
            field("Training Needs Request Nos";"Training Needs Request Nos")
            {
                ApplicationArea = Basic;
            }
            field("Traning Planning Nos"; Rec."Traning Planning Nos")
            {
                ApplicationArea = Basic;
            }
            field("Training Application Nos."; Rec."Training Application Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Training Committee Nos."; Rec."Training Committee Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Training Committee Nos. field.';
            }
            field("Training Allowance"; Rec."Training Allowance")
            {
                ApplicationArea = Basic;
            }
            field("Duty Station Training Nos."; Rec."Duty Station Training Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Duty Station Training Nos. field.';
            }
            field("Consolidated Trainning Nos."; Rec."Consolidated Trainning Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Consolidated Trainning Nos. field.';
            }
            field("Training Feedback Nos."; Rec."Training Feedback Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Training Allowance Arrears"; Rec."Training Allowance Arrears")
            {
                ApplicationArea = Basic;
            }
            field("Job Position No.s"; Rec."Job Position No.s")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Position No.s field.';
            }
            field("Job Application Nos"; Rec."Job Application Nos")
            {
                ApplicationArea = Basic;
            }
            field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
            {
                ApplicationArea = Basic;
            }
            field("HR E-mail Address"; Rec."HR E-mail Address")
            {
                ApplicationArea = Basic;
            }
            field("Job Applicant No.s"; Rec."Job Applicant No.s")
            {
                ApplicationArea = Basic;
            }
            field("Disciplinary Committee Nos"; Rec."Disciplinary Committee Nos")
            {
                ApplicationArea = Basic;
            }
            field("Succession Plan Nos"; Rec."Succession Plan Nos")
            {
                ApplicationArea = Basic;
            }
            field("Succession Template Nos"; Rec."Succession Template Nos")
            {
                ApplicationArea = Basic;
            }
            field("Succession Log Nos"; Rec."Succession Log Nos")
            {
                ApplicationArea = Basic;
            }
            field("Legal Case Nos"; Rec."Legal Case Nos")
            {
                ApplicationArea = Basic;
            }
            field("Employee Transfer Nos"; Rec."Employee Transfer Nos")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee Transfer Nos field.';
            }
            field("Attachee Nos."; Rec."Attachee Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Attachee Nos. field.';
            }
            field("Casual Employee Nos."; Rec."Casual Employee Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Casual Employee Nos. field.';
            }
            field("Intern Nos."; Rec."Intern Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Intern Nos. field.';
            }
            field("Pupillage Nos."; Rec."Pupillage Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Pupillage Nos. field.';
            }
            field("Temporary Employee Nos."; Rec."Temporary Employee Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Temporary Employee Nos. field.';
            }
            field("Payroll Data Form Nos."; Rec."Payroll Data Form Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payroll Data Form Nos. field.';
            }
            group("Payroll Setups")
            {
                Caption = 'Payroll Setups';

                field("Tax Table"; Rec."Tax Table")
                {
                    ApplicationArea = Basic;
                }
                field("Excess Pension Code"; Rec."Excess Pension Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Add Back';
                }
                field("Payroll Rounding Type"; Rec."Payroll Rounding Type")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Rounding Precision"; Rec."Payroll Rounding Precision")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Percentage"; Rec."Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Amount"; Rec."Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("General Payslip Message"; Rec."General Payslip Message")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("NHIF Code"; Rec."NHIF Code")
                {
                    ApplicationArea = Basic;
                }
                field("Net Pay Advance Code"; Rec."Net Pay Advance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Pending Days"; Rec."Pending Days")
                {
                    ApplicationArea = Basic;
                }
                field("Tax Relief Code"; Rec."Tax Relief Code")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                }
                field("Interest on Advance Code"; Rec."Interest on Advance Code")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF Tier I Code"; Rec."NSSF Tier I Code")
                {
                    ApplicationArea = Basic;
                }
                field("NSSF Tier II Code"; Rec."NSSF Tier II Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Journal Template"; Rec."Payroll Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Journal Batch"; Rec."Payroll Journal Batch")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Voucher Nos"; Rec."Salary Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Casual Pay Sched Nos"; Rec."Casual Pay Sched Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Consolidated Casual PS Nos."; Rec."Consolidated Casual PS Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidated Casual PS Nos. field.';
                }
                field("Board Payable"; Rec."Board Payable")
                {
                    ApplicationArea = Basic;
                }
                field("Board Expense"; Rec."Board Expense")
                {
                    ApplicationArea = Basic;
                }
                field("Director Journal Batch"; Rec."Director Journal Batch")
                {
                    ApplicationArea = Basic;
                }
                field("Directors Journal Template"; Rec."Directors Journal Template")
                {
                    ApplicationArea = Basic;
                }
                field("Gratuity Percentage"; Rec."Gratuity Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Advance Posting Group"; Rec."Salary Advance Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Icreament Nos"; Rec."Salary Icreament Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Pay-change No."; Rec."Pay-change No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay-change No. field.';
                }
                field("PR Benefit Nos"; Rec."PR Benefit Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PR Benefit Nos field.';
                }
                field("PR Deduction Nos."; Rec."PR Deduction Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PR Deduction Nos. field.';
                }
                field("PR Allowance Nos."; Rec."PR Allowance Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PR Allowance Nos. field.';
                }
            }
            group("Recruitment Setups")
            {
                Caption = 'Recruitment Setups';
                field("Standard Recruitment Lead Time"; Rec."Standard Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Expe Recruitment Lead Time"; Rec."Expe Recruitment Lead Time")
                {
                    ApplicationArea = Basic;
                }
                field("Current Global Staff Est"; Rec."Current Global Staff Est")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Global Staff Establishment field.';
                }

                field("Strict Manpower Planning"; Rec."Strict Manpower Planning")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Appointment Nos."; Rec."Employment Appointment Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employment Appointment Nos. field.';
                }
                field("Months for Recruiter Fees"; Rec."Months for Recruiter Fees")
                {
                    ApplicationArea = Basic;
                }
                field("Recruiter Fees %"; Rec."Recruiter Fees %")
                {
                    ApplicationArea = Basic;
                }
                field("Recruitment Plan Nos."; Rec."Recruitment Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Individual Shortlist Nos."; Rec."Individual Shortlist Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Individual Shortlist Nos. field.';
                }
                field("Recruitment Requsition Nos."; Rec."Recruitment Requsition Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Direct Hire Nos."; Rec."Direct Hire Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Apptitude Selection Nos."; Rec."Apptitude Selection Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Final Interview  Nos."; Rec."Final Interview  Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Final Shortlist  Nos."; Rec."Final Shortlist  Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Functional Plan Nos."; Rec."Functional Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Commiitee Appoint Nos."; Rec."Commiitee Appoint Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Terminate Nos."; Rec."Committee Terminate Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy Nos."; Rec."Vacancy Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("HR Template Nos."; Rec."HR Template Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Prescreening Template Nos."; Rec."Prescreening Template Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Apptitude Question Nos."; Rec."Apptitude Question Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Medical Checks Template Nos."; Rec."Medical Checks Template Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Nos."; Rec."Ability Test Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Invitation Nos."; Rec."Ability Test Invitation Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Report Nos."; Rec."Phone Interview Report Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Ability Test Response Nos."; Rec."Ability Test Response Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Shortlisting Voucher Nos."; Rec."Shortlisting Voucher Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Interview Invitation Nos."; Rec."Interview Invitation Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Background Checks Nos."; Rec."Background Checks Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Referee Recomm Nos."; Rec."Referee Recomm Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Prehire Medical Nos."; Rec."Prehire Medical Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Offer Nos."; Rec."Employment Offer Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Benefit Package Nos."; Rec."Benefit Package Nos.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("HR Numbers")
            {
                field("Phone Template Nos."; Rec."Phone Template Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer Nos"; Rec."Transfer Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer Opinion Nos"; Rec."Transfer Opinion Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Opinion Nos field.';
                }
                field("Transport Request Nos"; Rec."Transport Request Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Request Nos field.';
                }
                field("Hardship Allowance Code"; Rec."Hardship Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer Allowance Code"; Rec."Transfer Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Allowance Code"; Rec."Leave Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Transfer Nos"; Rec."Asset Transfer Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Interns Nos"; Rec."Interns Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Temporary Employee No"; Rec."Temporary Employee Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Temp Salary Voucher Nos."; Rec."Temp Salary Voucher Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Advert Nos."; Rec."Job Advert Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Induction Nos"; Rec."Induction Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Induction Nos field.';
                }
                field("Discipline Grievance Nos."; Rec."Discipline Grievance Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Grievance Nos. field.';
                }
                field("Discipline Surcharg Nos."; Rec."Discipline Surcharge Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discipline Surcharg Nos. field.';
                }

                field("Incidence Number"; Rec."Incidences Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Number Series for Incidences Nos.';
                }
            }
            group("Exchequer Project Setup")
            {
                Caption = 'Temporal Staff Payroll Setups';
                field("Temp Tax Relief Code"; Rec."Temp Tax Relief Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp NHIF Code"; Rec."Temp NHIF Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp Net Pay Advance Code"; Rec."Temp Net Pay Advance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp NSSF Tier I Code"; Rec."Temp NSSF Tier I Code")
                {
                    ApplicationArea = Basic;
                }
                field("Temp NSSF Tier II Code"; Rec."Temp NSSF Tier II Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Noticeboard No. Setup")
            {
                Caption = 'Notices & Faq Setup';
                field("Hr Notice Nos"; Rec."Hr Notice Nos")
                {
                    Caption = 'Hr Notices Nos';
                    ApplicationArea = Basic;


                }
                field("Faq Nos"; Rec."Faq Nos")
                {
                    Caption = 'FAQs Nos';
                    ApplicationArea = Basic;

                }
                field("Notice Category Nos"; Rec."Notice Category Nos")
                {
                    Caption = 'Notice Category Nos';
                    ApplicationArea = Basic;

                }

                field("Feedback Nos"; Rec."Feedback Nos")
                {

                    Caption = 'Feedback Nos';
                    ApplicationArea = Basic;
                }


            }

        }
    }
    actions
    {
        
    }
}

