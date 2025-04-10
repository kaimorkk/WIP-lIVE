page 96001 "Licensing Portal Users Card"
{
    ApplicationArea = All;
    Caption = 'Licensing Portal Users Card';
    PageType = Card;
    SourceTable = "Licensing Portal Users";
    // DeleteAllowed = false;
    DelayedInsert = true;
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.', Comment = '%';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.', Comment = '%';
                }
                field(Town; Rec.Town)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Town field.', Comment = '%';
                }
                field(Street; Rec.Street)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Street field.', Comment = '%';
                }
                field(Building; Rec.Building)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Building field.', Comment = '%';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Address field.', Comment = '%';
                }
                field("Postal Code"; Rec."Postal Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Postal Code field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                    Visible = false;
                }
                field("Email Verified"; Rec."Email Verified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Verified field.', Comment = '%';
                    Visible = false;
                }
                field("Email Verified At"; Rec."Email Verified At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Verified At field.', Comment = '%';
                    Visible = false;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                    Visible = false;
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Last DateTime Modified field.', Comment = '%';
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.', Comment = '%';
                    Visible = false;
                }
            }
            part("Licence Reg Pract Categories"; "Licence Reg Pract Categories")
            {
                ApplicationArea = Basic;
                Caption = 'Practice Categories';
                SubPageLink = "Document No." = field("User ID");
                Editable = false;
            }
            group("Bankruptcy or Conviction")
            {
                field("Has Bankruptcy/Conviction"; Rec."Has Bankruptcy/Conviction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Bankruptcy/Conviction field.', Comment = '%';
                }
                field("Bankruptcy/Conviction Details"; Rec."Bankruptcy/Conviction Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bankruptcy/Conviction Details field.', Comment = '%';
                    MultiLine = true;
                    // Visible = HasBankruptOrConviction;
                }
                field("Bankruptcy/Conviction Doc"; BankruptcyOrConvictionDoc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Upload Details';
                    ToolTip = 'Specifies the value of the Bankruptcy/Conviction Doc field.', Comment = '%';
                    // Visible = HasBankruptOrConviction;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."User ID");
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
                        DocAttach.SetRange("No.", Rec."User ID");
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
                        DocAttach.SetRange("No.", Rec."User ID");
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
                        DocAttach.SetRange("No.", Rec."User ID");
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
                        DocAttach.SetRange("No.", Rec."User ID");
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
                        DocAttach.SetRange("No.", Rec."User ID");
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
                        DocAttach.SetRange("No.", Rec."User ID");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Current KISM Practice Licence");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
                field("Signed Document"; SignedDocument)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Signed Document field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."User ID");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Signed Document");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
                field("Other Documents"; OtherDocuments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Documents field.', Comment = '%';
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        Clear(DocAttach);
                        Clear(DocAttachDetails);
                        RecRef.GetTable(Rec);
                        DocAttach.Reset();
                        DocAttach.SetRange("Table ID", RecRef.Number);
                        DocAttach.SetRange("No.", Rec."User ID");
                        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Other Documents");
                        // DocAttach.FindSet();
                        DocAttachDetails.SetTableView(DocAttach);
                        DocAttachDetails.RunModal();
                    end;
                }
            }
            group("Declaration A")
            {
                field("Competency Agreement"; Rec."Competency Agreement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Agreement field.', Comment = '%';
                }
                field("Not Corrupt"; Rec."Not Corrupt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Not Corrupt field.', Comment = '%';
                }
                field("Not Offer Inducements"; Rec."Not Offer Inducements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Not Offer Inducements field.', Comment = '%';
                }
                field("Not Engaged in Corrosive Prac"; Rec."Not Engaged in Corrosive Prac")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Not Engaged in Corrosive Prac field.', Comment = '%';
                }
                field("All Above is True"; Rec."All Above is True")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the All Above is True field.', Comment = '%';
                }
            }
            group("Declaration B")
            {
                field("Fully Read and Understood"; Rec."Fully Read and Understood")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fully Read and Understood field.', Comment = '%';
                }
                field("Commit to Abide"; Rec."Commit to Abide")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commit to Abide field.', Comment = '%';
                }
            }
            group("Declaration C")
            {
                field("Not Working for Govt"; Rec."Not Working for Govt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Not Working for Govt field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
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
                // Visible = HasMembership;
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
                // Visible = HasEmpHist;
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
                // Visible = PracticeAgency;
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
            action("Licence Restoration Referees")
            {
                ApplicationArea = Basic;
                Caption = 'Referees';
                Image = ReferenceData;
                RunObject = Page "Licence Restoration Referees";
                RunPageLink = "Document No." = field("User ID");
                RunPageView = sorting("Document No.", "Line No.")
                                  order(descending);
            }
            action("Application For Registration")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Image = Print;
                
                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("User ID", Rec."User ID");
                    Report.Run(Report::"Application For Registration", true, true, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

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
                actionref(Application_For_Registration_Promoted; "Application For Registration")
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
        // HasMembership := Rec.HasProfInstMembership();
        // HasEmpHist := Rec.HasWorkExperience();
        // PracticeAgency := Rec.HasOtherProfPractices();
        HasBankruptOrConviction := Rec.HasBankruptcyOrConviction();
    end;

    var
        // HasMembership: Boolean;
        // HasEmpHist: Boolean;
        // PracticeAgency: Boolean;
        HasBankruptOrConviction: Boolean;
        OtherDocuments: Integer;
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

    local procedure SetControlAppearance()
    begin
        Clear(DocAttach);
        Clear(SignedDocument);
        Clear(OtherDocuments);
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
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Bankruptcy/Conviction");
        if DocAttach.FindSet() then
            BankruptcyOrConvictionDoc := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Current KISM Practice Licence");
        if DocAttach.FindSet() then
            CurrentKISMPracticeLicence := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Identification Card");
        if DocAttach.FindSet() then
            IdentificationCard := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"KISM Membership Card");
        if DocAttach.FindSet() then
            KISMMembershipCard := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Passport Photo");
        if DocAttach.FindSet() then
            PassportPhoto := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Professional Indemnity Cover");
        if DocAttach.FindSet() then
            ProfessionalIndemnityCover := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Qualification Copies");
        if DocAttach.FindSet() then
            QualificationCopies := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Signed Document");
        if DocAttach.FindSet() then
            SignedDocument := DocAttach.Count;

        DocAttach.Reset();
        DocAttach.SetRange("Table ID", RecRef.Number);
        DocAttach.SetRange("No.", Rec."User ID");
        DocAttach.SetRange("Document Type", DocAttach."Document Type"::"Other Documents");
        if DocAttach.FindSet() then
            OtherDocuments := DocAttach.Count;
    end;
}
