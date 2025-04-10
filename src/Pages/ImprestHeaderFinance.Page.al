Page 50092 "Imprest Header Finance"
{
    PageType = Card;
    SourceTable = "Request Header1";

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
                }
                field(RequestDate; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(TripNo; "Trip No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerAC; "Customer A/C")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                }
                field(DeadlineforImprestReturn; "Deadline for Imprest Return")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmountRequested; "Total Amount Requested")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ImprestAmount; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IssuedAmount; "Issued Amount")
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
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount; "Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo; "Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ImprestType; "Imprest Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

            }
            part(Control1000000019; "Imprest_claim Lines")
            {
                SubPageLink = "Document No" = field("No.");
            }
        }
        area(factboxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Request Header1"),
                              "No." = field("No.");
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
                    //IF Posted=FALSE THEN
                    //ERROR('Payment Voucher No %1 has not been posted',"No.");

                    Reset;
                    SetFilter("No.", "No.");
                    // Report.Run(51511014, true, true, Rec);
                    Report.Run(52193453, true, true, Rec);
                    Reset;
                end;
            }
            action(CashVoucher)
            {
                ApplicationArea = Basic;
                Caption = 'Cash Voucher';
                Image = "Report";

                trigger OnAction()
                begin
                    //IF Posted=FALSE THEN
                    //ERROR('Payment Voucher No %1 has not been posted',"No.");

                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511005, true, true, Rec);
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
                        if "Transaction Type" = '' then
                            Error('You must select the transaction type');

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant)
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post';
                    Visible = true;

                    trigger OnAction()
                    begin
                        if Status <> Status::Released then
                            Error('The Document cannot be posted before it is fully approved');
                        Rec.TestField(Posted, false);
                        CommittmentMgt.CreatePV(Rec);
                        Rec.Posted := true;
                        CurrPage.Close;
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
                action(Action6)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //IF Posted=FALSE THEN
                        //ERROR('Payment Voucher No %1 has not been posted',"No.");

                        Reset;
                        SetFilter("No.", "No.");
                        Report.Run(51511005, true, true, Rec);
                        Reset;
                    end;
                }
                action(CreatePV)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create PV';
                    Image = Payment;
                    Visible = true;

                    trigger OnAction()
                    begin
                        CommittmentMgt.ImprestPaidWithPV(Rec);
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                action("Re&lease")
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. You must reopen the document before you can make changes to it.';
                    // Enabled = false;
                    // Visible = false;

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify();
                        CurrPage.Update(true);
                        CurrPage.Close();
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify();
                        CurrPage.Update(true);
                        CurrPage.Close();
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref(Action6_Promoted; Action6)
                {
                }
                actionref(CreatePV_Promoted; CreatePV)
                {
                }
                actionref("Re&lease_Promoted"; "Re&lease")
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Report)
            {
                actionref(CashVoucher_Promoted; CashVoucher)
                {
                }
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        /*
        IF Status<>Status::Open THEN
        ERROR('You cannot make changes at this stage');
        */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Imprest;
    end;

    trigger OnOpenPage()
    var
        Text000: label 'The Imprest Account Holder no %1, has %2 yet to be Surrendered. The Transaction will therefore Terminate!';
        ImprestHeaderRec: Record "Request Header1";
        CustLedge: Record "Cust. Ledger Entry";
        ImpNo: Integer;
    begin
        if Rec.Posted = true then
            CurrPage.Editable(false);
        /*
        SETRANGE("User ID",USERID);

        IF UserSetup.GET(USERID) THEN
        BEGIN

        IF UserSetup."Approver ID"=USERID THEN
        SETRANGE("User ID");
        ApprovalTemplate.RESET;
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
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
        ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
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
        //Error For Unserrendered Imprests
        ImprestHeaderRec.Reset;
        ImprestHeaderRec.SetRange(Posted, true);
        ImprestHeaderRec.SetRange(Surrendered, false);
        ImprestHeaderRec.SetRange("Customer A/C", "Customer A/C");
        ImprestHeaderRec.SetFilter(Type, '=%1', ImprestHeaderRec.Type::Imprest);
        ImprestHeaderRec.SetFilter("Deadline for Imprest Return", '<%1', Today);
        if ImprestHeaderRec.Find('-') then begin

            //Message(format(ImprestHeaderRec."No."));
            ImpNo := 0;
            repeat
                CustLedge.Reset;
                CustLedge.SetRange(Open, true);
                CustLedge.SetRange("Document No.", ImprestHeaderRec."No.");
                CustLedge.SetRange("Customer No.", ImprestHeaderRec."Customer A/C");
                CustLedge.SetRange("Due Date", ImprestHeaderRec."Deadline for Imprest Return");
                if CustLedge.Find('-') then
                    ImpNo := ImpNo + 1;
            until ImprestHeaderRec.Next = 0;
            if ImpNo > 0 then
                Error(Text000, "Customer A/C", ImpNo);
        end;
        //Error End

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
        CommittmentMgt: Codeunit Committment;
        PartialImprest: Record "Partial Imprest Issue";
        VarVariant: Variant;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";


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
        Requests: Record "Request Header1";
    begin
        AmountIssued := 0;
        /*
        Partial.RESET;
        Partial.SETCURRENTKEY("Imprest No","Line No");
        Partial.SETRANGE("Imprest No",ImpNo);
        Partial.SETRANGE(Posted,TRUE);
        IF Partial.FIND('-') THEN BEGIN REPEAT
        AmountIssued := AmountIssued + Partial."Amount Issued";
        UNTIL Partial.NEXT = 0;
        END ELSE
        AmountIssued := 0;
        */
        if Requests.Get(ImpNo) then begin
            //Requests.CALCFIELDS("Issued Amount");
            AmountIssued := "Issued Amount";
        end;

    end;
}

