

page 75237 "Standard Purchase Requisition"
{
    Caption = 'Standard Purchase Requisition';
    // DeleteAllowed = false;
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }

                field("PRN Type"; Rec."PRN Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Purchase Requisition Type';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        EmployeeRec: record Employee;
                        UserSetUp: record "User Setup";
                        dimesionValue: Record "Dimension Value";
                    begin
                        if UserSetUp.Get(UserId) then begin
                            UserSetUp.TestField("Global Dimension 1 Code");
                            UserSetUp.TestField("Shortcut Dimension 2 Code");
                            rec."Shortcut Dimension 1 Code" := UserSetUp."Global Dimension 1 Code";
                            //rec."Location Code" := UserSetUp."Global Dimension 1 Code";
                            rec."Shortcut Dimension 2 Code" := UserSetUp."Shortcut Dimension 2 Code";
                            dimesionValue.Reset();
                            dimesionValue.SetRange(dimesionValue.code, UserSetUp."Global Dimension 1 Code");
                            if dimesionValue.findfirst then
                                rec."Department Name" := dimesionValue.Name;
                        end;
                    end;

                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {



                //     ApplicationArea = Basic;
                // }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                // field("Requisition Template ID"; Rec."Requisition Template ID")
                // {
                //     ApplicationArea = Basic;
                // }


                field("Priority Level"; Rec."Priority Level")
                {
                    ApplicationArea = Basic;

                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field("Geographical Location Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Programme Name';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Admin Unit Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                }
                // field("Directorate Code1"; Rec."Directorate Code1")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Department Code"; Rec."Department Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Department/Center Code';
                // }

                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                // field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    editable = false;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    editable = false;
                    Caption = 'Budget';
                    ShowMandatory = true;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    editable = false;
                    Caption = 'Budget Line';
                    ShowMandatory = true;
                }


                field("PP Total Budget"; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("PP Total Actual Costs"; Rec."PP Total Actual Costs")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field("PP Total Commitments"; Rec."PP Total Commitments")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field("PP Total Available Budget"; Rec."PP Total Available Budget")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field("Requisition Amount"; Rec."Requisition Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition Amount field.';
                }

                // field("PP Solicitation Type"; Rec."PP Solicitation Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("PP Procurement Method"; Rec."PP Procurement Method")
                // {
                //     ApplicationArea = Basic;
                // }

                // field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                // {
                //     ApplicationArea = Basic;
                // }

                // field("PP  Invitation Notice Type"; Rec."PP  Invitation Notice Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("PRN Conversion Procedure"; Rec."PRN Conversion Procedure")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Ordered PRN"; Rec."Ordered PRN")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Linked IFS No."; Rec."Linked IFS No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Linked LPO No."; Rec."Linked LPO No.")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
            }
            part(PurchLines; "Purchase Requisition Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Document No." = field("No.");
                ApplicationArea = Basic;
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
                // action(Approve)
                // {
                //     ApplicationArea = Suite;
                //     Caption = 'Approve';
                //     Image = Approve;
                //     Promoted = true;
                //     PromotedCategory = Category4;
                //     PromotedIsBig = true;
                //     PromotedOnly = true;
                //     ToolTip = 'Approve the requested changes.';
                //     Visible = OpenApprovalEntriesExistForCurrUser;

                //     trigger OnAction()
                //     var
                //     //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //     begin
                //         //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
            group(ActionGroup21)
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        Pline: Record "Purchase Line";
                        pplan: Record "Procurement Plan Entry";
                        Availlable: Decimal;
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Pline.Reset();
                        Pline.setrange("Document No.", Rec."No.");
                        if Pline.findset() then begin
                            Repeat
                                Pline.TestField("Procurement Plan ID");
                                Pline.TestField("Procurement Plan Entry No");
                                Pline.TestField("Budget");
                                Pline.TestField("Budget Line");
                                Pline.TestField("No.");
                                IF Pline.Amount = 0 THEN begin
                                    ERROR('Error! Amount Cannot be zero');
                                end;
                                pplan.reset();
                                pplan.SetRange("Procurement Plan ID", Pline."Procurement Plan ID");
                                pplan.setrange("Entry No.", pline."Procurement Plan Entry No");
                                if pplan.findset() then begin
                                    pplan.calcfields("Total PRN Commitments");
                                    Availlable := pplan."Line Budget Cost" - pplan."Total PRN Commitments";
                                    if availlable > 0 then begin
                                        if ((pline.Amount + pplan."Total PRN Commitments") > pplan."Line Budget Cost") then begin
                                            ERROR('You have exceeded the budget on Item No %1 :%2 , Availlable budget is %3', Pline."No.", Pline.Description, Availlable);
                                        end;
                                    end else begin
                                        if ((pline.Amount + pplan."Total PRN Commitments") > pplan."Line Budget Cost") then begin
                                            ERROR('You have exceeded the budget, Availlable budget is 0');
                                        end;
                                    end;

                                end;


                            Until Pline.next = 0;
                        end;
                        rec.Status := Rec.Status::Released;
                        rec.modify(true);
                        message('Released Sucessfully');
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
                        if not Confirm('Do you want to reopen this document?') then exit;
                        rec.Status := Rec.Status::Open;
                        rec.modify(true);
                        message('Reopen Sucessfully');
                    end;
                }
            }
            // group("F&unctions")
            // {
            //     Caption = 'F&unctions';
            //     Image = "Action";


            //     action("Notify Procurement Officer")
            //     {
            //         ApplicationArea = Basic;
            //         Image = Apply;
            //         Promoted = true;
            //         PromotedCategory = Process;
            //         PromotedIsBig = true;

            //         trigger OnAction()
            //         var
            //             PurchHeader: Record "Purchase Header";
            //             Usersetup: Record "User Setup";
            //             Body: Code[150];
            //             SMTP: Codeunit "Email Message";
            //             CompanyInfo: Record "Company Information";
            //             Email2: Code[50];
            //             ProcRequest: Record "Procurement Request";
            //         begin
            //             //PurchHeader.RESET;
            //             CompanyInfo.Get;
            //             Email2 := CompanyInfo."Administrator Email";
            //             Usersetup.Reset;
            //             Usersetup.SetRange("User ID", Rec."Assigned User ID");
            //             if Usersetup.Find('-') then begin
            //                 Body := 'You have been assigned a procurement Requisition. Kindly login to Microsoft Dynamics NAV to Action.';

            //                 // //SMTP.Create('Kasneb', Email2,
            //                 // Usersetup."E-Mail", 'PRQ ' + 'No: ' + "No.",
            //                 // 'Dear ' + Usersetup."User ID" + ',<BR><BR>' +
            //                 //  Body
            //                 // , true);

            //                 //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Supply Chain Department.<BR>' + '<BR>');
            //                 //SMTP.Send();
            //             end;

            //             Message('Notified Successfully');
            //         end;
            //     }
            // }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    // Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        Pline: Record "Purchase Line";
                        pplan: Record "Procurement Plan Entry";
                        Availlable: Decimal;
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        if not Confirm('Do you want to send this document for approval?') then exit;
                        Pline.Reset();
                        Pline.setrange("Document No.", Rec."No.");
                        if Pline.findset() then begin
                            Repeat
                                Pline.TestField("Procurement Plan ID");
                                Pline.TestField("Procurement Plan Entry No");
                                // Pline.TestField("Budget");
                                // Pline.TestField("Budget Line");
                                Pline.TestField("No.");
                                IF Pline.Amount = 0 THEN begin
                                    ERROR('Error! Amount Cannot be zero');
                                end;
                                pplan.reset();
                                pplan.SetRange("Procurement Plan ID", Pline."Procurement Plan ID");
                                pplan.setrange("Entry No.", pline."Procurement Plan Entry No");
                                if pplan.findset() then begin
                                    pplan.calcfields("Total PRN Commitments");
                                    Availlable := pplan."Line Budget Cost" - pplan."Total PRN Commitments";
                                    if availlable > 0 then begin
                                        if ((pline.Amount + pplan."Total PRN Commitments") > pplan."Line Budget Cost") then begin
                                            ERROR('You have exceeded the budget on Item No %1 :%2 , Availlable budget is %3', Pline."No.", Pline.Description, Availlable);
                                        end;
                                    end else begin
                                        if ((pline.Amount + pplan."Total PRN Commitments") > pplan."Line Budget Cost") then begin
                                            ERROR('You have exceeded the budget, Availlable budget is 0');
                                        end;
                                    end;

                                end;


                            Until Pline.next = 0;
                        end;
                        // if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //     ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                        CurrPage.close;

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
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    // Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        // WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        // ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        // WorkflowWebhookMgt.FindAndCancel(rec.RecordId);
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                    end;
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
                        //Tag all the Purchase Line entries as Uncommitted
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

                actionref("Check Budget Availability_Promoted"; "Check Budget Availability")
                {
                }
                actionref("Cancel Budget Commitment_Promoted"; "Cancel Budget Commitment")
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

                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
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
        if rec.Status <> rec.Status::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        //ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        if rec.Status <> rec.Status::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
        //JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        //  SetControlAppearance;

        //  Rec."Document Type" := Rec."document type"::"Purchase Requisition";

        // if (Rec.Status = Rec.Status::"Pending Approval") then begin
        //     CurrPage.Editable := false;
        // end;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        UserSetUp: Record "User Setup";
        Empl: Record Employee;
        dimesionValue: record "dimension value";
    begin

        //Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Priority Level" := Rec."Priority Level"::Normal;
        if UserSetUp.Get(UserId) then begin
            UserSetUp.TestField("Global Dimension 1 Code");
            UserSetUp.TestField("Shortcut Dimension 2 Code");
            rec."Shortcut Dimension 1 Code" := UserSetUp."Global Dimension 1 Code";
            rec."Location Code" := UserSetUp."Global Dimension 1 Code";
            rec."Shortcut Dimension 2 Code" := UserSetUp."Shortcut Dimension 2 Code";
            dimesionValue.Reset();
            dimesionValue.SetRange(dimesionValue.code, UserSetUp."Global Dimension 1 Code");
            if dimesionValue.findfirst then
                rec."Department Name" := dimesionValue.Name;
        end;
    end;

    trigger OnOpenPage()
    begin
        if rec.Status <> rec.Status::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;
        // SetControlAppearance;
        // if UserMgt.GetPurchasesFilter <> '' then begin
        //     Rec.FilterGroup(2);
        //     Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
        //     Rec.FilterGroup(0);
        // end;


        // Rec."Document Type" := Rec."document type"::"Purchase Requisition";

        // if (Rec.Status = Rec.Status::"Pending Approval") then begin
        //     CurrPage.Editable := false;
        // end;
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
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ProcSetup: Record "Procurement Setup";
        // DMSDocuments: Record "DMS Documents";
        // DMSManagement: Codeunit "DMS Management";
        CompanyInfo: Record "Company Information";
        ApprovalEntries: Page "Approval Entries";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
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
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
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

