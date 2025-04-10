
table 69622 "Vacancy"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vacancy No"; Code[30])
        {
        }
        field(2; "Requisition Line"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Recruitment Plan ID"; Code[30])
        {
            TableRelation = "Recruitment Plan";
        }
        field(4; "Position ID"; Code[30])
        {
        }
        field(5; "Duty Station"; Code[30])
        {
        }
        field(6; "Recruitment Requisition Code"; Code[30])
        {
        }
        field(8; "No of Openings"; Integer)
        {
        }
        field(9; "Primary Recruitment Reason"; Code[30])
        {
            TableRelation = "Recruitment Reason Code";
        }
        field(10; "Recruitment Justification"; Text[100])
        {
        }
        field(11; "Target Candidate Source"; Option)
        {
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(12; "Sourcing Method"; Option)
        {
            OptionCaption = 'Recruitment Agency,Direct Hire';
            OptionMembers = "Recruitment Agency","Direct Hire";
        }
        field(13; "Recruitment Cycle Type"; Option)
        {
            OptionCaption = 'Standard,Expedited';
            OptionMembers = Standard,Expedited;
        }
        field(14; "Recruitment Lead Time"; DateFormula)
        {
        }
        field(15; "Planned Recruitment Start Date"; Date)
        {
        }
        field(16; "Planned Recruitment End Date"; Date)
        {
        }
        field(17; "Planned Employment Start Date"; Date)
        {
        }
        field(18; "Planned Employment End Date"; Date)
        {
        }
        field(19; "Job No."; Code[30])
        {
            TableRelation = Job;
        }
        field(20; "Job Task No."; Code[30])
        {
        }
        field(21; "Funding Source ID"; Code[30])
        {
        }
        field(22; "Recruitment Line Budget Cost"; Decimal)
        {
            Caption = 'Recruitment Line Budget Cost(LCY)';
        }
        field(23; "Average Cost/Hire"; Decimal)
        {
        }
        field(24; "Estimate Annual Salary"; Decimal)
        {
        }
        field(25; "Hierarchically Reports To"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(26; "Functionally  Reports To"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(27; "Job Grade ID"; Code[30])
        {
            TableRelation = "Salary Scales";
        }
        field(28; "Overall Appointment Authority"; Code[30])
        {
        }
        field(29; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(30; "Default Terms of Service Code"; Code[30])
        {
            TableRelation = "Terms of Service";
        }
        field(31; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(32; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(33; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(34; "Dimension Set ID"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(35; "Vacancy Status"; Option)
        {
            OptionCaption = 'Draft,Published,Evalution,Closed,Cancelled';
            OptionMembers = Draft,Published,Evalution,Closed,Cancelled;
        }
        field(36; "Job Announcement ID"; Code[30])
        {
        }
        field(37; "Date Published"; Date)
        {
        }
        field(38; "No of Applicants"; Integer)
        {
        }
        field(39; "No of Filled Posts"; Integer)
        {
        }
        field(40; "Position Category"; Option)
        {
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
        field(41; "Application Procedure 1"; Text[2000])
        {
        }
        field(42; "Application Procedure 2"; Text[2000])
        {
        }
        field(43; "Application Procedure 3"; Text[2000])
        {
        }
        field(44; "Application Procedure 4"; Text[2000])
        {
        }
    }

    keys
    {
        key(Key1; "Vacancy No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

