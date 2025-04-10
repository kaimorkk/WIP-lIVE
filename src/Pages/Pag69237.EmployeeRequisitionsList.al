
/// <summary>
/// Page Employee Requisitions List (ID 69237).
/// </summary>

page 69237 "Employee Requisitions List"
{
    CardPageID = "Employee Requisition Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = true;
    SourceTable = "Employee Requisitions";


    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Request field.';
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Positions field.';
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Contract field.';
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Date field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                Caption = 'Job';
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = JobListSetup;
                    RunObject = Page "Welfare Lines";
                    RunPageLink = "Welfare Header No." = field("Job ID");
                    ToolTip = 'Executes the Requirements action.';
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    RunObject = Page "Welfare Contribution Header";
                    RunPageLink = "Welfare No." = field("Job ID");
                    ToolTip = 'Executes the Responsibilities action.';
                }
            }
            group("Fu&nctions")
            {
                Caption = 'Fu&nctions';
                action(Advertise)
                {
                    ApplicationArea = Basic;
                    Caption = 'Advertise';
                    Image = Salutation;
                    ToolTip = 'Executes the Advertise action.';
                    trigger OnAction()
                    begin
                        /*
                        HREmp.RESET;
                        REPEAT
                        HREmp.TESTFIELD(HREmp."Company E-Mail");
                        //SMTP.Create('Job Advertisement','dgithahu@coretec.co.ke',HREmp."Company E-Mail",
                        'URAIA Job Vacancy','A vacancy with the job description' +"Job Description"+'is open for applications',TRUE);
                        //SMTP.Send();
                        UNTIL HREmp.NEXT=0;
                        */
                        Rec.TestField("Requisition Type", Rec."requisition type"::Internal);
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        if HREmp.Find('-') then

                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                             HREmailParameters.Reset;
                        // HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."associate with"::"Vacancy Advertisements");
                        // if HREmailParameters.Find('-') then begin
                        //     repeat
                        //         HREmp.TestField(HREmp."Company E-Mail");
                        //         //SMTP.Create(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",
                        //         HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                        //         HREmailParameters.Body + ' ' + "Job Title" + ' ' + HREmailParameters."Body 2" + ' ' + Format("Closing Date") + '. ' +
                        //         HREmailParameters."Body 3", true);
                        //     //SMTP.Send();
                        //     until HREmp.Next = 0;

                        //     Message('All Employees have been notified about this vacancy');
                        // end;

                    end;
                }
                action("Mark as Closed/Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mark as Closed/Open';
                    Image = ReopenCancelled;
                    ToolTip = 'Executes the Mark as Closed/Open action.';
                    trigger OnAction()
                    begin
                        if Rec.Closed then begin
                            if not Confirm('Are you sure you want to Re-Open this Document', false) then exit;
                            Rec.Closed := false;
                            Rec.Modify;
                            Message('Employee Requisition %1 has been Re-Opened', Rec."Requisition No.");

                        end else begin
                            if not Confirm('Are you sure you want to close this Document', false) then exit;
                            Rec.Closed := true;
                            Rec.Modify;
                            Message('Employee Requisition %1 has been marked as Closed', Rec."Requisition No.");
                        end;
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Image = PrintReport;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        HREmpReq.Reset;
                        HREmpReq.SetRange(HREmpReq."Requisition No.", Rec."Requisition No.");
                        if HREmpReq.Find('-') then
                            Report.Run(53918, true, true, HREmpReq);
                    end;
                }
                action("Re-Open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Visible = false;
                    ToolTip = 'Executes the Re-Open action.';
                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::New;
                        Rec.Modify;
                    end;
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
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        ////if //ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
                        // //ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        ////ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                Caption = 'Job', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Requirements_Promoted; Requirements)
                {
                }
                actionref(Responsibilities_Promoted; Responsibilities)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Advertise_Promoted; Advertise)
                {
                }
                actionref("Mark as Closed/Open_Promoted"; "Mark as Closed/Open")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
                actionref("Re-Open_Promoted"; "Re-Open")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Employee', Comment = 'Generated from the PromotedActionCategories property index 5.';
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

    var
        HREmp: Record Employee;
        HREmailParameters: Record "Hr E-Mail Parameters";
        SMTP: Codeunit "Email Message";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition";
        ApprovalEntries: Page "Approval Entries";
        HREmpReq: Record "Employee Requisitions";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;


    procedure TESTFIELDS()
    begin
        Rec.TestField("Job ID");
        Rec.TestField("Closing Date");
        Rec.TestField("Type of Contract Required");
        Rec.TestField("Requisition Type");
        Rec.TestField("Required Positions");
        if Rec."Reason For Request" = Rec."reason for request"::Other then
            Rec.TestField("Reason for Request(Other)");
    end;
}

#pragma implicitwith restore

