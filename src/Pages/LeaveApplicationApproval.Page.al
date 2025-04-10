Page 52194142 "Leave Application Approval"
{
    PageType = Card;
    SourceTable = "Employee Leave Application1";

    layout
    {
        area(content)
        {
            group(Control1000000000)
            {
                Caption = 'Leave Application';
                Editable = false;
                group(Application)
                {
                    Caption = 'Application';
                    field(ApplicationNo; "Application No")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(DateofApplication; "Application Date")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Date of Application';
                        Editable = false;
                    }
                    field(EmployeeNo; "Employee No")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                        Visible = true;
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
                    }
                    field(Directoratename; "Directorate name")
                    {
                        ApplicationArea = Basic;
                    }
                    field(DepartmentName; "Department Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field(DepartmentCode; "Department Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field(LeaveType; "Leave Code")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Leave Type';
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
                group(Balances)
                {
                    Caption = 'Balances';
                    field(LeaveEntitlment; "Leave Entitlment")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(RecalledDays; "Recalled Days")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field(AvailableLeaveBalance; "Leave balance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Available Leave Balance';
                        Editable = false;
                    }
                    field(OffDays; "Off Days")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
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
                }
                group(CurrentApplicationDetails)
                {
                    Caption = 'Current Application Details';
                    field(DaysApplied; "Days Applied")
                    {
                        ApplicationArea = Basic;
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.SendLeaveApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Visible = false;

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
        Text19004241: label 'Application';
        Text19009930: label 'Balances';
        Text19042981: label 'Current Application Details';
        PendingApprover: Code[30];
        ApprovalEntry: Record "Approval Entry";
}

