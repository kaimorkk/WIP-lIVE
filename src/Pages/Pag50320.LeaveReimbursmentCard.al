page 50320 "Leave Reimbursment Card"
{
    Caption = 'Leave Reimbursment Card';
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

                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    Editable = false;
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
                    MultiLine = true;
                }
                field("Approvers Comments"; Rec."Approvers Comments")
                {
                    ToolTip = 'Specifies the value of the Approvers Comments field.';
                    ApplicationArea = All;
                    MultiLine = true;

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
                    trigger OnAction()
                    begin
                        Rec.TestField("Leave Number");

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

                    trigger OnAction()

                    begin
                        VarVariant := Rec;
                        if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                            CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
                        end;
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

        Rec."Adjustment Type" := Rec."Adjustment Type"::"Positive Adjustment";

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