Page 75275 "Final Evaluation Report Card"
{
    PageType = Card;
    SourceTable = "Bid Tabulation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Evaluation ID"; "Financial Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; "Raised By")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; "Procurement Method")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Special RFQ"; "Special RFQ")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("<General Procurement Remarks>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Committee Remarks';
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
                field("Procurement Officer License No"; "Procurement Officer License No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Tender Committee Role"; "Tender Committee Role")
                {
                    ApplicationArea = Basic;
                }
                field("Designation/Title"; "Designation/Title")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; "Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Date"; "Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Completion Date"; "Evaluation Completion Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Evaluation Template"; "Bid Evaluation Template")
                {
                    ApplicationArea = Basic;
                }
                field("Award Type"; "Award Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appointed Bid Opening Comm"; "Appointed Bid Opening Comm")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Appointed Bid Evaluation Com"; "Appointed Bid Evaluation Com")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("General Procurement Remarks"; "General Procurement Remarks")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Committee Remarks';
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
                group("Key Statistics")
                {
                    Caption = 'Key Statistics';
                    field("No of submitted bids"; "No of submitted bids")
                    {
                        ApplicationArea = Basic;
                    }
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control20; "Final Evaluation Report Line")
            {
                SubPageLink = "Tabulation ID" = field(Code);
                ApplicationArea = All;
            }
        }
        area(FactBoxes)
        {
            part("Attached Documents List"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Documents';
                SubPageLink = "Table ID" = const(Database::"Bid Tabulation Header"), "No." = field(Code);
                UpdatePropagation = Both;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
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
                    Enabled = "code" <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
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
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Visible = true;

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadEvalreportDocuments(Code,'Record',RECORDID,"Primary Region");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;

                    trigger OnAction()
                    begin
                        Commit;
                        // if "Special RFQ" = true then begin
                        //     // RESET;
                        //     // SETRANGE(Code,Code);
                        //     // REPORT.RUN(70139,TRUE,TRUE,Rec);
                        //     if "Award Type" = "award type"::"Multiple Award" then begin
                        //         Reset;
                        //         SetRange(Code, Code);
                        //         Report.Run(70153, true, true, Rec);
                        //     end else begin
                        //         Reset;
                        //         SetRange(Code, Code);
                        //         Report.Run(70139, true, true, Rec);
                        //     end;




                        // end else begin
                        //     if "Award Type" = "award type"::"Multiple Award" then begin
                        //         Reset;
                        //         SetRange(Code, Code);
                        //         Report.Run(70134, true, true, Rec);
                        //     end else begin
                        //         Reset;
                        //         SetRange(Code, Code);
                        //         Report.Run(70043, true, true, Rec);
                        //     end;
                        // end;
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70043, true, true, Rec);
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
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
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
                        ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approval Comments';
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
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Submit Report")
                {
                    ApplicationArea = Suite;
                    Image = PostOrder;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        if Confirm('Are you sure you want to submit?', true) then begin
                            if "Award Type" = "award type"::"Single Award" then begin
                                BidTabulationLine.Reset;
                                BidTabulationLine.SetRange("Tabulation ID", Code);
                                BidTabulationLine.SetRange("Tabulation Type", BidTabulationLine."tabulation type"::"Evaluation Report");
                                BidTabulationLine.SetRange("Evaluation Committee Recomm", BidTabulationLine."evaluation committee recomm"::Awarded);
                                if not BidTabulationLine.FindSet then begin
                                    if Confirm('Are you sure you want to submit without awarding a vendor?', true) then begin
                                        //ERROR('Kindly ensure you have awarded atleast one bidder');
                                        if "Document Status" = "document status"::Submitted then begin
                                            Message('The report has already been Submitted');
                                        end;
                                        if "Document Status" <> "document status"::Submitted then begin
                                            TestField("General Procurement Remarks");
                                            "Document Status" := "document status"::Submitted;
                                            Modify(true);
                                            //  Procurement.FnSendEmaiNotificationHOD(Rec);
                                            Message('Submitted Successfully');
                                        end;
                                    end;



                                end else begin
                                    if "Document Status" = "document status"::Submitted then begin
                                        Message('The report has already been Submitted');
                                    end;
                                    if "Document Status" <> "document status"::Submitted then begin
                                        TestField("General Procurement Remarks");
                                        "Document Status" := "document status"::Submitted;
                                        Modify(true);
                                        //Procurement.FnSendEmaiNotificationHOD(Rec);
                                        Message('Submitted Successfully');
                                    end;
                                end;
                            end;

                            if "Award Type" = "award type"::"Multiple Award" then begin
                                if "Document Status" = "document status"::Submitted then begin
                                    Message('The report has already been Submitted');
                                end;
                                if "Document Status" <> "document status"::Submitted then begin
                                    TestField("General Procurement Remarks");
                                    "Document Status" := "document status"::Submitted;
                                    Modify(true);
                                    //  Procurement.FnSendEmaiNotificationHOD(Rec);
                                    Message('Submitted Successfully');
                                end;
                            end;
                        end;
                        /*BidTabulationHeader.RESET;
                        BidTabulationHeader.SETRANGE(Code,BidTabulationHeader.Code);
                        IF BidTabulationHeader.FINDSET THEN BEGIN
                        BidTabulationHeader."Document Status":=BidTabulationHeader."Document Status"::Submitted;*/


                        // END;
                        //IF code
                        //ReleasePurchDoc.ReleaseVendDebarment(Rec);

                    end;
                }
                action("Reopen Report")
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        TestField("Document Status", "document status"::Submitted);
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        UserSetup.SetRange("Procurement officer", false);
                        if UserSetup.FindSet then begin
                            Error('You do not have sufficient rights');
                        end;
                        if Confirm('Are you sure you want to Reopen This Document', true) then begin
                            "Document Status" := "document status"::Active;
                            Message('ReOpened Successfully');
                        end;
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                // Visible = false;
                action("Tender Bids")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison WorkSheet';
                    Image = Worksheet;
                    RunObject = Page "Cost Comparison Sheet";
                    RunPageLink = "Bid Evaluation Register" = field("Finance Bid Evaluation Registe");
                }
                action("Opening Committee Members")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),
                                  Type = const("Bid Opening");
                }
                action("Evaluation Committee Members")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field(Code),
                                  Type = const(Evaluation);
                }
                action("Suggest E-bids")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest E-bids';
                    Ellipsis = true;
                    Image = Suggest;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestFinalEvalReport(Rec);
                    end;
                }
                action("Import Manual Bids")
                {
                    ApplicationArea = Basic;
                    Image = Import;
                    Visible = false;
                    // RunObject = XMLport UnknownXMLport70001;
                }
                action("Proceed To Proffesional Opinion")
                {
                    ApplicationArea = Suite;
                    Caption = 'Proceed To Proffesional Opinion';
                    Ellipsis = true;
                    Image = PostDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = true;

                    trigger OnAction()
                    begin
                        TestField("Procurement Method");
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        if UserSetup.FindSet then begin
                            //  IF  UserSetup."HOD Supply Chain"= FALSE THEN
                            //    ERROR('You Do Not Have Rights To Create a Professional Opinion,Kindly Contact Head Of Supply Chain Department!!!');
                            //  END ELSE

                            Procurement.PostFinalEvaluationReport(Rec);
                            "Opinion Generated" := true;
                            Modify(true);
                        end;
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalsMgmt.CheckBidTabulationApprovalPossible(Rec) THEN
                        // ApprovalsMgmt.OnSendBidTabulationForApproval(Rec);
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //ApprovalsMgmt.OnCancelBidTabulationApprovalRequest(Rec);
                        //WorkflowWebhookMgt.FindAndCancel(RECORDID);
                    end;
                }
                action("Cancel Report")
                {
                    ApplicationArea = Suite;
                    Image = Cancel;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        if Confirm('Are you sure you want to Cancel?', true) then begin

                            TestField("General Procurement Remarks");
                            "Document Status" := "document status"::Cancelled;
                            "Cancelled By" := UserId;
                            "Cancelled On" := CurrentDatetime;
                            Modify(true);
                            Message('Cancelled Successfully');
                        end;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Import Manual Bids_Promoted"; "Import Manual Bids")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'workflow Process', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref("Cancel Report_Promoted"; "Cancel Report")
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
                actionref(Comment_Promoted; Comment)
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
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Submit Report_Promoted"; "Submit Report")
                {
                }
                actionref("Reopen Report_Promoted"; "Reopen Report")
                {
                }
                actionref("Tender Bids_Promoted"; "Tender Bids")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(AttachDocuments_Promoted; AttachDocuments)
                {
                }
                actionref("Opening Committee Members_Promoted"; "Opening Committee Members")
                {
                }
                actionref("Evaluation Committee Members_Promoted"; "Evaluation Committee Members")
                {
                }
                actionref("Suggest E-bids_Promoted"; "Suggest E-bids")
                {
                }
                actionref("Proceed To Proffesional Opinion_Promoted"; "Proceed To Proffesional Opinion")
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
                {
                }
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        licenseno := false;
        if "Approval Status" = "approval status"::Released then begin
            licenseno := true;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        licenseno := false;
        if "Document Status" = "document status"::Submitted then begin
            licenseno := true;
        end;
        IFSList.Reset;
        IFSList.SetRange(Code, "IFS Code");
        IFSList.SetRange("Special RFQ", true);
        if IFSList.FindSet then begin
            "Special RFQ" := true;
            Modify(true);
        end;
        StandIFS.Reset;
        StandIFS.SetRange(Code, "IFS Code");
        if StandIFS.FindFirst then begin
            "Procurement Method" := Format(StandIFS."Procurement Method");
            Modify(true);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Evaluation Report";
    end;

    trigger OnOpenPage()
    begin
        licenseno := false;
        if "Document Status" = "document status"::Submitted then begin
            licenseno := true;
        end;
        IFSList.Reset;
        IFSList.SetRange(Code, "IFS Code");
        IFSList.SetRange("Special RFQ", true);
        if IFSList.FindSet then begin
            "Special RFQ" := true;
            Modify(true);
        end;
        StandIFS.Reset;
        StandIFS.SetRange(Code, "IFS Code");
        if StandIFS.FindFirst then begin
            "Procurement Method" := Format(StandIFS."Procurement Method");
            Modify(true);
        end;
        if "Document Status" = "document status"::Submitted then begin
            CurrPage.Editable := false;


            if "Approval Status" = "approval status"::Released then begin
                CurrPage.Editable := false;
            end;
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
        // DMSDocuments: Record "DMS Documents";
        // DMSManagement: Codeunit "DMS Management";
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        IFSList: Record "Standard Purchase Code";
        StandIFS: Record "Standard Purchase Code";
        BidTabulationLine: Record "Bid Tabulation Line";
        UserSetup: Record "User Setup";
}

