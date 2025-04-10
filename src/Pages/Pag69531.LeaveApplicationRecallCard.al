

page 69531 "Leave Application Recall Card"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Leave Application Recall";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Recall No"; Rec."Recall No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Recall No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Leave Code"; Rec."Leave Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Leave Code field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Approved Days"; Rec."Approved Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approved Days field.';
                }
                field("Approved Start Date"; Rec."Approved Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approved Start Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
            group("Leave Recall")
            {
                Caption = 'Leave Recall';
                field("Days Recalled"; Rec."Days Recalled")
                {
                    ApplicationArea = Basic;
                    Editable = Editable;
                    ToolTip = 'Specifies the value of the Days Recalled field.';
                }
                field("Recall Date From"; Rec."Recall Date From")
                {
                    ApplicationArea = Basic;
                    Editable = Editable;
                    ToolTip = 'Specifies the value of the Recall Date From field.';
                }
                field("Recall Date To"; Rec."Recall Date To")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Recall Date To field.';
                }
                field("Reason for Recall"; Rec."Reason for Recall")
                {
                    ApplicationArea = Basic;
                    Editable = Editable;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Reason for Recall field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }

            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Post Leave Recall")
            {
                ApplicationArea = Basic;
                Enabled = Editable;
                Image = PostApplication;
                ToolTip = 'Executes the Post Leave Recall action.';
                trigger OnAction()
                begin
                    Rec.TestField("Days Recalled");
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField("Recall Date From");
                    Rec.TestField("Reason for Recall");
                    Rec.TestField(Posted, false);
                    if Rec."Days Recalled" > Rec."Days Applied" then
                        Error(Text0001, Rec."Days Recalled", Rec."Days Applied");
                    // if (Rec."Recall Date From" >= Rec."Start Date") and (Rec."Recall Date From" < Rec."End Date") then
                    //     Message(Text02, Rec."Start Date", Rec."End Date")
                    // else
                    //     Error(Text01, Rec."Start Date", Rec."End Date");
                    if Dialog.Confirm('Are you sure you want to recall ' + Rec."Employee Name" + ' for ' + Format(Rec."Days Recalled") + ' Days?', true) then begin
                        if HRLEntries1.FindLast then
                            EntryNo := HRLEntries1."Entry No.";
                        HRLEntries.Init;
                        HRLEntries."Entry No." := EntryNo + 1;
                        HRLEntries."Staff No." := Rec."Employee No";
                        HRLEntries."Staff Name" := Rec."Employee Name";
                        HRLEntries."Leave Entry Type" := HRLEntries."leave entry type"::Positive;
                        HRLEntries."Posting Date" := Rec."Recall Date From";
                        HRLEntries."No. of days1" := Rec."Days Recalled";
                        HRLEntries."Document No." := Rec."Recall No";
                        HRLEntries."User ID" := UserId;
                        HRLEntries2.Reset;
                        HRLEntries2.SetRange("Document No.", Rec."Application No");
                        if HRLEntries2.FindSet then
                            HRLEntries."Leave Period" := HRLEntries2."Leave Period";
                        HRLEntries."Leave Approval Date" := Today;
                        HRLEntries."Leave Type" := Rec."Leave Code";
                        HRLEntries."Journal Batch Name" := 'DEFAULT';
                        HRLEntries."Leave Posting Description" := 'Leave Recall: ' + Rec."Reason for Recall";
                        if HRLEntries.Insert then
                            Rec.Posted := true;

                        if Dialog.Confirm('Would you like to notify the employee via mail?', true) then begin
                            if Emp.Get(Rec."Employee No") then begin
                                Header := 'LEAVE APPLICATION RECAL FOR  ' + Format(Rec."Days Recalled") + ' DAYS';

                                if SMTPSetup.Get() then begin
                                    //    SenderEmail := SMTPSetup."Email Sender Address";
                                    //  SenderName := SMTPSetup."Email Sender Name";
                                end;
                                if Emp."Company E-Mail" <> '' then begin
                                    SMTPMail.Create(Emp."Company E-Mail", Header, '', true);
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('This is to notify you that you have been recalled back from your leave from ' + Format(Rec."Recall Date From") + ' to ' + Format(Rec."Recall Date To") + ' for a period of ' + Format(Rec."Days Recalled") +
                                                        ' Days because of the following reason:');// for the month of January 2014');
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('<ul>' + Rec."Reason for Recall" + '</ul> <br>The days recalled will be added back to your leave days');
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('Kindly prepare adequately');
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('Thanks & Regards');
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('HR Department');
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('<HR>');
                                    SMTPMail.AppendToBody('This is a system generated mail.');
                                    SMTPMail.AppendToBody('<br><br>');
                                    SMTPMail.AppendToBody('All Enquires regarding wages should be communicated with HR');
                                    SMTPMail.AppendToBody('<br><br>');
                                    Email.Send(SMTPMail);
                                end;
                                //End email
                            end;
                        end;
                        Message('%1 Successfuly recalled for %2 Days', Rec."Employee Name", Rec."Days Recalled");
                    end;
                    CurrPage.Close;
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;


                trigger OnAction()
                begin
                    DocumentType := Documenttype::"Leave Recall";
                    // ApprovalEntries.SetRecordFilters(Database::"Leave Application Recall", DocumentType, Rec."Application No");
                    ApprovalEntries.Run;
                end;
            }
            action(sendApproval)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;


                trigger OnAction()
                begin

                    DocumentType := Documenttype::"Leave Recall";

                    VarVariant := Rec;
                    if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                        CustomApprovalMgt.OnSendDocForApproval(VarVariant);
                    end;
                end;
            }
            action(cancellsApproval)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                trigger OnAction()

                begin

                    VarVariant := Rec;
                    if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then begin
                        CustomApprovalMgt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Post Leave Recall_Promoted"; "Post Leave Recall")
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

                actionref(sendApproval_Promoted; sendApproval)
                {
                }
                actionref(cancellsApproval_Promoted; cancellsApproval)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Editable := true;
        if Rec.Posted = true then
            Editable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        Editable := not Rec.Posted;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Editable := not Rec.Posted;
    end;

    var
        HRLEntries: Record "HR Leave Ledger Entries";
        Filename: Text;
        SMTPSetup: Record "Email Account";
        Email: Codeunit Email;
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        Text0001: label 'The number of days %1 recalled cannot be greater than the number of %2 days Applied';
        Editable: Boolean;
        EntryNo: Integer;
        HRLEntries1: Record "HR Leave Ledger Entries";
        HRLEntries2: Record "HR Leave Ledger Entries";
        Text01: label 'The Recall date must be between the leave dates i.e %1 and %2';
        Text02: label 'The Recall date is within the leave dates i.e %1 and %2';
        ApprovalEntries: Page "Approval Entries";
        VarVariant: Variant;
        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
        DocumentType: Enum "Approval Document Type";
}

#pragma implicitwith restore

