
table 69647 "Job Applicants Qualification"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Candidate No."; Code[30])
        {
            TableRelation = Applicant;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Qualification Category"; Option)
        {
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Proffessional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Proffessional Bodies";
        }
        field(4; "Qualification Code"; Code[10])
        {
            TableRelation = Qualification where("Qualification Category" = field("Qualification Category"));

            trigger OnValidate()
            var
                Qualification: Record Qualification;
            begin
                Qualification.Get("Qualification Code");
                Description := Qualification.Description;
            end;

        }
        field(5; "Specialized Domain Area"; Code[30])
        {
            TableRelation = "Domain Area";
        }
        field(6; "From Date"; Date)
        {
        }
        field(7; "To Date"; Date)
        {
        }
        field(8; Type; Option)
        {
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(9; Description; Text[100])
        {
        }
        field(10; "Institution/Company"; Text[100])
        {
        }
        field(11; Cost; Decimal)
        {
        }
        field(12; "Course Grade"; Code[30])
        {
        }
        field(13; "Job Applicant Status"; Option)
        {
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
        field(14; Comment; Text[50])
        {
        }
        field(15; "Expiration Date"; Date)
        {
        }
        field(16; "Education Level"; Option)
        {
            OptionCaption = ' ,Post Doctorate,PHD,Masters,Degree,Post Graduate Diploma,Diploma,Certificate';
            OptionMembers = " ","Post Doctorate",PHD,Masters,Degree,"Post Graduate Diploma",Diploma,Certificate;
        }
        field(17; Country; Text[50])
        {
        }
        field(18; "Attained Score"; Option)
        {
            OptionCaption = ' ,First Class Hons,Second Class Upper,Second Class Lower,Destinction,Pass,Credit,Others';
            OptionMembers = " ","First Class Hons","Second Class Upper","Second Class Lower",Destinction,Pass,Credit,Others;
        }
        field(19; "Graduation Year"; Text[50])
        {
        }
        field(20; "Membership Registration No"; Text[50])
        {
        }
        field(21; "Membership Type"; Text[50])
        {
        }
        field(22; "Member Renewal Date"; Date)
        {
        }
        field(23; "Licensing Number"; Text[50])
        {
        }
        field(24; "Licensing Renewal Date"; Date)
        {
        }
        field(25; "Job Description/Designation"; Text[50])
        {
        }
        field(26; "Terms of Service"; Option)
        {
            OptionCaption = ' ,Permanent and Pensionable,Contract,Casual,Internship';
            OptionMembers = " ","Permanent and Pensionable",Contract,Casual,Internship;
        }
        field(27; "Experience Years"; Text[30])
        {
        }
        field(28; "Duties and Resposibilities"; Text[2048])
        {
        }
        field(29; "Duration(Days)"; Integer)
        {
        }
        field(30; "Converted Full Years"; Integer)
        {
        }
        field(31; "Converted Full Months"; Integer)
        {
        }
        field(32; "Converted Full Days"; Integer)
        {
        }
        field(33; "Proffessional Qualifications"; Text[100])
        {
        }
        field(34; "Submission Date"; DateTime)
        {
        }
        field(35; "Other Academic Qualifications"; Text[250])
        {
            Description = '//For Other Academic Qualification besides the provided options';
        }
        field(36; "Employment Type"; Option)
        {
            OptionCaption = ' ,Government,Private';
            OptionMembers = " ",Government,Private;
        }
    }

    keys
    {
        key(Key1; "Candidate No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

