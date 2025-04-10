

page 70108 "Disposal Plan Header"
{
    PageType = Card;
    SourceTable = "Annual Disposal plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Department Filter"; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Filter field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control21; "Disposal Plan Lines")
            {
                SubPageLink = "Disposal header" = field(No);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control15; "Purchase Order Subform")
            {
                ApplicationArea = Basic;
            }
            part(Control16; "Purch. Invoice Subform")
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
        area(navigation)
        {
            group("Procurement Plan")
            {
                Caption = 'Procurement Plan';
                action("Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Approval';
                    Visible = true;
                    ToolTip = 'Executes the Request for Approval action.';
                    trigger OnAction()
                    begin
                        //SendForApproval() ;
                    end;
                }
                action("Load From Functional Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Load From Functional Plans';
                    Visible = true;
                    trigger OnAction()
                    var
                        ProcPlanItem: Record "Procurement Plan1";
                        BudgetEntries: Record "Procurement Plan Entry1";
                        GenPostingSetup: Record "General Posting Setup";
                        FAPostingGp: Record "FA Posting Group";
                        FADepreciation: Record "FA Depreciation Book";
                        ItemRec: Record Item;
                        Window: Dialog;
                        DisposalPlanLines: Record "Disposal Plan Lines";
                        DisposalPlanLinesN: Record "Disposal Plan Lines";
                        LineNumber: Integer;
                        DisposalPlanLines1: Record "Disposal Plan Lines";
                        planHeader: Record "Annual Disposal plan Header";
                    begin
                        planHeader.RESET;
                        planHeader.SETRANGE("Disposal Catetory", planHeader."Disposal Catetory"::"Functional Disposal");
                        planHeader.setrange("Consolidate Disposal Plan", Rec.No);
                        planHeader.SETRANGE("Document Status", planHeader."Document Status"::Submitted);
                        if planHeader.FINDSET then begin
                            repeat
                                DisposalPlanLines.RESET;
                                DisposalPlanLines.SETRANGE("Disposal Catetory", DisposalPlanLines."Disposal Catetory"::"Functional Disposal");
                                DisposalPlanLines.SETRANGE("Disposal header", planHeader.No);
                                DisposalPlanLines.SETRANGE("Loaded to Consolidated Plan", false);
                                if DisposalPlanLines.FINDSET then begin
                                    repeat

                                        DisposalPlanLines1.RESET;
                                        if DisposalPlanLines1.FINDLAST then
                                            LineNumber := DisposalPlanLines1."Line No." + 1;

                                        DisposalPlanLinesN.INIT;
                                        DisposalPlanLinesN.TRANSFERFIELDS(DisposalPlanLines);
                                        DisposalPlanLinesN."Disposal header" := Rec.No;
                                        DisposalPlanLinesN."Line No." := LineNumber;
                                        DisposalPlanLinesN."Disposal Catetory" := DisposalPlanLinesN."Disposal Catetory"::"Consolidated Disposal";
                                        if DisposalPlanLinesN.INSERT(true) then begin
                                            DisposalPlanLines."Loaded to Consolidated Plan" := true;
                                            DisposalPlanLines.MODIFY(true);
                                        end;

                                    until DisposalPlanLines.NEXT = 0;
                                end;
                            until planHeader.NEXT = 0;
                        end;
                        MESSAGE('Disposal Items Loaded from Functional Disposal Plans Successfully');
                    end;
                }
               
                action("Import Disposal Plan")
                {
                    ApplicationArea = Basic;
                    RunObject = XMLport "Import Procurement Plan";
                    ToolTip = 'Executes the Import Disposal Plan action.';
                }
                action("Update Budget Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Budget Entries';
                    Image = UpdateUnitCost;
                    Visible = false;
                    ToolTip = 'Executes the Update Budget Entries action.';
                    trigger OnAction()
                    begin
                        ProcPlanItem.Reset;
                        ProcPlanItem.SetRange(ProcPlanItem."Plan Year", Rec.No);
                        //ProcPlanItem.SETRANGE(Type,ProcPlanItem.Type::"G/L Account");
                        ProcPlanItem.SetFilter(ProcPlanItem."Estimated Cost", '<>%1', 0);
                        if ProcPlanItem.Find('-') then begin

                            repeat
                                BudgetEntries.Reset;
                                BudgetEntries.SetRange("Budget Name", ProcPlanItem."Plan Year");
                                BudgetEntries.SetRange("Procurement Item", ProcPlanItem."Plan Item No");
                                //BudgetEntries.SETRANGE("G/L Account No.",ProcPlanItem."No.");
                                if BudgetEntries.FindSet then begin
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";

                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    //BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";
                                    if BudgetEntries.Amount <> 0 then
                                        BudgetEntries.Modify(true);
                                end else begin

                                    BudgetEntries.Init;
                                    BudgetEntries."Entry No." := 0;
                                    BudgetEntries.Date := Rec."Start Date";
                                    BudgetEntries."Budget Name" := ProcPlanItem."Plan Year";
                                    BudgetEntries."G/L Account No." := ProcPlanItem."No.";
                                    BudgetEntries.Description := ProcPlanItem."Item Description";
                                    BudgetEntries."Global Dimension 1 Code" := ProcPlanItem."Department Code";
                                    // BudgetEntries."Global Dimension 2 Code":=ProcPlanItem."Global Dimension 2 Code";
                                    BudgetEntries.Amount := ProcPlanItem."Estimated Cost";
                                    BudgetEntries."Procurement Item" := ProcPlanItem."Plan Item No";

                                    //Update G/L if Item
                                    if ProcPlanItem.Type = ProcPlanItem.Type::Item then begin

                                        if ItemRec.Get(ProcPlanItem."No.") then begin
                                            GenPostingSetup.Reset;
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Bus. Posting Group", '');
                                            GenPostingSetup.SetRange(GenPostingSetup."Gen. Prod. Posting Group", ItemRec."Gen. Prod. Posting Group");
                                            if GenPostingSetup.Find('+') then
                                                BudgetEntries."G/L Account No." := GenPostingSetup."Inventory Adjmt. Account";
                                        end;
                                    end;

                                    //Update GL if FA
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"Fixed Asset" then begin
                                        FADepreciation.Reset;
                                        FADepreciation.SetRange(FADepreciation."FA No.", ProcPlanItem."No.");
                                        if FADepreciation.Find('-') then
                                            if FAPostingGp.Get(FADepreciation."FA Posting Group") then
                                                if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                                    BudgetEntries."G/L Account No." := FAPostingGp."Acquisition Cost Account";
                                    end;

                                    //Update GL if GL
                                    if ProcPlanItem.Type = ProcPlanItem.Type::"G/L Account" then
                                        BudgetEntries."G/L Account No." := ProcPlanItem."No.";


                                    BudgetEntries.Insert(true);
                                end;


                            until ProcPlanItem.Next = 0;

                            Message('Update Complete!');

                        end;
                    end;
                }
            }
             group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant)
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                      Caption = '&Approvals';
                      Image = Approvals;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Import Disposal Plan_Promoted"; "Import Disposal Plan")
                {
                }
                actionref("Update Budget Entries_Promoted"; "Update Budget Entries")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref("&Approvals_Promoted"; "&Approvals")
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
            }
        }
    }
    trigger OnNewRecord(BelowXrec: Boolean)
    var
        myInt: Integer;
    begin
        Rec."Disposal Catetory" := Rec."Disposal Catetory"::"Consolidated Disposal";
    end;

    var
        ProcPlanItem: Record "Procurement Plan1";
        BudgetEntries: Record "Procurement Plan Entry1";
        GenPostingSetup: Record "General Posting Setup";
        FAPostingGp: Record "FA Posting Group";
        FADepreciation: Record "FA Depreciation Book";
        ItemRec: Record Item;
        Window: Dialog;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

#pragma implicitwith restore

