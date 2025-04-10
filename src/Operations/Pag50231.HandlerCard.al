 
     
    

page  52194347 "HR handlers Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Functions,Employee,Attachments';
    SourceTable = "Handles Table";
    ApplicationArea = All;
    Caption = 'HR Handlers Card';
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
                    AssistEdit = true;
                    Editable=false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field("Hander No";Rec."Hander No")
                {
                    ApplicationArea=all;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Editable=false;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                      Editable=false;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                      Editable=false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                      Editable=false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                      Editable=false;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                      Editable=false;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                      Editable=false;
                    ToolTip = 'Specifies the value of the Passport Number field.';
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Citizenship field.';
                }
                field(workstation; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                    Caption = 'workstation';
                      Editable=false;

                    ToolTip = 'Specifies the value of the Workstation field.';
                }
                field("County Name"; Rec."County Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workstation Name';
                    ToolTip = 'Specifies the value of the Workstation Name field.';
                }
                field("Current Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = All;
                    //TableRelation = "Duty Station".Code where(Blocked = filter(false));
                }

                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Department';
                //     ToolTip = 'Specifies the value of the Responsibility Center field.';
                // }



                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Permanent Address';
                    ToolTip = 'Specifies the value of the Permanent Address field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Global Dimension 1 Code"; Rec.County)
                {
                    ApplicationArea = Basic;
                    Caption = 'Home County';
                    ToolTip = 'Specifies the value of the Home County field.';
                }
                field("Home District"; Rec."Home District")
                {
                    ApplicationArea = Basic;
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
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the User ID field.';
                    trigger OnValidate()
                    begin
                        SupervisorNames := GetSupervisor(Rec."User ID");
                    end;
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Paye Rates';
                    ToolTip = 'Specifies the value of the Paye Rates field.';
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
                    ToolTip = 'Specifies the value of the Employee Type Primary field.';
                }
                field("Commisioner?"; Rec."Commisioner?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commisioner? field.';
                }
                field("Sitting C.E.O"; Rec."Sitting C.E.O")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting C.E.O field.';
                }
                field("Highest level"; Rec."Highest level")
                {
                    ApplicationArea = all;
                }
                field("Highest Leverl Description"; Rec."Highest Leverl Description")
                {
                    ApplicationArea = all;
                    Caption = 'Highest Education Level';
                    Editable = false;
                }
                field(Department; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Caption = 'Department Name';
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(Directorates; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                    Caption = 'Directorates';
                }
                field("Directorates Name"; Rec."Directorates Name")
                {
                    ApplicationArea = all;
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
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Fax Number field.';
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
                field("E-Mail"; Rec."E-Mail2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal Email';
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the value of the Personal Email field.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Company E-Mail field.';
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
                field("Blood Group"; Rec."Blood Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Blood Group field.';
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
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Language field.';
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
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
                    Caption = 'Physically Challenged';
                    ToolTip = 'Specifies the value of the Physically Challenged field.';
                }
                field("Exemption Certificate No."; Rec."Exemption Certificate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Certificate No. field.';
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Health Assesment? field.';
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
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Health Assesment Date field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(Height; Rec.Height)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Height field.';
                }
                field("Place Of Birth"; Rec."Place Of Birth")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Place Of Birth field.';
                }
            }
            group("Bank Details")
            {
                Caption = 'Bank Details';
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
                    Editable = false;
                    Enabled = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("EMP Transfer Date"; Rec."EMP Transfer Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the transfer date of the employee';
                }
                field("Retirement date"; Rec."Retirement date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Retirement date field.';
                }

                field(DPension; Rec.DPension)
                {
                    ApplicationArea = Basic;
                    Caption = 'Days to Retire';
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Days to Retire field.';
                }
                field(DRetirement; Rec.DRetirement)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DRetirement field.';
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Date Of Joining the Company field.';
                }
                field("Date of Current Employment"; Rec."Date of Current Employment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Current Employment field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    Caption = 'Form of Employment';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Form of Employment field.';
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Start Date field.';
                }
                field("Contract Duration"; Rec."Contract Duration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Duration field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field(sec; Rec.sec)
                {
                    ApplicationArea = Basic;
                    Caption = '(IF)Seconded Start Date';
                    ToolTip = 'Specifies the value of the (IF)Seconded Start Date field.';
                }
                field(secdur; Rec.secdur)
                {
                    ApplicationArea = Basic;
                    Caption = 'Seconded Duration';
                    ToolTip = 'Specifies the value of the Seconded Duration field.';
                }
                field(sec2; Rec.sec2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Seconded End Date';
                    ToolTip = 'Specifies the value of the Seconded End Date field.';
                }
                field("Medical Scheme Join Date"; Rec."Medical Scheme Join Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Scheme Join Date field.';
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Wedding Anniversary field.';
                }
                field("Passport Expiry Date"; Rec."Passport Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport Expiry Date field.';
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
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
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = all;
                    Caption = 'Specifies if the driver has been allocated a Vehicle';
                }
                field("Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incremental Month field.';
                }
                field("AD Status"; Rec."AD Status")
                {
                    ApplicationArea = all;
                    ToolTip = 'specifies  the Ad account status';

                }
            }
            group("Job Details History")
            {
                Caption = 'Job Details History';
                field("Show On Payslip"; Rec."Show On Payslip")
                {
                    ApplicationArea = Basic;
                    Caption = 'Show On Payslip?';
                    ToolTip = 'Specifies the value of the Show On Payslip? field.';
                }
                field("Job ID1"; Rec."Job ID1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job ID_1';
                    ToolTip = 'Specifies the value of the Previous Job ID_1 field.';
                }
                field("Job Title1"; Rec."Job Title1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job Title_1';
                    ToolTip = 'Specifies the value of the Previous Job Title_1 field.';
                }
                field(Grade1; Rec.Grade1)
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Grade_1';
                    ToolTip = 'Specifies the value of the Previous Grade_1 field.';
                }
                field("From Payroll1"; Rec."From Payroll1")
                {
                    ApplicationArea = Basic;
                    Caption = 'From Payroll_1';
                    ToolTip = 'Specifies the value of the From Payroll_1 field.';
                }
                field("To payroll1"; Rec."To payroll1")
                {
                    ApplicationArea = Basic;
                    Caption = 'To payroll_1';
                    ToolTip = 'Specifies the value of the To payroll_1 field.';
                }
                field("Job ID2"; Rec."Job ID2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job ID_2';
                    ToolTip = 'Specifies the value of the Previous Job ID_2 field.';
                }
                field("Job Title2"; Rec."Job Title2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job Title_2';
                    ToolTip = 'Specifies the value of the Previous Job Title_2 field.';
                }
                field(Grade2; Rec.Grade2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Grade_2';
                    ToolTip = 'Specifies the value of the Previous Grade_2 field.';
                }
                field("From payroll2"; Rec."From payroll2")
                {
                    ApplicationArea = Basic;
                    Caption = 'From payroll_2';
                    ToolTip = 'Specifies the value of the From payroll_2 field.';
                }

                field("To Payroll2"; Rec."To Payroll2")
                {
                    ApplicationArea = Basic;
                    Caption = 'To Payroll_2';
                    ToolTip = 'Specifies the value of the To Payroll_2 field.';
                }
                field("Job ID3"; Rec."Job ID3")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job ID_3';
                    ToolTip = 'Specifies the value of the Previous Job ID_3 field.';
                }
                field("Job Title3"; Rec."Job Title3")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job Title_3';
                    ToolTip = 'Specifies the value of the Previous Job Title_3 field.';
                }
                field(Grade3; Rec.Grade3)
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Grade_3';
                    ToolTip = 'Specifies the value of the Previous Grade_3 field.';
                }
                field("From payroll3"; Rec."From payroll3")
                {
                    ApplicationArea = Basic;
                    Caption = 'From payroll_3';
                    ToolTip = 'Specifies the value of the From payroll_3 field.';
                }
                field("To payroll3"; Rec."To payroll3")
                {
                    ApplicationArea = Basic;
                    Caption = 'To payroll_3';
                    ToolTip = 'Specifies the value of the To payroll_3 field.';
                }
                field("Job ID4"; Rec."Job ID4")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job ID_4';
                    ToolTip = 'Specifies the value of the Previous Job ID_4 field.';
                }
                field("Job Title4"; Rec."Job Title4")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Job Title_4';
                    ToolTip = 'Specifies the value of the Previous Job Title_4 field.';
                }
                field(Grade4; Rec.Grade4)
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Grade_4';
                    ToolTip = 'Specifies the value of the Previous Grade_4 field.';
                }
                field("From Payroll4"; Rec."From Payroll4")
                {
                    ApplicationArea = Basic;
                    Caption = 'From Payroll_4';
                    ToolTip = 'Specifies the value of the From Payroll_4 field.';
                }
                field("To Payroll4"; Rec."To Payroll4")
                {
                    ApplicationArea = Basic;
                    Caption = 'To Payroll_4';
                    ToolTip = 'Specifies the value of the To Payroll_4 field.';
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
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
                    // NotBlank = false;
                    //ShowMandatory = true;
                    Style = AttentionAccent;
                    StyleExpr = true;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Specify Other Reasons"; Rec."Specify Other Reasons")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specify Other Reasons';
                    ToolTip = 'Specifies the value of the Specify Other Reasons field.';
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
                Visible=false;
                 
                field("Leave Calendar"; Rec."Leave Calendar")
                {
                    ApplicationArea = all;
                }
            }
            systempart(Control1102755002; Outlook) { }
            group("Acting Appointment")
            {
                Caption = 'Acting Appointment';
                field("Job ID5"; Rec."Job ID5")
                {
                    ApplicationArea = Basic;
                    Caption = 'Position Acting';
                    ToolTip = 'Specifies the value of the Position Acting field.';
                }
                field("Job Title5"; Rec."Job Title5")
                {
                    ApplicationArea = Basic;
                    Caption = 'Position Title';
                    ToolTip = 'Specifies the value of the Position Title field.';
                }
                field(Grade5; Rec.Grade5)
                {
                    ApplicationArea = Basic;
                    Caption = 'Grade Acting';
                    ToolTip = 'Specifies the value of the Grade Acting field.';
                }

                field("From Payroll5"; Rec."From Payroll5")
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Period';
                    ToolTip = 'Specifies the value of the Start Period field.';
                }
                field("To Payroll5"; Rec."To Payroll5")
                {
                    ApplicationArea = Basic;
                    Caption = 'End Period';
                    ToolTip = 'Specifies the value of the End Period field.';
                }
                field("Reason For Acting"; Rec."Reason For Acting")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason For Acting';
                    ToolTip = 'Specifies the value of the Reason For Acting field.';
                }
                field(Acting; Rec.Acting)
                {
                    ApplicationArea = Basic;
                    Caption = 'If Acting?';
                    ToolTip = 'Specifies the value of the If Acting? field.';
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
                        Misc.Reset();
                        Misc.SetRange(Misc."Employee No.", Rec."No.");
                        if Misc.Find('-') then
                            Report.Run(Report::"Employee - Misc. Article Info.", true, true, Misc);
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
                        Conf.Reset();
                        Conf.SetRange(Conf."Employee No.", Rec."No.");
                        if Conf.Find('-') then
                            Report.Run(Report::"Employee - Confidential Info.", true, true, Conf);
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
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Labels", true, true, HREmp);
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
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Addresses", true, true, HREmp);
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
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Alt. Addresses", true, true, HREmp);
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
                        if HREmp.Find('-') then
                            Report.Run(Report::"Employee - Phone Nos.", true, true, HREmp);
                    end;
                }
            }
            group("&Employee")
            {
                Caption = '&Wip Details';
                action("Next of Kin")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = field("Hander No");
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
                    RunObject = page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = field("Hander No");
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
                    RunObject = page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = field("Hander No");
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
                    RunPageLink = "Employee Code" = field("Hander No");
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
                    RunPageLink = "Employee Code" = field("Hander No");
                    RunPageView = where(Type = filter(Siblings));
                    ToolTip = 'Executes the Siblings action.';
                }
                 action("Wip List")
                {
                    ApplicationArea = Basic;
                    Caption = 'WIP List';
                    Image = SalesPerson;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee List ALL";
                    RunPageLink = "Hander No"= field("Hander No");
                    ToolTip = 'Executes the Dependants action.';
                }
                action("<Page HR Employee Spouse1>")
                {
                    ApplicationArea = Basic;
                    Caption = 'In-Laws';
                    Image = SalesPerson;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "HR Employee Spouse1";
                    RunPageLink = "Employee Code" = field("Hander No");
                    RunPageView = where(Type = filter("In-Laws"));
                    ToolTip = 'Executes the In-Laws action.';
                }
                
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                
               
               
                action("Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = 'Alternative Addresses';
                    Image = AlternativeAddress;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Alternative Address Card";
                    RunPageLink = "Employee No." = field("Hander No");
                    ToolTip = 'Executes the Alternative Addresses action.';
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = SNInfo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Confidential Information";
                    RunPageLink = "Employee No." = field("Hander No");
                    ToolTip = 'Executes the &Confidential Information action.';
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Confidential Info. Overview";
                    ToolTip = 'Executes the Co&nfidential Info. Overview action.';
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Employee Absences";
                    RunPageLink = "Employee No." = field("Hander No");
                    ToolTip = 'Executes the A&bsences action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Dimensions action.';
                }
                

            }
            group(ActionGroup19)
            {
                Caption = 'Approvals';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    begin
                        DocumentType := DocumentType::Employee;
                        ApprovalEntries.SetRecordFilters(Database::"HR Employees", DocumentType, Rec."No.");
                        ApprovalEntries.Run();
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Send Approval Request action.';
                    trigger OnAction()
                    begin

                        //TESTFIELDS;

                        if Confirm('Send this Employee for Approval?', true) = false then
                            exit;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                        //ApprovalMgt.SendEmployeeAppApprovalReq(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    Visible = false;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalMgt.CancelEmployeeAppRequest(Rec, true, true);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin


        if (Rec."Date Of Birth" <> 0D) then
            Rec.DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);


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
           */
        if Rec."Retirement date" <> 0D then
            Rec.DPension := Dates.DetermineAge(Today, Rec."Retirement date");

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //Rec.Status := Rec.Status::New;
    end;

    trigger OnOpenPage()
    var
        Dimensi: Record "Dimension Value";
    begin

        Rec."Retirement date" := 0D;
        if Rec."Date Of Birth" <> 0D then
            Rec."Retirement date" := CalcDate('60Y', Rec."Date Of Birth");
        Rec.Validate(Rec."Date Of Birth");
        if rec."County Name" = '' then begin
            Dimensi.Reset();
            Dimensi.SetRange(Code, rec."Global Dimension 1 Code");
            if Dimensi.FindFirst() then begin
                rec."County Name" := Dimensi.Name;
                rec.modify;
            end;
        end;

        /*
        HREmp.RESET;
        HREmp.SETRANGE(HREmp."No.",'NLC/INTERN/136');
        HREmp.SETRANGE(HREmp.Status,Status::Active);
        IF HREmp.FIND('-') THEN
         //MESSAGE(FORMAT(DaystoProbaton));

          BEGIN
          IF HREmp."Contract End Date"<>0D THEN




            DaystoProbaton:=HREmp."Contract End Date"-TODAY;
            //IF DaystoProbaton>20 THEN
          // error(format(DaystoProbaton));
           END;
           /////////////////////////////////////////////////code Morris
                                                              //          IF "Date Of Birth"<>0D  THEN
                                                              //               BEGIN
                                                              //               HREMP.DAge:=(TODAY-HREMP."Date Of Birth")/365;
                                                              //               IF HREMP.DAge>=60 THEN
        //IF "Retirement date"<TODAY THEN
        //               BEGIN
        //               REPEAT
        //               HREmp.MODIFY;
        //               HREmp.Status:=Status::Inactive;
        //               UNTIL HREmp.NEXT=0 ;
        //               END;

        */

        /*
         HREmp.TESTFIELD("Contract End Date",HREmp."Contract End Date");
              IF "Contract End Date"<TODAY THEN BEGIN
               //REPEAT
              // HREmp.MODIFY;
              Status:=HREmp.Status::Inactive;
            // UNTIL HREmp.NEXT=0 ;
           END;
        */

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
        Misc: Record "Misc. Article Information";
        Conf: Record "Confidential Information";
        //SMTP: Codeunit "SMTP Mail";
        CompInfo: Record "Company Information";
        Body: Text[1024];
        Text003: Label 'Welcome to Lotus Capital Limited';
        Filename: Text;
        Recordlink: Record "Record Link";
        Text004a: Label 'It is a great pleasure to welcome you to Moi Teaching and Referral Hospital. You are now part of an organization that has its own culture and set of values. On your resumption and during your on-boarding process,  to help you to understand and adapt quickly and easily to the LOTUS CAPITAL culture and values, HR Unit shall provide you with various important documents that you are encouraged to read and understand.';
        Text004b: Label 'On behalf of the Managing Director, I congratulate you for your success in the interview process and I look forward to welcoming you on board LOTUS CAPITAL Limited.';
        Text004c: Label 'Adebola SAMSON-FATOKUN';
        Text004d: Label 'Strategy & Corporate Services';
        NL: Char;
        LF: Char;
        // objpostingGroup: Record "prEmployee Posting Group";
        objDimVal: Record "Dimension Value";
        "Citizenship Text": Text[200];
        BankEditable: Boolean;
        HRBankAccounts: Record "HR Employee Bank Accounts";
        Dretire: Text[100];
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        //ApprovalMgt: Codeunit "Export F/O Consolidation";
        //DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",PV,"Petty Cash",Imp,Reqn,ImpS,InterB,Receipt,Staff,"Staff Adv",AdvSurr,Bank,Grant,"Grant Surr",EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee;
        ApprovalEntries: Page "Approval Entries";
        LOS: Text;
        DaystoProbaton: Integer;
        // SecondedTable: Record "Seconded Table";
        RetireRec: Decimal;
        DocumentType: Enum "Approval Document Type";

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
