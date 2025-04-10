
table 69704 "Ability Test Response"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Response ID"; Code[30])
        {
        }
        field(2; "Ability Test Invitation No."; Code[30])
        {
            TableRelation = "PreScreen Header"."Document No.";
        }
        field(3; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header";
        }
        field(4; "Test ID"; Code[30])
        {
            TableRelation = "Ability Test";
        }
        field(5; "Lead HR Officer"; Code[30])
        {
            TableRelation = "HR Officers";
        }
        field(6; "Candidate No."; Code[30])
        {
            Editable = false;
            TableRelation = Applicant;
        }
        field(7; "First Name"; Text[50])
        {
            Editable = false;
        }
        field(8; "Middle Name"; Text[50])
        {
            Editable = false;
        }
        field(9; "Last Name"; Text[50])
        {
            Editable = false;
        }
        field(10; Email; Text[30])
        {
            Editable = false;
        }
        field(11; "Test Start Time"; Time)
        {
        }
        field(12; "Test End Time"; Time)
        {
        }
        field(13; "Total No. of Questions"; Integer)
        {
            CalcFormula = count("Test Response Question" where("Response ID" = field("Response ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Total No. of Pass Questions"; Integer)
        {
            CalcFormula = count("Test Response Question" where("Response ID" = field("Response ID"),
                                                                "Pass/Fail" = filter(PASS)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Ability Test Pass Score %"; Decimal)
        {
            Editable = false;
        }
        field(16; "Response Status"; Option)
        {
            OptionCaption = 'Draft,Submitted,Evaluated,Cancelled';
            OptionMembers = Draft,Submitted,Evaluated,Cancelled;
        }
        field(17; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.", "Application No.");
                if JobApplications.FindFirst then begin
                    "First Name" := JobApplications."First Name";
                    "Middle Name" := JobApplications."Middle Name";
                    "Last Name" := JobApplications."Last Name";
                    Email := JobApplications."E-Mail";
                    "Candidate No." := JobApplications."Candidate No.";
                    "Vacancy ID" := JobApplications."Vacancy Id";
                end
            end;
        }
        field(18; "Test Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Response ID", "Ability Test Invitation No.", "Vacancy ID")
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

