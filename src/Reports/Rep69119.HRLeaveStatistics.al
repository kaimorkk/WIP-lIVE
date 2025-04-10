report 52193740 "HR Leave Statistics"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Statistics.rdlc';

    dataset
    {
        dataitem("HR Employees"; Employee)
        {

            RequestFilterFields = "No.";
            column(No; "HR Employees"."No.")
            {
            }
            column(FullName; "HR Employees"."Last Name" + '  ' + "HR Employees"."Middle Name")
            {
            }
            column(DepartmentName; "HR Employees"."Department Name")
            {
            }
            column(LeaveDaysBF; "HR Employees"."Reimbursed Leave Days")
            {
            }
            column(LeaveDaysEarned; "HR Employees"."Allocated Leave Days")
            {
            }
            column(LeaveDaysApplied; "HR Employees"."Total Leave Taken")
            {
            }
            column(LeaveBalance; "HR Employees"."Leave Outstanding Bal")
            {
            }
            column(Picture; CI.Picture)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(UserID; UserId)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields("Total Leave Taken", "Reimbursed Leave Days", "Allocated Leave Days", "Leave Outstanding Bal");
                // if "HR Employees"."Total Leave Taken"<10 then
                //  CurrReport.Skip;
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

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}

