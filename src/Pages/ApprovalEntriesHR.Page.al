Page 52194160 "Approval Entries HR"
{
    Caption = 'Approval Entries';
    Editable = false;
    PageType = Card;
    SourceTable = "Approval Entry";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Overdue; Overdue)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overdue';
                    Editable = false;
                    OptionCaption = 'Yes';
                    ToolTip = 'Overdue Entry';
                }
                field(TableID; "Table ID")
                {
                    ApplicationArea = Basic;
                }
                field(LimitType; "Limit Type")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalType; "Approval Type")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Purchase Requisition,Store Requisition,Imprest,Claim-Accounting,Appointment,Payment Voucher,Leave Application,Training Request,Transport Request,Recruitment Request,Telephone Request';
                }
                field(DocumentNo; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(SequenceNo; "Sequence No.")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalCode; "Approval Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(SenderID; "Sender ID")
                {
                    ApplicationArea = Basic;
                }
                field(SalespersPurchCode; "Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                }
                field(ApproverID; "Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(AmountLCY; "Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(AvailableCreditLimitLCY; "Available Credit Limit (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(DateTimeSentforApproval; "Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                }
                field(LastDateTimeModified; "Last Date-Time Modified")
                {
                    ApplicationArea = Basic;
                }
                field(LastModifiedByID; Rec."Last Modified By User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Comment; Comment)
                {
                    ApplicationArea = Basic;
                }
                field(DueDate; "Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Show)
            {
                Caption = '&Show';
                action(Document)
                {
                    ApplicationArea = Basic;
                    Caption = 'Document';

                    trigger OnAction()
                    begin
                        Rec.ShowRecord();
                    end;
                }
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = ViewComments;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        RecRef: RecordRef;
                    begin
                        RecRef.Get(Rec."Record ID to Approve");
                        Clear(ApprovalsMgmt);
                        ApprovalsMgmt.GetApprovalCommentForWorkflowStepInstanceID(RecRef, Rec."Workflow Step Instance ID");
                    end;
                }
                action(OverdueEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'O&verdue Entries';

                    trigger OnAction()
                    begin
                        SetFilter(Status, '%1|%2', Status::Created, Status::Open);
                        SetFilter("Due Date", '<%1', Today);
                    end;
                }
                action(AllEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'All Entries';

                    trigger OnAction()
                    begin
                        SetRange(Status);
                        SetRange("Due Date");
                    end;
                }
            }
        }
        area(processing)
        {
            action(Approve)
            {
                ApplicationArea = Basic;
                Caption = '&Approve';
                Image = Approve;
                Visible = ApproveVisible;

                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                begin
                    CurrPage.SetSelectionFilter(ApprovalEntry);
                    if ApprovalEntry.Find('-') then
                        repeat
                        //ApprovalMgt.ApproveApprovalRequest(ApprovalEntry);
                        until ApprovalEntry.Next = 0;
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Caption = 'Defer';
                Visible = RejectVisible;

                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    //ApprovalSetup: Record "Approval Setup";
                    ApprovalComment: Page "Approval Comments";
                begin
                    CurrPage.SetSelectionFilter(ApprovalEntry);
                    if ApprovalEntry.Find('-') then
                        repeat
                        // if not ApprovalSetup.Get then
                        //   Error(Text004);
                        // if ApprovalSetup."Request Rejection Comment" = true then begin
                        //   ApprovalComment.Setfilters(
                        //     ApprovalEntry."Table ID",ApprovalEntry."Document Type",ApprovalEntry."Document No.");
                        //   ApprovalComment.SetUpLine(
                        //     ApprovalEntry."Table ID",ApprovalEntry."Document Type",ApprovalEntry."Document No.");
                        //   Commit;
                        //   if ApprovalComment.RunModal = Action::OK then begin
                        //     Clear(ApprovalComment);
                        //     ApprovalMgt.RejectApprovalRequest(ApprovalEntry);
                        //   end;
                        // end else begin
                        //   Clear(ApprovalComment);
                        //   ApprovalMgt.RejectApprovalRequest(ApprovalEntry);
                        // end;
                        until ApprovalEntry.Next = 0;
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Basic;
                Caption = '&Delegate';
                Image = Delegate;

                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    TempApprovalEntry: Record "Approval Entry";
                //ApprovalSetup: Record "Approval Setup";
                begin
                    CurrPage.SetSelectionFilter(ApprovalEntry);

                    CurrPage.SetSelectionFilter(TempApprovalEntry);
                    if TempApprovalEntry.Find('-') then begin
                        TempApprovalEntry.SetFilter(Status, '<>%1', TempApprovalEntry.Status::Open);
                        if not TempApprovalEntry.IsEmpty then
                            Error(Text001);
                    end;

                    // if ApprovalEntry.Find('-') then begin
                    //   if ApprovalSetup.Get then;
                    //   if Usersetup.Get(UserId) then;
                    //   if (ApprovalEntry."Sender ID" = Usersetup."User ID") or
                    //      (ApprovalSetup."Approval Administrator" = Usersetup."User ID") or
                    //      (ApprovalEntry."Approver ID" = Usersetup."User ID")
                    //   then begin
                    //     repeat
                    //       ApprovalMgt.DelegateApprovalRequest(ApprovalEntry);
                    //     until ApprovalEntry.Next = 0;
                    //   end;
                    // end;

                    Message(Text002);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Overdue := Overdue::" ";
        if FormatField(Rec) then
            Overdue := Overdue::Yes;
    end;

    trigger OnInit()
    begin
        RejectVisible := true;
        ApproveVisible := true;
    end;

    trigger OnOpenPage()
    var
        Filterstring: Text[250];
    begin
        if Usersetup.Get(UserId) then begin
            FilterGroup(2);
            Filterstring := GetFilters;
            FilterGroup(0);
            if StrLen(Filterstring) = 0 then begin
                FilterGroup(2);
                SetCurrentkey("Approver ID");
                if Overdue = Overdue::Yes then
                    SetRange("Approver ID", Usersetup."User ID");
                SetRange(Status, Status::Open);
                FilterGroup(0);
            end else
                SetCurrentkey("Table ID", "Document Type", "Document No.");
        end;
    end;

    var
        Usersetup: Record "User Setup";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        Text001: label 'You can only delegate open approval entries.';
        Text002: label 'The selected approval(s) have been delegated. ';
        Overdue: Option Yes," ";
        Text004: label 'Approval Setup not found.';

        ApproveVisible: Boolean;

        RejectVisible: Boolean;


    procedure Setfilters(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DocumentNo: Code[20])
    begin
        if TableId <> 0 then begin
            FilterGroup(2);
            SetCurrentkey("Table ID", "Document Type", "Document No.");
            SetRange("Table ID", TableId);
            SetRange("Document Type", DocumentType);
            if DocumentNo <> '' then
                SetRange("Document No.", DocumentNo);
            FilterGroup(0);
        end;

        ApproveVisible := false;
        RejectVisible := false;
    end;


    procedure FormatField(Rec: Record "Approval Entry") OK: Boolean
    begin
        if (Status in [Status::Created, Status::Open]) then begin
            if (Rec."Due Date" < Today) then
                exit(true)
            else
                exit(false);
        end;
    end;


    procedure CalledFrom()
    begin
        Overdue := Overdue::" ";
    end;
}

