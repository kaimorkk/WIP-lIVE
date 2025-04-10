TableExtension 52193673 tableextension52193673 extends "Human Resources Setup"
{
    fields
    {
        field(50000; "Tax Table"; Code[10])
        {
            TableRelation = "Bracket Tablesx1";
        }
        field(50001; "Corporation Tax"; Decimal)
        {
        }
        field(50002; "Housing Earned Limit"; Decimal)
        {
        }
        field(50003; "Pension Limit Percentage"; Decimal)
        {
        }
        field(50004; "Pension Limit Amount"; Decimal)
        {
        }
        field(50005; "Round Down"; Boolean)
        {
        }
        field(50006; "Working Hours"; Decimal)
        {
        }
        field(50008; "Payroll Rounding Precision"; Decimal)
        {
        }
        field(50009; "Payroll Rounding Type"; Option)
        {
            OptionMembers = Nearest,Up,Down;
        }
        field(50010; "Special Duty Table"; Code[10])
        {
        }
        field(50011; "CFW Round Deduction code"; Code[20])
        {
            TableRelation = DeductionsX1;
        }
        field(50012; "BFW Round Earning code"; Code[20])
        {
            TableRelation = EarningsX1;
        }
        field(50013; "Company overtime hours"; Decimal)
        {
        }
        field(50014; "Loan Product Type Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50015; "Tax Relief Amount"; Decimal)
        {
        }
        field(50016; "General Payslip Message"; Text[100])
        {
        }
        field(50020; "Incoming Mail Server"; Text[30])
        {
        }
        field(50021; "Outgoing Mail Server"; Text[30])
        {
        }
        field(50022; "Email Text"; Text[250])
        {
        }
        field(50023; "Sender User ID"; Text[30])
        {
        }
        field(50024; "Sender Address"; Text[100])
        {
        }
        field(50025; "Email Subject"; Text[100])
        {
        }
        field(50026; "Template Location"; Text[100])
        {
        }
        field(50027; "Applicants Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50028; "Leave Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50029; "Recruitment Needs Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50030; "Disciplinary Cases Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(50031; "No. Of Days in Month"; Decimal)
        {
        }
        field(50032; "Transport Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50033; "Cover Selection Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50034; "Qualification Days (Leave)"; Decimal)
        {
        }
        field(50035; "Leave Allowance Code"; Code[10])
        {
            TableRelation = EarningsX1;
        }
        field(50036; "Telephone Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50037; "Training Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50038; "Leave Recall Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50039; "Medical Claim Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50040; "Account No (Training)"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50041; "Training Evaluation Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50042; "Off Days Code"; Code[10])
        {
            TableRelation = "Leave Types1";
        }
        field(50043; "Appraisal Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50044; "Leave Plan Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50045; "Keys Request Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50046; "Incidences Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50047; "Sick Of Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50048; "Conveyance Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50049; "Base Calender Code"; Code[20])
        {
            TableRelation = "Base Calendar".Code;
        }
        field(50050; "Membership No."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50052; "Employee Absentism"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50056; "Conf/Sem/Request"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50057; "Conf/Sem Evaluation"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50058; "Monthly PayDate"; DateFormula)
        {
        }
        field(50059; "User Incident"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50060; "DMS LINK"; Text[250])
        {
        }
        field(50061; "Vehicle Filling No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50062; "Savings Withdrawal No"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50063; "Med Claim DMS LINK"; Text[250])
        {
        }
        field(50064; "Resource Request Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50065; "Appraisal Objective Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50066; "Probation Period(Months)"; Integer)
        {
        }
        field(50067; "Retirement Age"; DateFormula)
        {
        }
        field(50068; "Owner occupier interest"; Code[10])
        {
            TableRelation = EarningsX1;
        }
        field(50069; "Technical Competence Overall %"; Decimal)
        {
        }
        field(50070; "Behaviour Competence Overall %"; Decimal)
        {
        }
        field(50071; "Training Need Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50072; "Training Needs Request Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50073; "Employee Training Need Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50074; "Job Structure Identifier"; Code[20])
        {
            TableRelation = "Structure Identifier Tables";
        }
        field(50075; "Fleet Accident Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50076; "Maintenance Req Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50077; "Grievance Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50078; "Medical Claim Account No"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50079; "JobApplication Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50080; "Overtime Earning Code"; Code[20])
        {
        }
        field(50081; InternMonthlyEntitlement; Decimal)
        {
        }
        field(50082; TempMonthlyEntitlement; Decimal)
        {
        }
        field(50083; PermMonthlyEntitlement; Decimal)
        {
        }
        field(50084; "Excess Leave Days No"; Code[30])
        {
            TableRelation = "No. Series";
        }
        field(69638; "Pay-change No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69649; "Job Position No.s"; Code[10])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69679; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(69678; "Payroll Data Form Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69641; "Portal Reports File Path"; Text[250])
        {
            DataClassification = CustomerContent;

        }
        field(69642; "Reports File Path"; Text[250])
        {
            DataClassification = CustomerContent;

        }
        field(50088; "Base Calendar"; Code[10])
        {
            Description = '//to cater for Leave';
            TableRelation = "Base Calendar".Code;
            DataClassification = CustomerContent;
        }
        field(69639; "PR Allowance Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69640; "PR Deduction Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69654; "PR Benefit Nos"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69007; "Salary Voucher Nos"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50091; "Leave Posting Period[FROM]"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50092; "Leave Posting Period[TO]"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50089; "Leave Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Template".Name;
            DataClassification = CustomerContent;
        }
        field(50090; "Leave Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch".Name;
            DataClassification = CustomerContent;
        }
        field(69663; "Leave Adjustment Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69664; "HR E-mail Address"; Text[150])
        {
            DataClassification = CustomerContent;
        }
        field(50085; "Training Need Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(50095; "Training Application Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(56000; "CRM Training Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(56001; "CRM Vacancies"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(56002; "CRM Applicants"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(56003; "CRM Attendees"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69034; "Training Expense Account"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(69038; "Annual Training Plan"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Training Plan Header".No;
        }
        field(69653; "Training Committee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69682; "Training Feedback Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69683; "Duty Station Training Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";

        }
        field(69692; "Training Course Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50096; "Quarterly Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(50097; "Annual Appraisal Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(50094; "Leave Planner Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(69000; "Default Leave Posting Template"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
            DataClassification = CustomerContent;
        }
        field(69001; "Default Leave Posting Batch"; Code[10])
        {
            TableRelation = "HR Leave Journal Batch"."Journal Template Name";
            DataClassification = CustomerContent;
        }
        field(69550; "Succession Plan Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(69551; "Succession Template Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(69552; "Succession Log Nos"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(69018; "Disciplinary Committee Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69019; "Interns Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69020; "Temporary Employee Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69021; "Plaintiff Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69022; "Defendant Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69037; "Handover Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69656; "Exit HandOver Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69009; "Medical Claims Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69619; "Medical Checks Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69628; "Prehire Medical Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69666; "Medical Cards Replacement"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69668; "Attachee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69669; "Casual Employee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69670; "Intern Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69671; "Pupillage Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69672; "Temporary Employee Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69673; "Casual Pay Sched Nos"; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }

        field(69674; "Airtime Allocation Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69693; "Exit Interview Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69694; "Employee Onboarding Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69657; "Exit voucher Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69658; "Exit Final Dues Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69652; "Insurance Claim Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69651; "Orientation Invitation Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69650; "Staff Establishment No.s"; Code[10])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69647; "Current Global Staff Est"; Code[30])
        {
            TableRelation = "Staff Establishment Plan";
            Caption = 'Current Global Staff Establishment';
            DataClassification = CustomerContent;
        }
        field(69646; "Induction Nos"; Code[10])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69005; "Employee Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(69643; "Employee Transfer Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69690; "Feedback Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69632; "Applicant Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69633; "Scoresheet Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69634; "Interview Report Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69635; "Vacancy Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69636; "Cadre  Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69630; "Benefit Package Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69620; "Ability Test Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69621; "Ability Test Invitation Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69622; "Phone Interview Report Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69623; "Ability Test Response Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69624; "Shortlisting Voucher Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69625; "Interview Invitation Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69626; "Background Checks Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69627; "Referee Recomm Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69600; "Standard Recruitment Lead Time"; DateFormula)
        {
            Caption = 'Default Standard Recruitment Lead Time';
            DataClassification = CustomerContent;
        }
        field(69601; "Expe Recruitment Lead Time"; DateFormula)
        {
            Caption = 'Default Expedited Recruitment Lead Time';
            DataClassification = CustomerContent;
        }
        field(69602; "Strict Manpower Planning"; Boolean)
        {
            Caption = 'Disable Strict Manpower Planning';
            DataClassification = CustomerContent;
        }
        field(69603; "Months for Recruiter Fees"; Decimal)
        {
            Caption = 'No. of Months for Recruiter Fees';
            DataClassification = CustomerContent;
        }
        field(69604; "Recruiter Fees %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(69605; "Recruitment Plan Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69606; "Recruitment Requsition Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69607; "Candidate No."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69608; "Job Applicant No.s"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69609; "Direct Hire Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69610; "Apptitude Selection Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69611; "Final Interview  Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69612; "Final Shortlist  Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69613; "Functional Plan Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69614; "Commiitee Appoint Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69615; "Committee Terminate Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69616; "HR Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69617; "Prescreening Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69618; "Apptitude Question Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69027; "Temp Tax Relief Code"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = "EarningsX Temp-E".Code;
        }
        field(69028; "Temp NHIF Code"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69029; "Temp Net Pay Advance Code"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69030; "Temp NSSF Tier I Code"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69031; "Temp NSSF Tier II Code"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = "DeductionsX Temp-E".Code;
        }
        field(69032; " Regional HR E-mail Address"; Text[150])
        {
            DataClassification = CustomerContent;
        }
        field(69033; "Temp Salary Voucher Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69025; "Legal Case Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69014; "Transfer Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69015; "Hardship Allowance Code"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = EarningsX.Code;
        }
        field(69016; "Transfer Allowance Code"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = EarningsX.Code;
        }
        field(69017; "Asset Transfer Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69006; "OP Paye Deduction %"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(69008; "Job Application Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69010; "Job Application No Series"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69011; "Rating Nos."; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(69012; "Excess Pension Code"; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = EarningsX.Code;
        }
        field(69002; "Amount Per Hour"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(69003; "Overtime Payroll Code"; Code[10])
        {
            // TableRelation = DeductionsX.Code;
            DataClassification = CustomerContent;
        }
        field(69004; "Overtime Req Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(50098; "Gratuity Percentage"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(50099; "Gratuity Percentage."; Decimal)
        {
            DataClassification = CustomerContent;
            MaxValue = 100;
            MinValue = 0;
        }
        field(50100; "Salary Advance Posting Group"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Employee Posting Group".Code;
        }
        field(51074; "Tax Relief Code"; Code[10])
        {
            // TableRelation = EarningsX.Code;
            DataClassification = CustomerContent;
        }
        field(51076; "Interest on Advance Code"; Code[10])
        {
            // TableRelation = DeductionsX.Code;
            DataClassification = CustomerContent;
        }
        field(51077; "Training Allowance Arrears"; Code[10])
        {
            // TableRelation = EarningsX.Code;
            DataClassification = CustomerContent;
        }
        field(51056; "Basic Salary Code"; Code[10])
        {
            // TableRelation = EarningsX.Code;
            DataClassification = CustomerContent;
        }
        field(51664; "Discipline Grievance Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69665; "Discipline Surcharge Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69661; "Employment Appointment Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69662; "Dependants Change Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69659; "Transfer Opinion Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69655; "Individual Shortlist Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69645; "Organization Hierachy Nos"; Code[10])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69644; "Acting Nos"; Code[10])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69035; "Manpower Planning Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69036; "Job Advert Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69026; "Traning Planning Nos"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69043; "Training Deduction"; Code[30])
        {
            DataClassification = CustomerContent;
            // TableRelation = DeductionsX;
        }
        field(69631; "Phone Template Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69629; "Employment Offer Nos."; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69684; "Consolidated Trainning Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(51068; "Training Allowance"; Code[10])
        {
            // TableRelation = EarningsX.Code;
            DataClassification = CustomerContent;
        }
        field(51057; "NHIF Code"; Code[10])
        {
            // TableRelation = DeductionsX.Code;
            DataClassification = CustomerContent;
        }
        field(51059; "Net Pay Advance Code"; Code[10])
        {
            // TableRelation = DeductionsX.Code;
            DataClassification = CustomerContent;
        }
        field(51072; "Pending Days"; Code[10])
        {
            // TableRelation = EarningsX.Code;
            DataClassification = CustomerContent;
        }
        field(51082; "NSSF Tier I Code"; Code[10])
        {
            // TableRelation = DeductionsX.Code;
            DataClassification = CustomerContent;
        }
        field(51083; "NSSF Tier II Code"; Code[10])
        {
            // TableRelation = DeductionsX.Code;
            DataClassification = CustomerContent;
        }
        field(50086; "Payroll Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
            DataClassification = CustomerContent;
        }
        field(50087; "Payroll Journal Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Payroll Journal Template"));
            DataClassification = CustomerContent;
        }
        field(69677; "Consolidated Casual PS Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(69039; "Board Payable"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Vendor;
        }
        field(69040; "Director Journal Batch"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Directors Journal Template"));
        }
        field(69041; "Directors Journal Template"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template";
        }
        field(69042; "Board Expense"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Job."No." where("Job Posting Group" = const('VOTE ITEMS'));
        }
        field(51075; "Salary Advance"; Code[10])
        {
            // TableRelation = DeductionsX.Code;
            DataClassification = CustomerContent;
        }
        field(69024; "Salary Icreament Nos"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(69687; "Hr Notice Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69688; "Faq Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69689; "Notice Category Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(69700; "ESS Portal Link"; Text[40])
        {
            DataClassification = CustomerContent;
        }
        field(69660; "E-Recruitment Portal Link"; Text[40])
        {
            DataClassification = CustomerContent;
        }
        field(70000; "Min. Member Age"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(70001; "Disabled Retirement Age"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
    }
}

