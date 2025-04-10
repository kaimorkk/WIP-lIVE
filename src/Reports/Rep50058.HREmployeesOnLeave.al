report 50058 "HR Employees On Leave"
{
    Caption = 'HR Employees On Leave';
    RDLCLayout = './Layouts/HR Employee on leave.rdlc';
    dataset
    {
        dataitem(HRLeaveApplication; "HR Leave Application")
        {
            DataItemTableView = Where("End Date" = filter('>= Today'));



            column(CompanyLogo; CompanyInfo.Picture)
            {
            }


            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(AlternatePhoneNumber; "Alternate Phone Number")
            {
            }
            column(AnnualLeaveType; "Annual Leave Type")
            {
            }
            column(ApplicantComments; "Applicant Comments")
            {
            }
            column(ApplicationCode; "Application Code")
            {
            }
            column(ApplicationDate; "Application Date")
            {
            }
            column(Approveddays; "Approved days")
            {
            }
            column(ApproverComments; "Approver Comments")
            {
            }
            column(Archived; Archived)
            {
            }
            column(Attachments; Attachments)
            {
            }
            column(CEO; CEO)
            {
            }
            column(CEOChecker; "CEO Checker")
            {
            }
            column(Cancelled; Cancelled)
            {
            }
            column(CellPhoneNumber; "Cell Phone Number")
            {
            }
            column(ChildsAge; "Child's Age")
            {
            }
            column(CurrentBalance; "Current Balance")
            {
            }
            column(DateofAppointment; "Date of Appointment")
            {
            }
            column(DateofExam; "Date of Exam")
            {
            }
            column(DaysApplied; "Days Applied")
            {
            }
            column(Department; Department)
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(Description; Description)
            {
            }
            column(Designation; Designation)
            {
            }
            column(DetailsofExamination; "Details of Examination")
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(DirectorateCode; "Directorate Code")
            {
            }
            column(DirectorateName; "Directorate Name")
            {
            }
            column(Division; Division)
            {
            }
            column(EmailAddress; "E-mail Address")
            {
            }
            column(Emergency; Emergency)
            {
            }
            column(EmployeeName; "Employee Name")
            {
            }
            column(EmployeeNo; "Employee No")
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(EntryNo; "Entry No")
            {
            }
            column(Grade; Grade)
            {
            }
            column(HOD; HOD)
            {
            }
            column(JobID; "Job ID")
            {
            }
            column(JobTittle; "Job Tittle")
            {
            }
            column(LeaveAllowanceAmount; "Leave Allowance Amount")
            {
            }
            column(LeaveAllowanceEntittlement; "Leave Allowance Entittlement")
            {
            }
            column(LeaveType; "Leave Type")
            {
            }
            column(Names; Names)
            {
            }
            column(Noseries; "No series")
            {
            }
            column(NumberofPreviousAttempts; "Number of Previous Attempts")
            {
            }
            column(Picture; Picture)
            {
            }
            column(Posted; Posted)
            {
            }
            column(Reason; Reason)
            {
            }
            column(Reliever; Reliever)
            {
            }
            column(RelieverImplementingUnit; "Reliever Implementing Unit")
            {
            }
            column(RelieverName; "Reliever Name")
            {
            }
            column(RelieverUnitName; "Reliever Unit Name")
            {
            }
            column(RelieverAddress; RelieverAddress)
            {
            }
            column(RequestLeaveAllowance; "Request Leave Allowance")
            {
            }
            column(RequesterID; "Requester ID")
            {
            }
            column(ResponsibilityCenter; "Responsibility Center")
            {
            }
            column(ResumptionDate; "Resumption Date")
            {
            }
            column(ReturnDate; "Return Date")
            {
            }
            column(Selected; Selected)
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(Status; Status)
            {
            }
            column(Supervisor; Supervisor)
            {
            }
            column(SupervisorEmail; "Supervisor Email")
            {
            }
            column(TotalTaken; "Total Taken")
            {
            }
            column(UserID; "User ID")
            {
            }
            column(tes; tes)
            {
            }
            column(test; test)
            {
            }
            trigger OnAfterGetRecord()
            begin

                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        CompanyInfo: Record "Company Information";
}
