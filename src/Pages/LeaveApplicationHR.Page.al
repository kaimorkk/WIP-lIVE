Page 52194192 "Leave Application HR"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Employee Leave Application1";

    layout
    {
        area(content)
        {
            group(Control1000000000)
            {
                Caption = 'Leave Application';
                group(Application)
                {
                    Caption = 'Application';
                    Editable = true;
                    field(ApplicationNo; "Application No")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(EmployeeNo; "Employee No")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                        Visible = true;
                    }
                    field(DateofApplication; "Application Date")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Date of Application';
                        Editable = false;
                    }
                    field(EmployeeName; "Employee Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        Visible = true;
                    }
                    field(MobileNo; "Mobile No")
                    {
                        ApplicationArea = Basic;
                    }
                    field(DirectorateCode; "Directorate Code")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(Directoratename; "Directorate name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(DepartmentCode; "Department Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field(DepartmentName; "Department Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(LeaveType; "Leave Code")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Leave Type';
                        NotBlank = true;
                    }
                }
                group(Balances)
                {
                    Caption = 'Balances';
                    field(Balancebroughtforward; "Balance brought forward")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(LeaveEarnedtoDate; "Leave Earned to Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(NoofDaysTakenToDate; "Total Leave Days Taken")
                    {
                        ApplicationArea = Basic;
                        Caption = 'No of Days Taken To Date';
                        Editable = false;
                    }
                    field(LeaveEntitlment; "Leave Entitlment")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Leave Entitlment';
                        Editable = false;
                    }
                    field(RecalledDays; "Recalled Days")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Recalled Days';
                        Editable = false;
                    }
                    field(DaysAbsent; "Days Absent")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Days Absent';
                    }
                    field(AvailableLeaveBalance; "Leave balance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Available Leave Balance';
                        Editable = false;
                    }
                }
                group(CurrentApplicationDetails)
                {
                    Caption = 'Current Application Details';
                    Editable = true;
                    field(DaysApplied; "Days Applied")
                    {
                        ApplicationArea = Basic;
                        NotBlank = true;

                        trigger OnValidate()
                        begin
                            if "Days Applied" > "Leave balance" then
                                Error('The days applied for are more than your leave balance');
                        end;
                    }
                    field(StartDate; "Start Date")
                    {
                        ApplicationArea = Basic;
                    }
                    field(EndDate; "End Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(ResumptionDate; "Resumption Date")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        NotBlank = true;
                    }
                    field(LeaveBalance; "Annual Leave Entitlement Bal")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Leave Balance';
                        Editable = false;
                    }
                    field(DutiesTakenOverBy; "Duties Taken Over By")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Name; Name)
                    {
                        ApplicationArea = Basic;
                    }
                    field(Status; Status)
                    {
                        ApplicationArea = Basic;
                    }
                    field(NoofApprovals; "No. of Approvals")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(PendingApprover; "Pending Approver")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(LeaveAllowancePayable; "Leave Allowance Payable")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(LeaveApplication)
            {
                Caption = 'Leave Application';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.SendLeaveApprovalRequest(Rec) then;

                        TestField("Application No");
                        TestField("Days Applied");
                        TestField("Leave Code");

                        days := "Days Applied";
                        /*
                        //Mail.NewIncidentMail('hrgrp@erc.go.ke', 'Leave App No ' +  "Application No" , "Employee Name" +
                        ' has applied ' + FORMAT("Days Applied") + ' days from ' + FORMAT("Start Date")  + ' to ' +  FORMAT("End Date"));
                        IF "Leave Allowance Payable"="Leave Allowance Payable"::Yes THEN BEGIN
                        //Mail.NewIncidentMail('finance@erc.go.ke', 'Leave App No ' +  "Application No" , "Employee Name" +
                        ' has applied ' + FORMAT("Days Applied") + ' days from ' + FORMAT("Start Date")  + ' to ' +  FORMAT("End Date"));
                         END
                         */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelLeaveApprovalRequest(Rec, true, true) then;
                    end;
                }
            }
        }
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Application No", "Application No");
                    Report.Run(51511192, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        /*
        ApprovalEntry.RESET;
        ApprovalEntry.SETRANGE(ApprovalEntry."Table ID",51511234);
        ApprovalEntry.SETRANGE(ApprovalEntry."Document No.","Application No");
        ApprovalEntry.SETRANGE(ApprovalEntry.Status,ApprovalEntry.Status::Open);
        IF ApprovalEntry.FIND('-') THEN BEGIN
            PendingApprover:=ApprovalEntry."Approver ID";
            "Pending Approver":=ApprovalEntry."Approver ID";
            MODIFY;
        END;
       */

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        d: Date;
        Mail: Codeunit Mail;
        Body: Text[250];
        days: Decimal;
        LeaveAllowancePaid: Boolean;
        FiscalStart: Date;
        FiscalEnd: Date;
        assmatrix: Record "Assignment Matrix1";
        AccPeriod: Record "Payroll PeriodX1";
        HRSetup: Record "Human Resources Setup";
        Text19051012: label 'No. Of days to Apply';
        ApprovalEntry: Record "Approval Entry";
        PendingApprover: Code[30];
}

