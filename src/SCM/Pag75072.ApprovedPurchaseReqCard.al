

page 75072 "Approved Purchase Req Card"
{
    Caption = 'Project Purchase Requisition';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request-By No. field.';
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request-By Name field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a code for the location where you want the items to be placed when they are received.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = false;
                    ToolTip = 'Specifies the date when the order was created.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when the purchase invoice is due for payment.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Tittle';
                    ToolTip = 'Specifies the value of the Procurement Tittle field.';
                }
                field("Approved Requisition Amount"; Rec."Approved Requisition Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approved Requisition Amount field.';
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Type field.';
                }
                field("Purchase Type"; Rec."Purchase Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Purchase Type field.';
                }
                field("Procurement Officer"; Rec."Assigned User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Officer';
                    ToolTip = 'Specifies the ID of the user who is responsible for the document.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Unit  Name field.';
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                    ToolTip = 'Specifies the number of archived versions for this document.';
                }
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Procurement Plan field.';
                }
                field("Procurement Plan Item"; Rec."Procurement Plan Item")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Procurement Plan Item field.';
                }
                field("Procurement Plan Item Descript"; Rec."Procurement Plan Item Descript")
                {
                    ApplicationArea = Basic;
                    Caption = 'Procurement Plan Item Description';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Procurement Plan Item Description field.';
                }
                field("General Item Category"; Rec."General Item Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the General Item Category field.';
                }
                field("Item Category"; Rec."Item Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Item Category field.';
                }
                field("Item Category Description"; Rec."Item Category Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Item Category Description field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
            }
            part(PurchLines; "Purchase Requisition Subpage")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                              "No." = field("No."),
                              "Line No." = field("Line No.");
                ApplicationArea = Basic;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
                ApplicationArea = Basic;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Visible = false;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*//if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
            group(ActionGroup13)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action73)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Enabled = false;
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Enabled = false;
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approval;
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        /*IF Status<>Status::Released THEN
                        ERROR(Text001);
                        IF Status=Status::Released THEN BEGIN
                        DocPrint.PrintPurchHeader(Rec);
                          END;*/

                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(50097, true, true, Rec)

                    end;
                }
                action("Initiate Procurement Method")
                {
                    ApplicationArea = Basic;
                    Caption = 'Initiate Procurement Method';
                    Image = CreateSKU;
                    Visible = false;
                    ToolTip = 'Executes the Initiate Procurement Method action.';
                    trigger OnAction()
                    begin
                        PurchHeader.Reset;
                        PurchHeader.SetRange("No.", Rec."No.");
                        if PurchHeader.FindSet then begin
                            Rec.Status := Rec.Status::"In Progress";
                            Rec.Modify;
                        end;
                    end;
                }
                action("Create Procurement Method")
                {
                    ApplicationArea = Basic;
                    Caption = 'Initiate Procurement Method';
                    Image = CreateSKU;
                    ToolTip = 'Executes the Initiate Procurement Method action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Assigned User ID");
                        Rec.TestField("Process Type");
                        if not Confirm('Are you sure you want to initiate procurement process for this requisition', true, Rec."Document Type") then
                            Error('Procurement process Aborted');
                        //CALCFIELDS("Process Type");
                        ProcMethod.Reset;
                        ProcMethod.SetRange(ProcMethod.Code, Rec."Process Type");
                        if ProcMethod.FindSet then begin
                            /* PurchLines.RESET;
                            PurchLines.SETRANGE("Document No.","No.");
                            IF PurchLines.FINDSET THEN BEGIN
                           REPEAT
                              IF ProcMethod."Process Type"=ProcMethod."Process Type"::RFQ THEN
                                BEGIN
                                  Procurement.GenerateRFQ(PurchLines);
                                 END;
                                 IF ProcMethod."Process Type"=ProcMethod."Process Type"::RFP THEN
                                BEGIN
                                  Procurement.GenerateRFQ(PurchLines);
                                 END;
                                  IF ProcMethod."Process Type"=ProcMethod."Process Type"::Direct THEN
                                BEGIN
                                  Procurement.GenerateDirect(PurchLines);
                                 END;
                                 UNTIL PurchLines.NEXT=0;
                          END;*/
                            PurchHeader.Reset;
                            PurchHeader.SetRange("No.", Rec."No.");
                            if PurchHeader.FindSet then begin
                                Rec.Status := Rec.Status::"In Progress";
                                Rec.Modify;
                            end;
                            PurchHeader.Reset;
                            PurchHeader.SetRange("No.", Rec."No.");
                            if PurchHeader.FindSet then begin
                                //REPEAT
                                if ProcMethod."Process Type" = ProcMethod."process type"::RFQ then begin
                                    Procurement.GenerateRFQDoc(PurchHeader);
                                end;
                                if ProcMethod."Process Type" = ProcMethod."process type"::RFP then begin
                                    Procurement.GenerateRFQDoc(PurchHeader);
                                end;
                                if ProcMethod."Process Type" = ProcMethod."process type"::Direct then begin

                                    Procurement.GenerateDirectDOC(PurchHeader);
                                end;
                                if ProcMethod."Process Type" = ProcMethod."process type"::Tender then begin

                                    Procurement.GenerateOpenTenderDOC(PurchHeader);
                                end;
                                // UNTIL PurchHeader.NEXT=0
                            end;

                        end;
                        /*
                        //function to send email notification
                        Email2:=CompanyInfo."Administrator Email";
                        Usersetup.RESET;
                        Usersetup.SETRANGE("User ID","Assigned User ID");
                        IF Usersetup.FIND('-') THEN BEGIN
                             Body:= 'You have been assigned a procurement Requisition. Kindly login to Microsoft Dynamics NAV to Action.';
                        
                                    //SMTP.Create('NACOSTI',Email2,
                                    Usersetup."E-Mail",'PRQ '+'No: '+"No.",
                                    'Dear '+Usersetup."User ID"+',<BR><BR>'+
                                     Body
                                    ,TRUE);
                        
                                    //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>Procurement Department.<BR>'+'<BR>');
                                    //SMTP.Send();
                        END;
                        */
                        Rec."Archive Requisitions" := true;
                        Rec.Modify;

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
                action("Notify Procurement Officer")
                {
                    ApplicationArea = Basic;
                    Image = Apply;
                    ToolTip = 'Executes the Notify Procurement Officer action.';
                    trigger OnAction()
                    begin
                        PurchHeader.Reset;

                        Email2 := CompanyInfo."Administrator Email";
                        Usersetup.Reset;
                        Usersetup.SetRange("User ID", Rec."Assigned User ID");
                        if Usersetup.Find('-') then begin
                            Body := 'You have been assigned a procurement Requisition. Kindly login to Microsoft Dynamics Business Central to Action.';

                            // //SMTP.Create('NACOSTI', Email2,
                            // Usersetup."E-Mail", 'PRQ ' + 'No: ' + "No.",
                            // 'Dear ' + Usersetup."User ID" + ',<BR><BR>' +
                            //  Body
                            // , true);

                            //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Supply Chain Department.<BR>' + '<BR>');
                            //SMTP.Send();
                        end;

                        Message('Notified Successfully');
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Initiate Procurement Method_Promoted"; "Initiate Procurement Method")
                {
                }
                actionref("Create Procurement Method_Promoted"; "Create Procurement Method")
                {
                }
                actionref("Notify Procurement Officer_Promoted"; "Notify Procurement Officer")
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Category5)
            {
                actionref(DocAttach_Promoted; DocAttach)
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

    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        /*
        //KUGUN-Calc Avaliable Budget
        SETRANGE("Date Filter",0D,"Order Date");
        CALCFIELDS("Budgeted Amount","Actual Budget Costs","Budget Commitments");
        
        "Remaining Budget":="Budgeted Amount"-("Actual Budget Costs"+"Budget Commitments");
        //End KUGUN-Calc Avaliable Budget
        */

    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::Project;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;

        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        AvailableBudget: Decimal;
        Text001: label 'You can only print a fully approved purchase requisition.';
        Procurement: Codeunit "Procurement Processing";
        ProcMethod: Record "Procurement Method";
        PurchLines: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
        Usersetup: Record "User Setup";
        Body: Code[150];
        SMTP: Codeunit "Email Message";
        CompanyInfo: Record "Company Information";
        Email2: Code[50];
        ProcRequest: Record "Procurement Request";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        //CurrPage.PurchLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange("Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        //CurrPage.UPDATE;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        //CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        //OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

