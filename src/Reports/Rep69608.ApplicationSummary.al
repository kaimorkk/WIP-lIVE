report 69608 "Application Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Application Summary.rdlc';

    dataset
    {
        dataitem(Applicant; "Job Applications")
        {
            column(JobTitleDesignation_Applicant; Applicant."Job Title/Designation")
            {
            }
            column(ApplicationNo_Applicant; Applicant."Application No.")
            {
            }
            column(JobGrade_Applicant; Applicant."Job Grade")
            {
            }
            column(Logo; CI.Picture)
            {
            }
            column(Name; CI.Name)
            {
            }
            column(CandidateNo_Applicant; Applicant."Candidate No.")
            {
            }
            column(FirstName_Applicant; Applicant."First Name")
            {
            }
            column(MiddleName_Applicant; Applicant."Middle Name")
            {
            }
            column(LastName_Applicant; Applicant."Last Name")
            {
            }
            column(FullNames_Applicant; Applicant."Full Names")
            {
            }
            column(Address_Applicant; Applicant.Address)
            {
            }
            column(Address2_Applicant; Applicant."Address 2")
            {
            }
            column(City_Applicant; Applicant.City)
            {
            }
            column(PostCode_Applicant; Applicant."Post Code")
            {
            }
            column(CountyofBirth_Applicant; Applicant."County of Birth")
            {
            }
            column(PhoneNo_Applicant; Applicant."Phone No.")
            {
            }
            column(MobilePhoneNo_Applicant; Applicant."Mobile Phone No.")
            {
            }
            column(EMail_Applicant; Applicant."E-Mail")
            {
            }
            column(Picture_Applicant; Applicant.Picture)
            {
            }
            column(BirthDate_Applicant; Applicant."Birth Date")
            {
            }
            column(Gender_Applicant; Applicant.Gender)
            {
            }
            column(CountryRegionCode_Applicant; Applicant."Country/Region Code")
            {
            }
            column(IDNumber_Applicant; Applicant."ID Number")
            {
            }
            column(PassportNo_Applicant; Applicant."Passport No.")
            {
            }
            column(MaritalStatus_Applicant; Applicant."Marital Status")
            {
            }
            column(EthnicGroup_Applicant; Applicant."Ethnic Group")
            {
            }
            column(Nationality_Applicant; Applicant.Nationality)
            {
            }
            column(HighestAcademicQualification_Applicant; Applicant."Highest Academic Qualification")
            {
            }
            column(SpecializationArea_Applicant; Applicant."Specialization Area")
            {
            }
            column(QualificationName_Applicant; Applicant."Qualification Name")
            {
            }
            column(WorkExperienceYears_Applicant; Applicant."Work Experience (Years)")
            {
            }
            column(ManagementExperienceYears_Applicant; Applicant."Management Experience (Years)")
            {
            }
            column(DisabilityCode_Applicant; Applicant."Disability Code")
            {
            }
            column(Disabled_Applicant; Applicant.Disabled)
            {
            }
            column(DisabilityDescription_Applicant; Applicant."Disability Description")
            {
            }
            column(DisabilityCertificateNo_Applicant; Applicant."Disability Certificate No")
            {
            }
            column(Religion_Applicant; Applicant.Religion)
            {
            }
            dataitem("Job Applicants Qualification"; "Application Qualification")
            {
                DataItemLink = "Candidate No." = field("Candidate No."), "Application No." = field("Application No.");
                column(CandidateNo_JobApplicantsQualification; "Job Applicants Qualification"."Candidate No.")
                {
                }
                column(LineNo_JobApplicantsQualification; "Job Applicants Qualification"."Line No.")
                {
                }
                column(ExperienceYears_JobApplicantsQualification; "Job Applicants Qualification"."Experience Years")
                {
                }
                column(QualificationCategory_JobApplicantsQualification; "Job Applicants Qualification"."Qualification Category")
                {
                }
                column(QualificationCode_JobApplicantsQualification; "Job Applicants Qualification"."Qualification Code")
                {
                }
                column(SpecializedDomainArea_JobApplicantsQualification; "Job Applicants Qualification"."Specialized Domain Area")
                {
                }
                column(FromDate_JobApplicantsQualification; Format("Job Applicants Qualification"."From Date", 0, '<year4>'))
                {
                }
                column(ToDate_JobApplicantsQualification; Format("Job Applicants Qualification"."To Date", 0, '<year4>'))
                {
                }
                column(DutiesandResposibilities_JobApplicantsQualification; "Job Applicants Qualification"."Duties and Resposibilities")
                {
                }
                column(Type_JobApplicantsQualification; "Job Applicants Qualification".Type)
                {
                }
                column(Description_JobApplicantsQualification; "Job Applicants Qualification".Description)
                {
                }
                column(InstitutionCompany_JobApplicantsQualification; "Job Applicants Qualification"."Institution/Company")
                {
                }
                column(Cost_JobApplicantsQualification; "Job Applicants Qualification".Cost)
                {
                }
                column(MembershipRegistrationNo_JobApplicantsQualification; "Job Applicants Qualification"."Membership Registration No")
                {
                }
                column(MemberRenewalDate_JobApplicantsQualification; "Job Applicants Qualification"."Member Renewal Date")
                {
                }
                column(LicensingNumber_JobApplicantsQualification; "Job Applicants Qualification"."Licensing Number")
                {
                }
                column(LicensingRenewalDate_JobApplicantsQualification; "Job Applicants Qualification"."Licensing Renewal Date")
                {
                }
                column(ProffessionalQualification_JobApplicantsQualification; "Job Applicants Qualification"."Proffessional Qualification")
                {
                }
                column(CourseGrade_JobApplicantsQualification; "Job Applicants Qualification"."Course Grade")
                {
                }
                column(Comment_JobApplicantsQualification; "Job Applicants Qualification".Comment)
                {
                }
                column(ExpirationDate_JobApplicantsQualification; "Job Applicants Qualification"."Expiration Date")
                {
                }
            }
            dataitem("Employee_Applicant Referees"; "Application Referees")
            {
                DataItemLink = "Application No." = field("Application No.");
                column(No_EmployeeApplicantReferees; "Employee_Applicant Referees"."Application No.")
                {
                }
                column(LineNo_EmployeeApplicantReferees; "Employee_Applicant Referees"."Candidate No.")
                {
                }
                column(RererenceType_EmployeeApplicantReferees; "Employee_Applicant Referees"."Rererence Type")
                {
                }
                column(Name_EmployeeApplicantReferees; "Employee_Applicant Referees".Name)
                {
                }
                column(DesignationTitle_EmployeeApplicantReferees; "Employee_Applicant Referees"."Designation/Title")
                {
                }
                column(Institution_EmployeeApplicantReferees; "Employee_Applicant Referees".Institution)
                {
                }
                column(Address_EmployeeApplicantReferees; "Employee_Applicant Referees".Address)
                {
                }
                column(Address2_EmployeeApplicantReferees; "Employee_Applicant Referees"."Address 2")
                {
                }
                column(City_EmployeeApplicantReferees; "Employee_Applicant Referees".City)
                {
                }
                column(PostCode_EmployeeApplicantReferees; "Employee_Applicant Referees"."Post Code")
                {
                }
                column(CountryRegionCode_EmployeeApplicantReferees; "Employee_Applicant Referees"."Country/Region Code")
                {
                }
                column(PhoneNo_EmployeeApplicantReferees; "Employee_Applicant Referees"."Phone No.")
                {
                }
                column(EMail_EmployeeApplicantReferees; "Employee_Applicant Referees"."E-Mail")
                {
                }
                column(YearsKnown_EmployeeApplicantReferees; "Employee_Applicant Referees"."Years Known")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

