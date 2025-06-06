report 69148 "Final Shortlisting Report"
{
    Caption = 'Final Shortlisting Report';

    RDLCLayout = './Layouts/ShortlistingSummaryRp.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Job Applications"; "Job Applications")
        {
            RequestFilterFields = "Vacancy Id";

            DataItemTableView = where("Shortlisting Outcome" = filter("Invite for First Interview"));
            column(ReportForNavId_1; 1) { } // Autogenerated by ForNav - Do not delete
            column(VacancyId_JobApplications; "Job Applications"."Vacancy Id")
            {
            }
            column(Vacancy; Vacancy)
            {
            }
            column(ShortlistingOutcome_JobApplications; "Shortlisting Outcome")
            {
            }
            column(Address_JobApplications; Address)
            {
            }
            column(Address2_JobApplications; "Address 2")
            {
            }
            column(City_JobApplications; City)
            {
            }
            column(CountryRegionCode_JobApplications; "Country/Region Code")
            {
            }
            column(CountyofBirth_JobApplications; "County of Birth")
            {
            }
            column(CurrentEmploymentStatus_JobApplications; "Current Employment Status")
            {
            }
            column(Department_JobApplications; Department)
            {
            }
            column(Directorate_JobApplications; Directorate)
            {
            }
            column(DisabilityCertificateNo_JobApplications; "Disability Certificate No")
            {
            }
            column(DisabilityCode_JobApplications; "Disability Code")
            {
            }
            column(DisabilityDescription_JobApplications; "Disability Description")
            {
            }
            column(Disabled_JobApplications; Disabled)
            {
            }
            column(DutyStationID_JobApplications; "Duty Station ID")
            {
            }
            column(EmployerName_JobApplications; "Employer Name")
            {
            }
            column(EmploymentType_JobApplications; "Employment Type")
            {
            }
            column(GrossSalary_JobApplications; "Gross Salary")
            {
            }
            column(JobGrade_JobApplications; "Job Grade")
            {
            }
            column(JobTitleDesignation_JobApplications; "Job Title/Designation")
            {
            }
            column(ManagementExperienceYears_JobApplications; "Management Experience (Years)")
            {
            }
            column(MaritalStatus_JobApplications; "Marital Status")
            {
            }
            column(PersonalNo_JobApplications; "Personal No.")
            {
            }
            column(PINRegistration_JobApplications; "PIN Registration")
            {
            }
            column(PositionCategory_JobApplications; "Position Category")
            {
            }
            column(PositionId_JobApplications; "Position Id")
            {
            }
            column(PostCode_JobApplications; "Post Code")
            {
            }
            column(PreScreeningTemplateID_JobApplications; "Pre-Screening Template ID")
            {
            }
            column(PresentSubstantivePost_JobApplications; "Present Substantive Post")
            {
            }
            column(ProfessionalSummary_JobApplications; "Professional Summary")
            {
            }
            column(RefereeChecksPass_JobApplications; "Referee Checks Pass")
            {
            }
            column(RegionID_JobApplications; "Region ID")
            {
            }
            column(SecondmentDesignation_JobApplications; "Secondment Designation")
            {
            }
            column(SecondmentJobGroup_JobApplications; "Secondment Job Group")
            {
            }
            column(SecondmentOrganization_JobApplications; "Secondment Organization")
            {
            }
            column(SeniorityLevel_JobApplications; "Seniority Level")
            {
            }
            column(Station_JobApplications; Station)
            {
            }
            column(TargetCandidateSource_JobApplications; "Target Candidate Source")
            {
            }
            column(TermsofServiceCode_JobApplications; "Terms of Service Code")
            {
            }
            column(WorkExperienceYears_JobApplications; "Work Experience (Years)")
            {
            }
            column(WorkLocationDetails_JobApplications; "Work Location Details")
            {
            }
            column(ApplicationNo_JobApplications; "Job Applications"."Application No.")
            {
            }
            column(ApplicationStatus_JobApplications; "Job Applications"."Application Status")
            {
            }
            column(CandidateNo_JobApplications; "Job Applications"."Candidate No.")
            {
            }
            column(FirstName_JobApplications; "Job Applications"."First Name")
            {
            }
            column(MiddleName_JobApplications; "Job Applications"."Middle Name")
            {
            }
            column(LastName_JobApplications; "Job Applications"."Last Name")
            {
            }
            column(FullNames_JobApplications; "Job Applications"."Full Names")
            {
            }
            column(EmployeeNo_JobApplications; "Job Applications"."Employee No.")
            {
            }
            column(PhoneNo_JobApplications; "Job Applications"."Phone No.")
            {
            }
            column(MobilePhoneNo_JobApplications; "Job Applications"."Mobile Phone No.")
            {
            }
            column(EMail_JobApplications; "Job Applications"."E-Mail")
            {
            }
            column(BirthDate_JobApplications; "Job Applications"."Birth Date")
            {
            }
            column(Gender_JobApplications; "Job Applications".Gender)
            {
            }
            column(IDNumber_JobApplications; "Job Applications"."ID Number")
            {
            }
            column(PassportNo_JobApplications; "Job Applications"."Passport No.")
            {
            }
            column(Religion_JobApplications; "Job Applications".Religion)
            {
            }
            column(EthnicGroup_JobApplications; "Job Applications"."Ethnic Group")
            {
            }
            column(Nationality_JobApplications; "Job Applications".Nationality)
            {
            }
            column(SpecializationArea_JobApplications; "Job Applications"."Specialization Area")
            {
            }
            column(HighestAcademicQualification_JobApplications; "Job Applications"."Highest Academic Qualification")
            {
            }
            column(QualificationName_JobApplications; "Job Applications"."Qualification Name")
            {
            }
            dataitem(AP; Applicant)
            {
                DataItemLink = "Candidate No." = field("Candidate No.");
                DataItemTableView = where(Status = filter(<> Inactive));
                column(ReportForNavId_25; 25) { } // Autogenerated by ForNav - Do not delete
                column(CandidateNo_AP; AP."Candidate No.")
                {
                }
                column(FirstName_AP; AP."First Name")
                {
                }
                column(Disableds_AP; Disabled)
                {
                }
                column(MiddleName_AP; AP."Middle Name")
                {
                }
                column(LastName_AP; AP."Last Name")
                {
                }
                column(FullNames_AP; AP."Full Names")
                {
                }
                column(Address_AP; AP.Address)
                {
                }
                column(Address2_AP; AP."Address 2")
                {
                }
                column(City_AP; AP.City)
                {
                }
                column(PostCode_AP; AP."Post Code")
                {
                }
                column(CountyofBirth_AP; AP."County of Birth")
                {
                }
                column(PhoneNo_AP; AP."Phone No.")
                {
                }
                column(MobilePhoneNo_AP; AP."Mobile Phone No.")
                {
                }
                column(EMail_AP; AP."E-Mail")
                {
                }
                column(Picture_AP; AP.Picture)
                {
                }
                column(BirthDate_AP; AP."Birth Date")
                {
                }
                column(Gender_AP; AP.Gender)
                {
                }
                column(CountryRegionCode_AP; AP."Country/Region Code")
                {
                }
                column(IDNumber_AP; AP."ID Number")
                {
                }
                column(PassportNo_AP; AP."Passport No.")
                {
                }
                column(MaritalStatus_AP; AP."Marital Status")
                {
                }
                column(Religion_AP; AP.Religion)
                {
                }
                column(EthnicGroup_AP; AP."Ethnic Group")
                {
                }
                column(Nationality_AP; AP.Nationality)
                {
                }
                column(SpecializationArea_AP; AP."Specialization Area")
                {
                }
                column(HighestAcademicQualification_AP; AP."Highest Academic Qualification")
                {
                }
                column(QualificationName_AP; AP."Qualification Name")
                {
                }
                column(WorkExperienceYears_AP; AP."Work Experience (Years)")
                {
                }
                column(ManagementExperienceYears_AP; AP."Management Experience (Years)")
                {
                }
                column(DisabilityCode_AP; AP."Disability Code")
                {
                }
                column(Disabled_AP; Format(AP.Disabled))
                {
                }
                column(DisabilityDescription_AP; AP."Disability Description")
                {
                }
                column(DisabilityCertificateNo_AP; AP."Disability Certificate No")
                {
                }
                column(Status_AP; AP.Status)
                {
                }
                column(InactiveDate_AP; AP."Inactive Date")
                {
                }
                column(CauseofInactivityCode_AP; AP."Cause of Inactivity Code")
                {
                }
                column(TerminationDate_AP; AP."Termination Date")
                {
                }
                column(GroundsforTermCode_AP; AP."Grounds for Term. Code")
                {
                }
                column(LastDateModified_AP; AP."Last Date Modified")
                {
                }
                column(LastModifiedDateTime_AP; AP."Last Modified Date Time")
                {
                }
                column(NoofJobApplications_AP; AP."No. of Job Applications")
                {
                }
                column(SkillsCompetences_AP; AP."Skills & Competences")
                {
                }
                column(NoSeries_AP; AP."No. Series")
                {
                }
                column(Tittles_AP; AP.Tittles)
                {
                }
                column(NHIFNo_AP; AP."NHIF No")
                {
                }
                column(NSSFNo_AP; AP."NSSF No")
                {
                }
                column(KRAPin_AP; AP."KRA Pin")
                {
                }
                column(EmployeeNo_AP; AP."Employee No")
                {
                }
                column(Active_AP; AP.Active)
                {
                }
                column(InactiveReasonCode_AP; AP."Inactive Reason Code")
                {
                }
                column(ProfileCompleted_AP; AP."Profile Completed")
                {
                }
                column(CountyofResidence_AP; AP."County of Residence")
                {
                }
                column(DisabilityCertificateExpiry_AP; AP."Disability Certificate Expiry")
                {
                }
                column(AlternativeEmail_AP; AP."Alternative Email")
                {
                }
                column(ApplicantNo_AP; AP.ApplicantNo)
                {
                }
                dataitem(Q; "Job Applicants Qualification")
                {
                    DataItemLink = "Candidate No." = field("Candidate No.");
                    column(ReportForNavId_29; 29) { } // Autogenerated by ForNav - Do not delete
                    column(CandidateNo_Q; Q."Candidate No.")
                    {
                    }
                    column(LineNo_Q; Q."Line No.")
                    {
                    }
                    column(QualificationCategory_Q; Q."Qualification Category")
                    {
                    }
                    column(QualificationCode_Q; Q."Qualification Code")
                    {
                    }
                    column(SpecializedDomainArea_Q; Q."Specialized Domain Area")
                    {
                    }
                    column(FromDate_Q; Q."From Date")
                    {
                    }
                    column(ToDate_Q; Q."To Date")
                    {
                    }
                    column(Type_Q; Q.Type)
                    {
                    }
                    column(Description_Q; Q.Description)
                    {
                    }
                    column(InstitutionCompany_Q; Q."Institution/Company")
                    {
                    }
                    column(Cost_Q; Q.Cost)
                    {
                    }
                    column(CourseGrade_Q; Q."Course Grade")
                    {
                    }
                    column(JobApplicantStatus_Q; Q."Job Applicant Status")
                    {
                    }
                    column(Comment_Q; Q.Comment)
                    {
                    }
                    column(ExpirationDate_Q; Q."Expiration Date")
                    {
                    }
                    column(EducationLevel_Q; Q."Education Level")
                    {
                    }
                    column(Country_Q; Q.Country)
                    {
                    }
                    column(AttainedScore_Q; Q."Attained Score")
                    {
                    }
                    column(GraduationYear_Q; Q."Graduation Year")
                    {
                    }
                    column(MembershipRegistrationNo_Q; Q."Membership Registration No")
                    {
                    }
                    column(MembershipType_Q; Q."Membership Type")
                    {
                    }
                    column(MemberRenewalDate_Q; Q."Member Renewal Date")
                    {
                    }
                    column(LicensingNumber_Q; Q."Licensing Number")
                    {
                    }
                    column(LicensingRenewalDate_Q; Q."Licensing Renewal Date")
                    {
                    }
                    column(JobDescriptionDesignation_Q; Q."Job Description/Designation")
                    {
                    }
                    column(TermsofService_Q; Q."Terms of Service")
                    {
                    }
                    column(ExperienceYears_Q; Q."Experience Years")
                    {
                    }
                    column(DutiesandResposibilities_Q; Q."Duties and Resposibilities")
                    {
                    }
                    column(DurationDays_Q; Q."Duration(Days)")
                    {
                    }
                    column(ConvertedFullYears_Q; Q."Converted Full Years")
                    {
                    }
                    column(ConvertedFullMonths_Q; Q."Converted Full Months")
                    {
                    }
                    column(ConvertedFullDays_Q; Q."Converted Full Days")
                    {
                    }
                    column(ProffessionalQualifications_Q; Q."Proffessional Qualifications")
                    {
                    }
                    column(SubmissionDate_Q; Q."Submission Date")
                    {
                    }
                }
            }
            trigger OnAfterGetRecord();
            begin
                RecruitmentRequisitionHeader.Reset;
                RecruitmentRequisitionHeader.SetRange("Document No.", "Job Applications"."Vacancy Id");
                if RecruitmentRequisitionHeader.Find('-') then
                    Vacancy := RecruitmentRequisitionHeader."Job Title/Designation"
            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                }
            }
        }

    }

    trigger OnInitReport()
    begin

    end;

    trigger OnPostReport()
    begin
    end;

    trigger OnPreReport()
    begin
    end;

    var
        Vacancy: Text;
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";


}
