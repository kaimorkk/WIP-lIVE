

page 70080 "Approved RFP Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(RFP),
                            Status = filter(<> "Pending Approval"));

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
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Purchase Line" where(Committed = filter(false),
                                                           "Process Type" = filter('RFP'));
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan No field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Tender Type"; Rec."Tender Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Type';
                    ToolTip = 'Specifies the value of the Proposal Type field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Supplier Category"; Rec."Supplier Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Category field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
                field("Tender Closing Date"; Rec."Tender Closing Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Closing Date';
                    ToolTip = 'Specifies the value of the Proposal Closing Date field.';
                }
                field("Validity Period"; Rec."Validity Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Validity Period field.';
                }
                field("Tender Opening Date"; Rec."Tender Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Opening Date';
                    ToolTip = 'Specifies the value of the Proposal Opening Date field.';
                }
                field("Extended Date"; Rec."Extended Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Extended Date field.';
                }
                field("Tender Status"; Rec."Tender Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Status';
                    ToolTip = 'Specifies the value of the Proposal Status field.';
                }
                field("No of Tender Documents"; Rec."No of Tender Documents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Tender Documents field.';
                }
                field("Generate Multiple LPO"; Rec."Generate Multiple LPO")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Generate Multiple LPO field.';
                }
                field("Tender Amount"; Rec."Tender Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Amount';
                    ToolTip = 'Specifies the value of the Proposal Amount field.';
                }
                field("Tender Committee"; Rec."Tender Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposal Committee';
                    ToolTip = 'Specifies the value of the Proposal Committee field.';
                }
                field("Technical Score"; Rec."Technical Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical Score field.';
                }
                field("Financial Score"; Rec."Financial Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Financial Score field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 1 field.';
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 2 field.';
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 3 field.';
                }
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
                    Visible = false;
                    ToolTip = 'Executes the Select Suppliers action.';
                    trigger OnAction()
                    var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                    end;
                }
                action("Request for Proposal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request for Proposal';
                    Image = Replan;
                    Visible = false;
                    ToolTip = 'Executes the Request for Proposal action.';
                    trigger OnAction()
                    var
                        Text0000: label 'Are you sure you want to Request for Quoation for record No %1';
                    begin
                        if Confirm(Text0000, true, Rec.No) then begin

                            RequestForProposal;

                        end;
                    end;
                }
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    //  RunObject = Page Bidders;
                    //  RunPageLink = "Ref No." = field(No);
                    Visible = false;
                    ToolTip = 'Executes the Bidders action.';
                }
                action("Mandatory Evaluation List")
                {
                    ApplicationArea = Basic;
                    Image = Setup;
                    RunObject = Page "Mandatory Evaluation Checklist";
                    RunPageLink = "RFP No." = field(No),
                                  "Evaluation Type" = const(Mandatory);
                    ToolTip = 'Executes the Mandatory Evaluation List action.';
                }
                action("Technical Evaluation List")
                {
                    ApplicationArea = Basic;
                    Image = Setup;
                    RunObject = Page "Technica Evaluation Checklist";
                    RunPageLink = "RFP No." = field(No),
                                  "Evaluation Type" = const(Technical);
                    ToolTip = 'Executes the Technical Evaluation List action.';
                }
                action("Financial Evaluation List")
                {
                    ApplicationArea = Basic;
                    Image = Setup;
                    RunObject = Page "Financial Evaluation Checklist";
                    RunPageLink = "RFP No." = field(No),
                                  "Evaluation Type" = const(Financial);
                    Visible = false;
                    ToolTip = 'Executes the Financial Evaluation List action.';
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
                action("<Send Approval Request>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        rfpevalrec: Record "RFQ Evaluation Lists";
                        filesrec2: Record "Document Attachment";
                        docrec: Record "Document Attachment";
                    begin
                        Rec.TestField("Technical Score");
                        Rec.TestField(Title);
                        //============================================================verify existance of preriquisites
                        rfpevalrec.Reset;
                        rfpevalrec.SetFilter(rfpevalrec."RFP No.", Rec.No);
                        rfpevalrec.SetFilter(rfpevalrec."Evaluation Type", '%1', rfpevalrec."evaluation type"::Mandatory);
                        if not rfpevalrec.FindSet then begin
                            Error('Please Fill the Mandatory Requirements!!!');
                        end;
                        rfpevalrec.Reset;
                        rfpevalrec.SetFilter(rfpevalrec."RFP No.", Rec.No);
                        rfpevalrec.SetFilter(rfpevalrec."Evaluation Type", '%1', rfpevalrec."evaluation type"::Technical);
                        if not rfpevalrec.FindSet then begin
                            Error('Please Fill the Technical Requirements!!!');
                        end;

                        filesrec2.Reset;
                        filesrec2.SetFilter(filesrec2."No.", Rec.No);
                        if not filesrec2.FindSet then begin
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
                                smtprec.Reset;
                                smtprec.Get;

                                mailheader := 'RE: RFQ NO:  ' + Rec.No;
                                mailbody := 'Dear Sir/Madam<br><br>';
                                mailbody := mailbody + 'Please Find Attached RFQ Document(s) for your review.<br><br>Kindly submit any comments on the same within 24 hours.<br><br>';
                                mailbody := mailbody + 'If you do not submit any Comments within 24 hours the Procurement Process will Continue.<br<br>';
                                mailbody := mailbody + '<br><br><i>This E-mail is sent to you because you Approved or Raised the Requisition No: <b>' + reqlist."No." + '</b> Which formed the basis of creating this RFQ Document</i><br><br>';
                                mailbody := mailbody + 'Kind Regards<br><br>';

                                // smtpcu.CreateMessage('RFQ Team', smtprec."User ID", useremail1, mailheader, mailbody, true);

                                // docrec.Reset;
                                // docrec.SetFilter(docrec."No.", No);
                                // if docrec.FindSet then
                                //     repeat
                                //         smtpcu.AddAttachment(docrec.Export(true), '');
                                //     until docrec.Next = 0;

                                //  smtpcu.AddCC(useremail2 + ';kibetbriann@gmail.com');
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
                        //ApprovalMgt.SendProcApprovalRequestRFP(Rec);

                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        //IF ApprovalMgt.CancelProcApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Technical Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = SetupColumns;
                    RunObject = Page "Technical Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = true;
                    ToolTip = 'Executes the Technical Evaluation action.';
                }
                action("Financial Evaluation")
                {
                    ApplicationArea = Basic;
                    Image = SetupLines;
                    RunObject = Page "Financial Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = true;
                    ToolTip = 'Executes the Financial Evaluation action.';
                }
                action(Award)
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    RunObject = Page "Award Quotation Evaluation";
                    RunPageLink = "Ref No." = field(No);
                    Visible = true;
                    ToolTip = 'Executes the Award action.';
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
                actionref("Request for Proposal_Promoted"; "Request for Proposal")
                {
                }
                actionref("Mandatory Evaluation List_Promoted"; "Mandatory Evaluation List")
                {
                }
                actionref("Technical Evaluation List_Promoted"; "Technical Evaluation List")
                {
                }
                actionref("Financial Evaluation List_Promoted"; "Financial Evaluation List")
                {
                }
                actionref("<Send Approval Request>_Promoted"; "<Send Approval Request>")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
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
        Rec."Process Type" := Rec."process type"::RFP;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Process Type" := Rec."process type"::RFP;
    end;

    var
        FileDirectory: Text[100];
        FileName: Text[500];
        ReportID: Integer;
        // //"Object": Record "Object";
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
        requser: Code[20];
        Approveruser: Code[20];
        smtpcu: Codeunit "Email Message";
        mailheader: Text;
        mailbody: Text;
        smtprec: Record "Email Account";
        useremail1: Text;
        useremail2: Text;
        schedulerec: Record "Job Queue Category";
        currentdatetime: DateTime;


    procedure RequestForProposal()
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
        ReportID := 51511025;
        NoSuppliers := 0;

        SupplierSelect.Reset;
        SupplierSelect.SetRange("Reference No.", Rec.No);
        SupplierSelect.SetRange(Invited, true);
        if SupplierSelect.Find('-') then begin

            Window.Open('processing Supplier ######################1##');
            // Object.Get(Object.Type::Report, '', ReportID);

            CompInfo.Get;
            SenderAddress := CompInfo."Administrator Email";
            SenderName := CompInfo.Name;//Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";

            repeat

                Subject := 'REQUEST FOR QUOTATION ' + SupplierSelect."Reference No.";
                Body := 'Please find attached Quotation';

                if UserSetup.Get(UserId) then begin

                    PrequalifiedSupRec.Reset;
                    PrequalifiedSupRec.SetRange(PrequalifiedSupRec.Name, SupplierSelect."Supplier Name");
                    if PrequalifiedSupRec.Find('-') then
                        Recipients := PrequalifiedSupRec."E-mail";

                    NoSuppliers := NoSuppliers + 1;
                    // SMTPMail.Create(SenderName, SenderAddress, Recipients, Subject, Body, true);

                    //Report.SaveAsPdf(Report::"Request for Quotation", FileName, SupplierSelect);
                    // FileName := FileMangement.ServerTempFileName('.pdf');
                    // SMTPMail.AddAttachment(FileName, '');

                    //  SMTPMail.Send();
                end;

            until SupplierSelect.Next = 0;

            Message('RFP Successfully Sent to %1 Suppliers', NoSuppliers);

            Window.Close;
        end else
            Error('There are no Suppliers Selected!');
    end;
}

#pragma implicitwith restore

