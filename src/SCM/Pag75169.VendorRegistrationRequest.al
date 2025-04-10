

page 75169 "Vendor Registration Request"
{
    Caption = 'Vendor Registration Request';
    DeleteAllowed = false;
    PageType = ListPlus;
    SourceTable = Contact;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = NoFieldVisible;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the name of the contact. If the contact is a person, you can click the field to see the Name Details window.';

                    trigger OnAssistEdit()
                    var
                        Contact: Record Contact;
                    begin
                        if Rec."No." = '' then begin
                            Rec.Insert(true);
                            Commit;
                        end;
                        Contact := Rec;
                        Contact.SetRecfilter;
                        if Contact.Type = Contact.Type::Person then begin
                            Clear(NameDetails);
                            NameDetails.SetTableview(Contact);
                            NameDetails.SetRecord(Contact);
                            NameDetails.RunModal;
                        end else begin
                            Clear(CompanyDetails);
                            CompanyDetails.SetTableview(Contact);
                            CompanyDetails.SetRecord(Contact);
                            CompanyDetails.RunModal;
                        end;
                        Rec := Contact;
                        CurrPage.Update(false);
                    end;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of contact, either company or person.';

                    trigger OnValidate()
                    begin
                        TypeOnAfterValidate;
                    end;
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Tax Registration (PIN) No.';
                    Enabled = VATRegistrationNoEnable;
                    Importance = Additional;
                    ToolTip = 'Specifies the contact''s VAT registration number. This field is valid for companies only.';

                    trigger OnDrillDown()
                    var
                        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                    begin
                        VATRegistrationLogMgt.AssistEditContactVATReg(Rec);
                    end;
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    Caption = 'Registered Business Name';
                    Enabled = CompanyNameEnable;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the company. If the contact is a person, Specifies the name of the company for which this contact works. This field is not editable.';

                    trigger OnAssistEdit()
                    begin
                        Rec.LookupCompany;
                    end;
                }
                field("Company No."; Rec."Company No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                group(Control37)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s address.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the city where the contact is located.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the country/region of the address.';
                    }
                    field(ShowMap; ShowMapLbl)
                    {
                        ApplicationArea = Basic, Suite;
                        Editable = false;
                        ShowCaption = false;
                        Style = StrongAccent;
                        StyleExpr = true;
                        ToolTip = 'Specifies the contact''s address on your preferred map website.';

                        trigger OnDrillDown()
                        begin
                            CurrPage.Update(true);
                            Rec.DisplayMap;
                        end;
                    }
                }
                group(ContactDetails)
                {
                    Caption = 'Contact';
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s phone number.';
                    }
                    field("Mobile Phone No."; Rec."Mobile Phone No.")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s mobile telephone number.';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Basic, Suite;
                        ExtendedDatatype = EMail;
                        Importance = Promoted;
                        ToolTip = 'Specifies the email address of the contact.';
                    }
                    field("Fax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the contact''s fax number.';
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Basic, Suite;
                        ToolTip = 'Specifies the contact''s web site.';
                    }
                    field("Correspondence Type"; Rec."Correspondence Type")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        ToolTip = 'Specifies the preferred type of correspondence for the interaction. NOTE: If you use the Web client, you must not select the Hard Copy option because printing is not possible from the web client.';
                    }
                    field("Language Code"; Rec."Language Code")
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Promoted;
                        ToolTip = 'Specifies the language that is used when translating specified text on documents to foreign business partner, such as an item description on an order confirmation.';
                    }
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Suite;
                    Enabled = CurrencyCodeEnable;
                    Importance = Promoted;
                    ToolTip = 'Specifies the currency code for the contact.';
                }
                field("Territory Code"; Rec."Territory Code")
                {
                    ApplicationArea = RelationshipMgmt;
                    Importance = Additional;
                    ToolTip = 'Specifies the territory code for the contact.';
                }
            }
        }
        area(factboxes)
        {
            part(Control41; "Contact Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("No.");
                Visible = not IsOfficeAddin;
            }
            part(Control31; "Contact Statistics FactBox")
            {
                ApplicationArea = RelationshipMgmt;
                SubPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter");
            }
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
        area(navigation)
        {
            group("C&ontact")
            {
                Caption = 'C&ontact';
                Image = ContactPerson;
                group("Comp&any")
                {
                    Caption = 'Comp&any';
                    // Enabled = CompanyGroupEnabled;
                    Image = Company;
                    action("Notify Procurement Department")
                    {
                        ApplicationArea = Basic;
                        Image = Email;

                        trigger OnAction()
                        begin
                            Procurement.FnSendEmaiNotificationOnSupplierRegRequest(Rec);
                            Procurement.FnSendEmaiNotificationOnSupplierRegRequestAcknowledge(Rec)
                        end;
                    }

                    action("Create Vendor")
                    {
                        ApplicationArea = Basic;
                        Image = Email;

                        trigger OnAction()
                        begin
                            Procurement.CreateVendor(Rec);
                        end;
                    }



                }


            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Notify Procurement Department_Promoted"; "Notify Procurement Department")
                {
                }
                actionref("Create Vendor_Promoted"; "Create Vendor")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        if CRMIntegrationEnabled then begin
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
            if Rec."No." <> xRec."No." then
                CRMIntegrationManagement.SendResultNotification(Rec);
        end;

        xRec := Rec;
        EnableFields;

        if Rec.Type = Rec.Type::Person then
            IntegrationFindCustomerNo
        else
            IntegrationCustomerNo := '';
    end;

    trigger OnInit()
    var
        ClientTypeManagement: Codeunit "Client Type Management";
    begin
        OrganizationalLevelCodeEnable := true;
        CompanyNameEnable := true;
        VATRegistrationNoEnable := true;
        CurrencyCodeEnable := true;
        ActionVisible := ClientTypeManagement.GetCurrentClientType = Clienttype::Windows;
        Rec."Portal Request" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        Contact: Record Contact;
    begin
        Rec."Portal Request" := true;

        if Rec.GetFilter("Company No.") <> '' then begin
            Rec."Company No." := Rec.GetRangemax("Company No.");
            Rec.Type := Rec.Type::Person;
            Contact.Get(Rec."Company No.");
            Rec.InheritCompanyToPersonData(Contact);
        end;
    end;

    trigger OnOpenPage()
    var
        OfficeManagement: Codeunit "Office Management";
    begin
        Rec."Portal Request" := true;
        IsOfficeAddin := OfficeManagement.IsAvailable;
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        SetNoFieldVisible;
        SetParentalConsentReceivedEnable;
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CompanyDetails: Page "Company Details";
        NameDetails: Page "Name Details";
        IntegrationCustomerNo: Code[20];

        CurrencyCodeEnable: Boolean;

        VATRegistrationNoEnable: Boolean;

        CompanyNameEnable: Boolean;

        OrganizationalLevelCodeEnable: Boolean;
        CompanyGroupEnabled: Boolean;
        PersonGroupEnabled: Boolean;
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        IsOfficeAddin: Boolean;
        ActionVisible: Boolean;
        ShowMapLbl: label 'Show Map';
        NoFieldVisible: Boolean;
        ParentalConsentReceivedEnable: Boolean;
        Procurement: Codeunit "Procurement Processing";

    local procedure EnableFields()
    begin
        CompanyGroupEnabled := Rec.Type = Rec.Type::Company;
        PersonGroupEnabled := Rec.Type = Rec.Type::Person;
        CurrencyCodeEnable := Rec.Type = Rec.Type::Company;
        VATRegistrationNoEnable := Rec.Type = Rec.Type::Company;
        CompanyNameEnable := Rec.Type = Rec.Type::Person;
        OrganizationalLevelCodeEnable := Rec.Type = Rec.Type::Person;
    end;

    local procedure IntegrationFindCustomerNo()
    var
        ContactBusinessRelation: Record "Contact Business Relation";
    begin
        ContactBusinessRelation.SetCurrentkey("Link to Table", "Contact No.");
        ContactBusinessRelation.SetRange("Link to Table", ContactBusinessRelation."link to table"::Customer);
        ContactBusinessRelation.SetRange("Contact No.", Rec."Company No.");
        if ContactBusinessRelation.FindFirst then begin
            IntegrationCustomerNo := ContactBusinessRelation."No.";
        end else
            IntegrationCustomerNo := '';
    end;

    local procedure TypeOnAfterValidate()
    begin
        EnableFields;
    end;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.ContactNoIsVisible;
    end;

    local procedure SetParentalConsentReceivedEnable()
    begin
        if Rec.Minor then
            ParentalConsentReceivedEnable := true
        else begin
            Rec."Parental Consent Received" := false;
            ParentalConsentReceivedEnable := false;
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePrintContactCoverSheet(var ContactCoverSheetReportID: Integer)
    begin
    end;
}

#pragma implicitwith restore

