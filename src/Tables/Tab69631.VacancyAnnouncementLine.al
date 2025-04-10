
table 69631 "Vacancy Announcement Line"
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
        field(3; "Vacancy ID"; Code[30])
        {
            Caption = 'Vacancy code';
            TableRelation = "Recruitment Requisition Header" where("Document Type" = const("Job Vacancy"));

            trigger OnValidate()
            begin
                RecruitmentRequisitionHeader.Reset;
                RecruitmentRequisitionHeader.SetRange("Document No.", "Vacancy ID");
                if RecruitmentRequisitionHeader.FindSet then begin
                    "Sourcing Method" := RecruitmentRequisitionHeader."Sourcing Method";
                    "Position ID" := RecruitmentRequisitionHeader."Position ID";
                    "Duty Station ID" := RecruitmentRequisitionHeader."Duty Station ID";
                    "Work Location Details" := RecruitmentRequisitionHeader."Work Location Details";
                    "No. of Openings" := RecruitmentRequisitionHeader."No of Openings";
                    "Recruitment Reason Code" := RecruitmentRequisitionHeader."Primary Recruitment Reason";
                    "Target Candidate Source" := RecruitmentRequisitionHeader."Target Candidate Source";
                    "Job No." := RecruitmentRequisitionHeader."Job No.";
                    "Task No." := RecruitmentRequisitionHeader."Job Task No.";
                    "Funding Source ID" := RecruitmentRequisitionHeader."Funding Source ID";
                    "Application Closing Date" := RecruitmentRequisitionHeader."Application Closing Date";
                    "Application Closing  Time" := RecruitmentRequisitionHeader."Application Closing Time";
                    "Line Budget Cost (LCY)" := RecruitmentRequisitionHeader."Recruitment Line Budget Cost";
                    Validate("Position ID");
                end
            end;
        }
        field(4; "Sourcing Method"; Option)
        {
            OptionCaption = 'Recruitment Agency,Direct Hire';
            OptionMembers = "Recruitment Agency","Direct Hire";
        }
        field(5; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions";
            Caption = 'Position Code';

            trigger OnValidate()
            begin
                if CompanyPositions.Get("Position ID") then begin
                    "Job Title/Designation" := CompanyPositions."Job Title";
                    "Designation Group" := CompanyPositions."Designation Group";
                    "(Directly) Reports To" := CompanyPositions."Directly Reports To";
                    "(Indirectly) Reports To" := CompanyPositions."Indirectly Reports To";
                    "Job Grade ID" := CompanyPositions."Job Grade ID";
                    "Overall Appointment Authority" := CompanyPositions."Overall Appointment Authority";
                    "Seniority Level" := CompanyPositions."Seniority Level";
                    "Duty Station ID" := CompanyPositions."Default Duty Station";
                    "Position Category" := CompanyPositions."Position Category";

                end
            end;
        }
        field(6; "Job Title/Designation"; Text[100])
        {
        }
        field(7; "Duty Station ID"; Code[30])
        {
            TableRelation = "Duty Station";
            Caption = 'Duty Station';
        }
        field(8; "Work Location Details"; Text[50])
        {
        }
        field(9; "No. of Openings"; Integer)
        {
        }
        field(10; "Recruitment Reason Code"; Code[30])
        {
            Caption = 'Primary Recruitment Reason Code';
            TableRelation = "Recruitment Reason Code";
        }
        field(11; "Target Candidate Source"; Option)
        {
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(12; "Job No."; Code[30])
        {
            TableRelation = Job;
        }
        field(13; "Task No."; Code[10])
        {
        }
        field(14; "Funding Source ID"; Code[30])
        {
        }
        field(15; "Designation Group"; Code[30])
        {
        }
        field(16; "(Directly) Reports To"; Code[30])
        {
        }
        field(17; "(Indirectly) Reports To"; Code[30])
        {
        }
        field(18; "Job Grade ID"; Code[30])
        {
            TableRelation = "Salary Scales";
        }
        field(19; "Overall Appointment Authority"; Code[30])
        {
        }
        field(20; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(21; "Terms of Service Code"; Code[30])
        {
            TableRelation = "Terms of Service";
        }
        field(22; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(23; "Application Closing Date"; Date)
        {
        }
        field(24; "Application Closing  Time"; Time)
        {
        }
        field(25; "Line Budget Cost (LCY)"; Decimal)
        {
        }
        field(26; "Actual Job Board  Cost"; Decimal)
        {
        }
        field(27; "Actual Recruiter Fees"; Decimal)
        {
        }
        field(28; "Advertisement Line Cost"; Decimal)
        {
        }
        field(29; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(30; "Position Category"; Option)
        {
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
    }

    keys
    {
        key(Key1; "Announcement No.", "Line No.", "Posting Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
        CompanyPositions: Record "Company Positions";
}

