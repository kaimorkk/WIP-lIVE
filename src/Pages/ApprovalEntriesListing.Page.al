Page 52193757 "Approval Entries Listing"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Approval Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(TableID;"Table ID")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType;"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo;"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(SequenceNo;"Sequence No.")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalCode;"Approval Code")
                {
                    ApplicationArea = Basic;
                }
                field(SenderID;"Sender ID")
                {
                    ApplicationArea = Basic;
                }
                field(SalespersPurchCode;"Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                }
                field(ApproverID;"Approver ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(DateTimeSentforApproval;"Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                }
                field(LastDateTimeModified;"Last Date-Time Modified")
                {
                    ApplicationArea = Basic;
                }
                field(LastModifiedByID;"Last Modified By USer ID")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;Comment)
                {
                    ApplicationArea = Basic;
                }
                field(DueDate;"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(AmountLCY;"Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalType;"Approval Type")
                {
                    ApplicationArea = Basic;
                }
                field(LimitType;"Limit Type")
                {
                    ApplicationArea = Basic;
                }
                field(AvailableCreditLimitLCY;"Available Credit Limit (LCY)")
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
                    Visible = false;

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
                    Visible = false;

                    trigger OnAction()
                    begin
                        SetFilter(Status,'%1|%2',Status::Created,Status::Open);
                        SetFilter("Due Date",'<%1',Today);
                    end;
                }
                action(AllEntries)
                {
                    ApplicationArea = Basic;
                    Caption = 'All Entries';
                    Visible = false;

                    trigger OnAction()
                    begin
                        SetRange(Status);
                        SetRange("Due Date");
                    end;
                }
            }
        }
    }
}

