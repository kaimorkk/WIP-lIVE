

page 69672 "Job Application"
{
    // DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Job Applications";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Vacancy Id"; Rec."Vacancy Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy Id field.';
                }
                field("Position Id"; Rec."Position Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Id field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Shortlisting Outcome"; Rec."Shortlisting Outcome")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortlisting Outcome field.';
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                    Visible = false;
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Location Details field.';
                    Visible = false;
                }
                field("Application Status"; Rec."Application Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Status field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field("Date Of Application"; Rec."Date Of Application")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("JobApplied"; Rec."JobApplied")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group("Personal Information")
            {
                field("Preferred Title"; Rec."Preferred Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preferred Title field.';
                }

                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Caption = 'Other Names';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    Caption = 'Surname';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Full Names"; Rec."Full Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initials field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport No. field.';
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Social Security No. field.';
                }
                field("SHA No."; Rec."SHA No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SHA No. field.';
                }
                field("KRA PIN NO."; Rec."KRA PIN NO.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA PIN NO. field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Ethnic Group"; Rec."Ethnic Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Group field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
                field("County of Origin"; Rec."County of Origin")
                {
                    ApplicationArea = Basic;
                    Caption = 'Home County';
                    ToolTip = 'Specifies the value of the County of Origin field.';
                }
                field("County of Origin Name"; Rec."County of Origin Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Home County Name';
                    ToolTip = 'Specifies the value of the County of Origin Name field.';
                }
                field("Sub County"; Rec."Sub County")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub County field.';
                }
                field("Sub County Name"; Rec."Sub County Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub County Name field.';
                }
                field(Ward; Rec.Ward)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ward field.';
                }
                field("Ward Name"; Rec."Ward Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the "Ward Name" field.';
                }
                field(Village; Rec.Village)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Village field.';
                }
                field("Village Name"; Rec."Village Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the "Village Name" field.';
                }
                field(Constituency; Rec.Constituency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency field.';
                }
            }
            group(Communication)
            {
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("County of Birth"; Rec."County of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                    Visible = false;
                }
                field("Alternative Contact Person"; Rec."Alternative Contact Person")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alternative Contact Person field.';
                }
                field("Alternative Contact Phone"; Rec."Alternative Contact Phone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alternative Contact Phone field.';
                }
            }
            group("Disability Information")
            {
                field("Disability Code"; Rec."Disability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Code field.';
                    Visible = false;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                    Caption = 'PWD';
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Description field.';
                }
                field("Disability Certificate No"; Rec."Disability Certificate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Certificate No field.';
                }
            }
            group("Applicant Qualification")
            {
                field("Professional Summary"; Rec."Professional Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Summary field.';
                }
                field("Specialization Area"; Rec."Specialization Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialization Area field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Name field.';
                }
                field("Work Experience (Years)"; Rec."Work Experience (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Experience (Years) field.';
                }
                field("Management Experience (Years)"; Rec."Management Experience (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Experience (Years) field.';
                }
            }
            group("Current Employment Details")
            {
                Editable = false;
                field("Current Employment Status"; Rec."Current Employment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Employment Status field.';
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Name field.';
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Station field.';
                }
                field("Personal No."; Rec."Personal No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Personal No. field.';
                }
                field("Present Substantive Post"; Rec."Present Substantive Post")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Present Substantive Post field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Secondment Organization"; Rec."Secondment Organization")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secondment Organization field.';
                }
                field("Secondment Designation"; Rec."Secondment Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secondment Designation field.';
                }
                field("Secondment Job Group"; Rec."Secondment Job Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secondment Job Group field.';
                }
                field("Gross Salary"; Rec."Gross Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Salary field.';
                }
                field("Terms Of Service"; Rec."Terms Of Service")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Terms Of Service field.', Comment = '%';
                }

            }
            group("Monthly Remuneration")
            {
                Editable = false;
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary field.';
                }
                field("House Allowance"; Rec."House Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the House Allowance field.';
                }
                field("Other Remunerative Allowances"; Rec."Other Remunerative Allowances")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Other Remunerative Allowances field.';
                }
                field("Gross"; Rec."Gross")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross field.';
                }
                field("Airtime Allowance"; Rec."Airtime Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Airtime Allowance field.';
                }
                field("Leave Travel Allowance"; Rec."Leave Travel Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Travel Allowance field.';
                }
            }
            group("Other Details")
            {
                field("Proficient Languages"; Rec."Proficient Languages")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proficient Languages field.';
                }
                field("Is Impaired"; Rec."Is Impaired")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Impaired field.';
                }
                field("Impairment Details"; Rec."Impairment Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Impairment Details field.';
                }
                field("Convicted/On Probation"; Rec."Convicted/On Probation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convicted/On Probation field.';
                }
                field("Dismissed from Employment"; Rec."Dismissed from Employment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dismissed from Employment field.';
                }
                field("Has On-going Investigation"; Rec."Has On-going Investigation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has On-going Investigation field.';
                }
                field("Investigation Details"; Rec."Investigation Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investigation Details field.';
                }
                field("Investigation Date"; Rec."Investigation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investigation Date field.';
                }
                field("Relatives In PPRA"; Rec."Relatives In PPRA")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Relatives In PPRA field.';
                }
                field("Name & Relationship"; Rec."Name & Relationship")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name & Relationship field.';
                }
                field("Is Tax Compliant"; Rec."Is Tax Compliant")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Tax Compliant field.';
                }
                field("Has Helb Loan"; Rec."Has Helb Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Helb Loan field.';
                }
                field("Appointment Availability Date"; Rec."Appointment Availability Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Availability Date field.';
                }
                field("Has Voilated Laws"; Rec."Has Voilated Laws")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Has Voilated Laws field.';
                }
                field("Charge Details"; Rec."Charge Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Charge Details field.';
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Job Applications"), "No." = field("Application No.");
            }
            systempart(Control41; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control42; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control43; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control44; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Academic Qualifications")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                RunObject = Page "Application Academic";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Academic Qualifications action.';
            }
            action("Professional Qualifications")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                RunObject = Page "Application Proffessionas";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Professional Qualifications action.';
            }
            action("Professional Bodies")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                RunObject = Page "Application Professional Body";
                RunPageLink = "Application No." = field("Application No.");
            }
            action("Skills & Competencies")
            {
                ApplicationArea = Basic;
                Image = Skills;
                RunObject = Page "Application Skills";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Skills & Competencies action.';
                Visible = false;
            }
            action(Experience)
            {
                ApplicationArea = Basic;
                Image = ExpandDepositLine;
                RunObject = Page "Job Application Experience";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Experience action.';
            }
            action(Hobbies)
            {
                ApplicationArea = Basic;
                Image = Holiday;
                RunObject = Page "Application Hobbies";
                RunPageLink = "Application No." = field("Application No."), "Candidate No." = field("Candidate No.");
                ToolTip = 'Executes the Hobbies action.';
                Visible = false;
            }
            action(Referees)
            {
                ApplicationArea = Basic;
                Image = Relationship;
                RunObject = Page ApplicationReferees;
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Referees action.';
            }
            action("Applicant Language")
            {
                ApplicationArea = Basic;
                Image = Language;
                RunObject = Page "Application Language";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Applicant Language action.';
                Visible = false;
            }
            action("Job Application Checklist")
            {
                ApplicationArea = Basic;
                Caption = 'Job Application Checklist';
                Image = Check;
                RunObject = Page "Job Application Requirements";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
                ToolTip = 'Executes the Job Application Checklist action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Application No.", Rec."Application No.");
                    Report.Run(69608, true, false, Rec);
                end;
            }
            action("Application Attached Documents")
            {
                ApplicationArea = Basic;
                Image = Evaluate;
                RunObject = Page "Application Attached Documents";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
                ToolTip = 'Executes the Application Attached Documents action.';
            }
            action("Application Declaration")
            {
                ApplicationArea = Basic;
                Image = DepreciationBooks;
                RunObject = Page "Application Declarations";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Application Declaration action.';
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Applicant Information';
                actionref("Academic Qualifications_Promoted"; "Academic Qualifications")
                {
                }
                actionref("Professional Qualifications_Promoted"; "Professional Qualifications")
                {
                }
                actionref("Professional Bodies_Promoted"; "Professional Bodies")
                {
                }
                actionref("Skills & Competencies_Promoted"; "Skills & Competencies")
                {
                }
                actionref(Experience_Promoted; Experience)
                {
                }
                actionref(Hobbies_Promoted; Hobbies)
                {
                }
                actionref(Referees_Promoted; Referees)
                {
                }
                actionref("Applicant Language_Promoted"; "Applicant Language")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Job Information';
                actionref("Job Application Checklist_Promoted"; "Job Application Checklist")
                {
                }
                actionref("Application Attached Documents_Promoted"; "Application Attached Documents")
                {
                }
                actionref("Application Declaration_Promoted"; "Application Declaration")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

