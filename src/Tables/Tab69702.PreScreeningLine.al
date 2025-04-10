
table 69702 "PreScreening Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Ability Test Invitation,Phone Interview Report';
            OptionMembers = "Ability Test Invitation","Phone Interview Report";
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
            TableRelation = "Job Applications" where("Vacancy Id" = field("Vacancy ID"));

            trigger OnValidate()
            begin
                JobApplication.Reset;
                JobApplication.SetRange("Application No.", "Application No.");
                if JobApplication.FindFirst then begin
                    "Candidate No." := JobApplication."Candidate No.";
                    "First Name" := JobApplication."First Name";
                    "Middle Name" := JobApplication."Middle Name";
                    "Last Name" := JobApplication."Last Name";
                    "Employee No." := JobApplication."Employee No.";
                    "Phone No." := JobApplication."Phone No.";
                    "Mobile Phone No." := JobApplication."Mobile Phone No.";
                    Email := JobApplication."E-Mail";

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
        field(9; "Employee No."; Code[30])
        {
        }
        field(10; "Phone No."; Text[30])
        {
        }
        field(11; "Mobile Phone No."; Text[30])
        {
        }
        field(12; Email; Text[30])
        {
        }
        field(13; "Planned Start Date"; Date)
        {
        }
        field(14; "Test Start Time"; Time)
        {
        }
        field(15; "Test End Time"; Time)
        {
        }
        field(16; "Ability Test Response ID"; Code[30])
        {
            TableRelation = "Ability Test Response";
        }
        field(17; "Ability Test Pass Score %"; Decimal)
        {
        }
        field(18; "Phone Interview Outcome"; Option)
        {
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(19; Notified; Boolean)
        {
        }
        field(20; "DateTime Notified"; DateTime)
        {
        }
        field(21; "No. of Questions"; Integer)
        {
            CalcFormula = count("PreScreening Phone Log" where("Vacancy ID" = field("Vacancy ID"),
                                                                "Application No." = field("Application No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Vacancy ID", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobApplication: Record "Job Applications";
}

