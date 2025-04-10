
Page 75278 "Proffesion Opinion Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Final Evaluation Report ID"; Rec."Final Evaluation Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Lead Name';
                }
                field("Tender Committee Role"; Rec."Tender Committee Role")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                group("Awarded Winner")
                {
                    Caption = 'Awarded Winner';
                    Visible = Corec;
                    field("Awarded Bid No"; Rec."Awarded Bid No")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Awarded Bidder No."; Rec."Awarded Bidder No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Awarded Bidder Name"; Rec."Awarded Bidder Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Award Acceptance Deadline"; Rec."Award Acceptance Deadline")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                    }
                    field("Award Acceptance Response"; Rec."Award Acceptance Response")
                    {
                        ApplicationArea = Basic;
                        Visible = false;
                    }
                }
                group("Key Statistics")
                {
                    Caption = 'Key Statistics';
                    field("No of submitted bids"; Rec."No of submitted bids")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("<General Procurement Remarks>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Proffessional Opinion Remarks';
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("General Procurement Remarks");
                        "General Procurement Remarks".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("General Procurement Remarks");
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         "General Procurement Remarks".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                         //MODIFY;
                        END;*/

                    end;
                }
                field("General Procurement Remarks"; Rec."General Procurement Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proffessional Opinion Remarks';
                    MultiLine = true;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("General Procurement Remarks");
                        "General Procurement Remarks".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        IF ObjText<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("General Procurement Remarks");
                         CLEAR(Obj);
                         Obj.ADDTEXT(ObjText);
                         "General Procurement Remarks".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                         //MODIFY;
                        END;*/

                    end;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Proffesion Opinion Lines")
            {
                SubPageLink = "Tabulation ID" = field(Code);
                ApplicationArea = All;
            }
            group("Procurement Plan Details")
            {
                Caption = 'Procurement Plan Details';
                field("Annual Procurement Plan ID"; Rec."Annual Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Date"; Rec."Procurement Plan Date")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Available Procurement Budget"; Rec."Available Procurement Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Officer License No"; Rec."Procurement Officer License No")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Sourcing History")
            {
                Caption = 'Sourcing History';
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date"; Rec."Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Comm"; Rec."Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Evaluation Com"; Rec."Appointed Bid Evaluation Com")
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
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."code" <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "No." = field(Code);
                    ToolTip = 'View or add comments for the record.';
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    //SubPageLink = "Table ID" = const(Database::"Document Attachment"), "No." = field(), "Document Type" = Filter(Contract);
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                        BIdEvaluation: Record "Bid Tabulation Header";
                    begin
                        BIdEvaluation.Reset();
                        BIdEvaluation.SetRange(code, rec.Code);
                        if BIdEvaluation.FindFirst() then begin
                            RecRef.GetTable(BIdEvaluation);
                            //DocumentAttachmentDetails.SetRecord(BIdEvaluation);
                            DocumentAttachmentDetails.OpenForRecRef(RecRef);
                            DocumentAttachmentDetails.RunModal;
                        end;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;

                    trigger OnAction()
                    begin
                        Commit;
                        if Rec."Award Type" = Rec."award type"::"Multiple Award" then begin
                            Rec.Reset;
                            Rec.SetRange(Code, Rec.Code);
                            Report.Run(70135, true, true, Rec);
                        end else begin
                            Rec.Reset;
                            Rec.SetRange(Code, Rec.Code);
                            Report.Run(70055, true, true, Rec);
                        end;
                    end;
                }
                action("Print Opinion Statement")
                {
                    ApplicationArea = Basic;
                    Image = Print;

                    trigger OnAction()
                    begin
                        Commit;
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(Report::"Professional Opinion Statement", true, true, Rec);
                    end;
                }
                action("Print Opinion")
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;

                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70099, true, true, Rec);
                    end;
                }
                action("Generate Notice of Award")
                {
                    ApplicationArea = All;
                    Image = PostDocument;
                    trigger OnAction()
                    begin
                        Procurement.PostProffesionOpinion(Rec);
                    end;
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(rec.RecordId);
                    end;
                }
                // action("Proceed To Notice Of Award")
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Proceed To Notice Of Award';
                //     Ellipsis = true;
                //     Image = PostDocument;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                //  //   Visible = noa;
                //     trigger OnAction()
                //     begin
                //         Procurement.PostProffesionOpinion(Rec);


                //     end;
                // }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
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
            group(ActionGroup30)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        Rec."Approval Status" := Rec."approval status"::Released;
                        Rec.Modify(true);
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);
                        //Procurement.ReleaseSupplierRatingTemplate(Rec)
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    visible = false;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenVendDebarment(Rec);
                        /*IF Released=FALSE THEN
                          ERROR('Document must be Released');
                        Released:=FALSE;
                        MODIFY;
                        MESSAGE('Supplier Rating Template %1 has been opened successfuly',Code);*/

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                //  Visible = false;
                action("Suggest Final Evaluation Reports")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Final Evaluation Reports';
                    Ellipsis = true;
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestProffesionOpinion(Rec);
                    end;
                }

            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                //Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin

                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Tender Bids")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison WorkSheet';
                    Image = Worksheet;
                    RunObject = Page "Cost Comparison Sheet";
                    RunPageLink = "Bid Evaluation Register" = field("Finance Bid Evaluation Registe");
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Suggest Final Evaluation Reports_Promoted"; "Suggest Final Evaluation Reports")
                {
                }
                actionref("Generate Notice of Award_Promoted"; "Generate Notice of Award")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
                actionref("Print Opinion Statement_Promoted"; "Print Opinion Statement")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Workflow Process', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Tabulation', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Tender Bids_Promoted"; "Tender Bids")
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Comments', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(Comment_Promoted; Comment)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Document Attachments', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        noa := false;
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            noa := true
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        noa := false;
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            noa := true
        end;
        Corec := true;
        if Rec."Award Type" = Rec."award type"::"Multiple Award" then begin
            Corec := false;
        end;
        StandIFS.Reset;
        StandIFS.SetRange(Code, Rec."IFS Code");
        if StandIFS.FindFirst then begin
            Rec."Procurement Method" := Format(StandIFS."Procurement Method");
            Rec.Modify(true);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Professional Opinion";
    end;

    trigger OnOpenPage()
    begin
        noa := false;
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            noa := true
        end;
        Corec := true;
        if Rec."Award Type" = Rec."award type"::"Multiple Award" then begin
            Corec := false;
        end;
        StandIFS.Reset;
        StandIFS.SetRange(Code, Rec."IFS Code");
        if StandIFS.FindFirst then begin
            Rec."Procurement Method" := Format(StandIFS."Procurement Method");
            Rec.Modify(true);
        end;

        if Rec."Approval Status" = Rec."approval status"::"Pending Approval" then begin
            CurrPage.Editable := false;
        end;

        if Rec."Approval Status" = Rec."approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        noa: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        Corec: Boolean;
        StandIFS: Record "Standard Purchase Code";
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

