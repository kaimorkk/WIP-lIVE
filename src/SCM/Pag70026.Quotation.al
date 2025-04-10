
/// <summary>
/// Page Quotation (ID 70026).
/// </summary>

page 70026 "Quotation"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Request";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Purchase Line" where("Process Type" = const('RFQ'),
                                                           Ordered = const(false));
                }
                field("Current Budget"; Rec."Current Budget")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                }
                field("Return Time"; Rec."Return Time")
                {
                    ApplicationArea = Basic;
                }
                field("Validity Period"; Rec."Validity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Extended Date"; Rec."Extended Date")
                {
                    ApplicationArea = Basic;
                }
                field("PO Type"; Rec."PO Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Does Not Require TOR"; Rec."Does Not Require TOR")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Path"; Rec."Approval Path")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Asigned User"; Rec."Asigned User")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                    Editable = seepersons;
                    Visible = openingbl2;
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                    Editable = seepersons;
                    Visible = openingbl2;
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                    Editable = seepersons;
                    Visible = openingbl2;
                }
            }
            part(Control1000000016; "Procurement Request Lines")
            {
                SubPageLink = "Requisition No" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Request for Quotation")
            {
                Caption = 'Request for Quotation';
                action("Select Suppliers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Select Suppliers';
                    Image = SelectField;
                    Visible = true;

                    trigger OnAction()
                    var
                        //ApprovalMgt: Codeunit "Approvals Mgmt.";
                        selectsupplierspg: Page "Pre Qualified Suppliers";
                        selectsuppliersrec: Record "Prequalified Suppliers1";
                    begin
                        if Rec."Supplier Category" = '' then begin
                            Error('Please Select Category First!!!');
                        end;
                        selectsuppliersrec.Reset;
                        selectsuppliersrec.SetRange(selectsuppliersrec.Category, Rec."Supplier Category");
                        selectsuppliersrec.SetRange(selectsuppliersrec."Fiscal Year", Rec."Current Budget");
                        if selectsuppliersrec.FindSet then begin
                            selectsupplierspg.GetRefnopg(Rec.No);
                            selectsupplierspg.SetTableview(selectsuppliersrec);
                            //selectsupplierspg.GETRECORD(selectsuppliersrec);
                            selectsupplierspg.Run;

                        end;
                    end;
                }
                action(Action4)
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotation';
                    Image = Replan;
                    Visible = false;

                    trigger OnAction()
                    var
                        Text0000: label 'Are you sure you want to Request for Quoation for record No %1';
                    begin
                        if Confirm(Text0000, true, Rec.No) then
                            RequestForQuotation;
                    end;
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    // RunObject = Page Bidders;
                    // RunPageLink = "Ref No." = field(No);
                    Visible = false;
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
                action("Preview RFQ")
                {
                    ApplicationArea = Basic;
                    Image = PrintVoucher;

                    // trigger OnAction()
                    // var
                    //    // rfqreport: Report "Request for Quotation";
                    //     Supplierrec: Record "Supplier Selection1";
                    // begin
                    //     // 51511025
                    //     Supplierrec.Reset;
                    //     Supplierrec.SetRange(Supplierrec."Reference No.", No);
                    //     if Supplierrec.FindSet then begin
                    //         rfqreport.SetTableview(Supplierrec);
                    //         rfqreport.Run;
                    //     end;
                    // end;
                }
                action("Email RFQ")
                {
                    ApplicationArea = Basic;
                    Caption = 'Move To Evaluation';
                    Image = Email;
                    Visible = Seeapproved3;

                    trigger OnAction()
                    var
                        supplierrec: Record "Prequalified Suppliers1";
                        // rfqreport: Report "Request for Quotation";
                        Supplierrec2: Record "Supplier Selection1";
                        setuprec: Record "Purchases & Payables Setup";
                        // emailrec: Record "SMTP Mail Setup";
                        //  emailcu: Codeunit "SMTP Mail";
                        emailhdr: Text;
                        emailbody: Text;
                    begin
                        /*supplierrec.RESET;
                        supplierrec.SETFILTER(supplierrec."Ref No.",No);
                        supplierrec.SETFILTER(supplierrec.Category,"Supplier Category");
                        supplierrec.SETFILTER(supplierrec.Selected, '%1',TRUE);
                        IF supplierrec.FINDSET THEN  BEGIN
                        REPEAT
                           //Message('%1',supplierrec.Name);
                            supplierrec.TESTFIELD(supplierrec."E-mail");
                            Supplierrec2.RESET;
                            Supplierrec2.SETRANGE(Supplierrec2."Reference No.",No);
                            Supplierrec2.SETRANGE(Supplierrec2."Supplier Name",supplierrec.Name);
                            IF Supplierrec2.FINDSET THEN BEGIN
                              CLEAR(rfqreport);
                              rfqreport.SETTABLEVIEW(Supplierrec2);
                              setuprec.RESET;
                              setuprec.GET;
                        
                              rfq//Report.SaveAsPdf(setuprec."RFQ Documents Path"+(FORMAT(No)+'_'+supplierrec.Name)+'.pdf');
                        
                              emailhdr:='REQUEST FOR QUOTATION: '+ Title+' '+supplierrec.Name;
                              emailbody:='Dear '+supplierrec.Name+'<br><br>';
                              emailbody:=emailbody+'Please Find Attached Request for Quotation and Terms of Reference<br><br>';
                              emailbody:=emailbody+'Fill it up and Drop it at Nema as Indicated<br><br>';
                              emailbody:=emailbody+'Kind Regards<br><br>';
                              emailrec.RESET;
                              emailrec.GET;
                              emailcu.CreateMessage('DYASOFT','edwinmatara@dynasoft.co.ke',supplierrec."E-mail",emailhdr,emailbody,TRUE);
                              emailcu.AddAttachment(setuprec."RFQ Documents Path"+(FORMAT(No)+'_'+supplierrec.Name)+'.pdf',setuprec."RFQ Documents Path"+(FORMAT(No)+'_'+supplierrec.Name)+'.pdf');
                              emailcu.AddAttachment("TOR File Name","TOR File Name");
                              emailcu.Send;
                            END;
                        
                        UNTIL supplierrec.NEXT=0;*/
                        Rec."Quotation Pending Opening" := true;
                        Message('Quotation Email Successfully');
                        CurrPage.Close;
                        Rec."Issued Date" := Today;
                        //END;

                    end;
                }
                action("Technical Evaluation")
                {
                    ApplicationArea = Basic;
                    Enabled = openingbl3;
                    Image = SetupColumns;
                    RunObject = Page "Technical Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = false;
                }
                action("Financial Evaluation")
                {
                    ApplicationArea = Basic;
                    Enabled = openingbl4;
                    Image = SetupLines;
                    RunObject = Page "Financial Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = false;
                }
                action(Award)
                {
                    ApplicationArea = Basic;
                    Enabled = openingbl5;
                    Image = CashFlow;
                    RunObject = Page "Award Quotation Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = false;
                }
                action("Attach Minutes")
                {
                    ApplicationArea = Basic;
                    Image = Attach;

                    trigger OnAction()
                    var
                        torpath: Record "Purchases & Payables Setup";
                        filename: Text;
                        filecu: Codeunit "File Management";
                        rec5: Record "Procurement Request";
                    begin
                        //   filename := filecu.OpenFileDialog('Select Technical File(s)', 'Technical File', '*.PDF|*.*');
                        if filename <> '' then begin
                            if filecu.GetExtension(filename) <> 'pdf' then begin
                                Error('You can Only Attach PDF Files!!!');
                            end;
                            torpath.Reset;
                            torpath.Get;
                            torpath.TestField(torpath."RFQ Documents Path");
                            rec5.Reset;
                            rec5.Get(Rec.No);
                            // filecu.CopyClientFile(filename, torpath."RFQ Documents Path" + No + '_' + filecu.GetFileName(filename), true);
                            Message('File Selected Successfully!');
                            rec5."Technical Minutes" := torpath."RFQ Documents Path" + Rec.No + '_' + filecu.GetFileName(filename);
                            rec5.Modify;
                        end;
                    end;
                }
                action("View Minutes")
                {
                    ApplicationArea = Basic;
                    Image = Documents;

                    trigger OnAction()
                    var
                        rec5: Record "Procurement Request";
                    begin
                        rec5.Reset;
                        rec5.Get(Rec.No);

                        if rec5."Technical Minutes" <> '' then
                            Hyperlink(rec5."Technical Minutes");
                    end;
                }
                action("Create LPO/LSO")
                {
                    ApplicationArea = Basic;
                    Image = Purchase;
                    Visible = seelpo;

                    trigger OnAction()
                    var
                        temprec: Record "Procurement Request" temporary;
                        awardedrec: Record "Tender Bids";
                        awardedlines: Record "Procurement Request Lines";
                        reqline: Record "Purchase Line";
                        lineshere: Record "Procurement Request Lines";
                        TenderBids: Record "Tender Bids";
                    begin
                        /* IF "Minutes File"='' THEN BEGIN
                             ERROR('Please Attach Minutes!!!');
                         END;*/

                        if Rec."Quotation Finished?" = true then begin
                            Error('LPO has already been generated for this Quotation!!!');
                        end;



                        awardedrec.Reset;
                        awardedrec.SetFilter(awardedrec."Requisition No", '%1', Rec.No);
                        awardedrec.SetFilter(awardedrec.Selected, '%1', true);
                        awardedrec.SetFilter(awardedrec."Linked vendor", '<>%1', '');
                        if awardedrec.FindSet then begin
                            repeat
                                temprec.Reset;
                                temprec.Copy(Rec);
                                temprec."Vendor No" := awardedrec."Linked vendor";
                                awardedlines.Reset;
                                awardedlines.SetFilter(awardedlines."Requisition No", '%1', Rec.No);
                                //awardedlines.SETRANGE(awardedlines.Description,awardedrec."Item Description");
                                if awardedlines.FindSet then begin
                                    /*TenderBids.RESET;
                                    //TenderBids.SETRANGE(contactNo,awardedrec."Contact No");
                                    TenderBids.SETRANGE("Requisition No",awardedrec."Requisition No");
                                    IF TenderBids.FINDSET THEN//*/
                                    Rec.CreatePurchaseOrderRFQ(temprec, awardedlines."Line No", awardedrec.Amount, awardedrec)
                                    //ELSE
                                    //CreatePurchaseOrder(temprec,awardedlines."Line No",awardedrec.Amount);
                                end;
                            until awardedrec.Next = 0;
                            Message('LPO Created Successfully!!!. The Quotation has been Archived.');
                            Rec."Quotation Finished?" := true;
                            CurrPage.Close;
                            //=========================================================mark line as used

                            lineshere.Reset;
                            lineshere.SetRange(lineshere."Requisition No", Rec.No);
                            if lineshere.FindSet then
                                repeat
                                    reqline.Reset;
                                    reqline.SetRange(reqline."Requisition No", Rec."Requisition No");
                                    reqline.SetRange(reqline.Description, lineshere.Description);
                                    reqline.SetRange(reqline."Activity Type", lineshere."Activity Type");
                                    reqline.SetRange(reqline."Current Budget", lineshere."Current Budget");
                                    reqline.SetRange(reqline.Activity, lineshere.Activity);
                                    reqline.SetRange(reqline.Amount, lineshere.Amount);
                                    if reqline.FindSet then begin
                                        //reqline."LPO Generated":=TRUE;
                                        reqline.Ordered := true;
                                        reqline.Modify;
                                    end;
                                until lineshere.Next = 0;

                            //===========================================================================
                        end

                    end;
                }
                action("Create Multiple LPO/LSO")
                {
                    ApplicationArea = Basic;
                    Caption = 'Create Multiple LPO/LSO';
                    Image = Purchase;
                    Visible = seelpo;

                    trigger OnAction()
                    var
                        temprec: Record "Procurement Request" temporary;
                        awardedrec: Record "Tender Bids";
                        awardedlines: Record "Procurement Request Lines";
                        reqline: Record "Purchase Line";
                        lineshere: Record "Procurement Request Lines";
                        TenderBids: Record "Tender Bids";
                    begin
                        /* IF "Minutes File"='' THEN BEGIN
                             ERROR('Please Attach Minutes!!!');
                         END;*/

                        if Rec."Quotation Finished?" = true then begin
                            Error('LPO has already been generated for this Quotation!!!');
                        end;

                        temprec.Reset;
                        temprec.Copy(Rec);
                        //temprec."Vendor No":=awardedrec."Linked vendor";
                        awardedlines.Reset;
                        awardedlines.SetFilter(awardedlines."Requisition No", '%1', Rec.No);
                        if awardedlines.FindSet then begin


                            Rec.CreateMultiplePurchaseOrderRFQ(temprec, awardedlines."Line No")
                            //ELSE
                            //CreatePurchaseOrder(temprec,awardedlines."Line No",awardedrec.Amount);
                        end;



                        Message('LPO Created Successfully!!!. The Quotation has been Archived.');
                        Rec."Quotation Finished?" := true;
                        CurrPage.Close;
                        //=========================================================mark line as used

                        lineshere.Reset;
                        lineshere.SetRange(lineshere."Requisition No", Rec.No);
                        if lineshere.FindSet then begin
                            repeat
                                reqline.Reset;
                                reqline.SetRange(reqline."Requisition No", Rec."Requisition No");
                                reqline.SetRange(reqline.Description, lineshere.Description);
                                reqline.SetRange(reqline."Activity Type", lineshere."Activity Type");
                                reqline.SetRange(reqline."Current Budget", lineshere."Current Budget");
                                reqline.SetRange(reqline.Activity, lineshere.Activity);
                                reqline.SetRange(reqline.Amount, lineshere.Amount);
                                if reqline.FindSet then begin
                                    //reqline."LPO Generated":=TRUE;
                                    reqline.Ordered := true;
                                    reqline.Modify;
                                end;
                            until lineshere.Next = 0;

                            //===========================================================================
                        end

                    end;
                }
                action("Cost Comparison Sheet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison Sheet';
                    Image = Worksheet;
                    Visible = true;

                    trigger OnAction()
                    begin
                        TenderBids.Reset;
                        TenderBids.SetFilter(TenderBids."Requisition No", Rec.No);
                        Report.Run(70003, true, true, TenderBids);
                    end;
                }
            }
            group(Reports)
            {
                Caption = 'Reports';
                Visible = false;
                action("Request for Quotations")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Quotations';
                    Image = "Report";
                    Visible = false;

                    trigger OnAction()
                    begin
                        SupplierSelect.Reset;
                        SupplierSelect.SetFilter("Reference No.", Rec.No);
                        Report.Run(70002, true, true, SupplierSelect);
                    end;
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print';
                    Image = Print;
                    Visible = false;

                    trigger OnAction()
                    begin
                        SupplierSelect.Reset;
                        SupplierSelect.SetFilter(SupplierSelect."Reference No.", Rec.No);
                        Report.Run(70004, true, true, SupplierSelect);
                        SupplierSelect.Reset;
                    end;
                }
                // action(Archive)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Archive';
                //     Image = Archive;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     Visible = false;

                //     trigger OnAction()
                //     begin
                //         Archive();
                //     end;
                // }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
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
                        //if //ApprovalsMgmt.CheckProcApprovalPossible(Rec) then
                        //ApprovalsMgmt.OnSendProcDocForApproval(Rec);
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
                        //ApprovalsMgmt.OnCancelProcDocApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
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
                        Doctype := Doctype::Procurement;
                        //WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, Database::"Procurement Request", Doctype, Rec.No);
                    end;
                }
                action(Action24)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    Image = Bin;
                    RunObject = Page "Tender Bids";
                    RunPageLink = "Requisition No" = field(No);
                    Visible = openingbl3;

                    trigger OnAction()
                    var
                        supplierrec: Record "Prequalified Suppliers1";
                        //rfqreport: Report "Request for Quotation";
                        Supplierrec2: Record "Supplier Selection1";
                        setuprec: Record "Purchases & Payables Setup";
                        Bidders: Record "Tender Bids";
                        reqlines: Record "Procurement Request Lines";
                    begin
                        ProcurementRequestLines.Reset;
                        ProcurementRequestLines.SetRange("Requisition No", Rec.No);
                        if ProcurementRequestLines.FindSet then begin
                            repeat
                                Supplierrec2.Reset;
                                Supplierrec2.SetRange("Reference No.", Rec.No);
                                if Supplierrec2.FindSet then begin
                                    repeat
                                        Bidders.Reset;
                                        Bidders.SetRange("Requisition No", Rec.No);
                                        Bidders.SetRange("Line No", ProcurementRequestLines."Line No");
                                        Bidders.SetRange("Bidder Name", Supplierrec2."Supplier Name");
                                        if Bidders.FindSet = false then begin
                                            //IF NOT Bidders.GET(No,ProcurementRequestLines."Line No",Supplierrec2."Supplier Name") THEN BEGIN
                                            Bidders.Init;
                                            Bidders."Line No" := ProcurementRequestLines."Line No";
                                            Bidders.Type := Bidders.Type::Item;
                                            Bidders."Linked vendor" := Supplierrec2."Vendor No";
                                            Bidders."Vendor No" := Supplierrec2."Vendor No";
                                            Bidders."Bidder Name" := Supplierrec2."Supplier Name";
                                            Bidders.No := ProcurementRequestLines.No;
                                            Bidders.Description := ProcurementRequestLines.Description;
                                            Bidders.Quantity := ProcurementRequestLines.Quantity;
                                            Bidders."Unit of Measure" := ProcurementRequestLines."Unit of Measure";
                                            Bidders."Unit Price" := ProcurementRequestLines."Unit Price";
                                            Bidders."Requisition No" := Rec.No;
                                            Bidders.Insert;
                                        end;

                                    until Supplierrec2.Next = 0
                                end;
                            until ProcurementRequestLines.Next = 0;
                        end;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Select Suppliers_Promoted"; "Select Suppliers")
                {
                }
                actionref(Action4_Promoted; Action4)
                {
                }
                actionref("Preview RFQ_Promoted"; "Preview RFQ")
                {
                }
                actionref("Email RFQ_Promoted"; "Email RFQ")
                {
                }
                actionref("Technical Evaluation_Promoted"; "Technical Evaluation")
                {
                }
                actionref("Financial Evaluation_Promoted"; "Financial Evaluation")
                {
                }
                actionref(Award_Promoted; Award)
                {
                }
                actionref("Attach Minutes_Promoted"; "Attach Minutes")
                {
                }
                actionref("View Minutes_Promoted"; "View Minutes")
                {
                }
                actionref("Create LPO/LSO_Promoted"; "Create LPO/LSO")
                {
                }
                actionref("Create Multiple LPO/LSO_Promoted"; "Create Multiple LPO/LSO")
                {
                }
                actionref(Action24_Promoted; Action24)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Cost Comparison Sheet_Promoted"; "Cost Comparison Sheet")
                {
                }
                actionref("Request for Quotations_Promoted"; "Request for Quotations")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category8)
            {
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::RFQ;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::RFQ;
    end;

    trigger OnOpenPage()
    var
        glsetup: Record "General Ledger Setup";
    begin
        glsetup.Reset;
        glsetup.Get;
        Rec."Current Budget" := glsetup."Current Budget";

        Seeapproved := false;
        if Rec.Status = Rec.Status::Open then begin
            Seeapproved := true;
        end;
        if Rec.Status <> Rec.Status::Open then begin
            Seeapproved2 := true;
        end;
        if (Rec.Status = Rec.Status::Released) and (Rec."Quotation Pending Opening" = false) then begin
            Seeapproved3 := true;
        end;
        quotationopening := false;

        if UserId = Rec."Asigned User" then begin
            openingbl := true;
        end;

        if Rec."Quotation Pending Opening" = true then begin
            openingbl2 := true;
        end;

        if Rec."Quotation Evaluation" = false then begin
            // openingbl3:=TRUE;
        end;

        if Rec."In Technical?" = true then begin
            if Rec."Quotation Evaluation" = true then begin
                openingbl3 := true;
            end;
        end;

        if Rec."In Financial?" = true then begin
            if Rec."Quotation Evaluation" = true then begin
                openingbl4 := true;
            end;
        end;
        if Rec."In Award?" = true then begin
            if Rec."Quotation Evaluation" = true then begin
                openingbl5 := true;
            end;
        end;
        if Rec.Status <> Rec.Status::Released then begin
            openingbl3 := false;
        end;
        if Rec."In Technical?" = true then begin
            openingbl3 := true;
        end;
        if Rec."In Technical?" = false then begin
            openingbl3 := false;
        end;
        if (Rec.Status = Rec.Status::Released) and (Rec."Quotation Pending Opening" = true) then begin
            openingbl3 := true;
            if Rec."Quotation Evaluation" = true then begin
                seepersons := false;
            end;
            if Rec."Quotation Evaluation" = false then begin
                seepersons := true;
            end;

        end;
        //message('%1',Seeapproved3);
        if Rec."Pending LPO?" = true then begin
            seelpo := true;
        end;
    end;

    var
        FileDirectory: Text[50];
        FileName: Text[500];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer: Record Customer;
        Customer2: Record Customer;
        SupplierSelect: Record "Supplier Selection1";
        SupplierSelect2: Record "Supplier Selection1";
        Mail: Codeunit Mail;
        MailSent: Boolean;
        PrequalifiedSupRec: Record "Prequalified Suppliers1";
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        GLsetup: Record "General Ledger Setup";
        SMTPMail: Codeunit "Email Message";
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        SenderName: Text[250];
        SenderAddress: Text[250];
        Recipients: Text[250];
        ProcurementRequest: Record "Procurement Request";
        SearchString: Text[250];
        RecLink: Record "Record Link";
        ProcurementReqRef: RecordRef;
        Trash: Record "Procurement Request";
        PurchSetup: Record "Purchases & Payables Setup";
        TenderBids: Record "Tender Bids";
        //ApprovalMgt: Codeunit "Approvals Mgmt.";
        CompInfo: Record "Company Information";
        Seeapproved: Boolean;
        Seeapproved2: Boolean;
        Seeapproved3: Boolean;
        quotationopening: Boolean;
        openingbl: Boolean;
        openingbl2: Boolean;
        openingbl3: Boolean;
        openingbl4: Boolean;
        openingbl5: Boolean;
        openingbl6: Boolean;
        "ineval?": Boolean;
        seepersons: Boolean;
        seelpo: Boolean;
        Doctype: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","staff Claims","Payment Voucher","Petty Cash",Imprest,Surrender,Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition",Sclaims,"Salary Voucher","Grant Funding Application",Procurement;
        ProcurementRequestLines: Record "Procurement Request Lines";


    procedure RequestForQuotation()
    var
        UserSetup: Record "User Setup";
        Emp: Record Employee;
        SenderName: Text;
        SenderAddress: Text;
        Recipients: Text;
        SMTPMail: Codeunit "Email Message";
        ProcurementReqRef: RecordRef;
        SearchString: Text;
        RecLink: Record "Record Link";
        FileMangement: Codeunit "File Management";
        NoSuppliers: Integer;
    begin
        ReportID := 70002;
        NoSuppliers := 0;

        SupplierSelect.Reset;
        SupplierSelect.SetRange("Reference No.", Rec.No);
        SupplierSelect.SetRange(Invited, true);
        if SupplierSelect.Find('-') then begin

            Window.Open('processing Supplier ######################1##');
            //    Object.Get(Object.Type::Report, '', ReportID);

            CompInfo.Get;
            SenderAddress := CompInfo."Administrator Email";
            SenderName := CompInfo.Name;//Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";

            repeat

                Subject := 'REQUEST FOR QUOTATION ' + SupplierSelect."Reference No.";
                Body := 'Dear Sir/Madam,<br><br>You are invited to submit quotation based on the attached document.<br><br>Thank you very much.<br><br>Kind regards,<br><br>NEMA Procument.';

                if UserSetup.Get(UserId) then begin

                    PrequalifiedSupRec.Reset;
                    PrequalifiedSupRec.SetRange(PrequalifiedSupRec.Name, SupplierSelect."Supplier Name");
                    if PrequalifiedSupRec.Find('-') then
                        Recipients := PrequalifiedSupRec."E-mail";

                    NoSuppliers := NoSuppliers + 1;
                    // SMTPMail.Create(SenderName, SenderAddress, Recipients, Subject, Body, true);
                    // FileName := FileMangement.ServerTempFileName('.pdf');         //FileName:='Payslip.pdf';
                    SupplierSelect2.Reset;
                    SupplierSelect2.SetRange(SupplierSelect2."Supplier Name", SupplierSelect."Supplier Name");
                    if SupplierSelect2.Find('-') then
                        //Report.SaveAsPdf(Report::"Request for Quotation", FileName, SupplierSelect2);
                        // SMTPMail.AddAttachment(FileName, '');
                        //  SMTPMail.Send;
                        message('');
                end;
            until SupplierSelect.Next = 0;

            Message('RFP Successfully Sent to %1 Suppliers', NoSuppliers);

            Window.Close;
        end else
            Error('There are no Suppliers Selected!');
    end;


    procedure Archive()
    begin

        if Rec.Status = Rec.Status::Open then begin
            Trash.Reset;
            Trash.SetRange(Trash.No, Rec.No);
            Rec.Status := Rec.Status::"Pending Approval";
            Rec."Process Type" := Rec."process type"::RFQ;
            Rec.Modify;
            Message('The Request For Quotation has been Archived');
        end;
    end;
}

#pragma implicitwith restore

