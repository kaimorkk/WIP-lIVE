report 52193738 "Leave Statement"
{
    Caption = 'Leave Statement';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Leave Statement.rdlc';
    UsageCategory = ReportsandAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(Employee; Employee)
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(FullName; Employee.FullName)
            {
            }
            column(Logo; CompanyInformation.Picture)
            {
            }
            column(City; CompanyInformation.City)
            {
            }
            column(Address2; CompanyInformation."Address 2")
            {
            }
            column(Address; CompanyInformation.Address)
            {
            }
            column(CompanyName; CompanyInformation.Name)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            dataitem("Leave Entries"; "HR Leave Ledger Entries")
            {
                DataItemLink = "Staff No." = field("No.");
                RequestFilterFields = "Leave Type", "Leave Period";
                column(ReportForNavId_2; 2)
                {
                }
                column(StartDate_LeaveEntries; "Leave Entries"."Leave Start Date")
                {
                }
                column(EndDate_LeaveEntries; "Leave Entries"."Leave End Date")
                {
                }
                column(EntryNo_LeaveEntries; "Leave Entries"."Entry No.")
                {
                }
                column(ApplicationNo_LeaveEntries; "Leave Entries"."Document No.")
                {
                }
                column(Description_LeaveEntries; "Leave Entries"."Leave Posting Description")
                {
                }
                column(EmployeeNo_LeaveEntries; "Leave Entries"."Staff No.")
                {
                }
                column(LeaveType_LeaveEntries; "Leave Entries"."Leave Type")
                {
                }
                column(PostingDate_LeaveEntries; "Leave Entries"."Posting Date")
                {
                }
                column(EmployeeName_LeaveEntries; "Leave Entries"."Staff Name")
                {
                }
                column(Quantity_LeaveEntries; "Leave Entries"."No. of days1")
                {
                }
                column(DepartmentCode_LeaveEntries; "Leave Entries"."Global Dimension 2 Code")
                {
                }
                // column(LeaveTaken_LeaveEntries; "Leave Entries"."Leave Taken")
                // {
                // }
                // column(NoSeries_LeaveEntries; "Leave Entries"."No.Series")
                // {
                // }
                // column(OpeningBalance_LeaveEntries; "Leave Entries"."Opening Balance")
                // {
                // }
                column(Year_LeaveEntries; "Leave Entries"."Leave Period")
                {
                }
                // column(IgnoreinLeavBalcalculation_LeaveEntries; "Leave Entries"."Ignore in Leav Bal calculation")
                // {
                // }
                column(LeaveName; LeaveTypes.Description)
                {
                }
                column(RunningBalance; RunningBalance)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    Ok := LeaveTypes.Get("Leave Entries"."Leave Type");
                    RunningBalance += "No. of days1";
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.CalcFields(Picture);
            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get;
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
        CompanyInformation: Record "Company Information";
        Ok: Boolean;
        LeaveTypes: Record "HR Leave Types";
        RunningBalance: Decimal;
}
