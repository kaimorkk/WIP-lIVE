Page 52193869 Applicants1
{
    PageType = Card;
    SourceTable = Applicants1;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(ApplicantType;"Applicant Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(InternalApplicant;"Employee No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Internal Applicant';
                    Editable = true;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Citizenship;Citizenship)
                {
                    ApplicationArea = Basic;
                }
                field(Employ;Employ)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employed';
                    Editable = false;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(MaritalStatus;"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(EthnicOrigin;"Ethnic Origin")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled;Disabled)
                {
                    ApplicationArea = Basic;
                }
                field(HealthAssesment;"Health Assesment?")
                {
                    ApplicationArea = Basic;
                }
                field(HealthAssesmentDate;"Health Assesment Date")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfBirth;"Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Age;Age)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(HomePhoneNumber;"Home Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field(PostalAddress;"Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field(PostalAddress2;"Postal Address2")
                {
                    ApplicationArea = Basic;
                }
                field(PostalAddress3;"Postal Address3")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode;"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(ResidentialAddress;"Residential Address")
                {
                    ApplicationArea = Basic;
                }
                field(ResidentialAddress2;"Residential Address2")
                {
                    ApplicationArea = Basic;
                }
                field(ResidentialAddress3;"Residential Address3")
                {
                    ApplicationArea = Basic;
                }
                field(PostCode2;"Post Code2")
                {
                    ApplicationArea = Basic;
                }
                field(CellularPhoneNumber;"Cellular Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field(WorkPhoneNumber;"Work Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field(Ext;"Ext.")
                {
                    ApplicationArea = Basic;
                }
                field(EMail;"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(FaxNumber;"Fax Number")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Qualifications)
            {
                Caption = 'Qualifications';
                part(Control1000000020;"Applicants Qualification1")
                {
                    SubPageLink = "Applicant No."=field("No.");
                }
            }
            group(WorkExperience)
            {
                Caption = 'Work Experience';
                part(Control1000000002;"Applicant Work Experience")
                {
                    SubPageLink = "Employee No."=field("No.");
                }
            }
            group(Referees)
            {
                Caption = 'Referees';
                part(Control1000000085;Referees)
                {
                    SubPageLink = "No." =field("No.");
                }
            }
            group(Hobbies)
            {
                Caption = 'Hobbies';
                part(Control1000000089;Hobbies)
                {
                    SubPageLink = "No."=field("No.");
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                part(Control1000000093;"Applicants Document Link")
                {
                    SubPageLink = "Applicant No"=field("No.");
                }
            }
            group(MedicalInfo)
            {
                Caption = 'Medical Info';
                part(Control1000000094;"Applicants Medical Info")
                {
                    SubPageLink = "Applicant No"=field("No.");
                }
            }
            group(ViewComments)
            {
                Caption = 'View/Comments';
                part(Control1000000095;"Applicants Comments/Views")
                {
                    SubPageLink = "Applicant No"=field("No.");
                }
            }
            group(Control1000000010)
            {
                Caption = 'View/Comments';
                part(Control1000000011;Interview)
                {
                    SubPageLink = "Applicant No."=field("No.");
                }
            }
        }
    }

    actions
    {
    }
}

