

page 80000 "Legal Entity Card"
{
    AdditionalSearchTerms = 'change experience,suite,user interface';
    Caption = 'Legal Entity Card';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Company Information";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the company''s name and corporate form. For example, Inc. or Ltd.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the company''s address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies additional address information.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the company''s city.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the state, province or county of the company''s address.';
                    Visible = CountyVisible;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic, Suite;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Contact Name';
                    ToolTip = 'Specifies the name of the contact person in your company.';
                    Visible = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s telephone number.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'KRA PIN';
                    ToolTip = 'Specifies the company''s VAT registration number.';
                }
                field(GLN; Rec.GLN)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies your company in connection with electronic document exchange.';
                }
                field("Industrial Classification"; Rec."Industrial Classification")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the company''s industrial classification code.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the picture that has been set up for the company, such as a company logo.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                // field("N.S.SF. No."; Rec."N.S.SF. No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the N.S.SF. No. field.';
                // }
                // field(RubberStamp; Rec.RubberStamp)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'RubberStamp';
                //     ToolTip = 'Specifies the value of the RubberStamp field.';
                // }
                field(Vision; Rec.Vision)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Vision field.';
                }
                field(Mission; Rec.Mission)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Mission field.';
                }
                // field(Motto; Rec.Motto)
                // {
                //     ApplicationArea = Basic;
                //     MultiLine = true;
                //     ToolTip = 'Specifies the value of the Motto field.';
                // }
                // field("Headed By"; Rec."Headed By")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Headed By field.';
                // }
                // field("Current Head"; Rec."Current Head")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Personal Number';
                //     ToolTip = 'Specifies the value of the Personal Number field.';
                // }
                // field("Current Head Name"; Rec."Current Head Name")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Current Head Name field.';
                // }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the company''s telephone number.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the company''s fax number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the company''s email address.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies your company''s web site.';
                }
                // field("IC Partner Code"; Rec."IC Partner Code")
                // {
                //     ApplicationArea = Intercompany;
                //     Importance = Additional;
                //     ToolTip = 'Specifies your company''s intercompany partner code.';
                // }
                // field("IC Inbox Type"; Rec."IC Inbox Type")
                // {
                //     ApplicationArea = Intercompany;
                //     Importance = Additional;
                //     ToolTip = 'Specifies what type of intercompany inbox you have, either File Location or Database.';
                // }
                // field("IC Inbox Details"; Rec."IC Inbox Details")
                // {
                //     ApplicationArea = Intercompany;
                //     Importance = Additional;
                //     ToolTip = 'Specifies details about the location of your intercompany inbox, which can transfer intercompany transactions into your company.';
                // }
                // field("Auto. Send Transactions"; Rec."Auto. Send Transactions")
                // {
                //     ApplicationArea = Intercompany;
                //     Importance = Additional;
                //     ToolTip = 'Specifies that as soon as transactions arrive in the intercompany outbox, they will be sent to the intercompany partner.';
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Core Values")
            {
                ApplicationArea = Basic;
                Image = ValueLedger;
                // RunObject = Page "Core Values";
                ToolTip = 'Executes the Core Values action.';
            }
            separator(Action11)
            {
            }
            action("Core Mandate")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                // RunObject = Page "Core Mandates";
                ToolTip = 'Executes the Core Mandate action.';
            }
            separator(Action13)
            {
            }
            action("Responsibility Centers")
            {
                ApplicationArea = Advanced;
                Caption = 'Responsibility Centers';
                Image = Position;
                RunObject = Page "Responsibility Center List";
                ToolTip = 'Set up responsibility centers to administer business operations that cover multiple locations, such as a sales offices or a purchasing departments.';
            }
            separator(Action12)
            {
            }
            action("Annual Reporting Codes")
            {
                ApplicationArea = Basic;
                Image = AccountingPeriods;
                // RunObject = Page "Annual Reporting Codes";
                ToolTip = 'Executes the Annual Reporting Codes action.';
            }
            separator(Action16)
            {
            }
            action("Partners & Collaborators")
            {
                ApplicationArea = Basic;
                Image = ContactPerson;
                // RunObject = Page "Stakeholder Groups";
                ToolTip = 'Executes the Partners & Collaborators action.';
            }
            separator(Action18)
            {
            }
            action("Staff Profile")
            {
                ApplicationArea = Basic;
                Image = Employee;
                RunObject = Page "Employee List-P";
                Visible = false;
                ToolTip = 'Executes the Staff Profile action.';
            }
            separator(Action23)
            {
            }
            // action("Grants Profile")
            // {
            //     ApplicationArea = Basic;
            //     Image = Grid;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     RunObject = Page "Grant Funding Application List";
            //     Visible = false;
            //     ToolTip = 'Executes the Grants Profile action.';
            // }
            separator(Action24)
            {
            }
            action("Project profile")
            {
                ApplicationArea = Basic;
                Image = Job;
                RunObject = Page "Job List";
                ToolTip = 'Executes the Project profile action.';
            }
            separator(Action25)
            {
            }
            // action("Research Programs")
            // {
            //     ApplicationArea = Basic;
            //     Image = Planning;
            //     Promoted = true;
            //     PromotedCategory = Category7;
            //     RunObject = Page "Research Program List";
            //     Visible = false;
            //     ToolTip = 'Executes the Research Programs action.';
            // }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Core Values_Promoted"; "Core Values")
                {
                }
                actionref("Core Mandate_Promoted"; "Core Mandate")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Application Settings', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Responsibility Centers_Promoted"; "Responsibility Centers")
                {
                }
                actionref("Annual Reporting Codes_Promoted"; "Annual Reporting Codes")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'System Settings', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Partners & Collaborators_Promoted"; "Partners & Collaborators")
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Currencies', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Staff Profile_Promoted"; "Staff Profile")
                {
                }
            }
            group(Category_Category7)
            {
                Caption = 'Codes', Comment = 'Generated from the PromotedActionCategories property index 6.';

                actionref("Project profile_Promoted"; "Project profile")
                {
                }
            }
            group(Category_Category8)
            {
                Caption = 'Regional Settings', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateSystemIndicator;
    end;

    trigger OnClosePage()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        if ApplicationAreaMgmtFacade.SaveExperienceTierCurrentCompany(Experience) then
            RestartSession;
    end;

    trigger OnInit()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        SetShowMandatoryConditions;
        // IsSaaS := PermissionManager.SoftwareAsAService and not ApplicationAreaMgmtFacade.IsInvoicingOnlyEnabled;
    end;

    trigger OnOpenPage()
    var
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        CountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");

        ApplicationAreaMgmtFacade.GetExperienceTierCurrentCompany(Experience);
    end;

    var
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        CalendarMgmt: Codeunit "Calendar Management";
        CompanyInformationMgt: Codeunit "Company Information Mgt.";
        FormatAddress: Codeunit "Format Address";
        PermissionManager: Codeunit "Permission Manager";
        Experience: Text;
        SystemIndicatorText: Text[250];

        SystemIndicatorTextEditable: Boolean;
        IBANMissing: Boolean;
        BankBranchNoOrAccountNoMissing: Boolean;
        IsSaaS: Boolean;
        BankAcctPostingGroup: Code[20];
        CountyVisible: Boolean;

    local procedure UpdateSystemIndicator()
    var
        IndicatorStyle: Option;
    begin
        //  GetSystemIndicator(SystemIndicatorText, IndicatorStyle); // IndicatorStyle is not used
        //  SystemIndicatorTextEditable := CurrPage.Editable and ("System Indicator" = "system indicator"::"Custom Text");
    end;

    local procedure SystemIndicatorTextOnAfterVali()
    begin
        UpdateSystemIndicator
    end;

    local procedure SystemIndicatorOnAfterValidate()
    begin
        UpdateSystemIndicator
    end;

    local procedure SetShowMandatoryConditions()
    begin
        BankBranchNoOrAccountNoMissing := (Rec."Bank Branch No." = '') or (Rec."Bank Account No." = '');
        IBANMissing := Rec.Iban = ''
    end;

    local procedure RestartSession()
    var
        SessionSetting: SessionSettings;
    begin
        SessionSetting.Init;
        SessionSetting.RequestSessionUpdate(false);
    end;
}

#pragma implicitwith restore

