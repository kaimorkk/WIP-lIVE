

page 69236 "Employee Requisition Card"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "Employee Requisitions";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Center';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Center field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = "Job IDEditable";
                    Importance = Promoted;
                    TableRelation = "ManPower Planning Lines"."Entry No";
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Obstxt)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Obstxt field.';
                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("Job Description");
                        "Job Description".CREATEINSTREAM(ObjInstr);
                        Obj.READ(ObjInstr);
                        
                        
                        IF Obstxt<>FORMAT(Obj) THEN
                        BEGIN
                         CLEAR("Job Description");
                         CLEAR(Obj);
                         Obj.ADDTEXT(Obstxt);
                         "Job Description".CREATEOUTSTREAM(ObjOutStr);
                         Obj.WRITE(ObjOutStr);
                        // MODIFY;
                        END;
                        */

                    end;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = Basic;
                    Editable = "Reason For RequestEditable";
                    ToolTip = 'Specifies the value of the Reason For Request field.';
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Contract Required field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    Editable = PriorityEditable;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Vacant Positions field.';
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = Basic;
                    Editable = "Required PositionsEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Required Positions field.';
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    Editable = "Closing DateEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Closing Date field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advertisement Type';
                    Editable = "Requisition TypeEditable";
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Advertisement Type field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Additional Information")
            {
                Caption = 'Additional Information';
                field("Any Additional Information"; Rec."Any Additional Information")
                {
                    ApplicationArea = Basic;
                    Editable = AnyAdditionalInformationEditab;
                    ToolTip = 'Specifies the value of the Any Additional Information field.';
                }
                field("Reason for Request(Other)"; Rec."Reason for Request(Other)")
                {
                    ApplicationArea = Basic;
                    Editable = ReasonforRequestOtherEditable;
                    ToolTip = 'Specifies the value of the Reason for Request(Other) field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755020; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
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
                        if Rec.Status <> Rec.Status::Approved then Error('The job position should first be approved');

                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.");
                        REPEAT
                        HREmp.TESTFIELD(HREmp."Company E-Mail");
                        //SMTP.Create('Job Advertisement','info@leventis.com',HREmp."Company E-Mail",
                        'Leventis Job Vacancy','A vacancy with the job description' +"Job Description"+'is open for applications',TRUE);
                        //SMTP.Send();
                        UNTIL HREmp.NEXT=0;*/

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
                            Report.Run(55489, true, true, HREmpReq);
                    end;
                }
                action("&Send Mail to HR to add vacant position")
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Mail to HR to add vacant position';
                    Image = Email;
                    Visible = false;
                    ToolTip = 'Executes the &Send Mail to HR to add vacant position action.';
                    trigger OnAction()
                    begin
                        objEmp.Reset;
                        objEmp.SetRange(objEmp."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                        // objEmp.SetRange(objEmp.HR, true);
                        if objEmp.Find('-') then begin
                            if objEmp."Company E-Mail" = '' then Error('THe HR doesnt have an email Account');
                            //**********************send mail**********************************

                            Message('EMail Sent');
                        end else begin
                            Message('There is no employee marked as HR in that department');
                        end;
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
                        ////ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                        if Confirm('Send Document for Approval?', true) = false then exit;
                        Rec.Status := Rec.Status::Approved;
                        Message('Approved!');
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
                        if Confirm('Cancel Document?', true) = false then exit;
                        Rec.Status := Rec.Status::New;
                        Message('Cancelled!');
                    end;
                }
            }
            group(Job)
            {
                Caption = 'Job';
                action(Requirements)
                {
                    ApplicationArea = Basic;
                    Caption = 'Requirements';
                    Image = JobListSetup;
                    Visible = false;
                    ToolTip = 'Executes the Requirements action.';
                }
                action(Responsibilities)
                {
                    ApplicationArea = Basic;
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Visible = false;
                    ToolTip = 'Executes the Responsibilities action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(Advertise_Promoted; Advertise)
                {
                }
                actionref("Mark as Closed/Open_Promoted"; "Mark as Closed/Open")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
                actionref("&Send Mail to HR to add vacant position_Promoted"; "&Send Mail to HR to add vacant position")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Job', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Re-Open_Promoted"; "Re-Open")
                {
                }
                actionref(Requirements_Promoted; Requirements)
                {
                }
                actionref(Responsibilities_Promoted; Responsibilities)
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
        UpdateControls;

        HRLookupValues.SetRange(HRLookupValues.Code, Rec."Type of Contract Required");
        if HRLookupValues.Find('-') then
            ContractDesc := HRLookupValues.Description;
        /*
        CALCFIELDS("Job Description");
        "Job Description".CREATEINSTREAM(ObjInstr);
        Obj.READ(ObjInstr);
        Obstxt:=FORMAT(Obj);
        */

    end;

    trigger OnInit()
    begin
        TypeofContractRequiredEditable := true;
        AnyAdditionalInformationEditab := true;
        "Required PositionsEditable" := true;
        "Requisition TypeEditable" := true;
        "Closing DateEditable" := true;
        PriorityEditable := true;
        ReasonforRequestOtherEditable := true;
        "Reason For RequestEditable" := true;
        "Responsibility CenterEditable" := true;
        "Job IDEditable" := true;
        "Requisition DateEditable" := true;
        "Requisition No.Editable" := true;
    end;

    var
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL;
        ApprovalEntries: Page "Approval Entries";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        HREmpReq: Record "Employee Requisitions";
        SMTP: Codeunit "Email Message";
        HRSetup: Record "Human Resources Setup";
        CTEXTURL: Text[30];
        HREmp: Record Employee;
        HREmailParameters: Record "Hr E-Mail Parameters";
        ContractDesc: Text[30];
        HRLookupValues: Record "HR Lookup Values";

        "Requisition No.Editable": Boolean;

        "Requisition DateEditable": Boolean;

        "Job IDEditable": Boolean;

        "Responsibility CenterEditable": Boolean;

        "Reason For RequestEditable": Boolean;

        ReasonforRequestOtherEditable: Boolean;

        PriorityEditable: Boolean;

        "Closing DateEditable": Boolean;

        "Requisition TypeEditable": Boolean;

        "Required PositionsEditable": Boolean;

        AnyAdditionalInformationEditab: Boolean;

        TypeofContractRequiredEditable: Boolean;
        DimValue: Record "Dimension Value";
        objEmp: Record Employee;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        Obstxt: Text;
        Rectxt: Text;
        Obj1: BigText;
        ObjInstr1: InStream;
        ObjOutStr1: OutStream;
        Obstxt1: Text;


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


    procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Requisition No.Editable" := true;
            "Requisition DateEditable" := true;
            "Job IDEditable" := true;
            "Responsibility CenterEditable" := true;
            "Reason For RequestEditable" := true;
            ReasonforRequestOtherEditable := true;
            PriorityEditable := true;
            "Closing DateEditable" := true;
            "Requisition TypeEditable" := true;
            "Required PositionsEditable" := true;
            "Required PositionsEditable" := true;
            AnyAdditionalInformationEditab := true;
            TypeofContractRequiredEditable := true;
        end else begin
            "Requisition No.Editable" := false;
            "Requisition DateEditable" := false;
            "Job IDEditable" := false;
            "Responsibility CenterEditable" := false;
            "Reason For RequestEditable" := false;
            ReasonforRequestOtherEditable := false;
            PriorityEditable := false;
            "Closing DateEditable" := false;
            "Requisition TypeEditable" := false;
            "Required PositionsEditable" := false;
            "Required PositionsEditable" := false;
            AnyAdditionalInformationEditab := false;

            TypeofContractRequiredEditable := false;
        end;
    end;
}

#pragma implicitwith restore

