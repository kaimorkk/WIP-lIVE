page 52194303 "Pending Leave Applications"
{

    Caption = 'Pending Leave Applications';
    PageType = List;
    SourceTable = "HR Leave Application";
    CardPageID = "Leave Applications Card";
    SourceTableView = where(Status = filter("Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Application No';
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Name field.';
                }

                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Leave Type field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field("Reliever Unit Name"; Rec."Reliever Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reliever Unit Name field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755006; "HR Leave Applications Factbox")
            {
                SubPageLink = "No." = field("Employee No");
                ApplicationArea = Basic;
            }
            systempart(Control1102755004; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = Comment;
                    ToolTip = 'Executes the Comments action.';
                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        DocumentType := Documenttype::"Leave Application";
                        /*
                        ApprovalComments.Setfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.SetUpLine(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                        ApprovalComments.RUN;
                        */

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::"Leave Application";
                        // ApprovalEntries.SetRecordFilters(Database::"HR Leave Application", DocumentType, Rec."Application Code");
                        ApprovalEntries.Run;
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        /*//if //ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendLeaveAppForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(Rec);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReopenCancelled;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = PrintForm;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        if HRLeaveApp.Find('-') then
                            Report.Run(69115, true, true, HRLeaveApp);
                    end;
                }
                action("Create Leave Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Leave Ledger Entries';
                    Image = CreateLinesFromJob;
                    Visible = false;
                    ToolTip = 'Executes the Create Leave Ledger Entries action.';
                    trigger OnAction()
                    begin
                        Rec.CreateLeaveLedgerEntries;
                        Rec.Reset;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Leave Application")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Application';
                Image = "Report";
                //RunObject = Report UnknownReport39005587;
                ToolTip = 'Executes the Leave Application action.';
            }
            action("Leave Reimbursements")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Reimbursements';
                Image = "Report";
                // RunObject = Report UnknownReport39005601;
                ToolTip = 'Executes the Leave Reimbursements action.';
            }
            action("Leave Applications List")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Applications List';
                Image = "Report";
                //  RunObject = Report UnknownReport39005604;
                ToolTip = 'Executes the Leave Applications List action.';
            }
            action("Leave Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Leave Statement';
                Image = "Report";
                //  RunObject = Report UnknownReport39005599;
                ToolTip = 'Executes the Leave Statement action.';
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Leave Application_Promoted"; "Leave Application")
                {
                }
                actionref("Leave Reimbursements_Promoted"; "Leave Reimbursements")
                {
                }
                actionref("Leave Applications List_Promoted"; "Leave Applications List")
                {
                }
                actionref("Leave Statement_Promoted"; "Leave Statement")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("&Approvals_Promoted"; "&Approvals")
                {
                }
                actionref("Re-Open_Promoted"; "Re-Open")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref("Create Leave Ledger Entries_Promoted"; "Create Leave Ledger Entries")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Comments_Promoted; Comments)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*
        HREmp.RESET;
        HREmp.SETRANGE(HREmp."User ID",USERID);
        IF HREmp.GET THEN
        SETRANGE("User ID",HREmp."User ID")
        ELSE
        //user id may not be the creator of the doc
        SETRANGE("User ID",USERID);
            */
        Rec.SetFilter("Requester ID", UserId);

    end;

    var
        ApprovalEntries: Page "Approval Entries";
        ApprovalComments: Page "Approval Comments";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application";
        HRLeaveApp: Record "HR Leave Application";
        HREmp: Record Employee;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;


    procedure TESTFIELDS()
    begin
        Rec.TestField("Leave Type");
        Rec.TestField("Days Applied");
        Rec.TestField("Start Date");
        Rec.TestField(Reliever);
        Rec.TestField(Supervisor);
    end;


    // procedure TestLeaveFamily()
    // var
    //     LeaveFamily: Record "HR Leave Family Groups";
    //     LeaveFamilyEmployees: Record "HR Leave Family Employees";
    //     Employees: Record Employee;
    // begin
    //     LeaveFamilyEmployees.SetRange(LeaveFamilyEmployees."Employee No", Rec."Employee No");
    //     if LeaveFamilyEmployees.FindSet then //find the leave family employee is associated with
    //         repeat
    //             LeaveFamily.SetRange(LeaveFamily.Code, LeaveFamilyEmployees.Family);
    //             LeaveFamily.SetFilter(LeaveFamily."Max Employees On Leave", '>0');
    //             if LeaveFamily.FindSet then //find the status other employees on the same leave family
    //               begin
    //                 Employees.SetRange(Employees."No.", LeaveFamilyEmployees."Employee No");
    //                 Employees.SetRange(Employees."Leave Status", Employees."leave status"::" ");
    //                 if Employees.Count > LeaveFamily."Max Employees On Leave" then
    //                     Error('The Maximum number of employees on leave for this family has been exceeded, Contact th HR manager for more information');
    //             end
    //         until LeaveFamilyEmployees.Next = 0;
    // end;
}
