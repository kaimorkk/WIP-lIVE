namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;
using System.EMail;
using System.Security.User;


page 52194206 "HR Employee Registration Crd"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Workflow Process,Witness Details,Attachments';
    ApplicationArea = All;
    Caption = 'Witness Registration Card';
    SourceTable = "Wip Header Registration";
    InsertAllowed = true;
    layout
    {
        area(Content)
        {
            group("General Details")
            {
                Caption = 'General Details';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Editable = false;
                    // Editable = rec."Contract Type" = rec."Contract Type"::Deployed;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        // rec.TestField("Contract Type");

                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Passport Number field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field("Type of Employee"; Rec."Type of Employee")
                {
                    ApplicationArea = all;
                    Visible = false;
                }

                field(workstation; Rec.County)
                {
                    ApplicationArea = all;
                    Caption = 'workstation';
                    Visible = false;

                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("County Name"; Rec."County Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Workstation Name';
                    ToolTip = 'Specifies the value of the Workstation Name field.';
                }
                field("Current Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = All;
                    Visible = false;
                    //TableRelation = "Duty Station".Code where(Blocked = filter(false));
                }

                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Department';
                //     ToolTip = 'Specifies the value of the Responsibility Center field.';
                // }

                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Code';
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                    Visible = true;
                }
                field("Dimectorates Name"; Rec."Dimectorates Name")
                {
                    ApplicationArea = all;
                    Caption = 'Dimectorates Name';
                }


                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Permanent Address';
                    ToolTip = 'Specifies the value of the Permanent Address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = all;
                    Visible = false;
                    Caption = 'Employee Type';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Home County';
                    ToolTip = 'Specifies the value of the Home County field.';
                }
                field("Home District"; Rec."Home District")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Home District field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the User ID field.';
                    trigger OnValidate()
                    var
                        HREmpREc: Record "HR Employees";
                    begin
                        HREmpREc.Reset();
                        HREmpREc.SetRange("User ID", Rec."User ID");
                        HREmpREc.SetFilter("No.", '<>%1', Rec."No.");
                        if HREmpREc.FindFirst() then
                            Error('You cannot share the user id with member no %1', HREmpREc."No.");
                        SupervisorNames := GetSupervisor(Rec."User ID");
                    end;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    Style = Attention;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Employee Type Primary"; Rec."Employee Type Primary")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee Type Primary field.';
                }
                field("Commisioner?"; Rec."Commisioner?")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Commisioner? field.';
                }
                field("Sitting C.E.O"; Rec."Sitting C.E.O")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Sitting C.E.O field.';
                }
                field("Highest level"; Rec."Highest level")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Highest Leverl Description"; Rec."Highest Leverl Description")
                {
                    ApplicationArea = all;
                    Visible = false;
                    Caption = 'Highest Education Level';
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
            }
            group("Communication Details")
            {
                Caption = 'Communication Details';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Home Phone Number field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Address';
                    ToolTip = 'Specifies the value of the Current Address field.';
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    ToolTip = 'Specifies the value of the Ext. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Email';
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the value of the Personal Email field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = all;
                    Caption = 'Company Email';
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the value of the Company Email Email field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Sub Location"; Rec."Sub Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Location field.';
                }
            }
            group("Personal Details")
            {
                Caption = 'Personal Details';
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Tribe; Rec.Tribe)
                {
                    ApplicationArea = Basic;
                    Caption = 'Ethnicity';
                    ToolTip = 'Specifies the value of the Ethnicity field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the First Language (R/W/S) field.';
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Read field.';
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Write field.';
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Language Speak field.';
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Second Language (R/W/S) field.';
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Read field.';
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Write field.';
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Language Speak field.';
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vehicle Registration Number field.';
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number Of Dependants field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Caption = 'Abled Differently';
                    ToolTip = 'Specifies the value of the Physically Challenged field.';
                }
                field("Exemption Certificate No."; Rec."Exemption Certificate No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Exemption Certificate No. field.';
                }

                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Medical Scheme No. field.';
                }
                field("Medical Scheme Head Member"; Rec."Medical Scheme Head Member")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Medical Scheme Head Member field.';
                }
                field("Medical Scheme Name"; Rec."Medical Scheme Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Medical Scheme Name field.';
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cause of Inactivity Code field.';
                }
            }
            group("Bank Details")
            {
                Caption = 'Bank Details';
                Visible = false;
                field("No. Of Bank A/Cs"; Rec."No. Of Bank A/Cs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of Bank A/Cs field.';
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                    trigger OnValidate()
                    begin


                        if Rec."Date Of Birth" >= Today then
                            Error('Invalid Entry');
                        //DAge:= Dates.DetermineAge("Date Of Birth",TODAY);
                        if (Rec."Date Of Birth" <> 0D) then
                            Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
                        if Rec."Retirement date" <> 0D then
                            Rec.DPension := Dates.DetermineAge(Today, Rec."Retirement date");
                        //IF TODAY - HREmp."Date Of Birth" <= 18 THEN ERROR('Age should be greater than 18 years');
                    end;
                }
                field(DAge; Rec.DAge)
                {
                    ApplicationArea = Basic;
                    Caption = 'Age';
                    Editable = true;
                    Enabled = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Retirement date"; Rec."Retirement date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Retirement date field.';
                }
                field(DPension; Rec.DPension)
                {
                    ApplicationArea = Basic;
                    Caption = 'Days to Retire';
                    Enabled = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Days to Retire field.';
                }
                // field(DRetirement; Rec.DRetirement)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the DRetirement field.';
                // }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Caption = 'Date Of Joining';
                    Visible = true;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Date of Current Employment"; Rec."Date of Current Employment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date of Current Employment field.';
                }

                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract Duration"; Rec."Contract Duration")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Contract Duration field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field(sec; Rec.sec)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = '(IF)Seconded Start Date';
                    ToolTip = 'Specifies the value of the (IF)Seconded Start Date field.';
                }
                field(secdur; Rec.secdur)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Seconded Duration';
                    ToolTip = 'Specifies the value of the Seconded Duration field.';
                }
                field(sec2; Rec.sec2)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Seconded End Date';
                    ToolTip = 'Specifies the value of the Seconded End Date field.';
                }
                field("Medical Scheme Join Date"; Rec."Medical Scheme Join Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Medical Scheme Join Date field.';
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Wedding Anniversary field.';
                }
                field("Passport Expiry Date"; Rec."Passport Expiry Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Passport Expiry Date field.';
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                Visible = false;
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incremental Month field.';
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                Visible = false;
                field("PIN No."; Rec."PIN No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the PIN No. field.';
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the NSSF No. field.';
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the NHIF No. field.';
                }
            }
            group("Separation Details")
            {
                Caption = 'Separation Details';
                Visible = false;
                field("Termination Grounds"; Rec."Termination Grounds")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reasons For Leaving';
                    Importance = Promoted;
                    OptionCaption = '< ,Resignation,End Of Contract,Dismissal,Termination,Retirement,Death,Other';
                    ToolTip = 'Specifies the value of the Reasons For Leaving field.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    NotBlank = false;
                    ShowMandatory = true;
                    Style = AttentionAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Exit Interview Done by field.';
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                Visible = false;

            }
            systempart(Control1102755002; Outlook) { }
            group("Acting Appointment")
            {
                Caption = 'Acting Appointment';
                Visible = false;

                field("Reason For Acting"; Rec."Reason For Acting")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason For Acting';
                    ToolTip = 'Specifies the value of the Reason For Acting field.';
                }

                field("If Acted?"; Rec."If Acted?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the If Acted? field.';
                }
                field("On Leave"; Rec."On Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Leave field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1; Links) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Print")
            {
                Caption = '&Print';
                action("Personal Information File")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Information File';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Personal Information File action.';
                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        if HREmp.Find('-') then
                            Report.Run(39005585, true, true, HREmp);
                    end;
                }
                action("Misc. Article Info")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Article Info';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Misc. Article Info action.';
                    trigger OnAction()
                    begin
                        // Misc.Reset();
                        // Misc.SetRange(Misc."Employee No.", Rec."No.");
                        // if Misc.Find('-') then
                        //     Report.Run(Report::"Employee - Misc. Article Info.", true, true, Misc);
                    end;
                }
                action("Confidential Info")
                {
                    ApplicationArea = Basic;
                    Caption = 'Confidential Info';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Confidential Info action.';
                    trigger OnAction()
                    begin
                        // Conf.Reset();
                        // Conf.SetRange(Conf."Employee No.", Rec."No.");
                        // if Conf.Find('-') then
                        //     Report.Run(Report::"Employee - Confidential Info.", true, true, Conf);
                    end;
                }
                action(Label)
                {
                    ApplicationArea = Basic;
                    Caption = 'Label';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Label action.';
                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");

                        // Report.Run(Report::"Employee - Labels", true, true, HREmp);
                    end;
                }
                action(Addresses)
                {
                    ApplicationArea = Basic;
                    Caption = 'Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Addresses action.';
                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        // if HREmp.Find('-') then
                        //     Report.Run(Report::"Employee - Addresses", true, true, HREmp);
                    end;
                }
                action("Alt. Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Alt. Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Alt. Addresses action.';
                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        // if HREmp.Find('-') then
                        //     Report.Run(Report::"Employee - Alt. Addresses", true, true, HREmp);
                    end;
                }
                action("Phone Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'Phone Nos';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ToolTip = 'Executes the Phone Nos action.';
                    trigger OnAction()
                    begin
                        HREmp.Reset();
                        HREmp.SetRange(HREmp."No.", Rec."No.");
                        // if HREmp.Find('-') then
                        //     Report.Run(Report::"Employee - Phone Nos.", true, true, HREmp);
                    end;
                }
            }
            group("&Employee")
            {
                Caption = 'Witness Details';
                action("Next of Kin")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "Next Of KIn Application";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter("Next of Kin"));
                    ToolTip = 'Executes the Next of Kin action.';
                }
                action(Beneficiaries)
                {
                    ApplicationArea = Basic;
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "Next Of KIn Application";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter(Beneficiary));
                    ToolTip = 'Executes the Beneficiaries action.';
                }
                action(Dependants)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dependants';
                    Image = SalesPerson;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "Next Of KIn Application";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter(Dependant));
                    ToolTip = 'Executes the Dependants action.';
                }
                action(Spouse)
                {
                    ApplicationArea = Basic;
                    Caption = 'Spouse';
                    Image = SalesPerson;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Spouse1";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter(Spouse));
                    ToolTip = 'Executes the Spouse action.';
                }
                action("<Page HR Employee In-laws1>")
                {
                    ApplicationArea = Basic;
                    Caption = 'Siblings';
                    Image = SalesPerson;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee In-laws1";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter(Siblings));
                    ToolTip = 'Executes the Siblings action.';
                }
                action("<Page HR Employee Spouse1>")
                {
                    ApplicationArea = Basic;
                    Caption = 'In-Laws';
                    Image = SalesPerson;
                    Visible = false;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Spouse1";
                    RunPageLink = "Employee Code" = field("No.");
                    RunPageView = where(Type = filter("In-Laws"));
                    ToolTip = 'Executes the In-Laws action.';
                }

            }
            group(ActionGroup19)
            {
                Caption = 'Approvals';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Enabled = NOT OpenApprovalEntriesExist;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    var
                        Nextofkinapp: Record "Next Of KIn Application";
                        Cummlative: decimal;
                    begin
                        rec.TestField("Date Of Birth");
                        // if rec."Contract Type" <> rec."Contract Type"::Deployed then
                        //     rec.TestField("NSSF No.");
                        // rec.TestField("PIN No.");
                        Rec.TestField("ID Number");
                        //TESTFIELDS;
                        if Confirm('Send this Document for Approval?', true) = false then
                            exit;
                        Nextofkinapp.Reset();
                        Nextofkinapp.SetRange("Employee Code", rec."No.");
                        Nextofkinapp.SetRange(Type, Nextofkinapp.Type::Beneficiary);
                        if Nextofkinapp.Find('-') then begin
                            Nextofkinapp.CalcSums("Percentage Shares");
                            Cummlative := Nextofkinapp."Percentage Shares";
                            if Cummlative <> 100 then
                                Error('Percentrage shares must be equal to 100% on beneficiaries');
                        end;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        CurrPage.Close();
                        //ApprovalMgt.SendEmployeeAppApprovalReq(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    Enabled = OpenApprovalEntriesExist;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        if not Confirm('Do you want to cancell this Approval?') then exit;
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        CurrPage.Close();
                        //ApprovalMgt.CancelEmployeeAppRequest(Rec, true, true);
                    end;
                }
                action("Re-open Document")
                {
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    trigger OnAction()
                    var
                        myInt: Integer;
                    begin
                        // if rec."Approval Status" = rec."Approval Status"::"Pending approval" then
                        //     Error('cancell the approval Request');
                        if Confirm('Do you want to reopen this document?') = true then begin
                            rec."Approval Status" := rec."Approval Status"::Open;
                            Rec.Modify();
                            Message('Document Reopend successfully');
                            CurrPage.Close();
                        end;

                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    var
                        Approvalma: Codeunit "Approvals Mgmt.";
                    begin
                        Approvalma.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approve';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = rec."Approval Status" = rec."Approval Status"::"Pending Approval";
                    ToolTip = 'Executes the Approve action.';

                    trigger OnAction()
                    var
                        myInt: Integer;
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Do you want approve this document?') = true then
                            ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                        CurrPage.Close();

                    end;
                }
                action(StaffFile)
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff File';
                    Image = Attach;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Staff File action.';
                    trigger OnAction()
                    var
                    // DMSInt: Record dms;
                    begin
                        // DMSInt.Reset();
                        // DMSInt.SetRange(DMSInt."DMS Link Type", DMSInt."DMS Link Type"::"Staff File");
                        // if DMSInt.Find('-') then
                        //     Hyperlink(DMSInt."DMS Link Path" + Rec."No.");
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin
        Setapparance();

    end;

    trigger OnAfterGetRecord()
    begin
        Setapparance();


        // if (Rec."Date Of Birth" <> 0D) then
        //     Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);


        /*
        "Leave Balance":="Allocated Leave Days" + "Total Leave Taken";

        LOS:= Dates.DetermineAge("Date Of Joining the Company",TODAY);
        //DAge:='';

        //Recalculate Important Dates
          IF ("Date Of Leaving the Company" = 0D) THEN BEGIN
            IF  ("Date Of Birth" <> 0D) THEN
            DAge:= Dates.DetermineAge("Date Of Birth",TODAY);
            IF  ("Date Of Joining the Company" <> 0D) THEN
            //DService:= Dates.DetermineAge("Date Of Joining the Company",TODAY);
            IF  ("Pension Scheme Join Date" <> 0D) THEN
            //DPension:= Dates.DetermineAge("Pension Scheme Join Date",TODAY);
            IF  ("Medical Scheme Join Date" <> 0D) THEN;
           // DMedical:= Dates.DetermineAge("Medical Scheme Join Date",TODAY);
            //MODIFY;
          END ELSE BEGIN
            IF  ("Date Of Birth" <> 0D) THEN
            DAge:= Dates.DetermineAge("Date Of Birth","Date Of Leaving the Company");
            IF  ("Date Of Joining the Company" <> 0D) THEN
            //DService:= Dates.DetermineAge("Date Of Joining the Company","Date Of Leaving the Company");
            IF  ("Pension Scheme Join Date" <> 0D) THEN
            //DPension:= Dates.DetermineAge("Pension Scheme Join Date","Date Of Leaving the Company");
            IF  ("Medical Scheme Join Date" <> 0D) THEN;
            //DMedical:= Dates.DetermineAge("Medical Scheme Join Date","Date Of Leaving the Company");
           //MODIFY;
          END;

        //Recalculate Leave Days
        VALIDATE("Allocated Leave Days");
        SupervisorNames:=GetSupervisor("User ID");
        //    */
        // if Rec."Retirement date" <> 0D then
        //     Rec.DPension := Dates.DetermineAge(Today, Rec."Retirement date");

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::New;
    end;

    trigger OnOpenPage()
    begin
        Setapparance();
    end;

    var
        PictureExists: Boolean;
        Text001: Label 'Do you want to replace the existing picture of %1 %2?';
        Text002: Label 'Do you want to delete the picture of %1 %2?';
        Dates: Codeunit "HR Dates";
        DoclLink: Record "HR Employee Attachments";
        "Filter": Boolean;
        prEmployees: Record "HR Employees";
        // prPayrollType: Record "prPayroll Type";
        Mail: Codeunit Mail;
        HREmp: Record "HR Employees";
        SupervisorNames: Text[60];
        // Misc: Record "Misc. Article Information";
        // Conf: Record "Confidential Information";
        //SMTP: Codeunit "SMTP Mail";
        // CompInfo: Record "Company Information";
        Body: Text[1024];
        Text003: Label 'Welcome to Lotus Capital Limited';
        Filename: Text;
        // Recordlink: Record "Record Link";
        Text004a: Label 'It is a great pleasure to welcome you to Moi Teaching and Referral Hospital. You are now part of an organization that has its own culture and set of values. On your resumption and during your on-boarding process,  to help you to understand and adapt quickly and easily to the LOTUS CAPITAL culture and values, HR Unit shall provide you with various important documents that you are encouraged to read and understand.';
        Text004b: Label 'On behalf of the Managing Director, I congratulate you for your success in the interview process and I look forward to welcoming you on board LOTUS CAPITAL Limited.';
        Text004c: Label 'Adebola SAMSON-FATOKUN';
        Text004d: Label 'Strategy & Corporate Services';
        NL: Char;
        LF: Char;
        // objpostingGroup: Record "prEmployee Posting Group";
        // objDimVal: Record "Dimension Value";
        "Citizenship Text": Text[200];
        BankEditable: Boolean;
        HRBankAccounts: Record "HR Employee Bank Accounts";
        Dretire: Text[100];
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit2";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        //DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",PV,"Petty Cash",Imp,Reqn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,"Grant Surr",EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee;
        ApprovalEntries: Page "Approval Entries";
        LOS: Text;
        DaystoProbaton: Integer;
        // SecondedTable: Record "Seconded Table";
        RetireRec: Decimal;
        DocumentType: Enum "Approval Document Type";
        OpenApprovalEntriesExist: boolean;
        OpenApprovalEntriesExistForCurrUser: boolean;

    local procedure Setapparance()
    var
        myInt: Integer;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        if rec."Approval Status" = rec."Approval Status"::Open then
            CurrPage.Editable := true
        else
            CurrPage.Editable := false;

    end;

    procedure GetSupervisor(var sUserID: Code[50]) SupervisorName: Text[200]
    var
        UserSetup: Record "User Setup";
    begin
        if sUserID <> '' then begin
            UserSetup.Reset();
            if UserSetup.Get(sUserID) then begin

                SupervisorName := UserSetup."Approver ID";
                if SupervisorName <> '' then begin
                    HREmp.Reset();
                    HREmp.SetRange(HREmp."User ID", SupervisorName);
                    if HREmp.Find('-') then
                        SupervisorName := HREmp.FullName();

                end else
                    SupervisorName := '';


            end else begin
                Error('User' + ' ' + sUserID + ' ' + 'does not exist in the user setup table');
                SupervisorName := '';
            end;
        end;
    end;


    procedure GetSupervisorID(var EmpUserID: Code[50]) SID: Text[200]
    var
        UserSetup: Record "User Setup";
        SupervisorID: Code[40];
    begin
        if EmpUserID <> '' then begin
            SupervisorID := '';

            UserSetup.Reset();
            if UserSetup.Get(EmpUserID) then begin
                SupervisorID := UserSetup."Approver ID";
                if SupervisorID <> '' then
                    SID := SupervisorID
                else
                    SID := '';
            end else
                Error('User' + ' ' + EmpUserID + ' ' + 'does not exist in the user setup table');
        end;
    end;
}

#pragma implicitwith restore

