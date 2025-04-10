page 96018 "Licence Renewal Form"
{
    ApplicationArea = All;
    Caption = 'Licence Renewal Form';
    SourceTable = "Licence Registration Form";
    PageType = Document;
    PopulateAllFields = true;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General Information';

                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("First Name"; fName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Last Name"; lName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field("Other Names"; otherNames)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Names field.', Comment = '%';
                    Importance = Additional;
                }
                field("Full Name"; fullNames)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.', Comment = '%';
                    Importance = Additional;
                }
                field("ID Number"; idNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.', Comment = '%';
                }
                field("Phone No."; phone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field("E-mail"; email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Type field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted field.', Comment = '%';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Invoice No. field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.', Comment = '%';
                }
                field("Amount Received"; Rec."Amount Received")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Amount Received field.', Comment = '%';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Closed field.', Comment = '%';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Closed By field.', Comment = '%';
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Submission Date field.', Comment = '%';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transaction Code field.', Comment = '%';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Transaction Date field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                    Importance = Additional;
                }
            }
            part("Licence Renewal Information"; "Licence Renewal Information")
            {
                ApplicationArea = Basic;
                Caption = 'Licence Renewal Lines';
                SubPageLink = "Document No." = field("No.");
            }
            group(Uploads)
            {
                field("Professional Indemnity Cover"; ProfessionalIndemnityCover)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Indemnity Cover field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        LicenceReg.Reset();
                        LicenceReg.SetRange("No.", Rec."No.");
                        if LicenceReg.FindFirst() then begin
                            Clear(DocAttach);
                            Clear(DocAttachDetails);
                            Clear(RecRef);

                            RecRef.GetTable(LicenceReg);

                            DocAttach.Reset();
                            DocAttach.SetRange("Table ID", RecRef.Number);
                            DocAttach.SetRange("No.", LicenceReg."No.");
                            DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Professional Indemnity Cover");
                            // DocAttach.FindSet();
                            DocAttachDetails.SetTableView(DocAttach);
                            DocAttachDetails.RunModal();
                        end;
                    end;
                }
                field("KISM Membership Card"; KISMMembershipCard)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KISM Membership Card field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        LicenceReg.Reset();
                        LicenceReg.SetRange("No.", Rec."No.");
                        if LicenceReg.FindFirst() then begin
                            Clear(DocAttach);
                            Clear(DocAttachDetails);
                            Clear(RecRef);

                            RecRef.GetTable(LicenceReg);

                            DocAttach.Reset();
                            DocAttach.SetRange("Table ID", RecRef.Number);
                            DocAttach.SetRange("No.", LicenceReg."No.");
                            DocAttach.SetRange("Document Type", DocAttach."Document Type"::"KISM Membership Card");
                            // DocAttach.FindSet();
                            DocAttachDetails.SetTableView(DocAttach);
                            DocAttachDetails.RunModal();
                        end;
                    end;
                }
                field("Current KISM Practice Licence"; CurrentKISMPracticeLicence)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current KISM Practice Licence field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        LicenceReg.Reset();
                        LicenceReg.SetRange("No.", Rec."No.");
                        if LicenceReg.FindFirst() then begin
                            Clear(DocAttach);
                            Clear(DocAttachDetails);
                            Clear(RecRef);

                            RecRef.GetTable(LicenceReg);

                            DocAttach.Reset();
                            DocAttach.SetRange("Table ID", RecRef.Number);
                            DocAttach.SetRange("No.", LicenceReg."No.");
                            DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Current KISM Practice Licence");
                            // DocAttach.FindSet();
                            DocAttachDetails.SetTableView(DocAttach);
                            DocAttachDetails.RunModal();
                        end;
                    end;
                }
                field("Identification Card"; IdentificationCard)
                {
                    ApplicationArea = Basic;
                    Caption = 'Identity Card/Passport/Certificate of Registration/Partnership Deed';
                    ToolTip = 'Specifies the value of the Identification Card field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        LicenceReg.Reset();
                        LicenceReg.SetRange("No.", Rec."No.");
                        if LicenceReg.FindFirst() then begin
                            Clear(DocAttach);
                            Clear(DocAttachDetails);
                            Clear(RecRef);

                            RecRef.GetTable(LicenceReg);

                            DocAttach.Reset();
                            DocAttach.SetRange("Table ID", RecRef.Number);
                            DocAttach.SetRange("No.", LicenceReg."No.");
                            DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Identification Card");
                            // DocAttach.FindSet();
                            DocAttachDetails.SetTableView(DocAttach);
                            DocAttachDetails.RunModal();
                        end;
                    end;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Create Licences")
            {
                ApplicationArea = All;
                Caption = 'Create Licences';
                Image = Post;
                ToolTip = 'Executes the Create Licence action.';

                trigger OnAction()
                var

                begin

                end;
            }
        }
        area(Navigation)
        {
            group("&Application")
            {
                Caption = '&Application';
                Image = ApplicationWorksheet;
                action(ApprovalEntries)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
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
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
                    Caption = 'Comments';
                    Image = ViewComments;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    ToolTip = 'Request approval to change the record.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
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
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property New.';

                actionref(Create_Licence_Promoted; "Create Licences")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Approve', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Approve_Promoted; Approve)
                {
                }
                actionref(Reject_Promoted; Reject)
                {
                }
                actionref(Comment_Promoted; Comment)
                {
                }
                actionref(Delegate_Promoted; Delegate)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Request Approval', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category9)
            {
                Caption = 'Application', Comment = 'Generated from the PromotedActionCategories property index 8.';
                actionref(ApprovalEntries_Promoted; ApprovalEntries)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    trigger OnInit()
    begin
        SetControlAppearance();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Application Type" := Rec."Application Type"::Renewal;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        IdentificationCard: Integer;
        CurrentKISMPracticeLicence: Integer;
        KISMMembershipCard: Integer;
        ProfessionalIndemnityCover: Integer;
        DocAttach: Record "Document Attachment";
        DocAttachDetails: Page "Licensing Document Attachments";
        RecRef: RecordRef;
        LicenceReg: Record "Licence Registration Form";
        PCategories: Record "Licence Practice Categories";
        RegPCategories: Record "Licence Reg. Pract. Categories";
        LicenceProcessing: Codeunit "Licensing Portal";
        Users: Record "Licensing Portal Users";
        fName: Text;
        lName: Text;
        otherNames: Text;
        fullNames: Text;
        email: Text;
        phone: Text;
        idNo: Text;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);

        Users.Reset();
        Users.SetRange("User ID", Rec."User ID");
        if Users.FindFirst() then begin
            fName := Users."First Name";
            lName := Users."Last Name";
            otherNames := Users."Other Names";
            fullNames := Users.FullName();
            email := Users."E-Mail";
            phone := Users."Phone No.";
            idNo := Users."ID Number";
        end;

        Clear(DocAttach);
        Clear(IdentificationCard);
        Clear(CurrentKISMPracticeLicence);
        Clear(KISMMembershipCard);
        Clear(ProfessionalIndemnityCover);

        RecRef.GetTable(Rec);

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Current KISM Practice Licence");
        if DocAttach.FindSet() then
            CurrentKISMPracticeLicence := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Identification Card");
        if DocAttach.FindSet() then
            IdentificationCard := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"KISM Membership Card");
        if DocAttach.FindSet() then
            KISMMembershipCard := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Professional Indemnity Cover");
        if DocAttach.FindSet() then
            ProfessionalIndemnityCover := DocAttach.Count;

    end;
}
