Page 52193986 "Employee Leave Plan 2"
{
    PageType = Card;
    SourceTable = "Employee Leave Plan Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(ContractType; "Contract Type")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                }
                field(LeaveCode; "Leave Code")
                {
                    ApplicationArea = Basic;
                }
                field(FiscalStartDate; "Fiscal Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(MaturityDate; "Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field(UserID; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoiningCompany; "Date Of Joining Company")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationDate; "Application Date")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicationNo; "Application No")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEntitlement; "Leave Entitlement")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveEarnedtoDate; "Leave Earned to Date")
                {
                    ApplicationArea = Basic;
                }
                field(LeaveBalance; "Leave Balance")
                {
                    ApplicationArea = Basic;
                }
                field(DaysinPlan; "Days in Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofApprovals; "No. of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000023; "Employee Plan Details")
            {
                SubPageLink = "Application No" = field("Application No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup1000000025)
            {
                action(SendLeavePlan)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Leave Plan';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.SendLeavePlanApprovalRequest(Rec) then;

                        //TESTFIELD("Application No");
                        //TESTFIELD("Days Applied");
                        //TESTFIELD("Leave Code");

                        //days:= "Days Applied";
                        /*
                        //Mail.NewIncidentMail('hrgrp@erc.go.ke', 'Leave Plan No ' +  "Application No" ,'This is a notification that '+ "Employee Name" +
                        ' entitled to '+FORMAT("Leave Entitlement")+' leave days'
                        +' has forwarded a leave plan for the period between '+FORMAT("Fiscal Start Date")+' and '+FORMAT("Maturity Date")
                        // of ' + FORMAT("Days Applied") + ' days from ' + FORMAT("Start Date")  + ' to ' +  FORMAT("End Date")
                        );
                        {
                        IF "Leave Allowance Payable"="Leave Allowance Payable"::Yes THEN BEGIN
                        //Mail.NewIncidentMail('finance@erc.go.ke', 'Leave App No ' +  "Application No" , "Employee Name" +
                        ' has applied ' + FORMAT("Days Applied") + ' days from ' + FORMAT("Start Date")  + ' to ' +  FORMAT("End Date"));
                         END
                        }
                        */

                    end;
                }
                action(CancelLeavePlan)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Leave Plan';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelLeavePlanApprovalRequest(Rec, true, true) then;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        // SETRANGE("User ID",USERID);
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        Mail: Codeunit Mail;
}

