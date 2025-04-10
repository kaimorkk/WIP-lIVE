page 96020 Licences
{
    ApplicationArea = All;
    Caption = 'Licences';
    PageType = List;
    SourceTable = Licences;
    UsageCategory = None;
    Editable = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    CardPageId = "Licences Card";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Licence ID"; Rec."Licence ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence ID field.', Comment = '%';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.', Comment = '%';
                }
                field("Category ID"; Rec."Category ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category ID field.', Comment = '%';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Name field.', Comment = '%';
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Licence Start Date"; Rec."Licence Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Start Date field.', Comment = '%';
                }
                field("Licence Expiry Date"; Rec."Licence Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Expiry Date field.', Comment = '%';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.', Comment = '%';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Renew; Rec.Renew)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renew field.', Comment = '%';
                }
                field(Restore; Rec.Restore)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Restore field.', Comment = '%';
                }
                field("Grounds of Removal"; Rec."Grounds of Removal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grounds of Removal field.', Comment = '%';
                }
                field("Application ID"; Rec."Application ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Registration ID field.', Comment = '%';
                }
                field(Deregister; Rec.Deregister)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deregister field.', Comment = '%';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.', Comment = '%';
                }
                field("Last DateTime Modified"; Rec."Last DateTime Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last DateTime Modified field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Deregister Licence")
            {
                ApplicationArea = Basic;
                Caption = 'Deregister Licence';
                Image = RemoveLine;

                trigger OnAction()
                begin
                    Rec.TestField("Grounds of Removal");
                    Rec.fnDeregisterLicence(Rec);
                    CurrPage.Update(true);
                end;
            }
            action("Practising Licence")
            {
                ApplicationArea = Basic;
                Caption = 'Practicing License';
                Image = PrintDocument;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("Licence ID", Rec."Licence ID");
                    if Rec.FindSet() then
                        Report.Run(Report::"Practicing License", true, true, Rec);
                end;
            }
            action("Certificate of Registration")
            {
                ApplicationArea = Basic;
                Caption = 'Certificate of Registration';
                Image = PrintForm;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetRange("Licence ID", Rec."Licence ID");
                    if Rec.FindSet() then
                        Report.Run(Report::"Certificate of Registration", true, true, Rec);
                end;
            }
        }

        area(Promoted)
        {
            group(Category_Category5)
            {
                Caption = 'Actions', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(DeregisterLicencePromoted; "Deregister Licence")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref(PractisingLicencePromoted; "Practising Licence")
                {
                }
                actionref(CertificateofRegistrationPromoted; "Certificate of Registration")
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

    var
        Users: Record "Licensing Portal Users";
        fName: Text;
        lName: Text;
        otherNames: Text;
        fullNames: Text;
        email: Text;
        phone: Text;
        idNo: Text;

    local procedure SetControlAppearance()
    begin
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
    end;
}
