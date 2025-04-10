Page 52193916 "Imprest Header"
{
    PageType = Card;
    SourceTable = "Request Header1";
    SourceTableView = where(Type = const(Imprest));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TripNo; "Trip No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No';
                    Editable = false;
                }
                field(Control1000000009; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = ' Employee Name';
                }
                field(CustomerAC; "Customer A/C")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    Visible = true;
                }
                field(TripStartDate; "Trip Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(TripExpectedEndDate; "Trip Expected End Date")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(NoofDays; "No. of Days")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(PurposeofImprest; "Purpose of Imprest")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate';
                }
                field(Department; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    Editable = false;
                    Visible = false;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(DeadlineforImprestReturn; "Deadline for Imprest Return")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(ImprestAmount; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TotalAmountRequested; "Total Amount Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Country; Country)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ActivityDate; "Activity Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(JobGroup; "Job Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ExternalApplication; "External Application")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ApprovalStatus; "No of Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Editable = false;
                }
                field(CBKWebsiteAddress; "CBK Website Address")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ImprestType; "Imprest Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        if "Imprest Type" = "imprest type"::Group then
                            GroupImprest := true;
                    end;
                }
            }
            part(Control1000000019; "Imprest_claim Lines")
            {
                SubPageLink = "Document No" = field("No.");
            }
            part(Control2; "Group Imprest Lines")
            {
                Editable = GroupImprest;
                SubPageLink = "Imprest No" = field("No.");
                Visible = GroupImprest;
            }
        }
    }

    actions
    {
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
                    SetFilter("No.", "No.");
                    Report.Run(51511014, true, true, Rec);
                    Reset;
                end;
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        /*
                        IF "Transaction Type"='' THEN
                        ERROR('You must select the transaction type');
                        */
                        // //if ApprovalMgt.SendImprestApprovalRequest(Rec) then;

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelImprestApprovalRequest(Rec, true, true) then;
                    end;
                }
                action(Submit)
                {
                    ApplicationArea = Basic;
                    Caption = 'Submit';
                    Visible = false;

                    trigger OnAction()
                    begin
                        CreatePV(Rec);
                    end;
                }
                action(PayrollRecovery)
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll Recovery';
                    Visible = false;

                    trigger OnAction()
                    begin
                        // loanapplication.Init;
                        // loanapplication."Loan No" := '';
                        // loanapplication."Loan Product Type" := "Transaction Type";
                        // loanapplication."Application Date" := Today;
                        // loanapplication."Amount Requested" := Balance;
                        // loanapplication."Approved Amount" := Balance;
                        // loanapplication."Employee No" := "Employee No";
                        // loanapplication."Loan Status" := loanapplication."loan status"::Approved;
                        // //loanapplication."Issued Date":=
                        // loanapplication.Insert(true);
                    end;
                }
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
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if "Imprest Type" = "imprest type"::Group then
            GroupImprest := true;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF Status<>Status::Open THEN
        ERROR('You cannot make changes at this stage');
        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Imprest;
    end;

    trigger OnOpenPage()
    begin
        /*
           SETRANGE("User ID",USERID);
        
           IF UserSetup.GET(USERID) THEN
           BEGIN
        
           IF UserSetup."Approver ID"=USERID THEN
           SETRANGE("User ID");
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Request Header1");
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approver ID",USERID);
           IF AdditionalApprovers.FIND('+') THEN
           SETRANGE("User ID");
           END;
           IF ApprovalSetup.GET THEN
           IF ApprovalSetup."Approval Administrator"=USERID THEN
           SETRANGE("User ID");
        
        
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Request Header1");
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           IF AdditionalApprovers.FIND('-') THEN
           REPEAT
        
            UserSetupRec.RESET;
            UserSetupRec.SETRANGE(UserSetupRec.Substitute,AdditionalApprovers."Approver ID");
            UserSetupRec.SETRANGE(UserSetupRec."User ID",USERID);
            IF UserSetupRec.FIND('-') THEN
            SETRANGE("User ID");
           UNTIL AdditionalApprovers.NEXT=0;
        
           END;
        
        
        
        
           END;
        
           IF ApprovalSetup.GET THEN
           IF ApprovalSetup."Approval Administrator"=UPPERCASE(USERID) THEN
           SETRANGE("User ID");
        */
        if "Imprest Type" = "imprest type"::Group then
            GroupImprest := true;

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        PV: Record Payments;
        PVlines: Record "PV Lines1";
        // loanapplication: Record "Loan Application1";
        D: Date;
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        RequestHeader: Record "Request Header1";
        GLSetup: Record "General Ledger Setup";
        Link: Text[250];

        GroupImprest: Boolean;
        PartialImprest: Record "Partial Imprest Issue";


    procedure GetPartialImprestNo(var ImpNo: Code[20]) LineNo: Integer
    var
        Partial: Record "Partial Imprest Issue";
    begin
        Partial.Reset;
        Partial.SetCurrentkey("Imprest No", "Line No");
        Partial.SetRange("Imprest No", ImpNo);
        if Partial.FindLast then
            LineNo := Partial."Line No" + 1
        else
            LineNo := 1;
    end;


    procedure GetAmountIssued(var ImpNo: Code[20]) AmountIssued: Decimal
    var
        Partial: Record "Partial Imprest Issue";
    begin
        Partial.Reset;
        Partial.SetCurrentkey("Imprest No", "Line No");
        Partial.SetRange("Imprest No", ImpNo);
        Partial.SetRange(Posted, true);
        if Partial.Find('-') then begin
            repeat
                AmountIssued := AmountIssued + Partial."Amount Already Issued";
            until Partial.Next = 0;
        end else
            AmountIssued := 0;
    end;
}

