table 69454 "Individual Interview Outcome"
{
    Caption = 'Individual Interview Outcome';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }

        field(4; "Vacancy ID"; Code[30])
        {
            Editable = false;
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
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
        }
        field(22; "Panelist Interview Remarks"; Text[350])
        {
        }
        field(23; "Unsuccesful App Reason Code"; Code[500])
        {
        }

        field(30; "Original Document No."; Code[30])
        {
        }
        field(26; Posted; Boolean)
        {
        }
        field(27; "Panel Oral Interview Score %"; Decimal)
        {
            Editable = false;
        }
        field(28; "Panel Tech Interview Score %"; Decimal)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Application No.", "Original Document No.")
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

