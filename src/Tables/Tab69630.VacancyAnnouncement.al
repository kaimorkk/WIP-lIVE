
table 69630 "Vacancy Announcement"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Announcement No."; Code[30])
        {
        }
        field(2; "Posting Type"; Option)
        {
            OptionCaption = 'Recruitment Agency Posting,Direct Hire Announcement,Career Fair';
            OptionMembers = "Recruitment Agency Posting","Direct Hire Announcement","Career Fair";
        }
        field(3; "Recruitment Agency No."; Code[30])
        {
            TableRelation = "Recruitment Agency";

            trigger OnValidate()
            begin
                if RecruitmentAgency.Get("Recruitment Agency No.") then
                    "Agency Name" := RecruitmentAgency.Name;
            end;
        }
        field(4; "Agency Name"; Text[50])
        {
            Editable = false;
        }
        field(5; "Actual Recruiter Fees"; Decimal)
        {
            CalcFormula = sum("Vacancy Announcement Line"."Actual Recruiter Fees" where("Announcement No." = field("Announcement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Career Fair Venue"; Text[50])
        {
        }
        field(7; "Career Fair Date"; Date)
        {
        }
        field(8; "Career Fair Start Time"; Date)
        {
        }
        field(9; "Career Fair End Time"; Time)
        {
        }
        field(10; "No. of Participants"; Integer)
        {
            CalcFormula = count("Career Fair Attendance" where("Career Fair ID" = field("Announcement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Document Date"; Date)
        {
            Editable = false;
        }
        field(12; "HR Officer User ID"; Code[30])
        {
            Editable = false;
        }
        field(13; "HR Officer Staff No."; Code[30])
        {
            Editable = false;
            TableRelation = Employee;
        }
        field(14; "Staff Name"; Text[50])
        {
            Editable = false;
        }
        field(15; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(16; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(17; Region; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(18; "Financial Year Code"; Code[30])
        {
            TableRelation = "Financial Year Code";
            Caption = 'Financial Year';
        }
        field(19; "Date Published"; Date)
        {
        }
        field(20; "Application Closing Date"; Date)
        {
        }
        field(21; "Application Closing  Time"; Time)
        {
        }
        field(22; "No. of Job Vacancies"; Integer)
        {
            CalcFormula = count("Vacancy Announcement Line" where("Announcement No." = field("Announcement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Advertisement Cost"; Decimal)
        {
            CalcFormula = sum("Vacancy Announcement Line"."Advertisement Line Cost" where("Announcement No." = field("Announcement No.")));
            Caption = 'Total Actual Advertisement Cost (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(25; "Created On"; Date)
        {
            Editable = false;
        }
        field(26; "Created Time"; Time)
        {
            Editable = false;
        }
        field(27; "Organization Name"; Text[50])
        {
            Description = '//get from 79';
        }
        field(28; "Organization Overview"; Text[300])
        {
        }
        field(29; Address; Text[50])
        {
        }
        field(30; "Address 2"; Text[50])
        {
        }
        field(31; City; Code[50])
        {
        }
        field(32; "Post Code"; Code[50])
        {
        }
        field(33; "Country/Region Code"; Code[50])
        {
        }
        field(34; "Phone No."; Text[50])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(35; Contact; Code[50])
        {
        }
        field(36; Email; Text[50])
        {
            ExtendedDatatype = EMail;
        }
        field(37; "Home Page"; Text[50])
        {
            ExtendedDatatype = URL;
        }
        field(38; "No. Series"; Code[10])
        {
        }
        field(39; "Created By"; Code[30])
        {
        }
        field(40; Description; Text[250])
        {
        }
        field(41; Posted; Boolean)
        {
        }
        field(42; "Posted By"; Code[30])
        {
        }
        field(43; "Posted On"; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; "Announcement No.", "Posting Type")
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
        if "Posting Type" = "posting type"::"Recruitment Agency Posting" then begin
            HumanResourcesSetup.TestField("Direct Hire Nos.");
            if "Announcement No." = '' then
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Direct Hire Nos.", xRec."No. Series", 0D, "Announcement No.", "No. Series");
        end;
        if "Posting Type" = "posting type"::"Direct Hire Announcement" then begin
            HumanResourcesSetup.TestField("Direct Hire Nos.");
            if "Announcement No." = '' then
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Direct Hire Nos.", xRec."No. Series", 0D, "Announcement No.", "No. Series");
        end;
        if "Posting Type" = "posting type"::"Career Fair" then begin
            HumanResourcesSetup.TestField("Direct Hire Nos.");
            if "Announcement No." = '' then
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Direct Hire Nos.", xRec."No. Series", 0D, "Announcement No.", "No. Series");
        end;

        "HR Officer User ID" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            "HR Officer Staff No." := UserSetup."Employee No.";
            "Staff Name" := UserSetup."Employee Name";
            // Department := UserSetup."Responsibility Center";
            // Region := UserSetup."Region Code";
            "Created By" := UserId;
        end;

        CompanyInformation.Get;
        "Organization Name" := CompanyInformation.Name;
        // "Organization Overview" := CompanyInformation.Vision + ' ' + CompanyInformation.Mission + ' ' + CompanyInformation.Motto;
        Address := CompanyInformation.Address;
        "Address 2" := CompanyInformation."Address 2";
        City := CompanyInformation.City;
        "Post Code" := CompanyInformation."Post Code";
        "Phone No." := CompanyInformation."Phone No.";
        Contact := CompanyInformation."Contact Person";
        Email := CompanyInformation."E-Mail";
        "Home Page" := CompanyInformation."Home Page";
    end;

    var
        CompanyInformation: Record "Company Information";
        UserSetup: Record "User Setup";
        RecruitmentAgency: Record "Recruitment Agency";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

