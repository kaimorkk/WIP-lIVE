
page 51001 "HR Leave Requests"
{
    // ApplicationArea = All;
    Caption = 'HR Leave Requests';
    PageType = Card;
    SourceTable = "HR Leave Allocation Request";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field("Application Type"; Rec."Application Type")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Application Type field.';
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                    ApplicationArea = All;
                }
                field("Time Off Start"; Rec."Time Off Start")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Time Off Start field.';
                }
                field("Time Off End"; Rec."Time Off End")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Time Off End field.';
                }
                field("Reliever No."; Rec."Reliever No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reliever No. field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }

                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Adjustment Type field.';
                    ApplicationArea = All;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;

                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ToolTip = 'Specifies the value of the Applied Days field.';
                    ApplicationArea = All;
                    Visible = false;

                }

                field("Days Approved"; Rec."Days Approved")
                {
                    Editable = false;
                    Visible = false;

                    ToolTip = 'Specifies the value of the Days Approved field.';
                    ApplicationArea = All;
                }

                field("Leave Number"; Rec."Leave Number")
                {
                    ToolTip = 'Specifies the value of the Leave Number field.';
                    ApplicationArea = All;
                    Visible = false;

                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field(Purpose; Rec.Purpose)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the value of the Purpose field.';
                    ApplicationArea = All;
                }
                field("Approvers Comments"; Rec."Approvers Comments")
                {
                    ToolTip = 'Specifies the value of the Approvers Comments field.';
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(Attachments; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(50029),
                              "No." = field("No.");
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = '&Functions';
                action(Submit)
                {
                    ApplicationArea = Basic;
                    Caption = 'Submit';
                    Image = Approvals;
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Posted;
                        Rec.Modify();
                    end;

                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Visible = false;


                    trigger OnAction()
                    begin
                        DocumentType := Documenttype::"Leave Reimbursment";
                        ApprovalEntries.SetRecordfilters(Database::"HR Leave Allocation Request", DocumentType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(sendApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Visible = false;


                    trigger OnAction()
                    var

                        showmessage: Boolean;
                        ManualCancel: Boolean;
                        State: Option Open,"Pending Approval",Cancelled,Approved;
                        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TransportRequest,Maintenance,Fuel,ImporterExporter,"Import Permit","Export Permit",TR,"Safari Notice","Student Applications","Water Research","Consultancy Requests","Consultancy Proposals","Meals Bookings","General Journal","Student Admissions","Staff Claim",KitchenStoreRequisition,"Leave Application","Staff Advance","Staff Advance Accounting";
                        tableNo: Integer;
                    begin
                        Rec.TestField("Leave Number");
                        DocType := Doctype::"Leave Application";

                        VarVariant := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApprovalMgt.OnSendDocForApproval(VarVariant);
                        end;
                    end;
                }
                action(cancellsApproval)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Visible = false;

                    trigger OnAction()

                    begin

                        VarVariant := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
                        end;
                    end;
                }

                action(PrintPreview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print/Preview';
                    Image = PrintReport;
                    Visible = false;
                    trigger OnAction()
                    var
                    begin
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        Report.Run(70135251, true, true, Rec);
                        Rec.Reset;
                    end;
                }

                action("Leave Journal")
                {
                    ApplicationArea = Basic;
                    Image = JobJournal;
                    Caption = 'Post';
                    Visible = false;

                    trigger OnAction()
                    var
                        Ledger: Record "HR Leave Ledger Entries";
                        Ledger2: Record "HR Leave Ledger Entries";
                        UserSetup: record "User Setup";
                        Periods: Record "HR Leave Periods";
                    begin
                        //     Rec.TestField("Days Approved");
                        Rec.TestField(Status, Rec.Status::Approved);

                        if Rec.Posted then Error('The document has already been posted');
                        userSetup.Get(UserId);
                        if userSetup.Leave = false then Error('You do not have permission to post leave days');
                        if not Confirm('Do you ant to post leave number ' + Rec."No.") then Error('Process Aborted');


                        Ledger2.FindLast();
                        Periods.Reset();
                        Periods.SetRange(Closed, false);
                        Periods.FindFirst();

                        Ledger.Init();
                        Ledger."Entry No." := Ledger2."Entry No." + 1;
                        Ledger."Document No." := Rec."No.";
                        Ledger."Leave Type" := Rec."Leave Type";
                        Ledger.Closed := false;
                        Ledger."Staff No." := Rec."Employee No";
                        Ledger."Staff Name" := Rec."Employee Name";
                        Ledger."No. of days1" := Rec."Applied Days";
                        Ledger."Leave Posting Description" := Format(Rec."Application Type") + ' - ' + Format(Rec."No.");
                        Ledger."Leave Entry Type" := Ledger."Leave Entry Type"::Reimbursement;
                        Ledger."Posting Date" := Today;
                        Ledger.Posted := true;
                        Ledger."Leave Period" := format(Periods.Code);
                        Ledger."Leave Start Date" := Periods.Starts;
                        Ledger."Leave End Date" := Periods.Ends;
                        Ledger.Insert();
                        Rec.Posted := true;
                        Rec.Modify();

                        //     leaveCal.Reset();
                        //     leaveCal.SetRange(Current, true);
                        //     if leaveCal.Find('-') then
                        //         LeavAllc.Init();
                        //     LeavAllc."Calendar Code" := leaveCal.Code;
                        //     LeavAllc."No." := Rec."Employee No";
                        //     LeavAllc."Staff Name" := Rec."Employee Name";
                        //     LeavAllc."Posting Date" := Today;
                        //     LeavAllc."Entry Type" := Rec."Adjustment Type";
                        //     if Rec."Application Type" = Rec."Application Type"::"Re-Imbursement" then
                        //         LeavAllc."Posting Type" := LeavAllc."Posting Type"::Reimbursement
                        //     else
                        //         if Rec."Application Type" = Rec."Application Type"::"Carry Forward" then
                        //             LeavAllc."Posting Type" := LeavAllc."Posting Type"::"Carry Forward"
                        //         else
                        //             LeavAllc."Posting Type" := LeavAllc."Posting Type"::Normal;
                        //     LeavAllc."No. Of days" := Rec."Days Approved";
                        //     LeavAllc."Posting Description" := Format(Rec."Adjustment Type") + Format(Rec."Application Type") + Rec."No.";
                        //     LeavAllc."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                        //     LeavAllc."Global Dimension 2 Code" := Rec."Department Code";
                        //     LeavAllc."Posted By" := UserId;
                        //     LeavAllc."Leave Type" := Rec."Leave Type";
                        //     LeavAllc.Posted := true;
                        //     LeavAllc."Application Start Date" := Rec."Starting Date";
                        //     LeavAllc."Application End Date" := Rec."End Date";
                        //     LeavAllc."Application Return Date" := Rec."Return Date";
                        //     LeavAllc."Calendar Start Date" := leaveCal."Start Date";
                        //     LeavAllc."Calendar End Date" := leaveCal."End Date";
                        //     LeavAllc."Document No." := Rec."No.";
                        //     LeavAllc."Posting Source" := LeavAllc."Posting Source"::Document;
                        //     LeavAllc."Posted By" := UserId;
                        //     LeavAllc.Posted := true;
                        //     LeavAllc.Closed := false;
                        //     LeavAllc.Insert();

                        //     LeavAllc.Reset();
                        //     LeavAllc.SetRange(LeavAllc."Document No.", Rec."No.");
                        //     LeavAllc.SetRange(LeavAllc."No.", Rec."Employee No");
                        //     LeavAllc.SetRange(LeavAllc."Calendar Code", leaveCal.Code);
                        //     if LeavAllc.Find('-') then
                        //         PostLeave.PostLeaveAllocation(LeavAllc."Entry No.", LeavAllc."No.", LeavAllc."Leave Type", LeavAllc."Calendar Code");
                        //     Rec.Status := Rec.Status::Posted;
                        //     Rec.Posted := true;
                        //     Rec."Posting Date" := Today;
                        //     Rec."Posted By" := UserId;
                        //     Rec.Modify();
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(PrintPreview_Promoted; PrintPreview)
                {
                }
                actionref("Leave Journal_Promoted"; "Leave Journal")
                {
                }
            }
            group(Category_Process)
            {
                actionref(Submit_Promoted; Submit)
                {
                }
            }
            group(Category_Category4)
            {
                actionref(sendApproval_Promoted; sendApproval)
                {
                }
                actionref(cancellsApproval_Promoted; cancellsApproval)
                {
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Application Type" := Rec."Application Type"::"Time Off";
        Rec."Adjustment Type" := Rec."Adjustment Type"::"Negative Adjustment";

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        LeaveTypes.Reset();
        LeaveTypes.SetRange(Annual, true);
        if LeaveTypes.FindFirst() then
            Rec."Leave Type" := LeaveTypes.Code;
        Rec."Application Type" := Rec."Application Type"::"Time Off";
    end;

    var
        LeaveTypes: Record "HR Leave Types";
        UserMgt: Codeunit "User Management";

        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        //  JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Enum "Approval Document Type";
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        FixedAsset: Record "Fixed Asset";
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
}

#pragma implicitwith restore
