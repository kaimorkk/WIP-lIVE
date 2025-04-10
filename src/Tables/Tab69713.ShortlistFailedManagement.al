
table 69713 "Shortlist Failed Management"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Candidate Shortlisting,Interview Invitation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation";
        }
        field(2; "Document No."; Code[30])
        {
        }
        field(3; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
        }
        field(4; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                JobApplication.Reset;
                JobApplication.SetRange("Application No.", "Application No.");
                if JobApplication.FindFirst then begin
                    "Vacancy ID" := JobApplication."Vacancy Id";
                    "Candidate No." := JobApplication."Candidate No.";
                    "First Name" := JobApplication."First Name";
                    "Middle Name" := JobApplication."Middle Name";
                    "Last Name" := JobApplication."Last Name";
                    "Employee No." := JobApplication."Employee No.";
                    "Phone No." := JobApplication."Phone No.";
                    "Mobile Phone No." := JobApplication."Mobile Phone No.";
                    Email := JobApplication."E-Mail";
                    Gender := JobApplication.Gender;
                    "Birth Date" := JobApplication."Birth Date";
                    "ID Number" := JobApplication."ID Number";
                    "Tax Registration(PIN)" := JobApplication."PIN Registration";
                    "Marital Status" := JobApplication."Marital Status";
                    "Ethnic Group" := JobApplication."Ethnic Group";
                    Nationality := JobApplication.Nationality;
                    "Highest Academic Qualification" := JobApplication."Highest Academic Qualification";
                    Validate("Highest Academic Qualification");
                    "General Work Experience Yrs" := JobApplication."Work Experience (Years)";
                    "Management Experience Yrs" := JobApplication."Management Experience (Years)";
                    Disabled := JobApplication.Disabled;
                    "Disability Code" := JobApplication."Disability Code";
                    "Disability Description" := JobApplication."Disability Description";
                end
            end;
        }
        field(5; "Candidate No."; Code[30])
        {
        }
        field(6; "First Name"; Text[50])
        {
        }
        field(7; "Middle Name"; Text[50])
        {
        }
        field(8; "Last Name"; Text[50])
        {
        }
        field(9; "Complete App Docs Submitted"; Boolean)
        {
        }
        field(10; "Shortlisting Outcome"; Code[30])
        {
        }
        field(11; "Unsuccesfull App Reason Code"; Code[30])
        {
        }
        field(12; "Commiittee Remarks"; Text[350])
        {
        }
        field(13; "Employee No."; Code[30])
        {
        }
        field(14; "Phone No."; Text[30])
        {
        }
        field(15; "Mobile Phone No."; Text[30])
        {
        }
        field(16; Email; Text[30])
        {
        }
        field(17; "Birth Date"; Date)
        {
        }
        field(18; Gender; Option)
        {
            OptionCaption = 'Female,Male,Other';
            OptionMembers = Female,Male,Other;
        }
        field(19; "ID Number"; Integer)
        {
        }
        field(20; "Passport No."; Code[20])
        {
        }
        field(21; "Tax Registration(PIN)"; Code[20])
        {
        }
        field(22; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(23; Religion; Code[30])
        {
        }
        field(24; "Ethnic Group"; Code[30])
        {
        }
        field(25; Nationality; Code[30])
        {
        }
        field(26; "Specialization Area"; Code[30])
        {
        }
        field(27; "Highest Academic Qualification"; Code[30])
        {
            TableRelation = Qualification;

            trigger OnValidate()
            begin
                Qualification.Reset;
                Qualification.SetRange(Code, "Highest Academic Qualification");
                if Qualification.FindFirst then begin
                    "Academic Qualification Name" := Qualification.Description;
                    "Highest Academic Pointer" := Qualification."Academic Hierachy Code";
                end
            end;
        }
        field(28; "Academic Qualification Name"; Text[50])
        {
        }
        field(29; "Highest Academic Pointer"; Integer)
        {
        }
        field(30; "General Work Experience Yrs"; Integer)
        {
        }
        field(31; "Management Experience Yrs"; Integer)
        {
        }
        field(32; "Disability Code"; Code[30])
        {
        }
        field(33; Disabled; Boolean)
        {
        }
        field(34; "Disability Description"; Text[100])
        {
        }
        field(35; "Disability Cert No."; Code[30])
        {
        }
        field(36; Notified; Boolean)
        {
        }
        field(37; "Notified On"; DateTime)
        {
        }
        field(38; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Entry No", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobApplication: Record "Job Applications";
        Qualification: Record Qualification;
}

