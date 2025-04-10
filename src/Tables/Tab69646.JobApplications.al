
table 69646 "Job Applications"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Candidate No."; Code[20])
        {
            Caption = 'Candidate No.';
            TableRelation = Applicant;

            trigger OnValidate()
            begin
                if Applicant.Get("Candidate No.") then begin
                    // Basic information
                    "First Name" := Applicant."First Name";
                    "Middle Name" := Applicant."Middle Name";
                    "Last Name" := Applicant."Last Name";
                    "Full Names" := Applicant."Full Names";
                    "Preferred Title" := Applicant."Preferred Title";

                    // Contact information
                    "E-Mail" := Applicant."E-Mail";
                    Address := Applicant.Address;
                    "Address 2" := Applicant."Address 2";
                    City := Applicant.City;
                    "Post Code" := Applicant."Post Code";
                    "Country/Region Code" := Applicant."Country/Region Code";
                    "Mobile Phone No." := Applicant."Mobile Phone No.";
                    "Phone No." := Applicant."Phone No.";
                    "Alternative Contact Person" := Applicant."Alternative Contact Person";
                    "Alternative Contact Phone" := Applicant."Alternative Contact Phone";

                    // Personal information
                    Gender := Applicant.Gender;
                    "Birth Date" := Applicant."Birth Date";
                    "ID Number" := Applicant."ID Number";
                    "Passport No." := Applicant."Passport No.";
                    "Marital Status" := Applicant."Marital Status";
                    Religion := Applicant.Religion;
                    "Ethnic Group" := Applicant."Ethnic Group";
                    Nationality := Applicant.Nationality;

                    // Location information
                    "County of Birth" := Applicant."County of Birth";
                    "County of Origin" := Applicant."County of Origin";
                    "County of Origin Name" := Applicant."County of Origin Name";
                    "Sub County" := Applicant."Sub County";
                    Constituency := Applicant.Constituency;
                    Ward := Applicant.Ward;
                    "Ward Name" := Applicant."Ward Name";
                    Village := Applicant.Village;
                    "Village Name" := Applicant."Village Name";

                    // Identification numbers
                    "Social Security No." := Applicant."Social Security No.";
                    "SHA No." := Applicant."SHA No.";
                    "KRA PIN NO." := Applicant."KRA PIN NO.";

                    // Disability information
                    Disabled := Applicant.Disabled;
                    "Disability Code" := Applicant."Disability Code";
                    "Disability Description" := Applicant."Disability Description";
                    "Disability Certificate No" := Applicant."Disability Certificate No";
                    "Is Impaired" := Applicant."Is Impaired";
                    "Impairment Details" := Applicant."Impairment Details";

                    // Education & Experience
                    "Highest Academic Qualification" := Applicant."Highest Academic Qualification";
                    "Qualification Name" := Applicant."Qualification Name";
                    "Work Experience (Years)" := Applicant."Work Experience (Years)";
                    "Management Experience (Years)" := Applicant."Management Experience (Years)";
                    "Specialization Area" := Applicant."Specialization Area";
                    "Professional Summary" := Applicant."Skills & Competences";
                    "Proficient Languages" := Applicant."Proficient Languages";

                    // Employment information
                    "Current Employment Status" := Applicant."Current Employment Status";
                    "Employer Name" := Applicant."Employer Name";
                    Station := Applicant.Station;
                    "Personal No." := Applicant."Personal No.";
                    "Present Substantive Post" := Applicant."Present Substantive Post";
                    "Job Grade" := Applicant."Job Grade";
                    "Employee No." := Applicant."Employee No";
                    "Terms Of Service" := Applicant."Terms Of Service";
                    "Date of Current Appointment" := Applicant."Date of Current Appointment";
                    "Date of Previous Appointment" := Applicant."Date of Previous Appointment";
                    "Upgraded Post" := Applicant."Upgraded Post";

                    // Secondment information
                    "Secondment Organization" := Applicant."Secondment Organization";
                    "Secondment Designation" := Applicant."Secondment Designation";
                    "Secondment Job Group" := Applicant."Secondment Job Group";

                    // Salary information
                    "Gross Salary" := Applicant."Gross Salary";

                    // Additional information
                    "Is Tax Compliant" := Applicant."Is Tax Compliant";
                    "Has Helb Loan" := Applicant."Has Helb Loan";
                    "Convicted/On Probation" := Applicant."Convicted/On Probation";
                    "Has On-going Investigation" := Applicant."Has On-going Investigation";
                    "Investigation Details" := Applicant."Investigation Details";
                    "Investigation Date" := Applicant."Investigation Date";
                    "Dismissed from Employment" := Applicant."Dismissed from Employment";
                    "Appointment Availability Date" := Applicant."Appointment Availability Date";
                    "Has Voilated Laws" := Applicant."Has Voilated Laws";
                    "Charge Details" := Applicant."Charge Details";
                    "Relatives In PPRA" := Applicant."Relatives In PPRA";
                    "Name & Relationship" := Applicant."Name & Relationship";
                end;
            end;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; "Full Names"; Text[200])
        {
            Caption = 'Initials';
        }
        field(6; "Employee No."; Code[30])
        {
        }
        field(7; "Professional Summary"; Text[350])
        {
        }
        field(8; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(9; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(11; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; "County of Birth"; Text[30])
        {
            Caption = 'County';
        }
        field(13; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(14; "Mobile Phone No."; Text[15])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(15; "E-Mail"; Text[70])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(16; Picture; Media)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
        }
        field(17; "Birth Date"; Date)
        {
            Caption = 'Birth Date';
        }
        field(18; Gender; Option)
        {
            Caption = 'Gender';
            OptionCaption = ' ,Male,Female,Both';
            OptionMembers = " ",Male,Female,Both;
        }
        field(19; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", "County of Birth", Nationality, xRec.Nationality);
            end;
        }
        field(20; "ID Number"; Integer)
        {
        }
        field(21; "Passport No."; Code[30])
        {
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
            end;
        }
        field(22; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(23; Religion; Code[20])
        {
        }
        field(24; "Ethnic Group"; Code[30])
        {
            // TableRelation = "Ethnic Background";
            TableRelation = "Ethnic Groups1".Code;
        }
        field(25; Nationality; Code[30])
        {
        }
        field(26; "Specialization Area"; Code[30])
        {
            TableRelation = "Domain Area";
        }
        field(27; "Highest Academic Qualification"; Code[30])
        {
            TableRelation = "Application Qualification"."Qualification Code" where("Qualification Category" = filter(Academic),
                                                                                    "Application No." = field("Application No."));

            trigger OnValidate()
            begin
                if Qualification.Get("Highest Academic Qualification") then
                    "Qualification Name" := Qualification.Description;
            end;
        }
        field(28; "Qualification Name"; Text[100])
        {
        }
        field(29; "Work Experience (Years)"; Integer)
        {
        }
        field(30; "Management Experience (Years)"; Integer)
        {
        }
        field(31; "Disability Code"; Code[30])
        {
            TableRelation = "Disability Code";
        }
        field(32; Disabled; Boolean)
        {
        }
        field(33; "Disability Description"; Text[30])
        {
        }
        field(34; "Disability Certificate No"; Code[30])
        {
        }
        field(35; "Position Id"; Code[30])
        {
            Caption = 'Position Code';
            TableRelation = "Recruitment Planning Line"."Position ID";
        }
        field(36; "Job Title/Designation"; Text[50])
        {
        }
        field(37; "Duty Station ID"; Code[30])
        {
            Caption = 'Cost center';
            TableRelation = "Duty Station";
        }
        field(38; "Work Location Details"; Text[300])
        {
        }
        field(39; "No. of Openings"; Integer)
        {
        }
        field(40; "Target Candidate Source"; Option)
        {
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(41; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(42; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(43; "Region ID"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(44; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(45; "Terms of Service Code"; Code[30])
        {
        }
        field(46; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(47; "Vacancy Id"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header";

            trigger OnValidate()
            begin
                if RecruitmentRequisition.Get("Vacancy Id") then begin
                    "Position Id" := RecruitmentRequisition."Position ID";
                    "Terms of Service Code" := RecruitmentRequisition."Default Terms of Service Code";
                    "Work Location Details" := RecruitmentRequisition."Work Location Details";
                    "Seniority Level" := RecruitmentRequisition."Seniority Level";
                    "Employment Type" := RecruitmentRequisition."Seniority Level";
                    "Region ID" := RecruitmentRequisition.Region;
                    Department := RecruitmentRequisition.Department;
                    Directorate := RecruitmentRequisition.Directorate;
                    "Job Title/Designation" := RecruitmentRequisition."Job Title/Designation";
                    "Target Candidate Source" := RecruitmentRequisition."Target Candidate Source";
                    "No. of Openings" := RecruitmentRequisition."No of Openings";
                    "Position Category" := RecruitmentRequisition."Position Category";
                end
            end;
        }
        field(48; "Application No."; Code[30])
        {
        }
        field(49; "Application Status"; Option)
        {
            OptionCaption = 'Open,System Shortlisting,Oral Interview,Written Interview,Closed';
            OptionMembers = Open,"System Shortlisting","Oral Interview","Written Interview",Closed;
        }
        field(50; "No. Series"; Code[30])
        {
        }
        field(51; "PIN Registration"; Code[20])
        {
        }
        field(52; "Applications Closing Date"; Date)
        {
        }
        field(53; "Applications Closing Time"; Time)
        {
        }
        field(54; "Pre-Screening Template ID"; Code[30])
        {
        }
        field(55; "Current Employment Status"; Option)
        {
            OptionCaption = 'Public Service,Private Sector,Unemployed';
            OptionMembers = "Public Service","Private Sector",Unemployed;
        }
        field(56; "Employer Name"; Text[150])
        {
        }
        field(57; Station; Text[150])
        {
        }
        field(58; "Personal No."; Code[50])
        {
        }
        field(59; "Present Substantive Post"; Text[150])
        {
        }
        field(60; "Job Grade"; Text[150])
        {
        }
        field(61; "Secondment Organization"; Text[150])
        {
        }
        field(62; "Secondment Designation"; Text[150])
        {
        }
        field(63; "Secondment Job Group"; Text[50])
        {
        }
        field(64; "Gross Salary"; Integer)
        {
        }
        field(65; "Background Checks Pass"; Boolean)
        {
        }
        field(66; "Referee Checks Pass"; Boolean)
        {
        }
        field(67; "Medical Checks Pass"; Boolean)
        {
        }
        field(68; "Position Category"; Option)
        {
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
        field(69; "Passed County of Origin"; Boolean)
        {
        }
        field(70; "Passed Date of Birth"; Boolean)
        {
        }
        field(71; "Passed Ethnicity"; Boolean)
        {
        }
        field(72; "Passed Gender"; Boolean)
        {
        }
        field(73; "Passed Minimum Academic"; Boolean)
        {
        }
        field(74; "Passed Minimum Mngt Exp"; Boolean)
        {
        }
        field(75; "Passed Minimum Work Exp"; Boolean)
        {
        }
        field(76; "Passed PWD"; Boolean)
        {
        }
        //Shortlisted 
        field(77; Shortlisted; Boolean)
        {
        }
        field(78; "Shorlisting Document No."; Code[30])
        {
            TableRelation = "Candidate Selection Header"."Document No.";
        }
        field(79; "Shortlisting Outcome"; Option)
        {
            OptionCaption = ' ,Non-Responsive,Invite for First Interview';
            OptionMembers = " ","Non-Responsive","Invite for First Interview";
        }
        field(80; "Committee Remarks"; Text[300])
        {
        }
        field(81; "Attended Interview"; Boolean)
        {
        }
        field(82; University; Code[20])
        {
            Caption = 'University';
        }
        field(83; "Preffered Station 1"; Code[20])
        {
            Caption = 'Preffered Station 1';
        }
        field(84; "Preffered Station 2"; Code[20])
        {
            Caption = 'Preffered Station 2';
        }
        field(85; "Preffered Station 3"; Code[20])
        {
            Caption = 'Preffered Station 3';
        }
        field(86; "Date Of Application"; DateTime)
        {
            Caption = 'Date of candidate submitting application';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(87; "JobApplied"; Boolean)
        {
        }
        field(88; "Social Security No."; Text[50])
        {
            Caption = 'NSSF No.';
        }
        field(89; "SHA No."; Text[50])
        {
            Caption = 'SHIF No.';
        }
        field(90; "KRA PIN NO."; Code[50])
        {
        }
        field(91; "County of Origin"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = County.Code;

            // trigger OnValidate()
            // var
            //     Countys: Record County;
            // begin
            //     if Countys.Get("County of Origin") then begin

            //         "County of Origin Name" := Countys.Description;
            //     end;
            // end;
        }
        field(92; "County of Origin Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(County.Description where(Code = field("County of Origin")));
            Editable = false;
        }

        field(93; "Sub County"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sub County".Code where(County = field("County of Origin"));
        }
        field(94; Constituency; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(95; "Alternative Contact Person"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(96; "Alternative Contact Phone"; Text[100])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(97; "Preferred Title"; Option)
        {
            OptionCaption = ',Prof,Dr,Mr.,Mrs.,Ms,Rev';
            OptionMembers = ,Prof,Dr,Mr,Mrs,Ms,Rev;
        }
        field(98; "Basic Salary"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(99; "House Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Other Remunerative Allowances"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(101; Gross; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(102; "Airtime Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(103; "Leave Travel Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(104; "Is Tax Compliant"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Has Helb Loan"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(106; "Convicted/On Probation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(107; "Has On-going Investigation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(108; "Investigation Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(109; "Dismissed from Employment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(110; "Is Impaired"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(111; "Impairment Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(112; "Appointment Availability Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(113; "Has Voilated Laws"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(114; "Charge Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(115; "Investigation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(116; "Proficient Languages"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(117; "Relatives In PPRA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(118; "Name & Relationship"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(119; "Terms Of Service"; Option)
        {
            OptionCaption = ',Permanent and Pensionable,Contract';
            OptionMembers = "","Permanent and Pensionable","Contract";
        }
        field(120; "Date of Current Appointment"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(121; "Upgraded Post"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(122; "Date of Previous Appointment"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(123; Ward; Code[20])
        {
            TableRelation = Ward.Code where(County = field("County of Origin"), "Sub County" = field("Sub County"));
            DataClassification = ToBeClassified;
        }
        field(124; Village; Code[20])
        {
            TableRelation = Village.Code where(County = field("County of Origin"), "Sub County" = field("Sub County"), Ward = field(Ward));
            DataClassification = ToBeClassified;
        }
        field(125; "Sub County Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sub County".Name where(Code = field("Sub County")));
            Editable = false;
        }
        field(126; "Ward Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Ward.Name where(Code = field(Ward)));
            Editable = false;
        }
        field(127; "Village Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Village.Name where(Code = field(Village)));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Job Application Nos");
        if "Application No." = '' then
            NoSeriesMgt.InitSeries(HumanResourcesSetup."Job Application Nos", xRec."No. Series", 0D, "Application No.", "No. Series");
    end;

    var
        PostCode: Record "Post Code";
        RecruitmentRequisition: Record "Recruitment Requisition Header";
        Applicant: Record Applicant;
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Qualification: Record Qualification;
}

