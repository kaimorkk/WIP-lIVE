codeunit 70112 recruitmentQueries
{
    trigger OnRun()
    begin

    end;

    var
        recruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        tbl_dynasoftPortalUser: Record "Dynasoft Portal User";
        tbl_applicant: Record Applicant;
        tbl_jobRequirements: Record "Recruitment Req Requirement";
        tbl_countries: Record "Country/Region";
        tbl_counties: Record County;
        tbl_ethnicity: Record "Ethnic Group";
        tbl_postCodes: Record "Post Code";
        tbl_specializationAreas: Record "Domain Area";
        tbl_jobQualication: Record "Job Applicants Qualification";
        tbl_qualification: Record Qualification;
        tbl_referees: Record "Employee_Applicant Referees";
        tbl_jobResponsibility: Record "Recruitment Req Responsibility";
        tbl_requirementCheckList: Record "Requirements Checklist";
        tbl_workConditions: Record "Recruitment Req Work Condition";
        tbl_jobApplications: Record "Job Applications";

    //tbl_profile:Record "Applicant Profile";

    procedure fnGetAdvertisedVacancies() data: Text
    begin
        recruitmentRequisitionHeader.Reset();
        recruitmentRequisitionHeader.SetRange("Document Type", recruitmentRequisitionHeader."Document Type"::"Job Vacancy");
        ///recruitmentRequisitionHeader.SetRange("Vacancy Status", recruitmentRequisitionHeader."Vacancy Status"::Published);
        recruitmentRequisitionHeader.SetRange("Approval Status", recruitmentRequisitionHeader."Approval Status"::Released);

        if (recruitmentRequisitionHeader.FindSet(true)) then begin
            repeat
                data += recruitmentRequisitionHeader."Job No." + '*' + recruitmentRequisitionHeader."Document No." + '*' + Format(recruitmentRequisitionHeader."Document Date") + '*' + recruitmentRequisitionHeader."Job Grade ID" + '*' + recruitmentRequisitionHeader."Job Title/Designation" + '*' + Format(recruitmentRequisitionHeader."Date Published") + '*' + Format(recruitmentRequisitionHeader."Employment Type") + '*' + Format(recruitmentRequisitionHeader."Application Closing Date") + '*' + Format(recruitmentRequisitionHeader."Application Closing Time") + '*' + Format(recruitmentRequisitionHeader."No. of Applications") + '*' + recruitmentRequisitionHeader."Work Location Details" + '*' + recruitmentRequisitionHeader."Vacancy Announcement ID" + '*' + recruitmentRequisitionHeader."Vacancy No" + '*' + Format(recruitmentRequisitionHeader."Vacancy Status") + '*' + Format(recruitmentRequisitionHeader."Approval Status") + '*' + Format(recruitmentRequisitionHeader."Duty Station ID") + '*' + Format(recruitmentRequisitionHeader."Hierarchically Reports To") + '*' + Format(recruitmentRequisitionHeader."Target Candidate Source") + '*' + Format(recruitmentRequisitionHeader."Estimate Annual Salary") + '*' + Format(recruitmentRequisitionHeader."No of Openings") + '*' + Format(recruitmentRequisitionHeader."Target Candidate Source") + '*' + Format(recruitmentRequisitionHeader."Position ID") + '*' + Format(recruitmentRequisitionHeader.Directorate) + '*' + Format(recruitmentRequisitionHeader.Department) + '*' + Format(recruitmentRequisitionHeader."Default Terms of Service Code") + '*' + Format(recruitmentRequisitionHeader."Seniority Level") + '*' + Format(recruitmentRequisitionHeader."Application Procedure 1") + '*' + Format(recruitmentRequisitionHeader."Application Procedure 2") + '*' + Format(recruitmentRequisitionHeader."Application Procedure 3") + '::::';
            until recruitmentRequisitionHeader.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetPortalUser(email: Text; password: Text) data: Text
    begin
        tbl_applicant.Reset();
        tbl_dynasoftPortalUser.Reset();
        tbl_applicant.SetRange("E-Mail", email);
        tbl_dynasoftPortalUser.SetRange("Authentication Email", email);
        tbl_dynasoftPortalUser.SetRange("Password Value", password);
        tbl_dynasoftPortalUser.SetRange("Record Type", tbl_dynasoftPortalUser."Record Type"::"Job Applicant");
        if tbl_dynasoftPortalUser.FindSet(true) and tbl_applicant.FindSet(true) then begin
            data := 'success*' + tbl_applicant."Full Names" + '*' + tbl_applicant."Mobile Phone No." + '*' + Format(tbl_applicant."Profile Completed") + '*' + tbl_dynasoftPortalUser."Authentication Email" + '*' + tbl_dynasoftPortalUser."Record ID" + '*' + Format(tbl_applicant."Passport No.") + '*' + tbl_applicant."First Name" + '*' + tbl_applicant."Middle Name" + '*' + tbl_applicant."Last Name" + '*' + Format(tbl_dynasoftPortalUser.State) + '*' + Format(tbl_dynasoftPortalUser."Change Password") + '::::';
            exit(data);
        end else begin
            data := 'danger* Sorry, You have entered the wrong password or email. Kindly try again'
        end;

    end;

    procedure fnGetJobVacancyRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyAcademicRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::Academic);
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyProfessionalRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::Professional);
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyCoreCompetenciesRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::"Skills & Competencies");
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetJobVacancyEthicsRequirements() data: Text
    begin
        tbl_jobRequirements.Reset();
        tbl_jobRequirements.SetRange("Document Type", tbl_jobRequirements."Document Type"::"Job Vacancy");
        tbl_jobRequirements.SetRange(tbl_jobRequirements."Qualification Category", tbl_jobRequirements."Qualification Category"::"Ethics & Integrity");
        if tbl_jobRequirements.FindSet(true) then begin
            repeat
                data += Format(tbl_jobRequirements."Document Type") + '*' + Format(tbl_jobRequirements."Document No.") + '*' + Format(tbl_jobRequirements."Requirement Type") + '*' + Format(tbl_jobRequirements."Qualification Category") + '*' + tbl_jobRequirements.Description + '::::';
            until tbl_jobRequirements.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetCountries() data: Text
    begin
        tbl_countries.Reset();
        repeat
            data += tbl_countries.Code + '*' + tbl_countries.Name + '::::';
        until tbl_countries.Next = 0;
        exit(data);
    end;

    procedure fnGetSpecializationAreas() data: Text
    begin
        tbl_specializationAreas.Reset();
        repeat
            data += tbl_specializationAreas.Code + '*' + tbl_specializationAreas.Description + '::::';
        until tbl_specializationAreas.Next = 0;
        exit(data);
    end;

    procedure fnGetPostCodes() data: Text
    begin
        tbl_postCodes.Reset();
        repeat
            data += tbl_postCodes.code + '*' + tbl_postCodes.City + '::::';
        until tbl_postCodes.Next = 0;
        exit(data);
    end;

    procedure fnGetCounties() data: Text
    begin
        tbl_counties.Reset();
        repeat
            data += tbl_counties.code + '*' + tbl_counties.Description + '::::';
        until tbl_counties.Next = 0;
        exit(data);
    end;

    procedure fnGetEthnicity() data: Text
    begin
        tbl_ethnicity.Reset();
        repeat
            data += tbl_ethnicity.Code + '*' + tbl_ethnicity.Description + '::::';
        until tbl_ethnicity.Next = 0;
        exit(data);
    end;

    procedure fnGetJobApplicantsQualification(applicantNumber: Code[20]) data: Text
    begin
        tbl_jobQualication.Reset();
        tbl_jobQualication.SetRange("Candidate No.", applicantNumber);
        if tbl_jobQualication.FindSet(true) then begin
            repeat
                data += tbl_jobQualication."Candidate No." + '*' + Format(tbl_jobQualication."Qualification Category") + '*' + tbl_jobQualication."Institution/Company" + '*' + tbl_jobQualication.Country + '*' + tbl_jobQualication."Specialized Domain Area" + '*' + Format(tbl_jobQualication."Attained Score") + '*' + Format(tbl_jobQualication."Graduation Year") + '*' + Format(tbl_jobQualication."From Date") + '*' + Format(tbl_jobQualication."To Date") + '*' + Format(tbl_jobQualication."Line No.") + '*' + tbl_jobQualication."Job Description/Designation" + '*' + Format(tbl_jobQualication."Terms of Service") + '*' + Format(tbl_jobQualication."Experience Years") + '*' + Format(tbl_jobQualication."Duties and Resposibilities") + '*' + Format(tbl_jobQualication."Membership Registration No") + '*' + Format(tbl_jobQualication."Membership Type") + '*' + Format(tbl_jobQualication."Member Renewal Date") + '*' + Format(tbl_jobQualication."Licensing Number") + '*' + Format(tbl_jobQualication."Licensing Renewal Date") + '*' + Format(tbl_jobQualication."Education Level") + '*' + Format(tbl_jobQualication."Proffessional Qualifications") + '*' + tbl_jobQualication."Qualification Code" + '*' + Format(tbl_jobQualication."Employment Type") + '::::';
            until tbl_jobQualication.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetQualifications() data: Text
    begin
        tbl_qualification.Reset();
        repeat
            data += tbl_qualification.Code + '*' + tbl_qualification.Description + '*' + Format(tbl_qualification."Qualification Category") + '::::';
        until tbl_qualification.Next = 0;
        exit(data);
    end;

    procedure fnGetApplicantProfile(ApplicantNumber: Code[20]) data: Text
    begin
        tbl_applicant.Reset();
        tbl_applicant.SetRange("Candidate No.", ApplicantNumber);
        if tbl_applicant.FindSet(true) then begin
            repeat
                data += Format(tbl_applicant.Tittles) + '*' + Format(tbl_applicant.Disabled) + '*' + Format(tbl_applicant.City) + '*' + Format(tbl_applicant.Gender) + '*' + Format(tbl_applicant."E-Mail") + '*' + Format(tbl_applicant."First Name") + '*' + Format(tbl_applicant."County of Birth") + '*' + Format(tbl_applicant."Disability Description") + '*' + Format(tbl_applicant."Middle Name") + '*' + Format(tbl_applicant."Last Name") + '*' + Format(tbl_applicant."ID Number") + '*' + Format(tbl_applicant."Passport No.") + '*' + Format(tbl_applicant.Nationality) + '*' + Format(tbl_applicant.Religion) + '*' + Format(tbl_applicant."Post Code") + '*' + Format(tbl_applicant."Ethnic Group") + '*' + Format(tbl_applicant."Mobile Phone No.") + '*' + Format(tbl_applicant."Marital Status") + '*' + Format(tbl_applicant.Address) + '*' + Format(tbl_applicant."Disability Certificate No") + '*' + tbl_applicant."KRA Pin" + '*' + Format(tbl_applicant."Birth Date") + '*' + Format(tbl_applicant."NSSF No") + '*' + Format(tbl_applicant."NHIF No") + '*' + Format(tbl_applicant."Full Names") + '*' + Format(tbl_applicant."Specialization Area") + '*' + Format(tbl_applicant."Skills & Competences") + '*' + Format(tbl_applicant."Highest Academic Qualification") + '*' + Format(tbl_applicant."Management Experience (Years)") + '*' + Format(tbl_applicant."Work Experience (Years)") + '*' + Format(tbl_applicant."County of Residence") + '::::';
            until tbl_applicant.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetApplicantReferees(applicantNumber: Code[20]) data: Text
    begin
        tbl_referees.Reset();
        tbl_referees.SetRange("No.", applicantNumber);
        if tbl_referees.FindSet(true) then begin
            repeat
                data += Format(tbl_referees."Line No.") + '*' + Format(tbl_referees."Rererence Type") + '*' + Format(tbl_referees.Name) + '*' + Format(tbl_referees."Designation/Title") + '*' + Format(tbl_referees.Institution) + '*' + Format(tbl_referees."E-Mail") + '*' + Format(tbl_referees."Phone No.") + '*' + Format(tbl_referees.Relationship) + '*' + Format(tbl_referees."Country/Region Code") + '*' + Format(tbl_referees."Years Known") + '::::';
            until tbl_referees.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetJobResponsibility() data: Text
    begin
        tbl_jobResponsibility.Reset();
        tbl_jobResponsibility.SetRange("Document Type", tbl_jobResponsibility."Document Type"::"Job Vacancy");
        if tbl_jobResponsibility.FindSet(true) then begin
            repeat
                data += Format(tbl_jobResponsibility."Document No.") + '*' + Format(tbl_jobResponsibility."Document Type") + '*' + Format(tbl_jobResponsibility.Description) + '::::';
            until tbl_jobResponsibility.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetRequirementCheckList() data: Text
    begin
        tbl_requirementCheckList.Reset();
        repeat
            data += tbl_requirementCheckList."Vacancy No." + '*' + Format(tbl_requirementCheckList."Qualification Category") + '*' + Format(tbl_requirementCheckList.Description) + '*' + Format(tbl_requirementCheckList."Requirement Type") + '*' + Format(tbl_requirementCheckList."Rating Type") + '::::';
        until tbl_requirementCheckList.Next = 0;
        exit(data);
    end;

    procedure fnGetWorkConditions() data: Text
    begin
        tbl_workConditions.Reset();
        tbl_workConditions.SetRange("Document Type", tbl_workConditions."Document Type"::"Job Vacancy");
        if tbl_workConditions.FindSet(true) then begin
            repeat
                data += Format(tbl_workConditions."Document No") + '*' + Format(tbl_workConditions."Document Type") + '*' + Format(tbl_workConditions."Working Condition Category") + '*' + tbl_workConditions.Description + '::::';
            until tbl_workConditions.Next = 0;
        end;

    end;

    procedure fnGetMyJobApplications(applicantNumber: Code[30]) data: Text
    begin
        tbl_jobApplications.Reset();
        tbl_jobApplications.SetRange("Candidate No.", applicantNumber);
        if tbl_jobApplications.FindSet(true) then begin
            repeat
                data += format(tbl_jobApplications."Application No.") + '*' + Format(tbl_jobApplications."Application Status") + '*' + Format(tbl_jobApplications."Vacancy Id") + '*' + Format(tbl_jobApplications."Professional Summary") + '*' + Format(tbl_jobApplications."Job Title/Designation") + '::::';
            until tbl_jobApplications.Next = 0;
        end;
        exit(data);
    end;


}