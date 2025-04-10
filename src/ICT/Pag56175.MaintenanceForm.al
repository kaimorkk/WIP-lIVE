

page 56175 "Maintenance Form"
{
    PageType = Document;
    SourceTable = "ICT Issuance Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Maintainance Schedule"; Rec."Maintainance Schedule")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintainance Schedule field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Created By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
            }
            part(Control19; "Maintenance Form Lines")
            {
                SubPageLink = "Document No" = field("No."),
                              "Maintenance Schedule" = field("Maintainance Schedule");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
             part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(56061),
                              "No." = field("No.");
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    // SETRANGE("No.","No.");
                    // REPORT.RUN(56242,TRUE,TRUE,Rec);
                end;
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec.Modify(true);
                    //if //ApprovalsMgmt.CheckICTIssuanceApprovalPossible(Rec) then
                    //ApprovalsMgmt.OnSendICTIssuanceForApproval(Rec);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Image = CancelApprovalRequest;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                begin
                    Rec."Document Status" := Rec."document status"::Open;
                    Rec.Modify(true);
                    //ApprovalsMgmt.OnCancelICTIssuanceApprovalRequest(Rec);
                    WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = PostApplication;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    MaintenanceFormActivities.Reset;
                    MaintenanceFormActivities.SetRange("Document No", Rec."No.");
                    if MaintenanceFormActivities.FindSet then begin
                        repeat
                            PostedMaintenanceActivities.Init;
                            PostedMaintenanceActivities."Entry No" := PostedMaintenanceActivities."Entry No" + 1;
                            PostedMaintenanceActivities."Document No" := MaintenanceFormActivities."Document No";
                            PostedMaintenanceActivities."Maintenance Area" := MaintenanceFormActivities."Maintenance Area";
                            PostedMaintenanceActivities."ICT Inventory No." := MaintenanceFormActivities."ICT Inventory No.";
                            PostedMaintenanceActivities."Maintenance Schedule" := MaintenanceFormActivities."Maintenance Schedule";
                            PostedMaintenanceActivities.Code := MaintenanceFormActivities.Code;
                            PostedMaintenanceActivities.Activity := MaintenanceFormActivities.Activity;
                            PostedMaintenanceActivities.Type := MaintenanceFormActivities.Type;
                            PostedMaintenanceActivities.Status := MaintenanceFormActivities.Status;
                            PostedMaintenanceActivities.Comments := MaintenanceFormActivities.Comments;
                            MaintenanceLines.Reset;
                            MaintenanceLines.SetRange("Document No", MaintenanceFormActivities."Document No");
                            MaintenanceLines.SetRange("Maintenance Schedule", MaintenanceFormActivities."Maintenance Schedule");
                            MaintenanceLines.SetRange("Maintenance Area", MaintenanceFormActivities."Maintenance Area");
                            if MaintenanceLines.FindSet then
                                PostedMaintenanceActivities."Maintenance Period" := MaintenanceLines."Maintenance Period";
                            PostedMaintenanceActivities.Period := MaintenanceLines.Period;
                            PostedMaintenanceActivities."Period Date" := MaintenanceLines."Period Date";
                            PostedMaintenanceActivities.Insert(true);
                            ICTInventory.Reset;
                            ICTInventory.SetRange(Code, MaintenanceFormActivities."ICT Inventory No.");
                            if ICTInventory.FindSet then begin
                                ICTInventory."Last Maintenance Date" := Today;
                                ICTInventory.Modify(true);
                            end;
                        until MaintenanceFormActivities.Next = 0;
                    end;

                    Rec.Posted := true;
                    Rec."Posting Date" := Today;
                    Rec."Document Status" := Rec."document status"::Issued;
                    Rec.Modify(true);
                    Message('Posted Successfully ');
                end;
            }
            action(Approvals)
            {
                AccessByPermission = TableData "Approval Entry" = R;
                ApplicationArea = Suite;
                Caption = 'Approvals';
                Image = Approvals;
                ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                trigger OnAction()
                var
                    WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Submit_Promoted; Submit)
                {
                }
            }
            group(Category_Category8)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category9)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Maintenance;
    end;

    var
        PostedMaintenanceActivities: Record "Posted Maintenance Activities";
        MaintenanceLines: Record "Maintenance Lines";
        MaintenanceFormActivities: Record "Maintenance Form Activities";
        ICTInventory: Record "ICT Inventory";
}

#pragma implicitwith restore

