

page 56136 "ICT Issuance Voucher card"
{
    PageType = Card;
    SourceTable = "ICT Issuance Voucher";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = corec;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Helpdesk No."; Rec."Helpdesk No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Helpdesk No. field.';
                }
                field("Issued To User ID"; Rec."Issued To User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To User ID field.';
                }
                field("Issued To No."; Rec."Issued To No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Internal\external"; Rec."Internal\external")
                {
                    ApplicationArea = Basic;
                    Caption = 'Type';
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch';
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
            }
            part(Control6; "Issuance Voucher Lines")
            {
                Editable = corec;
                SubPageLink = "No." = field("No."),
                              Type = const(Issuance);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
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
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56242, true, true, Rec);
                end;
            }
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
                    // TESTFIELD(Status,Status::Open);
                    // Status:=Status::Released;
                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec.Modify(true);
                    // MESSAGE('Approved Successfully');

                    ////if //ApprovalsMgmt.CheckICTIssuanceApprovalPossible(Rec) then
                    //ApprovalsMgmt.OnSendICTIssuanceForApproval(Rec);

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
                    // TESTFIELD(Status,Status::Released);
                    // Status:=Status::Open;
                    Rec."Document Status" := Rec."document status"::Open;
                    Rec.Modify(true);
                    // MESSAGE('Approval Request Cancelled');
                    //ApprovalsMgmt.OnCancelICTIssuanceApprovalRequest(Rec);
                    WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Issue';
                Image = PostApplication;
                ToolTip = 'Executes the Issue action.';
                trigger OnAction()
                begin
                    if Rec."Internal\external" = Rec."internal\external"::External then
                        Rec.TestField(Status, Rec.Status::Released);

                    //TESTFIELD("Document Status","Document Status"::Submitted);
                    Rec.TestField(Posted, false);
                    ICTIssuanceVoucherLines.Reset;
                    ICTIssuanceVoucherLines.SetRange("No.", Rec."No.");
                    ICTIssuanceVoucherLines.SetRange(Type, Rec.Type);
                    if ICTIssuanceVoucherLines.FindSet then begin
                        repeat
                            ICTIssuanceEntries.Init;
                            ICTIssuanceEntries."Entry No" := ICTIssuanceEntries."Entry No" + 100;
                            ICTIssuanceEntries."No." := Rec."No.";
                            ICTIssuanceEntries."Shortcut Dimension 1 Code" := Rec."Shortcut Dimension 1 Code";
                            ICTIssuanceEntries.Directorate := Rec.Directorate;
                            ICTIssuanceEntries.Department := Rec.Department;
                            ICTIssuanceEntries."Division/Unit" := Rec."Division/Unit";
                            ICTIssuanceEntries.Code := ICTIssuanceVoucherLines.Code;
                            ICTIssuanceEntries.Description := ICTIssuanceVoucherLines.Description;
                            ICTIssuanceEntries."Serial No." := ICTIssuanceVoucherLines."Serial No.";
                            ICTIssuanceEntries."FA No" := ICTIssuanceVoucherLines."FA No";
                            ICTIssuanceEntries.Type := ICTIssuanceVoucherLines.Type;
                            ICTIssuanceEntries."Reason For Movement" := ICTIssuanceVoucherLines."Reason For Movement";
                            ICTIssuanceEntries."Issued To User ID" := Rec."Issued To User ID";
                            ICTIssuanceEntries."Issued To No." := Rec."Issued To No.";
                            ICTIssuanceEntries."Issued By" := Rec."Issued By";
                            ICTIssuanceEntries."Issued Date" := Rec."Issued Date";
                            ICTIssuanceEntries.Name := Rec.Name;
                            ICTIssuanceEntries."Duration of Use" := ICTIssuanceVoucherLines."Duration of Use";
                            ICTIssuanceEntries."Duration of Use end date" := ICTIssuanceVoucherLines."Duration of Use end date";
                            ICTIssuanceEntries."Duration of Use start date" := ICTIssuanceVoucherLines."Duration of Use start date";
                            //ICTIssuanceEntries."Receiving Officer Name":=ICTIssuanceVoucherLines."Current Assigned Employee";
                            // ICTIssuanceEntries."Receiving Officer":=ICTIssuanceVoucherLines."Dpt Current Assigned";
                            ICTIssuanceEntries.Insert(true);
                        //MESSAGE('%1',Description);
                        until ICTIssuanceVoucherLines.Next = 0;
                        ICTInventory.Reset;
                        ICTInventory.SetRange(Code, ICTIssuanceVoucherLines.Code);
                        if ICTInventory.FindSet then begin
                            ICTInventory."Current Assigned Employee" := Rec."Issued To No.";
                            ICTInventory."Current Assigned Division/Unit" := Rec.Department;
                            ICTInventory.Modify(true);
                        end;
                    end;
                    //GET THE helpdesk issue and close it
                    ICTHelpdesk.Reset;
                    ICTHelpdesk.SetRange("Job No.", Rec."Helpdesk No.");
                    if ICTHelpdesk.FindFirst then begin
                        ICTHelpdesk.Status := ICTHelpdesk.Status::Resolved;
                        ICTHelpdesk.Modify(true);
                    end;

                    Rec.Posted := true;
                    Rec."Posting Date" := Today;
                    Rec."Document Status" := Rec."document status"::Issued;
                    Rec.Modify(true);

                    //send email
                    Helpdesk.Get;
                    ObjComInfo.Get;
                    if UserSetup.Get(Rec."Issued To User ID") then
                        Body := 'Please note that the item requested through the request no. ' + '  ' + Rec."No." + ' ' + 'has been issued to you';
                    //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", UserSetup."E-Mail", 'ICT ISSUANCE' + ' ' + "No.", Body, true);
                    ICTIssuanceV.Reset;
                    ICTIssuanceV.SetRange("No.", Rec."No.");
                    if ICTIssuanceV.FindSet then begin
                        FileDirectory := 'C:\DOCS\';
                        FileName := 'ISSUANCE_NO' + ICTIssuanceV."No." + '.pdf';
                        //Report.SaveAsPdf(56242, FileDirectory + FileName, ICTIssuanceV);
                    end;
                    //SMTP.AddBCC(Helpdesk."ICT Email");
                    //SMTP.AddAttachment(FileDirectory + FileName, FileName);
                    //SMTP.Send();
                    Message('Issued Successfully To %1', Rec.Name);
                end;
            }
            action(Accept)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Visible = false;
                ToolTip = 'Executes the Accept action.';
                trigger OnAction()
                begin
                    Rec.TestField("Document Status", Rec."document status"::Issued);
                    Rec."Document Status" := Rec."document status"::Verified;
                    Rec."Acceptance Status" := Rec."acceptance status"::Accept;
                    Rec.Modify(true);
                    Message('Accepted Successfully');
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;
                Visible = false;
                ToolTip = 'Executes the Reject action.';
                trigger OnAction()
                begin
                    Rec.TestField("Document Status", Rec."document status"::Issued);
                    Rec."Document Status" := Rec."document status"::Submitted;
                    Rec."Acceptance Status" := Rec."acceptance status"::Reject;
                    Rec.Modify(true);
                    //send email
                    Helpdesk.Get;
                    ObjComInfo.Get;
                    if UserSetup.Get(Rec."Issued To User ID") then
                        Body := 'Please note that the item requested through the request no. ' + '  ' + Rec."No." + ' ' + 'has been rejected';
                    //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", UserSetup."E-Mail", 'ICT ISSUANCE' + ' ' + "No.", Body, true);
                    //SMTP.AddBCC(Helpdesk."ICT Email");
                    //SMTP.Send();
                    Message('Rejected Successfully');
                end;
            }
            action(Return)
            {
                ApplicationArea = Basic;
                Image = Return;
                ToolTip = 'Executes the Return action.';
                trigger OnAction()
                begin
                    Rec.TestField("Document Status", Rec."document status"::Issued);
                    Rec."Document Status" := Rec."document status"::Returned;
                    Rec."Acceptance Status" := Rec."acceptance status"::Accept;
                    Rec.Modify(true);

                    //send email
                    Helpdesk.Get;
                    ObjComInfo.Get;
                    if UserSetup.Get(Rec."Issued To User ID") then
                        Body := 'Please note that the item requested through the request no. ' + '  ' + Rec."No." + ' ' + 'has been returned to the ICT';
                    //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", UserSetup."E-Mail", 'ICT ISSUANCE' + ' ' + "No.", Body, true);
                    //SMTP.AddBCC(Helpdesk."ICT Email");
                    //SMTP.Send();

                    Message('Returned Successfully');
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
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                actionref(Submit_Promoted; Submit)
                {
                }
            }
            group(Category_Category5)
            {
                actionref(Accept_Promoted; Accept)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Return_Promoted; Return)
                {
                }
            }
            group(Category_Category8)
            {
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

    trigger OnAfterGetRecord()
    begin
        // IF "Document Status"="Document Status"::Submitted THEN
        //  CurrPage.EDITABLE:=FALSE;
        // MODIFY(TRUE);
        corec := true;
        if (Rec.Status = Rec.Status::Released) and (Rec."Document Status" = Rec."document status"::Submitted) then
            corec := false;
        corec1 := true;
        if (Rec.Status = Rec.Status::Released) and (Rec."Document Status" = Rec."document status"::Issued) then
            corec1 := false;
        corec2 := true;
        if (Rec.Status = Rec.Status::Released) and (Rec."Document Status" = Rec."document status"::Verified)
          and (Rec."Acceptance Status" = Rec."acceptance status"::Accept) then
            corec2 := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Issuance;
        Rec."Document Status" := Rec."document status"::Open;
    end;

    trigger OnOpenPage()
    begin
        /*IF "Document Status"="Document Status"::Submitted THEN
          CurrPage.EDITABLE:=FALSE;
        MODIFY(TRUE);
        */
        if Rec.Status = Rec.Status::"Pending Approval" then
            corec := false;
        corec := true;
        if (Rec.Status = Rec.Status::Released) and (Rec."Document Status" = Rec."document status"::Submitted) then
            corec := false;
        corec1 := true;
        if (Rec.Status = Rec.Status::Released) and (Rec."Document Status" = Rec."document status"::Issued) then
            corec1 := false;
        corec2 := true;
        if (Rec.Status = Rec.Status::Released) and (Rec."Document Status" = Rec."document status"::Verified) then
            corec2 := false;

    end;

    var
        ICTIssuanceEntries: Record "ICT Issuance Entries";
        ICTIssuanceVoucherLines: Record "ICT Issuance Voucher Lines";
        ICTInventory: Record "ICT Inventory";
        corec: Boolean;
        corec1: Boolean;
        corec2: Boolean;
        corec3: Boolean;
        EditValue: Boolean;
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        SMTP: Codeunit "Email Message";
        Body: Text;
        Helpdesk: Record "ICT Helpdesk Global Parameters";
        ICTHelpdesk: Record "ICT Helpdesk";
        FileDirectory: Text[100];
        FileName: Text[100];
        ICTIssuanceV: Record "ICT Issuance Voucher";
}

#pragma implicitwith restore

