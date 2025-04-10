page 96015 "Licence Categories Form Card"
{
    ApplicationArea = All;
    Caption = 'Licence Categories Form Card';
    PageType = Document;
    RefreshOnActivate = true;
    PopulateAllFields = true;
    SourceTable = "Licence Registration Form";
    // Editable = false;
    // DeleteAllowed = false;
    // ModifyAllowed = false;
    SourceTableView = where("Application Type" = filter(Category));
    
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
                field(Nationality; Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.', Comment = '%';
                }
                field(Town; Town)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Town field.', Comment = '%';
                }
                field(Street; Street)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Street field.', Comment = '%';
                }
                field(Building; Building)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Building field.', Comment = '%';
                }
                field("Postal Address"; PostalAddress)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.', Comment = '%';
                }
                field("Postal Code"; PostalCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Code field.', Comment = '%';
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
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Date field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                    Importance = Additional;
                }
            }
            part("Licence Category Lines"; "Licence Category Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Practice Categories';
                SubPageLink = "Document No." = field("User ID");
            }
            group("Bankruptcy or Conviction")
            {
                field("Has Bankruptcy/Conviction"; HasBankruptOrConviction)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Bankruptcy/Conviction field.', Comment = '%';
                }
                field("Bankruptcy/Conviction Details"; BankruptOrConvictionDetails)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bankruptcy/Conviction Details field.', Comment = '%';
                    MultiLine = true;
                    Visible = HasBankruptOrConviction;
                }
                field("Bankruptcy/Conviction Doc"; BankruptcyOrConvictionDoc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Upload Details';
                    ToolTip = 'Specifies the value of the Bankruptcy/Conviction Doc field.', Comment = '%';
                    Visible = HasBankruptOrConviction;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Bankruptcy/Conviction");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
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
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Professional Indemnity Cover");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
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
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Identification Card");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
                field("Passport Photo"; PassportPhoto)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport Photo field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Passport Photo");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
                field("Qualification Copies"; QualificationCopies)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Copies field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Qualification Copies");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
                field("KISM Membership Card"; KISMMembershipCard)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KISM Membership Card field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"KISM Membership Card");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
                field("Current KISM Practice Licence"; CurrentKISMPracticeLicence)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current KISM Practice Licence field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."No.");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Current KISM Practice Licence");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
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
                    SelectedCategories: Integer;
                    NoCategErr: Label 'At least 1 Practice Category must be selected in order to proceed.';
                begin
                    Clear(SelectedCategories);

                    Rec.TestField(Status, Rec.Status::Approved);
                    Rec.TestField(Submitted, true);
                    Rec.TestField(Closed, false);

                    SelectedCategories := LicenceProcessing.fnCheckSelectedLicencePracticeCategories(Rec."User ID");

                    if SelectedCategories = 0 then
                        Error(NoCategErr);

                    LicenceProcessing.fnCreateLicences(Rec);
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
                action(Attachments)
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
                        DocumentAttachmentDetails.RunModal();
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
            group("User Details")
            {
                Caption = 'User Information';
                Image = Documents;

                action("Licence Reg Education Info")
                {
                    ApplicationArea = Basic;
                    Caption = 'Educational Information';
                    Image = QualificationOverview;
                    RunObject = Page "Licence Reg Education Info";
                    RunPageLink = "Document No." = field("User ID");
                    RunPageView = sorting("Document No.", "Line No.")
                                  order(descending);
                }
                action("Professional Inst. Membership")
                {
                    ApplicationArea = Basic;
                    Caption = 'Professional Institutions';
                    Image = CoupledContactPerson;
                    RunObject = Page "Professional Inst. Membership";
                    RunPageLink = "Document No." = field("User ID");
                    RunPageView = sorting("Document No.", "Line No.")
                                  order(descending);
                }
                action("Licence Reg. Employment Hist")
                {
                    ApplicationArea = Basic;
                    Caption = 'Experience & Employment';
                    Image = History;
                    RunObject = Page "Licence Reg. Employment Hist";
                    RunPageLink = "Document No." = field("User ID");
                    RunPageView = sorting("Document No.", "Line No.")
                                  order(descending);
                }
                action("Licence Reg. Practice Agencies")
                {
                    ApplicationArea = Basic;
                    Caption = 'Other Business & Professional Practices';
                    Image = EmployeeAgreement;
                    RunObject = Page "Licence Reg. Practice Agencies";
                    RunPageLink = "Document No." = field("User ID");
                    RunPageView = sorting("Document No.", "Line No.")
                                  order(descending);
                }
                action("Licence Reg Proc Professionals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Other Support Grounds';
                    Image = RelatedInformation;
                    RunObject = Page "Licence Reg Proc Professionals";
                    RunPageLink = "Document No." = field("User ID");
                    RunPageView = sorting("Document No.", "Line No.")
                                  order(descending);
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
            group(Category_Category7)
            {
                Caption = 'Application', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref(Attachments_Promoted; Attachments)
                {
                }
                actionref(ApprovalEntries_Promoted; ApprovalEntries)
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'User Information', Comment = 'Generated from the PromotedActionCategories property index 9.';

                actionref(Education_Info_Promoted; "Licence Reg Education Info")
                {
                }
                actionref(Membership_Promoted; "Professional Inst. Membership")
                {
                }
                actionref(Employment_Hist_Promoted; "Licence Reg. Employment Hist")
                {
                }
                actionref(Agencies_Promoted; "Licence Reg. Practice Agencies")
                {
                }
                actionref(Professionals_Promoted; "Licence Reg Proc Professionals")
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
        Rec."Application Type" := Rec."Application Type"::Category;
    end;

    var
        HasMembership: Boolean;
        HasEmpHist: Boolean;
        PracticeAgency: Boolean;
        HasBankruptOrConviction: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SignedDocument: Integer;
        IdentificationCard: Integer;
        QualificationCopies: Integer;
        CurrentKISMPracticeLicence: Integer;
        KISMMembershipCard: Integer;
        PassportPhoto: Integer;
        ProfessionalIndemnityCover: Integer;
        BankruptcyOrConvictionDoc: Integer;
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
        Nationality: Text;
        Town: Text;
        Street: Text;
        Building: Text;
        PostalAddress: Text;
        PostalCode: Text;
        BankruptOrConvictionDetails: Text;

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
            Nationality := Users.Nationality;
            Town := Users.Town;
            Street := Users.Street;
            Building := Users.Building;
            PostalAddress := Users."Postal Address";
            PostalCode := Users."Postal Code";
            HasMembership := Users.HasProfInstMembership();
            HasEmpHist := Users.HasWorkExperience();
            PracticeAgency := Users.HasOtherProfPractices();
            HasBankruptOrConviction := Users.HasBankruptcyOrConviction();
            BankruptOrConvictionDetails := Users."Bankruptcy/Conviction Details";
        end;

        Clear(DocAttach);
        Clear(SignedDocument);
        Clear(BankruptcyOrConvictionDoc);
        Clear(IdentificationCard);
        Clear(QualificationCopies);
        Clear(CurrentKISMPracticeLicence);
        Clear(KISMMembershipCard);
        Clear(PassportPhoto);
        Clear(ProfessionalIndemnityCover);

        RecRef.GetTable(Rec);

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Bankruptcy/Conviction");
        if DocAttach.FindSet() then
            BankruptcyOrConvictionDoc := DocAttach.Count;

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
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Passport Photo");
        if DocAttach.FindSet() then
            PassportPhoto := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Professional Indemnity Cover");
        if DocAttach.FindSet() then
            ProfessionalIndemnityCover := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Qualification Copies");
        if DocAttach.FindSet() then
            QualificationCopies := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."No.");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Signed Document");
        if DocAttach.FindSet() then
            SignedDocument := DocAttach.Count;
    end;
}
