
table 69641 "Selection Commitee Vacancy"
{
    // DrillDownPageID = "Selection Committee Vacancy";
    // LookupPageID = "Selection Committee Vacancy";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
        }
        field(3; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));

            trigger OnValidate()
            begin
                if RecruitmentRequisitionHeader.Get("Vacancy ID") then begin
                    "Position ID" := RecruitmentRequisitionHeader."Position ID";
                    "Job Title/Designation" := RecruitmentRequisitionHeader."Job Title/Designation";
                    "Duty Station ID" := RecruitmentRequisitionHeader."Duty Station ID";
                    "Work Location Details" := RecruitmentRequisitionHeader."Work Location Details";
                    "No. of Openings" := RecruitmentRequisitionHeader."No of Openings";
                end
            end;
        }
        field(4; "Position ID"; Code[30])
        {
            Editable = false;
        }
        field(5; "Job Title/Designation"; Text[50])
        {
            Editable = false;
        }
        field(6; "Duty Station ID"; Code[30])
        {
        }
        field(7; "Work Location Details"; Text[100])
        {
        }
        field(8; "No. of Openings"; Integer)
        {
        }
        field(9; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RecruitmentRequisitionHeader: Record "Recruitment Requisition Header";
}

