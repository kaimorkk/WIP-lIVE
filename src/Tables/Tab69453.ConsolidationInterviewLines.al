table 69453 "Consolidation Interview Lines"
{
    Caption = 'Consolidation Interview Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Interview Invitation No."; Code[30])
        {
            TableRelation = "Candidate Selection Header"."Document No." where("Document Type" = filter("Interview Invitation"));


        }
        field(3; "Interview Scoresheet Template"; Code[30])
        {
            Editable = false;
            TableRelation = "HR Screening Template".Code where("Template Type" = filter("Interview Scoresheet"));


        }
        field(4; "Vacancy ID"; Code[30])
        {
            Editable = false;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
        }
        field(6; "Candidate Shortlist Vouch No."; Code[30])
        {
            Editable = false;
            TableRelation = "Candidate Selection Header" where("Document Type" = const("Candidate Shortlisting"));
        }
        field(7; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";


        }
        field(8; "Candidate No."; Code[30])
        {
            Editable = false;
            TableRelation = Applicant;


        }
        field(9; "First Name"; Text[50])
        {
            Editable = false;
        }
        field(10; "Middle Name"; Text[50])
        {
            Editable = false;
        }
        field(11; "Last Name"; Text[50])
        {
            Editable = false;
        }
        field(12; "Interview Date"; Date)
        {
        }
        field(13; "Interview Start Time"; Time)
        {
        }
        field(14; "Interview End Time"; Time)
        {
        }
        field(15; "Interview Venue"; Text[300])
        {
        }
        field(16; "Room No."; Code[30])
        {
        }
        field(17; "Assigned Panel ID"; Code[30])
        {
            TableRelation = "Commitee Appointment Voucher"."Document No.";
        }
        field(18; "Panel Member No."; Code[30])
        {
            TableRelation = "Commitee Appointed Member"."Member No." where("Document No." = field("Assigned Panel ID"));


        }
        field(19; Member; Text[100])
        {
        }
        field(20; "Panel Interview Outcome"; Option)
        {
            OptionCaption = ' ,Unsuccessful,Successful';
            OptionMembers = " ",Unsuccessful,Successful;
        }
        field(21; "Panel Interview Score %"; Decimal)
        {
            Editable = false;
            fieldclass = flowfield;
            calcformula = sum("Individual Interview Outcome"."Panel Interview Score %" where("Application No." = field("Application No."), Posted = const(true), "Document No." = field("Document No.")));
        }
        field(22; "Panelist Interview Remarks"; Text[350])
        {
        }
        field(23; "Unsuccesful App Reason Code"; Code[500])
        {
        }
        field(24; "Document Status"; Option)
        {
            Editable = false;
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(25; "Document Date"; Date)
        {
            Editable = false;
        }
        field(26; Posted; Boolean)
        {
        }
        field(27; "Posted By"; Code[30])
        {
        }
        field(28; "Posted On"; DateTime)
        {
        }
        field(29; "No. Series"; Code[10])
        {
        }
        field(40; "Original Document No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }


    var
        Applicant: Record Applicant;
        SelectionHeader: Record "Candidate Selection Header";
        InterviewLine: Record "Candidate Interview Line";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        JobApplications: Record "Job Applications";
        Qns: Record "Hr Screening Template Line";
        CandidateInterviewQuestion: Record "Candidate Interview Question";
        HrScreeningQn1: Record "Hr Screening Qn Group";
        CandidateInterviewQn2: Record "Candidate Interview Qn Group";
        Resource: Record Resource;
}

