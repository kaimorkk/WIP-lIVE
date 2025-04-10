

page 70046 "Commitee Creation"
{
    PageType = Card;
    SourceTable = "Tender Commitee Appointment1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Appointment No"; Rec."Appointment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment No field.';
                }
                field("Tender/Quotation No"; Rec."Tender/Quotation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender/Quotation No field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Committee ID"; Rec."Committee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee ID field.';
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Name field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("No of Members"; Rec."No of Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Members field.';
                }
                field("Deadline For Report Submission"; Rec."Deadline For Report Submission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deadline For Report Submission field.';
                }
            }
            part(Control1000000016; "Commitee Members")
            {
                SubPageLink = "Appointment No" = field("Appointment No");
                SubPageView = sorting("Appointment No", "Employee No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Committee ")
            {
                Caption = 'Committee ';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    thisrec.Reset;
                    thisrec.SetFilter("Appointment No", Rec."Appointment No");
                    if thisrec.FindSet then begin
                        Report.Run(0, true, false, thisrec);

                    end;
                end;
            }
            action(PrintPDF)
            {
                ApplicationArea = Basic;
                Image = PrintAcknowledgement;
                ToolTip = 'Executes the PrintPDF action.';
                trigger OnAction()
                begin
                    rfqname := Rec."Appointment No";
                    rfqname2 := Rec."Tender/Quotation No";
                    rfqname := ConvertStr(rfqname, '/', '_');
                    rfqname := ConvertStr(rfqname, '\', '_');
                    thepdffilename := PurchSetup."RFQ Documents Path" + (Format(rfqname)) + '_' + rfqname2 + '.pdf';
                    Clear(thepdffilename);
                    //saveCommiteeReport(Rec);

                    PurchSetup.Get;

                    rfqname2 := ConvertStr(rfqname2, '/', '_');
                    rfqname2 := ConvertStr(rfqname2, '\', '_');
                    Hyperlink(PurchSetup."RFQ Documents Path" + (Format(rfqname)) + '_' + rfqname2 + '.pdf');
                end;
            }
            action("DMS Link")
            {
                ApplicationArea = Basic;
                Image = Web;
                ToolTip = 'Executes the DMS Link action.';
                trigger OnAction()
                begin

                    GLSetup.Get();
                    //Link := GLSetup."DMS Link" + Rec."Appointment No";
                    Hyperlink(Link);
                end;
            }
            action("Approval Entries")
            {
                ApplicationArea = Basic;
                Image = Approvals;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "Approval Entries";
                RunPageMode = View;
                ToolTip = 'Executes the Approval Entries action.';
            }
            group(Approvals)
            {
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    if not Confirm('Are you sure you want to send it for approval?') then
                        exit;


                    //if //ApprovalsMgmt.CheckCommiteeAppointmentWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendCommiteeAppointmentForApproval(Rec);
                    CurrPage.Close();
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    if not Confirm('Are you sure you want to cancel approval request?') then
                        exit;

                    //if //ApprovalsMgmt.CheckCommiteeAppointmentWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnCancelCommiteeAppointmentApprovalRequest(Rec);
                    CurrPage.Close();
                end;
            }
            action(Approve)
            {
                ApplicationArea = All;
                Caption = 'Approve';
                Image = Approve;
                ToolTip = 'Approve the requested changes.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    if not Confirm('Are you sure you want to Approve the document?') then
                        exit;
                    //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    CurrPage.Close();
                end;
            }
            action(Reject)
            {
                ApplicationArea = All;
                Caption = 'Reject';
                Image = Reject;
                ToolTip = 'Reject the approval request.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    if not Confirm('Are you sure you want to Reject the document?') then
                        exit;
                    //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    CurrPage.Close;
                end;
            }
            action(Comment)
            {
                ApplicationArea = All;
                Caption = 'Comments';
                Image = ViewComments;
                ToolTip = 'View or add comments for the record.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //ApprovalsMgmt.GetApprovalComment(Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref(PrintPDF_Promoted; PrintPDF)
                {
                }
                actionref("DMS Link_Promoted"; "DMS Link")
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
            }
        }
    }

    var
        //ApprovalMgt: Codeunit "Approvals Mgmt.";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        approvalentry: Record "Approval Entry";
        OpenApprovalEntriesExistForCurrUser2: Boolean;
        i: Integer;
        approvalentries: Record "Approval Entry";
        CUST: Record Customer;
        Internationalsee: Boolean;
        Localsee: Boolean;
        //dotnetvalue: dotnet Interaction;
        commentmsg: Text;
        commentline: Record "Approval Comment Line";
        //  SQLConnection: dotnet SqlConnection;
        //  SQLCommand: dotnet SqlCommand;
        //  SQReader: dotnet SqlDataReader;
        ServerName: Text;
        NAVDB: Text;
        ConnectionString: Text;
        BDUserID: Text;
        BDPW: Text;
        SQLStt: Text;
        "Attached?": Boolean;
        Docnobd2: Text;
        GLSetup: Record "General Ledger Setup";
        Link: Text;
        commiterec: Record "Commitee Members";
        thisrec: Record "Tender Commitee Appointment1";
        thisrecord: Record "Tender Commitee Appointment1";
        rfqname: Text;
        rfqname2: Text;
        PurchSetup: Record "Purchases & Payables Setup";
        thepdffilename: Text;
        committemembers: Record "Commitee Members";
        BDSTT: label 'SELECT * FROM %1%2 WHERE [CONTACTS]=''%3''';
        BDSTT2: label 'SELECT * FROM [ERC2017].dbo.[ERC$Customer] where [No_]=''%1''';
        BDSTT3: label 'SELECT * FROM [192.168.230.11].[DMSDB].[dbo].[CF_IMPREST]';
        BDSTT4: label 'SELECT * FROM OPENQUERY([192.168.230.11],''%1'')';
        BDSTT41: label 'SELECT * FROM [DMSDB].[dbo].[CF_IMPREST]';
        Docnobd: label '%1';

    // trigger Sqlcommand::StatementCompleted(sender: Variant; e: dotnet StatementCompletedEventArgs)
    // begin
    // end;

    // trigger Sqlcommand::Disposed(sender: Variant; e: dotnet EventArgs)
    // begin
    // end;

    // trigger Sqlconnection::InfoMessage(sender: Variant; e: dotnet SqlInfoMessageEventArgs)
    // begin
    // end;

    // trigger Sqlconnection::StateChange(sender: Variant; e: dotnet StateChangeEventArgs)
    // begin
    // end;

    // trigger Sqlconnection::Disposed(sender: Variant; e: dotnet EventArgs)
    // begin
    // end;
}

#pragma implicitwith restore

