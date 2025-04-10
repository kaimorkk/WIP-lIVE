
codeunit 77002 "eRecruitment2"
{

    trigger OnRun()
    begin
    end;

    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        ApplicationEntryNumber: Integer;
        ApplicationQualification1: Record "Application Qualification";
        Applicant_EmployeeHobby: Record "Applicant_Employee Hobby";
        ApplicationHobby: Record "Application Hobby";
        ApplicationDeclaration: Record "Application Declaration";
        DeclarationSetup: Record "Declaration Statement Setup";
        DocAttachment: Record "Document Attachment";

        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        FileDirectory: Text;
        FileName: Text;
        SMTP: Codeunit Mail;
        SMTPMailSetup2: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        RecordIDNumber: RecordID;
        Contact_Test: Record Contact;
        FILEPATH: Text;
        HRsetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RecRef: RecordRef;
        TempBlob_lRec: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;

        FileManagement_lCdu: Codeunit "File Management";
        Base64Convert: Codeunit "Base64 Convert";

    procedure CheckApplicantExists(Email: Text) Exists: Boolean
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
    begin
        Exists := false;
        Contact.Reset;
        Contact.SetRange("E-Mail", Email);
        if Contact.FindSet then begin
            Exists := true;
        end
    end;

    procedure Login(Email: Text) Password: Text
    var
        portalUser: Record "Dynasoft Portal User";
    begin
        portalUser.Reset;
        portalUser.SetRange("Authentication Email", Email);
        if portalUser.FindSet() then begin
            Password := portalUser."Password Value";
        end
    end;

    procedure ChangePassword(Email: Text) changePassword: Boolean
    var
        portalUser: Record "Dynasoft Portal User";
    begin
        portalUser.Reset;
        portalUser.SetRange("Authentication Email", Email);
        if portalUser.FindSet() then begin
            changePassword := portalUser."Change Password";
        end
    end;

    procedure LoginAsJson(Email: Text): Text
    var
        portalUser: Record "Dynasoft Portal User";
        jsonObject: JsonObject;
        jsonWriter: Text;
        passwordHash: Text;
        passwordSalt: Text;
        candidateNumber: Text;
        resultText: Text;
    begin
        portalUser.Reset();
        portalUser.SetRange("Authentication Email", Email);

        if portalUser.FindFirst() then begin
            passwordHash := portalUser."PasswordHash";
            passwordSalt := portalUser."PasswordSalt";
            candidateNumber := portalUser."Record ID";
            jsonObject.Add('PasswordHash', passwordHash);
            jsonObject.Add('PasswordSalt', passwordSalt);
            jsonObject.Add('CandidateNumber', candidateNumber);
            jsonObject.WriteTo(resultText);
            exit(resultText);
        end else
            Error('User not found.');
    end;

    procedure FnRegistration(idnumber: Text; firstname: Text; lastname: Text; middlename: Text; email: Text; phoneNumber: Text)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        StatusResponse: Text;
    begin

        Contact.Reset;
        Contact.SetRange("E-Mail", email);
        Contact.SetRange("ID Number", idnumber);
        if Contact.FindSet then begin
            Error('Another applicant with the same email address or ID number exists!');
        end;
        MarketingSetup.Get;
        Contact.Init;
        Contact."No." := NoSeriesManagement.GetNextNo(MarketingSetup."Contact Nos.", Today, true);
        Contact.Name := firstname + ' ' + lastname + ' ' + middlename;
        Contact.Type := Contact.Type::Person;
        Contact."Phone No." := phoneNumber;
        Contact."E-Mail" := email;
        Contact."ID Number" := idnumber;
        Contact."First Name" := firstname;
        Contact."Middle Name" := middlename;
        Contact.Surname := lastname;
        if Contact.Insert(true) then begin
            FnCreateApplicantAccountRequest(email);
            FnSendEmaiNotificationOnApplicantAccountActivation(Contact);
        end else begin
            Error('Your applicant account was not created successfully. Kindly contact the system administrator.');
        end;
    end;



    procedure FnResetPassword(emailaddress: Text)
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        RandomPassword: Text;
        Body: Text;
    begin
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        DynasoftPortalUser.SetRange("Record Type", DynasoftPortalUser."Record Type"::"Job Applicant");

        if DynasoftPortalUser.FindSet then begin
            RandomPassword := GenerateSecurePassword;
            DynasoftPortalUser."Password Value" := RandomPassword;
            DynasoftPortalUser."Last Modified Date" := Today;
            DynasoftPortalUser."Change Password" := false;
            DynasoftPortalUser."Record Type" := DynasoftPortalUser."Record Type"::"Job Applicant";

            if DynasoftPortalUser.Modify(true) then begin
                ResetSendEmail(emailaddress);
            end else begin
                Error('The Password was Not Modified');
            end;
        end else begin
            Error('Email Address is Missing');
        end;
    end;

    procedure GenerateSecurePassword(): Text
    var
        Characters: Text;
        Password: Text;
        i: Integer;
        RandomIndex: Integer;
        PasswordLength: Integer;
    begin
        Characters := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_=+';

        PasswordLength := 8 + Random(5);

        for i := 1 to PasswordLength do begin
            RandomIndex := Random(StrLen(Characters)) + 1;
            Password += CopyStr(Characters, RandomIndex, 1);
        end;

        exit(Password);
    end;



    procedure ResetSendEmail(emailaddress: Text)
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        Body: Text;
        SMTP: Codeunit Mail;
        Receipients: List of [Text];
        Subject: Text[250];
    begin
        CompInfo.get();
        DynasoftPortalUser.Reset;
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindSet then begin
            Subject := 'Password Reset - Recruitment Portal ';
            Body := 'Dear, your password for the account: ' + ' <strong>' + DynasoftPortalUser."Authentication Email" + '</strong> has been reset successfully. Kindly use the password below to access your account<br> <strong>Password: ' + DynasoftPortalUser."Password Value" + '</strong> <br>';
            Body := Body + ' ' + 'Kind Regards,<br> ' + CompInfo.Name + '<br><br>';
            Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
            SMTPMail.Create(DynasoftPortalUser."Authentication Email", Subject, Body, true);
            Smail.Send(SMTPMail, Enum::"Email Scenario"::"E-Recruitment");
        end;
    end;


    procedure FnApplicantProfileRegistration(applicantNumber: Text; surname: Text; firstname: Text; othernames: Text; gender: Integer; idnumber: Integer;
    passportnumber: Text; nationality: Text; religion: Code[20];
    alternativeContact: Text; alternativeNumber: Text; constituency: Text; ward: Code[20]; village: Code[20]; subCounty: Code[20];
    dateofbirth: Date; countyofresidence: Text; countyoforigin: Text;
    ethnicity: Text; mobilephonenumber: Text; krapin: Text; maritalstatus: Integer;
    address: Code[50]; disabilityCode: Code[50]; disabilitycertificate: Code[50];
    disabilitysummary: Text[50]; phonenumber2: Text; isdisable: Boolean; postalcodes: Code[50];
    managementYears: Integer; WorkExperience: Integer; HighestAcademicLevel: Code[50]; SkillsandCompetence: Text;
    specializationArea: Text; minimumAcademicQualification: Code[50]; shifNo: Text[50]; nssfNo: Text[20]; region: Code[20]; prefferedTitle: Integer)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        Applicant: Record Applicant;
    begin
        // <<< New Changes

        Applicant.Reset;
        Applicant.SetRange("Candidate No.", applicantNumber);
        if Applicant.FindSet then begin
            Applicant."First Name" := firstname;
            Applicant."Middle Name" := othernames;
            Applicant."Last Name" := surname;
            Applicant."Full Names" := firstname + ' ' + othernames + ' ' + surname;
            Applicant.Gender := gender;
            Applicant."Preferred Title" := prefferedTitle;
            Applicant.Religion := religion;
            Applicant."Birth Date" := dateofbirth;
            Applicant."County of Origin" := countyoforigin;
            Applicant.Validate("County of Origin");
            Applicant."Ethnic Group" := ethnicity;
            Applicant.Nationality := nationality;
            Applicant."Alternative Contact Person" := alternativeContact;
            Applicant."Alternative Contact Phone" := alternativeNumber;
            Applicant.Constituency := constituency;
            Applicant."Sub County" := subCounty;
            Applicant.Village := village;
            Applicant.Ward := ward;
            Applicant."Mobile Phone No." := mobilephonenumber;
            Applicant."KRA PIN NO." := krapin;
            Applicant."Country/Region Code" := region;
            Applicant."County of Residence" := countyofresidence;
            Applicant.Address := address;
            Applicant."Social Security No." := nssfNo;
            Applicant."SHA No." := shifNo;
            Applicant."Marital Status" := maritalstatus;
            Applicant."Management Experience (Years)" := managementYears;
            Applicant."Work Experience (Years)" := WorkExperience;
            Applicant."Highest Academic Qualification" := HighestAcademicLevel;
            Applicant."Skills & Competences" := SkillsandCompetence;
            Applicant."ID Number" := idnumber;
            Applicant."Passport No." := passportnumber;
            Applicant.Validate("Highest Academic Qualification");
            if (isdisable = true) then begin
                Applicant.Disabled := true;
                Applicant."Disability Code" := disabilityCode;
                Applicant."Disability Certificate No" := disabilitycertificate;
                Applicant."Disability Description" := disabilitysummary;
            end;
            Applicant."Phone No." := phonenumber2;
            Applicant."Post Code" := postalcodes;
            Applicant."Last Date Modified" := Today;
            Applicant."Specialization Area" := specializationArea;
            Applicant."Profile Completed" := false;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            if not Applicant.Modify(true) then begin
                Error('Your Applicant account was not created successfully.Kindly Contact System Administrator');
            end;
        end else begin
            Applicant.Init;
            Applicant."First Name" := firstname;
            Applicant."Middle Name" := othernames;
            Applicant."Last Name" := surname;
            Applicant.Gender := gender;
            Applicant.Nationality := nationality;
            Applicant."Preferred Title" := prefferedTitle;
            Applicant.Religion := religion;
            Applicant."Birth Date" := dateofbirth;
            Applicant."County of Birth" := countyoforigin;
            Applicant."Country/Region Code" := nationality;
            Applicant."County of Residence" := countyofresidence;
            Applicant."Ethnic Group" := ethnicity;
            Applicant.Nationality := nationality;
            Applicant."Alternative Contact Person" := alternativeContact;
            Applicant."Alternative Contact Phone" := alternativeNumber;
            Applicant.Constituency := constituency;
            Applicant."Sub County" := subCounty;
            Applicant.Village := village;
            Applicant.Ward := ward;
            Applicant."Mobile Phone No." := mobilephonenumber;
            Applicant."Country/Region Code" := region;
            Applicant."County of Birth" := countyoforigin;
            Applicant.Address := address;
            Applicant."Marital Status" := maritalstatus;
            Applicant."KRA Pin" := krapin;
            Applicant."Phone No." := phonenumber2;
            Applicant."Post Code" := postalcodes;
            Applicant."Social Security No." := nssfNo;
            Applicant."NHIF No" := shifNo;
            Applicant."Management Experience (Years)" := managementYears;
            Applicant."Work Experience (Years)" := WorkExperience;
            Applicant."Highest Academic Qualification" := HighestAcademicLevel;
            Applicant."ID Number" := idnumber;
            Applicant."Passport No." := passportnumber;
            Applicant."Skills & Competences" := SkillsandCompetence;
            Applicant.Validate("Highest Academic Qualification");
            if (isdisable = true) then begin
                Applicant.Disabled := true;
                Applicant."Disability Code" := disabilityCode;
                Applicant."Disability Certificate No" := disabilitycertificate;
                Applicant."Disability Description" := disabilitysummary;
            end;
            Applicant."Last Date Modified" := Today;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            Applicant."Specialization Area" := specializationArea;
            Applicant."Profile Completed" := false;
            if not Applicant.Insert(true) then begin
                Error('Your Applicant account was not created successfully. Kindly contact the System Administrator.');
            end;
        end;
    end;

    procedure ModifyCurrentEmployerDetails(applicantNumber: Code[50]; institution: Code[50]; station: Text[100]; employmentNumber: Text[50]; post: Text[50]; jobGrade: Text[50]; dateOfAppointment: Date; upgradedPost: Text[100]; previousAppointment: Date; secondOrg: Code[50]; secondDes: Code[50]; secondJobGrade: Code[50]; termsOfService: Option; grossSalary: Integer; currentEmployment: Option)
    var
        Applicant: Record Applicant;
    begin
        Applicant.Reset;
        Applicant.SetRange("Candidate No.", applicantNumber);
        if Applicant.FindSet then begin
            Applicant."Employer Name" := institution;
            Applicant."Station" := station;
            Applicant."Personal No." := employmentNumber;
            Applicant."Present Substantive Post" := post;
            Applicant."Job Grade" := jobGrade;
            Applicant."Secondment Organization" := secondOrg;
            Applicant."Secondment Designation" := secondDes;
            Applicant."Secondment Job Group" := secondJobGrade;
            Applicant."Gross Salary" := grossSalary;
            Applicant."Date of Current Appointment" := dateOfAppointment;
            Applicant."Upgraded Post" := upgradedPost;
            Applicant."Date of Previous Appointment" := previousAppointment;
            Applicant."Terms Of Service" := termsOfService;
            Applicant."Current Employment Status" := currentEmployment;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            if not Applicant.Modify(true) then begin
                Error('Your Aplicant account was not created successfully.Kindly Contact System Administrator');
            end;
        end;
    end;

    procedure ModifyOtherDetails(candidateNumber: Code[50]; languages: Text[100]; physicalImparement: Boolean; imparementDetail: Text[100]; criminalOffence: Boolean; dissmisal: Boolean; investigation: Boolean; dismissalDetail: Text[100]; effectiveDate: Date; family: Boolean; familyDetail: Text[100]; taxComliant: Boolean; hasHelbLoan: Boolean; lawViolation: Boolean; chargeDetails: Text[100])
    var
        Applicant: Record Applicant;
    begin
        Applicant.Reset;
        Applicant.SetRange("Candidate No.", candidateNumber);
        if Applicant.FindSet then begin
            Applicant."Proficient Languages" := languages;
            Applicant."Is Impaired" := physicalImparement;
            Applicant."Impairment Details" := imparementDetail;
            Applicant."Convicted/On Probation" := criminalOffence;
            Applicant."Dismissed from Employment" := dissmisal;
            Applicant."Has On-going Investigation" := investigation;
            Applicant."Investigation Details" := dismissalDetail;
            Applicant."Investigation Date" := effectiveDate;
            Applicant."Relatives In PPRA" := family;
            Applicant."Name & Relationship" := familyDetail;
            Applicant."Is Tax Compliant" := taxComliant;
            Applicant."Has Helb Loan" := hasHelbLoan;
            Applicant."Has Voilated Laws" := lawViolation;
            Applicant."Charge Details" := chargeDetails;
            Applicant."Last Modified Date Time" := CurrentDatetime;
            if not Applicant.Modify(true) then begin
                Error('Your Aplicant account was not modified successfully.Kindly Contact System Administrator');
            end;
        end;
    end;

    procedure FnAcademicQualifications(applicantNumber: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Education Level" := educationlevel;
        JobApplicantsQualification.Country := country;
        JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::Academic;
        JobApplicantsQualification."Qualification Code" := qualificationtitle;
        JobApplicantsQualification.Validate("Qualification Code");
        JobApplicantsQualification."Specialized Domain Area" := specializationarea;
        JobApplicantsQualification."Attained Score" := attainedscore;
        JobApplicantsQualification."Graduation Year" := graduationyear;
        JobApplicantsQualification."Institution/Company" := institutionname;
        JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
        JobApplicantsQualification."From Date" := startdate;
        JobApplicantsQualification."To Date" := enddate;
        if not JobApplicantsQualification.Insert(true) then begin
            Error('Academic details could not be submitted');
        end;
    end;


    procedure FnUpdateAcademicQualifications(applicantNumber: Text; EntryNumber: Integer; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Education Level" := educationlevel;
            JobApplicantsQualification.Country := country;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::Academic;
            JobApplicantsQualification."Qualification Code" := qualificationtitle;
            JobApplicantsQualification.Validate("Qualification Code");
            JobApplicantsQualification."Specialized Domain Area" := specializationarea;
            JobApplicantsQualification."Attained Score" := attainedscore;
            JobApplicantsQualification."Graduation Year" := graduationyear;
            JobApplicantsQualification."Institution/Company" := institutionname;
            JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
            JobApplicantsQualification."From Date" := startdate;
            JobApplicantsQualification."To Date" := enddate;
            if not JobApplicantsQualification.Modify(true) then begin
                Error('The academic details could not be updated');
            end;
        end;
    end;


    procedure FnApplicationAcademicQualifications(applicantNumber: Text; jobApplicationNo: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := jobApplicationNo;
        ApplicationQualification."Education Level" := educationlevel;
        ApplicationQualification.Country := country;
        ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::Academic;
        ApplicationQualification."Qualification Code" := qualificationtitle;
        ApplicationQualification."Specialized Domain Area" := specializationarea;
        ApplicationQualification."Attained Score" := attainedscore;
        ApplicationQualification."Graduation Year" := graduationyear;
        ApplicationQualification."Institution/Company" := institutionname;
        ApplicationQualification."From Date" := startdate;
        ApplicationQualification."To Date" := enddate;
        ApplicationQualification.Description := qualificationtitle;
        if not ApplicationQualification.Insert(true) then begin
            Error('Academic Qualifications could not be submitted,Kindly try again!');
        end;
    end;


    procedure FnUpdateApplicationAcademicQualifications(applicantNumber: Text; EntryNumber: Integer; jobApplicationNo: Text; educationlevel: Integer; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            ApplicationQualification."Candidate No." := applicantNumber;
            ApplicationQualification."Application No." := jobApplicationNo;
            ApplicationQualification."Education Level" := educationlevel;
            ApplicationQualification.Country := country;
            ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::Academic;
            ApplicationQualification."Qualification Code" := qualificationtitle;
            ApplicationQualification."Specialized Domain Area" := specializationarea;
            ApplicationQualification."Attained Score" := attainedscore;
            ApplicationQualification."Graduation Year" := graduationyear;
            ApplicationQualification."Institution/Company" := institutionname;
            ApplicationQualification."From Date" := startdate;
            ApplicationQualification."To Date" := enddate;
            ApplicationQualification.Description := qualificationtitle;
            if not ApplicationQualification.Modify(true) then begin
                Error('The Academic Details could not be saved');
            end;
        end else begin
            Error('The Academic Details could not be saved');
        end;
    end;


    procedure FnProffessionalQualifications(applicantNumber: Text; educationlevel: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Proffessional Qualifications" := educationlevel;
        JobApplicantsQualification.Country := country;
        JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::Professional;
        JobApplicantsQualification."Qualification Code" := qualificationtitle;
        JobApplicantsQualification."Specialized Domain Area" := specializationarea;
        JobApplicantsQualification."Attained Score" := attainedscore;
        JobApplicantsQualification."Graduation Year" := graduationyear;
        JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
        JobApplicantsQualification."Institution/Company" := institutionname;
        JobApplicantsQualification."From Date" := startdate;
        JobApplicantsQualification."To Date" := enddate;
        JobApplicantsQualification.Description := qualificationtitle;
        if not JobApplicantsQualification.Insert(true) then begin
            Error('Professional Qualifications could be submitted,Kindly try again!');
        end;
    end;


    procedure FnUpdateProffessionalQualifications(EntryNo: Integer; applicantNumber: Text; professionQualification: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNo);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Proffessional Qualifications" := professionQualification;
            JobApplicantsQualification.Country := country;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::Professional;
            JobApplicantsQualification."Qualification Code" := qualificationtitle;
            JobApplicantsQualification."Specialized Domain Area" := specializationarea;
            JobApplicantsQualification."Attained Score" := attainedscore;
            JobApplicantsQualification."Graduation Year" := graduationyear;
            JobApplicantsQualification.Type := JobApplicantsQualification.Type::External;
            JobApplicantsQualification."Institution/Company" := institutionname;
            JobApplicantsQualification."From Date" := startdate;
            JobApplicantsQualification."To Date" := enddate;
            JobApplicantsQualification.Description := qualificationtitle;
            if not JobApplicantsQualification.Modify(true) then begin
                Error('Professional qualifications could not be updated, Kindly try again!');
            end;
        end;
    end;


    procedure FnApplicationProffessionalQualifications(applicantNumber: Text; JobApplicationNo: Text; proffesionalQualification: Text; institutionname: Text; country: Text; qualificationtitle: Text; specializationarea: Text; attainedscore: Integer; graduationyear: Text; startdate: Date; enddate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Proffessional Qualification" := proffesionalQualification;
        ApplicationQualification.Country := country;
        ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::Professional;
        ApplicationQualification."Qualification Code" := qualificationtitle;
        ApplicationQualification."Specialized Domain Area" := specializationarea;
        ApplicationQualification."Attained Score" := attainedscore;
        ApplicationQualification."Graduation Year" := graduationyear;
        ApplicationQualification."Institution/Company" := institutionname;
        ApplicationQualification."From Date" := startdate;
        ApplicationQualification."To Date" := enddate;
        ApplicationQualification.Description := qualificationtitle;
        if not ApplicationQualification.Insert(true) then begin
            Error('Details Could not be Submitted');
        end;
    end;


    procedure FnProffessionaBodies(applicantNumber: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; RenewalDate: Date; licensingNumber: Text; LicenseRenewalDate: Date; institution: Text[100])
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Institution/Company" := institution;
        JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"Proffessional Bodies";
        JobApplicantsQualification."Member Renewal Date" := RenewalDate;
        JobApplicantsQualification."Membership Registration No" := registrationNumber;
        JobApplicantsQualification."Membership Type" := MembershipType;
        JobApplicantsQualification."Licensing Number" := licensingNumber;
        JobApplicantsQualification."Licensing Renewal Date" := LicenseRenewalDate;
        JobApplicantsQualification."Qualification Code" := professionalbody;
        if not JobApplicantsQualification.Insert(true) then begin
            Error('Professional bodies could not be submitted, kindly try again!')
        end;
    end;


    procedure FnUpdateProffessionaBodies(EntryNumber: Integer; applicantNumber: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; RenewalDate: Date; licensingNumber: Text; LicenseRenewalDate: Date; institution: Text)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Institution/Company" := institution;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::"Proffessional Bodies";
            JobApplicantsQualification."Member Renewal Date" := RenewalDate;
            JobApplicantsQualification."Membership Registration No" := registrationNumber;
            JobApplicantsQualification."Membership Type" := MembershipType;
            JobApplicantsQualification."Licensing Number" := licensingNumber;
            JobApplicantsQualification."Licensing Renewal Date" := LicenseRenewalDate;
            JobApplicantsQualification."Qualification Code" := professionalbody;
            if not JobApplicantsQualification.Modify(true) then begin
                Error('Professional bodies could be updated,Kindly try again!')
            end;
        end;

    end;


    procedure FnApplicationProffessionaBodies(applicantNumber: Text; JobApplicationNo: Text; professionalbody: Text; registrationNumber: Text; MembershipType: Text; RenewalDate: Date; licensingNumber: Text; LicenseRenewalDate: Date)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Institution/Company" := professionalbody;
        ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::"Proffessional Bodies";
        ApplicationQualification."Member Renewal Date" := RenewalDate;
        ApplicationQualification."Membership Registration No" := registrationNumber;
        ApplicationQualification."Membership Type" := MembershipType;
        ApplicationQualification."Licensing Number" := licensingNumber;
        ApplicationQualification."Licensing Renewal Date" := LicenseRenewalDate;
        if not ApplicationQualification.Insert(true) then begin
            Error('Professional bodies Details Could not be Submitted');
        end;

    end;


    procedure FnWorkExperience(applicantNumber: Text; employerName: Text; jobdesignation: Text; employmentstartdate: Date; employmentenddate: Date; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text; specializationArea: Text; employmentType: Integer)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Init;
        JobApplicantsQualification."Candidate No." := applicantNumber;
        JobApplicantsQualification."Job Description/Designation" := jobdesignation;
        JobApplicantsQualification."Institution/Company" := employerName;
        JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::Experience;
        JobApplicantsQualification."From Date" := employmentstartdate;
        JobApplicantsQualification."To Date" := employmentenddate;
        JobApplicantsQualification."Terms of Service" := termsofservice;
        JobApplicantsQualification."Experience Years" := experienceyears;
        JobApplicantsQualification."Duties and Resposibilities" := dutiesresponsibilities;
        JobApplicantsQualification."Specialized Domain Area" := specializationArea;
        JobApplicantsQualification."Employment Type" := employmentType;
        if not JobApplicantsQualification.Insert(true) then begin
            Error('Experience details could not be submitted,Kindly try again');
        end;
    end;


    procedure FnUpdateWorkExperience(EntryNumber: Integer; applicantNumber: Text; employerName: Text; jobdesignation: Text; employmentstartdate: Date; employmentenddate: Date; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text; employmentType: Integer) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        JobApplicantsQualification.SetRange("Candidate No.", applicantNumber);
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification."Candidate No." := applicantNumber;
            JobApplicantsQualification."Job Description/Designation" := jobdesignation;
            JobApplicantsQualification."Institution/Company" := employerName;
            JobApplicantsQualification."Qualification Category" := JobApplicantsQualification."qualification category"::Experience;
            JobApplicantsQualification."From Date" := employmentstartdate;
            JobApplicantsQualification."To Date" := employmentenddate;
            JobApplicantsQualification."Terms of Service" := termsofservice;
            JobApplicantsQualification."Experience Years" := experienceyears;
            JobApplicantsQualification."Duties and Resposibilities" := dutiesresponsibilities;
            JobApplicantsQualification."Employment Type" := employmentType;
            if not JobApplicantsQualification.Modify(true) then begin
                Error('Experience details could not be updated, kindly try again!');
            end;
        end;
    end;


    procedure FnApplicationWorkExperience(applicantNumber: Text; JobApplicationNo: Text; employerName: Text; jobdesignation: Text; employmentstartdate: Date; employmentenddate: Date; termsofservice: Integer; experienceyears: Text; dutiesresponsibilities: Text)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin

        ApplicationQualification.Init;
        ApplicationQualification."Candidate No." := applicantNumber;
        ApplicationQualification."Application No." := JobApplicationNo;
        ApplicationQualification."Job Description/Designation" := jobdesignation;
        ApplicationQualification."Institution/Company" := employerName;
        ApplicationQualification."Qualification Category" := ApplicationQualification."qualification category"::Experience;
        ApplicationQualification."From Date" := employmentstartdate;
        ApplicationQualification."To Date" := employmentenddate;
        ;
        ApplicationQualification."Terms of Service" := termsofservice;
        ApplicationQualification."Experience Years" := experienceyears;
        ApplicationQualification."Duties and Resposibilities" := dutiesresponsibilities;
        if not ApplicationQualification.Insert(true) then begin
            Error('Experience details could not be submitted,Kindly try again');
        end;

    end;

    procedure ModifyRemunerationDetails(applicationNumber: Code[20]; candidateNumber: Code[20]; basicSalary: Decimal; houseAllowance: Decimal; otherAllowances: Decimal; gross: Decimal;
                airtime: Decimal; leaveTravel: Decimal; availabilityDate: Date)
    var
        JobApplications: Record "Job Applications";
    begin
        JobApplications.Reset();
        JobApplications.SetRange("Application No.", applicationNumber);
        JobApplications.SetRange("Candidate No.", candidateNumber);
        if JobApplications.FindFirst() then begin
            JobApplications."Basic Salary" := basicSalary;
            JobApplications."House Allowance" := basicSalary;
            JobApplications."Other Remunerative Allowances" := otherAllowances;
            JobApplications.Gross := gross;
            JobApplications."Airtime Allowance" := airtime;
            JobApplications."Leave Travel Allowance" := leaveTravel;
            JobApplications."Appointment Availability Date" := availabilityDate;
            if not JobApplications.Modify(true) then begin
                Error('Renumerationn details could not be updated!');
            end;
        end;
    end;


    procedure FnCandidateReferees(appplicantNumber: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Integer; institution: Text)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
    begin

        Employee_ApplicantReferees.Init;
        Employee_ApplicantReferees."No." := appplicantNumber;
        Employee_ApplicantReferees."Document Type" := Employee_ApplicantReferees."document type"::"Job Applicant";
        Employee_ApplicantReferees."Rererence Type" := refereetype;
        Employee_ApplicantReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
        Employee_ApplicantReferees."Designation/Title" := contactdesignations;
        Employee_ApplicantReferees.Institution := institution;
        Employee_ApplicantReferees."Phone No." := phonenumber;
        Employee_ApplicantReferees."Country/Region Code" := country;
        Employee_ApplicantReferees."E-Mail" := emailaddress;
        Employee_ApplicantReferees.Relationship := relationship;
        Employee_ApplicantReferees."Years Known" := periodknown;
        if not Employee_ApplicantReferees.Insert(true) then begin
            Error('Referees could not be submitted,Kindly try again!')
        end;
    end;


    procedure FnUpdateCandidateReferees(entryNo: Integer; appplicantNumber: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Integer; institution: Text)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
    begin
        Employee_ApplicantReferees.Reset();
        Employee_ApplicantReferees.SetRange("No.", appplicantNumber);
        Employee_ApplicantReferees.SetRange("Line No.", entryNo);
        if Employee_ApplicantReferees.FindSet(true) then begin
            Employee_ApplicantReferees."No." := appplicantNumber;
            Employee_ApplicantReferees."Document Type" := Employee_ApplicantReferees."document type"::"Job Applicant";
            Employee_ApplicantReferees."Rererence Type" := refereetype;
            Employee_ApplicantReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
            Employee_ApplicantReferees."Designation/Title" := contactdesignations;
            Employee_ApplicantReferees.Institution := institution;
            Employee_ApplicantReferees."Phone No." := phonenumber;
            Employee_ApplicantReferees."Country/Region Code" := country;
            Employee_ApplicantReferees."E-Mail" := emailaddress;
            Employee_ApplicantReferees.Relationship := relationship;
            Employee_ApplicantReferees."Years Known" := periodknown;
            if not Employee_ApplicantReferees.Modify(true) then begin
                Error('Referee etails could not be updated, kindly try again!');
            end;
        end else begin
            Error('Kindly ensure you select an existing Referee to edit');
        end;
    end;



    procedure FnApplicationCandidateReferees(appplicantNumber: Text; JobApplicationNo: Text; refereetype: Integer; title: Text; surname: Text; firtsname: Text; otherNames: Text; contactdesignations: Text; emailaddress: Text; phonenumber: Text; relationship: Text; country: Text; periodknown: Integer; institution: Text)
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationReferees: Record "Application Referees";
    begin
        ApplicationReferees.Init;
        ApplicationReferees."Candidate No." := appplicantNumber;
        ApplicationReferees."Application No." := JobApplicationNo;
        ApplicationReferees."Rererence Type" := refereetype;
        ApplicationReferees."E-Mail" := emailaddress;
        ApplicationReferees.Relationship := relationship;
        ApplicationReferees.Name := surname + ' ' + firtsname + ' ' + otherNames;
        ApplicationReferees."Designation/Title" := contactdesignations;
        ApplicationReferees.Institution := institution;
        ApplicationReferees."Phone No." := phonenumber;
        ApplicationReferees."Country/Region Code" := country;
        ApplicationReferees."Years Known" := periodknown;
        if not ApplicationReferees.Insert(true) then begin
            Error('Referees could not be submitted,Kindly try again!')
        end;
    end;

    procedure FnCandidateHobbies(appplicantNumber: Text; hobbyCategory: Integer; description: Text)
    begin

        Applicant_EmployeeHobby.Init;
        Applicant_EmployeeHobby."Candidate No." := appplicantNumber;
        Applicant_EmployeeHobby."Hobby Category" := hobbyCategory;
        Applicant_EmployeeHobby.Description := description;
        if not Applicant_EmployeeHobby.Insert(true) then begin
            Error('Hobbies could not be submitted,Kindly try again!')
        end;
    end;

    procedure FnDeleteCandidateHobbies(EntryNumber: Integer; CandidateNumber: Code[100])
    begin

        Applicant_EmployeeHobby.Reset;
        Applicant_EmployeeHobby.SetRange("Candidate No.", CandidateNumber);
        Applicant_EmployeeHobby.SetRange("Line No.", EntryNumber);
        if Applicant_EmployeeHobby.FindSet then begin
            if not Applicant_EmployeeHobby.Delete(true) then begin
                Error('Your  Details were not successfully Deleted,Kindly try again!');
            end;
        end;
    end;

    procedure FnUpdateCandidateHobbies(entryNo: Integer; appplicantNumber: Text; hobbyCategory: Integer; description: Text)
    begin
        Applicant_EmployeeHobby.Reset();
        Applicant_EmployeeHobby.SetRange("Candidate No.", appplicantNumber);
        Applicant_EmployeeHobby.SetRange("Line No.", entryNo);
        if Applicant_EmployeeHobby.FindSet(true) then begin
            Applicant_EmployeeHobby."Hobby Category" := hobbyCategory;
            Applicant_EmployeeHobby.Description := description;
            if not Applicant_EmployeeHobby.Modify(true) then begin
                Error('Hobbies details could not be updated, kindly try again!');
            end;
        end;
    end;

    procedure FnApplicationHobbies(applicantNumber: Text; applicationNumber: Code[50]; hobbyCategory: Integer; description: Text)
    begin
        ApplicationHobby.Init;
        ApplicationHobby."Candidate No." := applicantNumber;
        ApplicationHobby."Hobby Category" := hobbyCategory;
        ApplicationHobby.Description := description;
        ApplicationHobby."Application No." := applicationNumber;
        if not ApplicationHobby.Insert(true) then begin
            Error('Hobbies could not be submitted,Kindly try again!')
        end;
    end;

    procedure FnDeleteApplicationHobbies(applicationNumber: Code[50]; entryNumber: Integer; candidateNumber: Code[100])
    begin

        ApplicationHobby.Reset;
        ApplicationHobby.SetRange("Candidate No.", CandidateNumber);
        ApplicationHobby.SetRange("Application No.", applicationNumber);
        ApplicationHobby.SetRange("Line No.", EntryNumber);
        if ApplicationHobby.FindSet then begin
            if not ApplicationHobby.Delete(true) then begin
                Error('Your  Details were not successfully Deleted,Kindly try again!');
            end;
        end;
    end;

    procedure FnJobApplication(ApplicantNumber: Text; VacancyId: Text): Text
    var
        Applicant: Record Applicant;
        JobApplications: Record "Job Applications";
        applicationNumber: Text;
    begin
        Applicant.Reset();
        Applicant.SetRange("Candidate No.", ApplicantNumber);
        Applicant.SetRange("Profile Completed", true);

        if not Applicant.FindFirst then
            Error('Candidate profile was not successfully completed');

        JobApplications.Reset();
        JobApplications.SetRange("Vacancy Id", VacancyId);
        JobApplications.SetRange("Candidate No.", ApplicantNumber);

        if JobApplications.FindFirst then begin
            JobApplications."Candidate No." := ApplicantNumber;
            JobApplications.Validate("Candidate No.");
            JobApplications."Vacancy Id" := VacancyId;
            JobApplications.Validate("Vacancy Id");
            if not JobApplications.Modify(true) then
                Error('Failed to update job application');

            FnPrepopulateApplicantProfile(ApplicantNumber, JobApplications."Application No.", VacancyId);
            applicationNumber := JobApplications."Application No.";
        end else begin
            JobApplications.Init();
            JobApplications."Application No." := '';
            JobApplications."Candidate No." := ApplicantNumber;
            JobApplications.Validate("Candidate No.");
            JobApplications."Vacancy Id" := VacancyId;
            JobApplications.Validate("Vacancy Id");


            if not JobApplications.Insert(true) then
                Error('Failed to create job application.');

            FnPrepopulateApplicantProfile(ApplicantNumber, JobApplications."Application No.", VacancyId);
            applicationNumber := JobApplications."Application No.";
            DocAttachment.Reset;
            DocAttachment.SetRange("No.", applicationNumber);
            if not DocAttachment.FindSet then begin
                DocAttachment.Reset;
                DocAttachment.SetRange("No.", ApplicantNumber);
                if DocAttachment.FindSet() then begin
                    repeat
                        DocAttachment."Table ID" := 69646;
                        DocAttachment."File Name" := DocAttachment."File Name";
                        DocAttachment."Line No." := 10000;
                        DocAttachment."No." := applicationNumber;
                        DocAttachment."File Extension" := DocAttachment."File Extension";
                        DocAttachment."Attached Date" := DocAttachment."Attached Date";
                    until DocAttachment.Next = 0;
                end;
            end;
        end;

        exit(applicationNumber);
    end;



    procedure FnPrepopulateApplicantProfile(CandindateNo: Code[50]; ApplicationNo: Code[50]; VacancyId: Code[50])
    var
        Applicant: Record Applicant;
        JobApplicantsQualification: Record "Job Applicants Qualification";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationQualification: Record "Application Qualification";
        ApplicationReferees: Record "Application Referees";
        ApplicationReferees1: Record "Application Referees";
        RecruitmentReqRequirement: Record "Recruitment Req Requirement";
        JobApplicationRequirements: Record "Job Application Requirements";
        JobApplicationRequirements1: Record "Job Application Requirements";
        VacancyDeclaration: Record "Vacancy Declaration";
        ApplicationDeclaration: Record "Application Declaration";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandindateNo);
        if JobApplicantsQualification.FindSet then begin
            ApplicationQualification1.Reset;
            ApplicationQualification1.SetRange("Application No.", ApplicationNo);
            ApplicationQualification1.SetRange("Candidate No.", CandindateNo);
            if not ApplicationQualification1.FindSet then begin
                repeat
                    ApplicationQualification.Init;
                    ApplicationQualification."Line No." := JobApplicantsQualification."Line No.";
                    ApplicationQualification."Application No." := ApplicationNo;
                    ApplicationQualification."Candidate No." := CandindateNo;
                    ApplicationQualification."Qualification Code" := JobApplicantsQualification."Qualification Code";
                    ApplicationQualification."Qualification Category" := JobApplicantsQualification."Qualification Category";
                    ApplicationQualification."From Date" := JobApplicantsQualification."From Date";
                    ApplicationQualification."To Date" := JobApplicantsQualification."To Date";
                    ApplicationQualification.Type := JobApplicantsQualification.Type;
                    ApplicationQualification."Job Description/Designation" := JobApplicantsQualification."Job Description/Designation";
                    ApplicationQualification.Description := JobApplicantsQualification.Description;
                    ApplicationQualification."Institution/Company" := JobApplicantsQualification."Institution/Company";
                    ApplicationQualification."Course Grade" := JobApplicantsQualification."Course Grade";
                    ApplicationQualification."Applicant Status" := JobApplicantsQualification."Job Applicant Status";
                    ApplicationQualification."Expiration Date" := JobApplicantsQualification."Expiration Date";
                    ApplicationQualification.Specialization := JobApplicantsQualification."Specialized Domain Area";
                    ApplicationQualification."Specialized Domain Area" := JobApplicantsQualification."Specialized Domain Area";
                    ApplicationQualification."Education Level" := JobApplicantsQualification."Education Level";
                    ApplicationQualification.Country := JobApplicantsQualification.Country;
                    ApplicationQualification."Attained Score" := JobApplicantsQualification."Attained Score";
                    ApplicationQualification."Graduation Year" := JobApplicantsQualification."Graduation Year";
                    ApplicationQualification."Membership Registration No" := JobApplicantsQualification."Membership Registration No";
                    ApplicationQualification."Membership Type" := JobApplicantsQualification."Membership Type";
                    ApplicationQualification."Member Renewal Date" := JobApplicantsQualification."Member Renewal Date";
                    ApplicationQualification."Licensing Number" := JobApplicantsQualification."Licensing Number";
                    ApplicationQualification."Licensing Renewal Date" := JobApplicantsQualification."Licensing Renewal Date";
                    ApplicationQualification."Terms of Service" := JobApplicantsQualification."Terms of Service";
                    ApplicationQualification."Experience Years" := JobApplicantsQualification."Experience Years";
                    ApplicationQualification."Duties and Resposibilities" := JobApplicantsQualification."Duties and Resposibilities";
                    if not ApplicationQualification.Insert(true) then begin
                        Error('Applicant qualifications could not be populated!')
                    end;
                until JobApplicantsQualification.Next = 0;
            end else begin
                ApplicationQualification1.Reset;
                ApplicationQualification1.SetRange("Candidate No.", CandindateNo);
                ApplicationQualification1.SetRange("Application No.", ApplicationNo);
                if ApplicationQualification1.FindSet then begin
                    repeat
                        ApplicationQualification."Line No." := JobApplicantsQualification."Line No.";
                        ApplicationQualification."Application No." := ApplicationNo;
                        ApplicationQualification."Candidate No." := CandindateNo;
                        ApplicationQualification."Qualification Code" := JobApplicantsQualification."Qualification Code";
                        ApplicationQualification."Qualification Category" := JobApplicantsQualification."Qualification Category";
                        ApplicationQualification."From Date" := JobApplicantsQualification."From Date";
                        ApplicationQualification."To Date" := JobApplicantsQualification."To Date";
                        ApplicationQualification.Type := JobApplicantsQualification.Type;
                        ApplicationQualification.Description := JobApplicantsQualification.Description;
                        ApplicationQualification."Institution/Company" := JobApplicantsQualification."Institution/Company";
                        ApplicationQualification."Course Grade" := JobApplicantsQualification."Course Grade";
                        ApplicationQualification."Applicant Status" := JobApplicantsQualification."Job Applicant Status";
                        ApplicationQualification."Expiration Date" := JobApplicantsQualification."Expiration Date";
                        ApplicationQualification.Specialization := JobApplicantsQualification."Specialized Domain Area";
                        ApplicationQualification."Specialized Domain Area" := JobApplicantsQualification."Specialized Domain Area";
                        ApplicationQualification."Education Level" := JobApplicantsQualification."Education Level";
                        ApplicationQualification.Country := JobApplicantsQualification.Country;
                        ApplicationQualification."Attained Score" := JobApplicantsQualification."Attained Score";
                        ApplicationQualification."Graduation Year" := JobApplicantsQualification."Graduation Year";
                        ApplicationQualification."Member Renewal Date" := JobApplicantsQualification."Member Renewal Date";
                        ApplicationQualification."Licensing Number" := JobApplicantsQualification."Licensing Number";
                        ApplicationQualification."Licensing Renewal Date" := JobApplicantsQualification."Licensing Renewal Date";
                        ApplicationQualification."Terms of Service" := JobApplicantsQualification."Terms of Service";
                        ApplicationQualification."Experience Years" := JobApplicantsQualification."Experience Years";
                        ApplicationQualification."Duties and Resposibilities" := JobApplicantsQualification."Duties and Resposibilities";
                        if not ApplicationQualification.Modify(true) then begin
                            Error('Applicant qualifications could not be populated!')
                        end;
                    until JobApplicantsQualification.Next = 0;
                end;
            end;
            begin
                DeclarationSetup.Reset;
                DeclarationSetup.SetRange(Blocked, false);
                if DeclarationSetup.FindSet then begin
                    ApplicationDeclaration.Reset;
                    ApplicationDeclaration.SetRange("Application No.", ApplicationNo);
                    if not ApplicationDeclaration.FindSet then begin
                        repeat
                            ApplicationDeclaration.Init;
                            ApplicationDeclaration."Application No." := ApplicationNo;
                            ApplicationDeclaration."Declaration Statement" := DeclarationSetup."Declaration Statement";
                            if not ApplicationDeclaration.Insert(true) then begin
                                Error('The Applicant Declaration Details could not be populated');
                            end;
                        until ApplicationDeclaration.Next = 0;
                    end;
                end;
            end;
            begin

                begin
                    Employee_ApplicantReferees.Reset;
                    Employee_ApplicantReferees.SetRange("No.", CandindateNo);
                    if Employee_ApplicantReferees.FindSet then begin
                        ApplicationReferees.Reset;
                        ApplicationReferees.SetRange("Application No.", ApplicationNo);
                        ApplicationReferees.SetRange("Candidate No.", CandindateNo);
                        if not ApplicationReferees.FindSet then begin
                            repeat
                                ApplicationReferees1.Init;
                                ApplicationReferees1."Application No." := ApplicationNo;
                                ApplicationReferees1."Candidate No." := CandindateNo;
                                ApplicationReferees1.Relationship := Employee_ApplicantReferees.Relationship;
                                ApplicationReferees1."Line No." := Employee_ApplicantReferees."Line No.";
                                ApplicationReferees1."Rererence Type" := Employee_ApplicantReferees."Rererence Type";
                                ApplicationReferees1.Name := Employee_ApplicantReferees.Name;
                                ApplicationReferees1."Designation/Title" := Employee_ApplicantReferees."Designation/Title";
                                ApplicationReferees1.Institution := Employee_ApplicantReferees.Institution;
                                ApplicationReferees1.Address := Employee_ApplicantReferees.Address;
                                ApplicationReferees1."Address 2" := Employee_ApplicantReferees."Address 2";
                                ApplicationReferees1.City := Employee_ApplicantReferees.City;
                                ApplicationReferees1."Post Code" := Employee_ApplicantReferees."Post Code";
                                ApplicationReferees1."Country/Region Code" := Employee_ApplicantReferees."Country/Region Code";
                                ApplicationReferees1."Phone No." := Employee_ApplicantReferees."Phone No.";
                                ApplicationReferees1."E-Mail" := Employee_ApplicantReferees."E-Mail";
                                ApplicationReferees1."Years Known" := Employee_ApplicantReferees."Years Known";
                                if not ApplicationReferees1.Insert(true) then begin
                                    Error('The Applicant Referees could not be populated!')
                                end;
                            until Employee_ApplicantReferees.Next = 0;
                        end else begin
                            ApplicationReferees.Reset;
                            ApplicationReferees.SetRange("Application No.", ApplicationNo);
                            ApplicationReferees.SetRange("Candidate No.", CandindateNo);
                            if ApplicationReferees.FindSet then begin
                                repeat
                                    ApplicationReferees1.Init;
                                    ApplicationReferees1."Application No." := ApplicationNo;
                                    ApplicationReferees1."Candidate No." := CandindateNo;
                                    ApplicationReferees1."Line No." := Employee_ApplicantReferees."Line No.";
                                    ApplicationReferees1."Rererence Type" := Employee_ApplicantReferees."Rererence Type";
                                    ApplicationReferees1.Name := Employee_ApplicantReferees.Name;
                                    ApplicationReferees1."Designation/Title" := Employee_ApplicantReferees."Designation/Title";
                                    ApplicationReferees1.Institution := Employee_ApplicantReferees.Institution;
                                    ApplicationReferees1.Address := Employee_ApplicantReferees.Address;
                                    ApplicationReferees1."Address 2" := Employee_ApplicantReferees."Address 2";
                                    ApplicationReferees1.City := Employee_ApplicantReferees.City;
                                    ApplicationReferees1."Post Code" := Employee_ApplicantReferees."Post Code";
                                    ApplicationReferees1."Country/Region Code" := Employee_ApplicantReferees."Country/Region Code";
                                    ApplicationReferees1."Phone No." := Employee_ApplicantReferees."Phone No.";
                                    ApplicationReferees1."E-Mail" := Employee_ApplicantReferees."E-Mail";
                                    ApplicationReferees1."Years Known" := Employee_ApplicantReferees."Years Known";
                                    if not ApplicationReferees1.Modify(true) then begin
                                        Error('The Applicant Referees could not be populated!');
                                    end;
                                until Employee_ApplicantReferees.Next = 0;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;


    procedure FnSubmitApplication(ApplicantNumber: Code[100]; JobAppplicationNumber: Code[100])
    var
        JobApplications: Record "Job Applications";
        EmailMess: Text;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text[2047];
        Subject: Text[500];
    begin
        JobApplications.Reset;
        JobApplications.SetRange("Application No.", JobAppplicationNumber);
        JobApplications.SetRange("Candidate No.", ApplicantNumber);
        if JobApplications.FindSet then begin
            JobApplications.Validate("Candidate No.");
            JobApplications."Date Of Application" := CurrentDateTime;
            JobApplications.JobApplied := true;
            Body :=
    '<html>' +
    '<head>' +
    '<style>' +
    '  body { font-family: Arial, sans-serif; font-size: 14px; color: #333; line-height: 1.6; }' +
    '  .header { font-size: 16px; font-weight: bold; color: #0066cc; }' +
    '  .content { margin-top: 10px; }' +
    '  .footer { margin-top: 20px; font-size: 12px; color: #666; }' +
    '  a { color: #0066cc; text-decoration: none; }' +
    '</style>' +
    '</head>' +
    '<body>' +
    '<div class="header">Dear ' + JobApplications."First Name" + ' ' + JobApplications."Last Name" + ',</div>' +
    '<div class="content">' +
    'We are pleased to inform you that your application for the position of <b>' + JobApplications."Job Title/Designation" + '</b> has been received successfully.<br><br>' +
    'Your Job Application Number is <b>' + JobAppplicationNumber + '</b>.<br><br>' +
    'You will be contacted shortly with details regarding your interview. In the meantime, you can access the E-Recruitment Portal using the link below:<br><br>' +
    '<b><a href="http://192.168.1.87:7988/">E-Recruitment Portal</a></b>' +
    '</div>' +
    '<div class="footer">' +
    'Thank you for your interest in joining our team. If you have any questions, feel free to contact us.<br><br>' +
    'Best regards,<br>' +
    '<b>The Recruitment Team</b>' +
    '</div>' +
    '</body>' +
    '</html>';

            Subject := 'JOB VACANCY APPLICATION';
            EmailMessage.Create(JobApplications."E-Mail", Subject, Body, true);
            EmailMessage.AddAttachment('APPLICATION SUMMARY.pdf', 'PDF', GenerateApplicationReport(JobApplications."Application No."));
            Email.Send(EmailMessage, Enum::"Email Scenario"::"E-Recruitment");
            JobApplications.Modify(true);
        end else begin
            Error('The Job Application was not sent Successfully');
        end;
    end;

    procedure GenerateApplicationReport(documentNumber: Code[50]) BaseImage: Text
    var
        JobApplications: Record "Job Applications";
    begin
        TempBlob_lRec.CreateOutStream(OutStr, TEXTENCODING::UTF8);
        JobApplications.Reset;
        JobApplications.SetRange(JobApplications."Application No.", documentNumber);
        if JobApplications.FindSet() then begin
            RecRef.GetTable(JobApplications);
            Report.SaveAs(Report::"Application Summary", '', ReportFormat::Pdf, OutStr, RecRef);
            FileManagement_lCdu.BLOBExport(TempBlob_lRec, STRSUBSTNO('Application_Summury%1.Pdf', JobApplications."Application No."), TRUE);
            TempBlob_lRec.CreateInstream(InStr, TEXTENCODING::UTF8);
            BaseImage := Base64Convert.ToBase64(InStr);
            exit(BaseImage);
        end;
    end;

    procedure FnSubmitProfileApplication(ApplicantNumber: Code[100])
    var
        Applicant: Record Applicant;
    begin

        Applicant.Reset;
        Applicant.SetRange("Candidate No.", ApplicantNumber);
        if Applicant.FindSet then begin
            Applicant."Profile Completed" := true;
            Applicant.Modify(true);
        end else begin
            Error('The Candidate Profile has been Received Successfully');
        end;
    end;


    procedure FnChangeCandidatePassword(emailaddress: Text; passwordHash: Text[255]; passwordSalt: Text[255])
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        TempPasswordHash: Text[10000];
        TempPasswordSalt: Text[10000];
    begin
        DynasoftPortalUser.Reset();
        DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
        if DynasoftPortalUser.FindFirst() then begin
            DynasoftPortalUser."PasswordHash" := passwordHash;
            DynasoftPortalUser."PasswordSalt" := passwordSalt;
            DynasoftPortalUser."Change Password" := true;
            DynasoftPortalUser."Last Modified Date" := Today;
            if not DynasoftPortalUser.Modify(true) then
                Error('Your password could not be reset');
        end else
            Error('The specified Email Address does not exist');
    end;

    procedure SendAccountActivationLink(emailaddress: Text) status: Text
    var
        DynasoftPortalUser: Record "Dynasoft Portal User";
        SMTPMailSetup: Record "Email Account";
        Email2: Text;
        Body: Text;
        SMTP: Codeunit Mail;
        Contact: Record Contact;
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailaddress);
        if Contact.FindSet then begin
            SMTPMailSetup.Get;
            Email2 := SMTPMailSetup."Email Address";
            Body := 'CANDIDATE ACCOUNT ACTIVATION';
            //     SMTP.CreateMessage('CANDIDATE ACCOUNT ACTIVATION', Email2, emailaddress,
            //    'CANDIDATE ACCOUNT ACTIVATION',
            //    'Dear ' + Contact.Name + ',<br><br>' +
            //    'Your Account Creation Request has been successfully Received with Email Address<b>' + ' ' + Format(Contact."E-Mail") + ' ' + '</b> .Kindly Click on the Link Below to activate your Account<br>' +
            //    'Click on the Link to Activate your Account' + ' ' + '<b><a href="http://192.168.1.87:7988/">Click here to activate your Account</a></b><br>'
            //    + '<br>'
            //    + 'On Activation of the Account, You will Receive Login Credentials' + ' <b>'
            //  , true);
            //     SMTP.AddBCC(Email2);
            //     SMTP.AddBodyline('<br><br>Kind Regards,' + '<br><br>Human Resource <br><br>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<br>');
            //     SMTP.Send();
            Message('Notification successfully sent to %1', Contact."E-Mail");
        end;
    end;



    procedure FnCreateApplicantAccountRequest(emailaddress: Text)
    var
        PortalUSer: Record "Dynasoft Portal User";
        RandomDigit: Text[50];
        entryno: Integer;
        ApplicantProfile: Record Applicant;
        HumanResourcesSetup: Record "Human Resources Setup";
        Contact: Record Contact;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        IDD: Integer;
        idNumber: Integer;
    begin
        Contact.Reset;
        Contact.SetRange("E-Mail", emailaddress);
        if Contact.FindSet then begin
            HumanResourcesSetup.Get;
            ApplicantProfile.Reset;
            ApplicantProfile.SetRange("E-Mail", emailaddress);
            if not ApplicantProfile.FindSet then begin
                ApplicantProfile.Init;
                ApplicantProfile."Candidate No." := NoSeriesMgt.GetNextNo(HumanResourcesSetup."Candidate No.", Today, true);
                ApplicantProfile."Full Names" := Contact.Name;
                ApplicantProfile."E-Mail" := Contact."E-Mail";
                ApplicantProfile."Mobile Phone No." := Contact."Phone No.";
                ApplicantProfile."Phone No." := Contact."Phone No.";
                if Evaluate(idNumber, Contact."ID Number") then begin
                    ApplicantProfile."ID Number" := idNumber;
                end;
                ApplicantProfile."First Name" := Contact."First Name";
                ApplicantProfile."Middle Name" := Contact."Middle Name";
                ApplicantProfile."Last Name" := Contact.Surname;
                if Contact."Record Type" = Contact."Record Type"::Employee then
                    ApplicantProfile."Employee No" := Contact."Employee No";
                if ApplicantProfile.Insert(true) then begin
                    PortalUSer.Reset;
                    PortalUSer.SetRange("Authentication Email", emailaddress);
                    if not PortalUSer.FindSet then begin
                        PortalUSer.Init;
                        PortalUSer."User Name" := Contact.Name;
                        PortalUSer."Full Name" := Contact.Name;
                        PortalUSer."Authentication Email" := Contact."E-Mail";
                        PortalUSer."Mobile Phone No." := Contact."Phone No.";
                        PortalUSer.State := PortalUSer.State::Enabled;
                        PortalUSer."Record Type" := PortalUSer."record type"::"Job Applicant";
                        if Contact."Record Type" = Contact."Record Type"::Employee then
                            PortalUSer."Record Type" := PortalUSer."record type"::Employee;
                        PortalUSer."Record ID" := ApplicantProfile."Candidate No.";
                        PortalUSer."Password Value" := GenerateSecurePassword;
                        PortalUSer."Last Modified Date" := Today;
                        if not PortalUSer.Insert(true) then begin
                            Error('Your account has not beed been created, Contact support!');
                        end;
                    end;
                end;
            end;
        end;
    end;



    procedure FnSendEmaiNotificationOnApplicantRegRequest(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        // //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        SMTPMail_CU: Codeunit Mail;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[250];
        HRSetupNew: Record "Human Resources Setup";
    begin

        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;
        RequesterEmail := ApplicantRequest."E-Mail";
        RequesterName := ApplicantRequest.Name;
        Counter := Counter + 1;
        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
        SenderAddress := HRSetup."E-Mail";

        if HRSetupNew."HR E-mail Address" = '' then
            Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
        CustEmail := HRSetupNew."HR E-mail Address";
        CompanyDetails := 'HR Officer,' + '<br></br>' + CompInfo.Name + '<br></br>' + CompInfo.Address + '<br></br>' + CompInfo."Address 2" + '<br></br>' + CompInfo.City;
        SenderMessage := '<br>This is to notify you that there has been a request for Registration via e-Recruitment for your action</br>';
        SupplierDetails := 'Registration Request Reference No:' + ApplicantRequest."No." + '<br></br>' + 'Company Name:' + ApplicantRequest.Name + '<br></br>' +
        '</br>' + 'Primary Email:' + ApplicantRequest."E-Mail" + '<br></br>' +
        'Mobile Phone No:' + ApplicantRequest."Phone No." + '<br></br>';
        if CustEmail = '' then
            exit;

        //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
        emailhdr := 'Applicant e-Registration Request Reference No:' + ApplicantRequest."No.";

        // SMTPMail_CU.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
        // 'HR Officer,' + '<br></br>' + SenderMessage + SupplierDetails, true);

        // SMTPMail_CU.AddCC(RequesterEmail);

        //  SMTPMail_CU.AddBodyline(CompanyDetails);


        //   SMTPMail_CU.Send;
        SendingDate := Today;
        SendingTime := Time;

        Sleep(1000);
        Window.Close;
    end;



    procedure FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(ApplicantRequest: Record Contact)
    var
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        SMTPMail_CU: Codeunit Mail;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[250];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[250];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        HRSetupNew: Record "Human Resources Setup";
    begin
        //New Changes <<<

        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;

        RequesterEmail := ApplicantRequest."E-Mail";
        RequesterName := ApplicantRequest.Name;
        Counter := Counter + 1;

        if HRSetup."E-Mail" = '' then
            Error('Please Contact the IT Admin to specify the E-mail address ' +
                  'under Company Information Setup page');

        SenderAddress := HRSetup."E-Mail";


        if HRSetupNew."HR E-mail Address" = '' then
            Error('Please Contact the IT Admin to specify the HR Manager ' +
         'E-mail address under Human Resource Setup page');

        CustEmail := HRSetupNew."HR E-mail Address";

        CompanyDetails := 'Dear ' + ApplicantRequest.Name + '<br>';
        SenderMessage := 'Thank you for using our e-Recruitment Portal which has been established to provide you with ' +
                            'easy access to our online Recruitment services at Judiciary.' +
                          '<br>This email is to acknowledge that your request for registration as an applicant, ' +
                          'done on: ' + Format(ApplicantRequest."Last Date Modified") +
                          ' has been received and summarized as follows:' + '<br>' + '<br>';

        SupplierDetails := 'Registration Reference No:' + ApplicantRequest."No." + '<br>' +
                        'Full Names: </b>' + ApplicantRequest.Name + '<br>' +
                        'Primary Email Address:' + ApplicantRequest."E-Mail" + '<br>' +
                        'Mobile Phone No:' + ApplicantRequest."Phone No." + '<br>';

        if CustEmail = '' then exit;

        emailhdr := 'PPRA e-Recruitment Acknowledgment - [' + ApplicantRequest."No." + '])';

        //SMTPMail_CU.CreateMessage(SenderName,SenderAddress,Recipients,Subject,Body,HtmlFormatted)
        // SMTPMail_CU.CreateMessage(
        //                          CompInfo.Name,
        //                          SenderAddress,
        //                          RequesterEmail,
        //                          emailhdr,
        //                 CompanyDetails + '<br></br>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
        // //SMTPMail_CU.AddCC(RequesterEmail);
        // SMTPMail_CU.AddBodyline(ProcNote);
        // SMTPMail_CU.Send;
        // SendingDate := Today;
        // SendingTime := Time;
        Sleep(1000);
        //Window.CLOSE;
    end;



    procedure FnSendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record Contact)
    var
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //  //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        SMTPMail_CU: Codeunit Mail;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetupNew: Record "Human Resources Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        ApplicantDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
    begin
        //New Changes on formatting of email <<<

        CompInfo.Get;
        HRSetup.Get;
        HRSetupNew.Get;

        RequesterEmail := ApplicantRequest."E-Mail";
        RequesterName := ApplicantRequest.Name;

        Counter := Counter + 1;
        PortalUser.Reset;
        PortalUser.SetRange("Authentication Email", ApplicantRequest."E-Mail");
        if PortalUser.FindSet then Password := PortalUser."Password Value";

        if HRSetup."E-Mail" = '' then Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');

        SenderAddress := HRSetup."E-Mail";
        if HRSetupNew."HR E-mail Address" = '' then Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');

        CustEmail := HRSetupNew."HR E-mail Address";

        CompanyDetails := 'Dear,' + ApplicantRequest.Name + '<br>';

        SenderMessage := 'Please note that your applicant account has been created on our system with the following key registration details:<br> <br>';

        ApplicantDetails := '<br> Registration Request Reference No: ' + ApplicantRequest."No." +
                          '<br> Name: ' + ApplicantRequest.Name +
                          '<br> Mobile Phone No: ' + ApplicantRequest."Phone No.";
        CompInfo.get();
        LoginDetails := '<br> We have also created your portal access account with the following login credentials:' +
                          '<br>  User Name: ' + ApplicantRequest."E-Mail" +
                          '<br> <b> Password: ' + Password + '</b>' +
                          '<br> <br>To access our portal and complete your registration click on the link below to access the ' +
                          CompInfo.Name + ' E-Recruitment Portal and complete your Profile';

        ActivationDetails := '<br> Once you access our portal, you shall be able to complete the Confidential Applicant section ' +
                                 'of the registration that shall require you to provide the following information: </br>' +
                            '<br> 1. Personal Information' +
                            '<br> 2. Contact details' +
                            '<br> 3. Academic Qualifications' +
                            '<br> 4. Proffesional Qualifications' +
                            '<br> 5. Employment History' +
                            '<br> 6. Refferees' +
                            '<br> 7. Academic Qualification Attachments' +
                            '<br> <br><a href="' + HRSetupNew."E-Recruitment Portal Link" + '">E-Recruitment Portal Link</a></br>';
        if CustEmail = '' then exit;
        CompInfo.get();
        emailhdr := CompInfo.Name + ' e-Recruitment Account Activation - [' + ApplicantRequest."No." + '])';
        SMTPMail.Create(RequesterEmail, emailhdr, CompanyDetails + '<br></br>' + SenderMessage + ApplicantDetails + LoginDetails + ActivationDetails, true);
        Smail.Send(SMTPMail, Enum::"Email Scenario"::"E-Recruitment");

        SendingDate := Today;
        SendingTime := Time;

    end;


    procedure fnDeleteQualifications(EntryNumber: Integer; CandidateNumber: Code[100])
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
    begin

        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", CandidateNumber);
        JobApplicantsQualification.SetRange("Line No.", EntryNumber);
        if JobApplicantsQualification.FindSet then begin
            if not JobApplicantsQualification.Delete(true) then begin
                Error('Your  Details were not successfully Deleted,Kindly try again!');
            end;
        end;
    end;


    procedure FnDeleteRefereeDetails(EntryNumber: Integer; CandidateNumber: Code[100])
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        EmployeeApplicantReferees: Record "Employee_Applicant Referees";
    begin

        EmployeeApplicantReferees.Reset;
        EmployeeApplicantReferees.SetRange("No.", CandidateNumber);
        EmployeeApplicantReferees.SetRange("Line No.", EntryNumber);
        if EmployeeApplicantReferees.FindSet then begin
            if not EmployeeApplicantReferees.Delete(true) then begin
                Error('Your Referree Details was not successfully Deleted,Kindly try again!');
            end;
        end;
    end;


    procedure FnDeleteApplicationQualifications(EntryNumber: Integer; CandidateNumber: Code[100])
    var
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if not ApplicationQualification.Delete(true) then begin
                Error('Your qualifications details were not successfully Deleted,Kindly try again!');
            end;
        end;
    end;


    procedure FnDeleteJobProffesionalQualificationDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if not ApplicationQualification.Delete(true) then begin
                Error('Your Proffesional Qualifications Details was not successfully Deleted');
            end;
        end;

    end;


    procedure FnDeleteJobProffesionalBodiesDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicationQualification: Record "Application Qualification";
    begin
        ApplicationQualification.Reset;
        ApplicationQualification.SetRange("Candidate No.", CandidateNumber);
        ApplicationQualification.SetRange("Line No.", EntryNumber);
        if ApplicationQualification.FindSet then begin
            if not ApplicationQualification.Delete(true) then begin
                Error('Your Qualifications Details were not successfully Deleted');
            end;
        end;

    end;


    procedure FnCreateCandidateDocumentsLink(applicantNo: Code[50]; ApplicationNo: Code[50]; FileName: Text; FileLink: Text) status: Text
    var
        JobApplications: Record "Job Applications";
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            JobApplications.Reset;
            JobApplications."Application No." := ApplicationNo;
            JobApplications."Candidate No." := applicantNo;
            if JobApplications.Find('=') then
                RecordIDNumber := JobApplications.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;


    procedure FnDeleteJobApplicationRefereeDetails(EntryNumber: Integer; CandidateNumber: Code[100]) status: Text
    var
        ApplicantProfile: Record Contact;
        Contact: Record Contact;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        MarketingSetup: Record "Marketing Setup";
        JobApplicantsQualification: Record "Job Applicants Qualification";
        EmployeeApplicantReferees: Record "Employee_Applicant Referees";
        ApplicationReferees: Record "Application Referees";
    begin

        ApplicationReferees.Reset;
        ApplicationReferees.SetRange("Candidate No.", CandidateNumber);
        ApplicationReferees.SetRange("Line No.", EntryNumber);
        if ApplicationReferees.FindSet then begin
            if not ApplicationReferees.Delete(true) then begin
                Error('Your Referree Details was not successfully Deleted');
            end;
        end;

    end;


    procedure FnGenerateJobApplicantReport(CandidateNo: Code[20]; JobApplicantNumber: Code[20]) status: Text
    var
        JobApplications: Record "Job Applications";
    begin

        JobApplications.Reset;
        JobApplications.SetRange("Application No.", JobApplicantNumber);
        JobApplications.SetRange("Candidate No.", CandidateNo);
        if JobApplications.FindSet then begin
            // if FILE.Exists(FILESPATH2 + JobApplicantNumber + '.pdf') then
            //     FILE.Erase(FILESPATH2 + JobApplicantNumber + '.pdf');
            // Report.SaveAsPdf(69608, FILESPATH2 + JobApplicantNumber + '.pdf', JobApplications);
            status := 'success*Generated*Downloads\JobApplicants\' + JobApplicantNumber + '.pdf';

        end else begin
            status := 'danger*The Report Could not be generated';
        end
    end;


    procedure FnCreateApplicantDocumentsLink(applicantNo: Code[50]; FileName: Text; FileLink: Text) status: Text
    var
        Applicant: Record Applicant;
        DocumentAttachment: Record "Document Attachment";
        RecordLink: Record "Record Link";
    begin
        // Record Links Attachment on the Applications -Obadiah Korir
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := FileLink;
            RecordLink.Description := FileName;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Applicant.Reset;
            Applicant."Candidate No." := applicantNo;
            //JobApplications."Candidate No.":=applicantNo;
            if Applicant.Find('=') then
                RecordIDNumber := Applicant.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;


    procedure AcceptJobOffer(ApplicantNo: Text; Comments: Text; OfferID: Text)
    var
        EmploymentOffer: Record "Employment Offer";
    begin
        EmploymentOffer.reset;
        EmploymentOffer.SetRange("Offer ID", OfferID);
        if EmploymentOffer.find('-') then begin
            EmploymentOffer."Candidate Response Date" := Today;
            EmploymentOffer."Candidate Response" := Comments;
            EmploymentOffer."Offer Acceptance Status" := EmploymentOffer."Offer Acceptance Status"::Accepted;
            EmploymentOffer.Modify();
        end;

    end;


    procedure RejectJobOffer(ApplicantNo: Text; Comments: Text; OfferID: Text)
    var
        EmploymentOffer: Record "Employment Offer";
    begin
        EmploymentOffer.reset;
        EmploymentOffer.SetRange("Offer ID", OfferID);
        if EmploymentOffer.find('-') then begin
            EmploymentOffer."Candidate Response Date" := Today;
            EmploymentOffer."Candidate Response" := Comments;
            EmploymentOffer."Offer Acceptance Status" := EmploymentOffer."Offer Acceptance Status"::Rejected;
            EmploymentOffer.Modify();
        end;
    end;

    procedure addFileLinks(recordType: Text[100]; recordNo: Code[50]; filename: Text; base64File: Text; extensionType: Text)
    begin
        case recordType of
            'Candidate':
                fnConvertFile(base64File, extensionType, 69649, filename, recordNo, 1);
            'Application':
                fnConvertFile(base64File, extensionType, 69646, filename, recordNo, 2);
            else
                Error('Invalid Record Type');
        end;
    end;

    procedure fnConvertFile(base64File: Text; extensionType: Text; tableId: Integer; fileName: Text; recordNo: Code[30]; documentType: Integer)
    var
        tbl_documentAttachments: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        fileInstream: InStream;
        fileOutstream: OutStream;
        fileId: Guid;
        Base64Convert: Codeunit "Base64 Convert";
    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.Init();
        tbl_documentAttachments."Table ID" := tableId;
        tbl_documentAttachments."File Name" := fileName;
        tbl_documentAttachments."Line No." := 10000;
        tbl_documentAttachments."No." := recordNo;
        tbl_documentAttachments."File Extension" := extensionType;

        case lowercase(extensionType) of
            'pdf':
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::PDF;
            'docx':
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Word;
            'xlsx':
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Excel;
            'png', 'jpeg', 'jpg':
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Image;
            else
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Other;
        end;

        TempBlob.CreateOutStream(fileOutstream);
        Base64Convert.FromBase64(base64File, fileOutstream);

        TempBlob.CreateInStream(fileInstream);

        tbl_documentAttachments."Document Reference ID".ImportStream(fileInstream, fileName, '');

        if not tbl_documentAttachments.Insert(true) then begin
            Error('An error occurred while creating a document link. Please contact the administrator if this error persists.');
        end;
    end;




    procedure DeleteAttachment(DocNo: Code[20]; TableID: Integer)
    var
        DocAttachment: Record "Document Attachment";
    begin
        DocAttachment.Reset();
        DocAttachment.SetRange("Table ID", TableID);
        DocAttachment.SetRange("No.", DocNo);
        // DocAttachment.SetRange(ID, DocID);
        if DocAttachment.Find('-') then begin
            if DocAttachment."Document Reference ID".HasValue then begin
                Clear(DocAttachment."Document Reference ID");
                DocAttachment.Modify(true);
            end;
            DocAttachment.Delete(true);
        end;
    end;

    procedure GetDocumentAttachment(tableId: Integer; No: Code[20]; RecID: Integer) BaseImage: Text
    var
        IStream: InStream;
        //Bytes: dotnet Array;
        //Convert: dotnet Convert;
        // MemoryStream: dotnet MemoryStream;
        TenantMedia: Record "Tenant Media";
        imageID: GUID;
        docAttachment: Record "Document Attachment";
    begin
        docAttachment.Reset();
        docAttachment.SetRange("Table ID", tableId);
        docAttachment.SetRange("No.", No);
        docAttachment.SetRange(ID, RecID);
        if docAttachment.find('-') then begin
            if docAttachment."Document Reference ID".Hasvalue then begin
                imageID := docAttachment."Document Reference ID".MediaId;
                IF TenantMedia.GET(imageID) THEN BEGIN
                    TenantMedia.CALCFIELDS(Content);
                    TenantMedia.Content.CreateInstream(IStream);
                    // MemoryStream := MemoryStream.MemoryStream();
                    // CopyStream(MemoryStream, IStream);
                    // Bytes := MemoryStream.GetBuffer();
                    // BaseImage := Convert.ToBase64String(Bytes);
                END;
            end;
        end;
    end;

    procedure AcceptDeclaration(applicationNumber: Code[50]; userChoice: Boolean; lineNo: Integer)
    begin
        ApplicationDeclaration.Reset;
        ApplicationDeclaration.SetRange("Application No.", applicationNumber);
        ApplicationDeclaration.SetRange("Line No.", lineNo);
        if ApplicationDeclaration.FindFirst() then begin
            ApplicationDeclaration."Candidate Accepted" := userChoice;
            if not ApplicationDeclaration.Modify(true) then begin
                Error('The Applicant Declaration Details could not be modified');
            end;
        end;
    end;
}

