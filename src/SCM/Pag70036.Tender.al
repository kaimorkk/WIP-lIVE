page 70036 "Tender"
{
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(Tender));

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
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Type"; Rec."Tender Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                }
                field("Validity Period"; Rec."Validity Period")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Validate End Date"; Rec."Tender Validate End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Tender Closing Date"; Rec."Tender Closing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Date"; Rec."Tender Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Extended Date"; Rec."Extended Date")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Status"; Rec."Tender Status")
                {
                    ApplicationArea = Basic;
                }
                field("No of Tender Documents"; Rec."No of Tender Documents")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Amount"; Rec."Tender Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000019; "Procurement Request Lines")
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
            group(Tender)
            {
                Caption = 'Tender';
                action("Mandatory Requirements")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements';
                    Image = Setup;
                    RunObject = Page "Tender Mandatory Requirements";
                    RunPageLink = "Tender No" = field(No);
                }
                action("Technical Specifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Technical Specifications';
                    Image = setup;
                    RunObject = Page "Tender Specifications";
                    RunPageLink = "Requisition No" = field(No);
                }
                action("Close Tender")
                {
                    ApplicationArea = Basic;
                    Caption = 'Close Tender';

                    trigger OnAction()
                    begin
                        Rec.Closed := true;
                        Rec.Modify;
                    end;
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bidders';
                    // RunObject = Page Bidders;
                    //  RunPageLink = "Ref No." = field(No);
                    Visible = false;
                }
                action("Tender Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Summary';
                    RunObject = Page "Tender Bidders Summary";
                    RunPageLink = "Ref No." = field(No);
                }
                action("<Page Supplier Selection>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier Selection';
                    RunObject = Page "Tender Supplier";
                    RunPageLink = "Reference No." = field(No);
                    RunPageView = sorting("Reference No.", "Supplier No");
                    Visible = false;
                }
                action("Cost Comparison Sheet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cost Comparison Sheet';

                    trigger OnAction()
                    begin
                        TenderBids.Reset;
                        TenderBids.SetFilter(TenderBids."Requisition No", Rec.No);
                        Report.Run(70003, true, true, TenderBids);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    RunObject = Page "Document Attachment Details";
                    RunPageLink = "No." = field(No);
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        // RecRef.GETTABLE(Rec);
                        // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        // DocumentAttachmentDetails.RUNMODAL;
                    end;
                }
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        rfpevalrec: Record "RFQ Evaluation Lists";
                        filesrec2: Record "Document Attachment";
                        docrec: Record "Document Attachment";
                    begin
                        //TESTFIELD("Technical Score");
                        //TESTFIELD(Title);
                        //============================================================verify existance of preriquisites
                        /*rfpevalrec.RESET;
                        rfpevalrec.SETFILTER(rfpevalrec."RFP No.",No);
                        rfpevalrec.SETFILTER(rfpevalrec."Evaluation Type",'%1',rfpevalrec."Evaluation Type"::Mandatory);
                        IF NOT  rfpevalrec.FINDSET THEN BEGIN
                           ERROR('Please Fill the Mandatory Requirements!!!');
                        END;*/
                        /* rfpevalrec.RESET;
                         rfpevalrec.SETFILTER(rfpevalrec."RFP No.",No);
                         rfpevalrec.SETFILTER(rfpevalrec."Evaluation Type",'%1',rfpevalrec."Evaluation Type"::Technical);
                         IF NOT  rfpevalrec.FINDSET THEN BEGIN
                            ERROR('Please Fill the Technical Requirements!!!');
                         END;*/

                        filesrec2.Reset;
                        filesrec2.SetRange(filesrec2."No.", Rec.No);
                        if not filesrec2.FindFirst then begin
                            Message('This is Doc No %1 and this is tender %2', filesrec2."No.", Rec.No);
                            Error('Please Attach Documents for RFP %1', Rec.No);
                        end;
                        //=============================================================================================
                        //====================================================================================
                        reqlist.Reset;
                        reqlist.SetFilter(reqlist."No.", Rec."Requisition No");
                        if reqlist.FindSet then begin
                            requser := reqlist."Requester ID";

                            Usersetuprec.Reset;
                            Usersetuprec.Get(requser);
                            useremail1 := Usersetuprec."E-Mail";

                            approvatemprec.Reset;
                            approvatemprec.SetFilter(approvatemprec."Document No.", '%1', Rec."Requisition No");
                            approvatemprec.SetFilter(approvatemprec."Sequence No.", '%1', 2);
                            if approvatemprec.FindSet then begin
                                Approveruser := approvatemprec."Approver ID";

                                Usersetuprec.Reset;
                                Usersetuprec.Get(Approveruser);
                                useremail2 := Usersetuprec."E-Mail";

                                //====================================================================
                                ///  smtprec.Reset;
                                //  smtprec.Get;

                                mailheader := 'RE: RFQ NO:  ' + Rec.No;
                                mailbody := 'Dear Sir/Madam<br><br>';
                                mailbody := mailbody + 'Please Find Attached RFQ Document(s) for your review.<br><br>Kindly submit any comments on the same within 24 hours.<br><br>';
                                mailbody := mailbody + 'If you do not submit any Comments within 24 hours the Procurement Process will Continue.<br<br>';
                                mailbody := mailbody + '<br><br><i>This E-mail is sent to you because you Approved or Raised the Requisition No: <b>' + reqlist."No." + '</b> Which formed the basis of creating this RFQ Document</i><br><br>';
                                mailbody := mailbody + 'Kind Regards<br><br>';

                                //  smtpcu.CreateMessage('RFQ Team', smtprec."User ID", useremail1, mailheader, mailbody, true);

                                docrec.Reset;
                                docrec.SetFilter(docrec."No.", Rec.No);
                                if docrec.FindSet then
                                    repeat
                                    ///smtpcu.AddAttachment(docrec.Export(true), '');
                                    until docrec.Next = 0;

                                //  smtpcu.AddCC(useremail2 + ';mwanaambai.jc@gmail.com');
                                //  smtpcu.Send();


                                //=====================================put on queue=================
                                /*schedulerec.RESET;
                                schedulerec.SETFILTER(schedulerec."Document No",No);
                                IF schedulerec.FINDSET THEN BEGIN
                                   schedulerec.DELETEALL;
                                END;
                                schedulerec.RESET;
                                schedulerec.INIT;
                                schedulerec."Document No":=No;
                                schedulerec.Date:=CALCDATE('1D',TODAY);
                                schedulerec.time:= TIME;
                                schedulerec.INSERT;*/

                                Message('Email sent & Job Queue Entries setup successfully...');
                                //====================================================================
                            end;
                        end;
                        //====================================================================================
                        ///   if ApprovalMgt.CheckProcApprovalPossible(Rec) then
                        ///      ApprovalMgt.OnSendProcDocForApproval(Rec);

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelProcApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("<Send Approval Request>_Promoted"; "<Send Approval Request>")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
                actionref("Mandatory Requirements_Promoted"; "Mandatory Requirements")
                {
                }
                actionref("Technical Specifications_Promoted"; "Technical Specifications")
                {
                }
                actionref(Bidders_Promoted; Bidders)
                {
                }
                actionref("<Page Supplier Selection>_Promoted"; "<Page Supplier Selection>")
                {
                }
            }
            group(Category_Category8)
            {
                actionref(DocAttach_Promoted; DocAttach)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Process Type" := Rec."process type"::Tender;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::Tender;
    end;

    var
        TenderBids: Record "Tender Bids";
        FileDirectory: Text[100];
        FileName: Text[500];
        ReportID: Integer;
        ///  //"Object": Record "Object";
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
        //ApprovalMgt: Codeunit "Approvals Mgmt.";
        CompInfo: Record "Company Information";
        Usersetuprec: Record "User Setup";
        approvatemprec: Record "Approval Entry";
        payablesetuprec: Record "Purchases & Payables Setup";
        reqlist: Record "Purchase Header";
        requser: Code[50];
        Approveruser: Code[50];
        ///   smtpcu: Codeunit "SMTP Mail";
        mailheader: Text;
        mailbody: Text;
        ///   smtprec: Record "SMTP Mail Setup";
        useremail1: Text;
        useremail2: Text;
        schedulerec: Record "Job Queue Category";
        currentdatetime: DateTime;
}