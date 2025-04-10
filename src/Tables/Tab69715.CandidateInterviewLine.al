
table 69715 "Candidate Interview Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Candidate Shortlisting,Interview Invitation,Consolidated Interview Report,Invitation for Orientation';
            OptionMembers = "Candidate Shortlisting","Interview Invitation","Consolidated Interview Report","Invitation for Orientation";
        }
        field(2; "Document No."; Code[30])
        {
        }
        field(3; "Source Type"; Option)
        {
            OptionCaption = ' ,Previous Interview,Final Shortlisting';
            OptionMembers = " ","Previous Interview","Final Shortlisting";
        }
        field(4; "Source Document No."; Code[30])
        {
        }
        field(5; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.", "Application No.");
                if JobApplications.FindFirst then begin
                    "Candidate No." := JobApplications."Candidate No.";
                    "First Name" := JobApplications."First Name";
                    "Middle Name" := JobApplications."Middle Name";
                    "Last Name" := JobApplications."Last Name";
                    "Phone No." := JobApplications."Phone No.";
                    Email := JobApplications."E-Mail";
                    "Mobile Phone No." := JobApplications."Mobile Phone No.";
                    "Birth Date" := JobApplications."Birth Date";
                    "ID Number" := JobApplications."ID Number";
                    "Passport No." := JobApplications."Passport No.";
                    "Ethnic Group" := JobApplications."Ethnic Group";
                    Nationality := JobApplications.Nationality;
                    "Specialization Area" := JobApplications."Specialization Area";
                    "Highest Academic Qualification" := JobApplications."Highest Academic Qualification";
                    "General Work Experience Yrs" := JobApplications."Work Experience (Years)";
                    "Management Experience Yrs" := JobApplications."Management Experience (Years)";
                    Disabled := JobApplications.Disabled;
                    "Disability Description" := JobApplications."Disability Description";
                    "Disability Cert No." := JobApplications."Disability Certificate No";
                    "Disability Code" := JobApplications."Disability Code";
                    //"Highest Academic Pointer":=JobApplications.p
                end
            end;
        }
        field(6; "Candidate No."; Code[30])
        {
            TableRelation = Applicant;
        }
        field(7; "First Name"; Text[50])
        {
        }
        field(8; "Middle Name"; Text[50])
        {
        }
        field(9; "Last Name"; Text[50])
        {
        }
        field(10; "Interview Date"; Date)
        {
        }
        field(11; "Interview Start Time"; Time)
        {
        }
        field(12; "Interview End Time"; Time)
        {
        }
        field(13; "Assigned Panel ID"; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher";
        }
        field(14; "Interview Venue"; Text[300])
        {
        }
        field(15; "Room No."; Code[30])
        {
        }
        field(16; "Candidate Attendance Status"; Option)
        {
            OptionCaption = 'Pending Confirmation,Confirmed,Confirmed with Reschedule Request,Cancelled';
            OptionMembers = "Pending Confirmation",Confirmed,"Confirmed with Reschedule Request",Cancelled;
        }
        field(17; "Vacancy ID"; Code[30])
        {
        }
        field(18; "Candidate Shortlist Voucher"; Code[30])
        {
        }
        field(19; "Interview Panel Outcome"; Option)
        {
            Caption = 'Final Interview Panel Outcome';
            OptionCaption = ' ,Unsuccesful,Succesful';
            OptionMembers = " ",Unsuccesful,Succesful;
        }
        field(20; "Interview Panel Score %"; Decimal)
        {
            Caption = 'Final Interview Panel Score %';
        }
        field(21; "Interview Panel Remarks"; Text[350])
        {
        }
        field(22; "Unsuccesful Application Reason"; Code[30])
        {
        }
        field(23; "Phone No."; Text[30])
        {
        }
        field(24; "Mobile Phone No."; Text[30])
        {
        }
        field(25; Email; Text[30])
        {
        }
        field(26; "Birth Date"; Date)
        {
        }
        field(27; Gender; Option)
        {
            OptionCaption = 'Female,Male,Other';
            OptionMembers = Female,Male,Other;
        }
        field(28; "ID Number"; Integer)
        {
        }
        field(29; "Passport No."; Code[20])
        {
        }
        field(30; "Tax Registration(PIN)"; Code[20])
        {
        }
        field(31; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(32; Religion; Code[30])
        {
        }
        field(33; "Ethnic Group"; Code[30])
        {
        }
        field(34; Nationality; Code[30])
        {
        }
        field(35; "Specialization Area"; Code[30])
        {
        }
        field(36; "Highest Academic Qualification"; Code[30])
        {
        }
        field(37; "Academic Qualification Name"; Text[50])
        {
        }
        field(38; "Highest Academic Pointer"; Integer)
        {
        }
        field(39; "General Work Experience Yrs"; Integer)
        {
        }
        field(40; "Management Experience Yrs"; Integer)
        {
        }
        field(41; "Disability Code"; Code[30])
        {
        }
        field(42; Disabled; Boolean)
        {
        }
        field(43; "Disability Description"; Text[100])
        {
        }
        field(44; "Disability Cert No."; Code[30])
        {
        }
        field(45; Notified; Boolean)
        {
        }
        field(46; "Notified On"; DateTime)
        {
        }
        field(47; "Offer ID"; Code[30])
        {
        }
        field(48; "Orientation Remarks"; Text[350])
        {
        }
        field(49; "Orientation Attendance Status"; Option)
        {
            OptionCaption = '...,Attended Orientation,Did Not Orientation';
            OptionMembers = "...","Attended Orientation","Did Not Orientation";
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Application No.", "Source Document No.")
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

