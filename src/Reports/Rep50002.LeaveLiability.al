report 52193741 "Leave Liability"
{
    ApplicationArea = All;
    Caption = 'Leave Liability';
    UsageCategory = None;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Leave Liability.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.", "Global Dimension 1 Code", "Global Dimension 2 Code";

            column(Picture; CI.Picture)
            {
            }
            column(Company_Name; CI.Name)
            {
            }
            column(Company_Address; CI.Address)
            {
            }
            column(Company_Address2; CI."Address 2")
            {
            }
            column(Company_Email; CI."E-Mail")
            {
            }
            column(Company_Phone; CI."Phone No.")
            {
            }
            column(Company_Phone2; CI."Phone No. 2")
            {
            }
            column(No; "No.")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(MiddleName; "Middle Name")
            {
            }
            column(LastName; "Last Name")
            {
            }
            column(FullName; EmpName)
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(Leave_Outstanding_Bal; "Leave Outstanding Bal")
            {
            }
            column(Allocated_Leave_Days; "Allocated Leave Days")
            {
            }
            column(Total_Leave_Taken; "Total Leave Taken")
            {
            }
            column(DepartmentCode; "Department Code")
            {
            }
            column(DepartmentName; "Department Name")
            {
            }
            column(LeaveTypeCaption; LeaveTypeCaption)
            {
            }
            column(LeaveLiability; LeaveLiability)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields("Total Leave Taken", "Allocated Leave Days", "Leave Outstanding Bal", "Annual Leave Account", "Annual Leave Days");
                EmpName := Employee.FullName();

                Clear(Month);

                Month := Date2DMY(Today, 2);

                EarnedLeaveDays := Employee."Annual Leave Account" * Month / 12;

                Pointers.Reset();
                // if Employee."Salary Scale" <> '' then
                Pointers.SetRange("Salary Pointer", Employee.Present);
                // if  Employee.Present <> '' then
                Pointers.SetRange("Salary Scale", Employee."Salary Scale");
                if Pointers.FindFirst() then
                    BPay := Pointers."Basic Pay";

                LeaveLiability := BPay * EarnedLeaveDays / 30;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        EmpName: Text;
        LeaveTypeCaption: Label 'ANNUAL LEAVE';
        Month: Decimal;
        EarnedLeaveDays: Decimal;
        Pointers: Record "Salary Pointers";
        BPay: Decimal;
        LeaveLiability: Decimal;
}
