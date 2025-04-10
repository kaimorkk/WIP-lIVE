

page 75066 "Projects Works PRNs"
{
    Caption = 'Purchase Requisition';
    DeleteAllowed = false;
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
                }
                field("PRN Type"; Rec."PRN Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        CspPlannedY: Record "CSP Planned Years";
                    begin
                        CspPlannedY.reset;
                        CspPlannedY.SetRange(Current, true);
                        if CspPlannedY.findfirst then begin
                            rec.Job := CspPlannedY."Annual Year Code";
                            rec.validate(rec.Job);
                        end;

                    end;
                }

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }

                // field(Description; Rec.Description)
                // {
                //     ApplicationArea = Basic;
                //     Editable = not OpenApprovalEntriesExist;
                //     NotBlank = true;
                //     ShowMandatory = true;
                // }

                // field("Priority Level"; Rec."Priority Level")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Programme Name';
                }

                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    caption = 'Department Name';
                }

                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                }
                // field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                // {
                //     ApplicationArea = Basic;
                // }
                field("Purchaser Code"; Rec."Purchaser Code2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Supply Chain Officer';
                    Visible = PurchaseCode;
                    TableRelation = "Salesperson/Purchaser" /* where("Global Dimension 1 Code" = field("Shortcut Dimension 1 Code")) */;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        //SalesPerson: record Employee;
                        SalesPerson: record "User Setup";
                        SaleS: Record "Salesperson/Purchaser";
                    begin
                        SaleS.Reset();
                        SaleS.SetRange(code, rec."Purchaser Code2");
                        if SaleS.FindFirst() then begin
                            SalesPerson.reset;
                            //SalesPerson.setrange(SalesPerson."No.", rec."Purchaser Code");
                            SalesPerson.setrange(SalesPerson."Employee No.", SaleS."Employee No");
                            if SalesPerson.findfirst then begin
                                rec."Purchaser Code2" := SaleS."Employee No";
                                //rec."Assigned Officer" := SalesPerson."full name";
                                rec."Assigned Officer" := SalesPerson."Employee Name";
                                rec."Assigned User ID" := SalesPerson."User ID"
                            end else
                                Rec."Assigned Officer" := '';
                        end;
                    end;
                }
                field("Assigned Officer"; Rec."Assigned Officer")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Job; Rec.Job)
                {       // Caption = 'Project ID';
                    ApplicationArea = Basic;
                    // Caption = 'Project ID';
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                // field("PP Funding Source ID"; Rec."PP Funding Source ID")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    editable = false;
                }
                field("PP Total Budget"; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PP Total Actual Costs"; Rec."PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                // field("PP Total Commitments"; Rec."PP Total Commitments")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("PP Total Available Budget"; Rec."PP Total Available Budget")
                // {
                //     ApplicationArea = Basic;
                // }
                field("PP Solicitation Type"; Rec."PP Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Other Procurement Methods"; Rec."Other Procurement Methods")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Alternative Procurement Methods field.', Comment = '%';
                    Visible = false;
                }
                field("PP Bid Selection Method"; Rec."PP Bid Selection Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PP Procurement Method"; Rec."PP Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("PP  Invitation Notice Type"; Rec."PP  Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("PRN Conversion Procedure"; Rec."PRN Conversion Procedure")
                {
                    ApplicationArea = Basic;
                }
                field("Ordered PRN"; Rec."Ordered PRN")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Linked IFS No."; Rec."Linked IFS No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Linked LPO No."; Rec."Linked LPO No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Consolidate PRN"; Rec."Consolidate PRN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidate PRN field.';
                    Visible = false;
                }
                field("Consolidate to IFS No."; Rec."Consolidate to IFS No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Consolidate to IFS No. field.';
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }

            }

            part(Control59; "BoQ Specifications")
            {
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = Basic;
            }
            group(PurchLines)
            {
                Caption = 'Project Details';
                Editable = not OpenApprovalEntriesExist;
            }
        }
        area(factboxes)
        {
            // part("Attached Documents"; "Document Attachments")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = const(38),

            //                   "No." = field("No.");
            // }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = true;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = true;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = true;
                Enabled = true;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Notes;
            }
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control6; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Links)
            {
                ApplicationArea = Basic;
            }
            // chartpart("Q5402-01"; "Q5402-01")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Purchase Requisition")
            {
                Caption = 'Purchase Requisition';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
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
                        ApprovalEntries: Page "Approval Entries";
                        approvgmgt: Codeunit "Approvals Mgmt.";
                    begin
                        //WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RECORDID,DATABASE::"Purchase Header","Document Type","No.");
                        approvgmgt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
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

                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup71)
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
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //check Budget Control
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        end;


                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                    end;
                }



                action("Create Invitation Notice")
                {
                    ApplicationArea = Basic;
                    Image = CreateForm;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        if confirm('Do you want to Create invitation Notice?') then
                            Procurement.CreateInvitationNotice(Rec, true, UserId);
                    end;
                }
                action("Notify Supply Chain Officer")
                {
                    ApplicationArea = Basic;
                    Image = Apply;

                    trigger OnAction()
                    var
                        PurchHeader: Record "Purchase Header";
                        Usersetup: Record "User Setup";
                        Body: Code[150];
                        SMTP: Codeunit "Email Message";
                        CompanyInfo: Record "Company Information";
                        Email2: Code[50];
                        ProcRequest: Record "Procurement Request";
                        ProcOff: Record Employee;
                        Email: Codeunit Email;
                        EmailMessage: Codeunit "Email Message";
                    begin
                        if not confirm('Do you want to Send Notification to  employee?') then exit;
                        //PurchHeader.RESET;
                        CompanyInfo.Get;
                        Email2 := CompanyInfo."Administrator Email";

                        ProcOff.Reset;
                        ProcOff.SetRange(ProcOff."No.", Rec."Purchaser Code2");
                        if ProcOff.Find('-') then begin
                            Body := 'You have been assigned a procurement Requisition. Kindly login to Microsoft Dynamics Business Central to Action.';
                            EmailMessage.Create(ProcOff."Company E-Mail", 'Purchase Requisition Assignment', Body, true);
                            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
                            Message('Notified Successfully');
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
                    Enabled = not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        Rec.TestField(Description);
                        //TESTFIELD("Requisition Amount");
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        end;

                        //if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("Personnel Specification")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    RunObject = Page "PRN Personnel Specification";
                    RunPageLink = "Document No." = field("No."),
                                  "Document Type" = field("Document Type");
                }
                action("Equipment Specification")
                {
                    ApplicationArea = Basic;
                    Image = Giro;
                    RunObject = Page "PRN Equipment Specification";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("No.");
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Visible = false;

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        // Commitment.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        // DeleteCommitment.Reset;
                        // DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        // DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        // DeleteCommitment.DeleteAll;
                        // //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

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
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Notify Supply Chain Officer_Promoted"; "Notify Supply Chain Officer")
                {
                }
                actionref("Check Budget Availability_Promoted"; "Check Budget Availability")
                {
                }
                actionref("Cancel Budget Commitment_Promoted"; "Cancel Budget Commitment")
                {
                }
                actionref(CopyDocument_Promoted; CopyDocument)
                {
                }
                actionref("Create Invitation Notice_Promoted"; "Create Invitation Notice")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
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
                Caption = 'Manage', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Posting', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
            group(Category_Category7)
            {
                Caption = 'Print', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
            group(Category_Category8)
            {
                Caption = 'Comments', Comment = 'Generated from the PromotedActionCategories property index 7.';

                actionref("Personnel Specification_Promoted"; "Personnel Specification")
                {
                }
                actionref("Equipment Specification_Promoted"; "Equipment Specification")
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref("Co&mments_Promoted"; "Co&mments")
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
        //JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        // SetControlAppearance;

        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."Procurement Type" := 'WORKS';

        if (Rec.Status = Rec.Status::"Pending Approval") then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."PRN Type" := Rec."prn type"::"Project Works";
        Rec."Requisition Product Group" := Rec."requisition product group"::Works;
        Rec."Procurement Type" := 'WORKS';
        Rec."Procurement Plan ID" := ProcSetup."Effective Procurement Plan";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."PRN Type" := Rec."prn type"::"Project Works";
        Rec."Requisition Product Group" := Rec."requisition product group"::Works;
        Rec."Procurement Type" := 'WORKS';
        Rec."Procurement Plan ID" := ProcSetup."Effective Procurement Plan";
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        PurchaseCode := false;
        if (Rec.Status = Rec.Status::Released) then begin
            PurchaseCode := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        // IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
        //  FILTERGROUP(2);
        //  SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
        //  FILTERGROUP(0);
        // END;
        PurchaseCode := false;
        if (Rec.Status = Rec.Status::Released) then begin
            PurchaseCode := true;
        end;
        if (Rec.Status = Rec.Status::"Pending Approval") then begin
            CurrPage.Editable := false;
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
        AvailableBudget: Decimal;
        Commitment: Codeunit "Procurement Processing";
        // DeleteCommitment: Record "Commitment Entries1";
        s: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ProcSetup: Record "Procurement Setup";
        PurchaseCode: Boolean;


    local procedure SetControlAppearance()
    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        //OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);


        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // CanCancelApprovalForRecord :=  //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

#pragma implicitwith restore

