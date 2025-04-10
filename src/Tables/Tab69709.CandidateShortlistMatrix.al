
table 69709 "Candidate Shortlist Matrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Candidate Shortlisting,Interview Invitation,Consolidated Interview Report,Invitation for Orientation,Individual Candidate Shortlist';
            OptionMembers = "Candidate Shortlisting","Interview Invitation","Consolidated Interview Report","Invitation for Orientation","Individual Candidate Shortlist";
        }
        field(2; "Document No"; Code[30])
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
                JobApplications.Reset;
                JobApplications.SetRange("Application No.", "Application No.");
                if JobApplications.FindFirst then begin
                    "Candidate No" := JobApplications."Candidate No.";
                    "First Name" := JobApplications."First Name";
                    "Middle Name" := JobApplications."Middle Name";
                    "Last Name" := JobApplications."Last Name";
                    "Vacancy ID" := JobApplications."Vacancy Id";
                    "Employee No." := JobApplications."Employee No.";
                    "Phone No." := JobApplications."Phone No.";
                    "Mobile Phone No." := JobApplications."Mobile Phone No.";
                    Email := JobApplications."E-Mail";
                    "Birth Date" := JobApplications."Birth Date";
                    Gender := JobApplications.Gender;
                    "ID Number" := JobApplications."ID Number";
                    "Passport No." := JobApplications."Passport No.";
                    "Tax Registration No." := JobApplications."PIN Registration";
                    "Marital Status" := JobApplications."Marital Status";
                    "Ethnic Group" := JobApplications."Ethnic Group";
                    Nationality := JobApplications.Nationality;
                    "Highest Academic Qualification" := JobApplications."Highest Academic Qualification";
                    Validate("Highest Academic Qualification");
                    "Work Experience (Years)" := JobApplications."Work Experience (Years)";
                    "Management Experience (Years)" := JobApplications."Management Experience (Years)";
                    Religion := JobApplications.Religion;
                    Disabled := JobApplications.Disabled;
                    "Disability Code" := JobApplications."Disability Code";
                    "Disability Description" := JobApplications."Disability Description";
                    "Disability Certificate No" := JobApplications."Disability Certificate No";
                end
            end;
        }
        field(5; "Candidate No"; Code[30])
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
        field(9; "Complete Doc Submitted"; Boolean)
        {
        }
        field(10; "Shortlisting Outcome"; Option)
        {
            OptionCaption = ' ,Non-Responsive,Invite for First Interview';
            OptionMembers = " ","Non-Responsive","Invite for First Interview";
        }
        field(11; "Committee Remarks"; Text[300])
        {
        }
        field(12; "Unsuccesfull App Reason Code"; Code[30])
        {
        }
        field(13; "Ability Test Report ID"; Code[30])
        {
        }
        field(14; "Phone Interview Report ID"; Code[30])
        {
        }
        field(15; "Ability Test Pass Score %"; Decimal)
        {
        }
        field(16; "Phone Interview Outcome"; Option)
        {
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(17; "Employee No."; Code[30])
        {
        }
        field(18; "Phone No."; Text[30])
        {
        }
        field(19; "Mobile Phone No."; Text[30])
        {
        }
        field(20; Email; Text[30])
        {
        }
        field(21; "Birth Date"; Date)
        {
        }
        field(22; Gender; Option)
        {
            OptionCaption = ' ,Male,Female,Other';
            OptionMembers = " ",Male,Female,Other;
        }
        field(23; "ID Number"; Integer)
        {
        }
        field(24; "Passport No."; Code[20])
        {
        }
        field(25; "Tax Registration No."; Code[20])
        {
        }
        field(26; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(27; "Ethnic Group"; Code[30])
        {
            TableRelation = "Ethnic Background";
        }
        field(28; Nationality; Code[30])
        {
        }
        field(29; "Specialization Area"; Code[30])
        {
        }
        field(30; "Highest Academic Qualification"; Code[30])
        {
            TableRelation = "Application Qualification"."Qualification Code" where("Qualification Category" = filter(Academic));
        }
        field(31; "Qualification Name"; Text[50])
        {
        }
        field(32; "Work Experience (Years)"; Integer)
        {
        }
        field(33; "Management Experience (Years)"; Integer)
        {
        }
        field(34; "Disability Code"; Code[30])
        {
            TableRelation = "Disability Code";
        }
        field(35; Disabled; Boolean)
        {
        }
        field(36; "Disability Description"; Text[30])
        {
        }
        field(37; "Disability Certificate No"; Code[30])
        {
        }
        field(38; Notified; Boolean)
        {
        }
        field(39; "Notified On"; DateTime)
        {
        }
        field(40; Religion; Code[50])
        {
        }
        field(41; "Highest Academic Hierarchy Poi"; Integer)
        {
        }

        field(42; "Member No."; Code[30])
        {
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Member No.");
                if Employee.Find('-') then begin
                    "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";


                end;
            end;
        }
        field(43; "Member Name"; Text[70])
        {
        }
        field(44; "Shorlisting Document No."; Code[30])
        {
            TableRelation = "Candidate Selection Header"."Document No.";
        }
        field(45; "ind Shorlisting Document No."; Code[30])
        {
            TableRelation = "Candidate Selection Header"."Document No.";
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Vacancy ID", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobApplications: Record "Job Applications";
}

