page 69364 "Job Appliants Details"
{
    Caption = 'Job Appliants Details';
    PageType = ListPart;
    SourceTable = "Candidate Shortlist Matrix";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No"; Rec."Candidate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field("Complete Doc Submitted"; Rec."Complete Doc Submitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complete Doc Submitted field.';
                }
                field("Shortlisting Outcome"; Rec."Shortlisting Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortlisting Outcome field.';
                }
                field("Committee Remarks"; Rec."Committee Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Remarks field.';
                }
                field("Unsuccesfull App Reason Code"; Rec."Unsuccesfull App Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unsuccesfull App Reason Code field.';
                }
                field("Ability Test Report ID"; Rec."Ability Test Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Report ID field.';
                }
                field("Phone Interview Report ID"; Rec."Phone Interview Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Report ID field.';
                }
                field("Ability Test Pass Score %"; Rec."Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Pass Score % field.';
                }
                field("Phone Interview Outcome"; Rec."Phone Interview Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Outcome field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
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
                field("Tax Registration No."; Rec."Tax Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Registration No. field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
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
                field("Disability Code"; Rec."Disability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Code field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
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
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field("Notified On"; Rec."Notified On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notified On field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Highest Academic Hierarchy Poi"; Rec."Highest Academic Hierarchy Poi")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Hierarchy Poi field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Application Details")
            {
                action("View Job Application")
                {
                    ApplicationArea = Basic;
                    Image = ViewCheck;
                    RunObject = Page "Job Application";
                    RunPageLink = "Application No." = field("Application No.");
                }
            }
        }
    }
}

#pragma implicitwith restore


