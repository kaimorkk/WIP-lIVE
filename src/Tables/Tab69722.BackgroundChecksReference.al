
table 69722 "Background Checks Reference"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            Editable = false;
        }
        field(2; "Application No."; Code[30])
        {
            TableRelation = "Job Applications" where("Vacancy Id" = field("Vacancy Id"));
        }
        field(3; "Referee Id"; Integer)
        {
            TableRelation = "Application Referees"."Line No." where("Application No." = field("Application No."));

            trigger OnValidate()
            begin
                ApplicationReferees.Reset;
                ApplicationReferees.SetRange("Application No.", "Application No.");
                ApplicationReferees.SetRange("Line No.", "Referee Id");
                if ApplicationReferees.FindFirst then begin
                    "Referee Type" := ApplicationReferees."Rererence Type";
                    Name := ApplicationReferees.Name;
                    "Title/Designation" := ApplicationReferees."Designation/Title";
                    Institution := ApplicationReferees.Institution;
                    "Phone No." := ApplicationReferees."Phone No.";
                    Email := ApplicationReferees."E-Mail";
                end
            end;
        }
        field(4; "Referee Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Previous Employer,Current Employer,Other Referee';
            OptionMembers = " ","Previous Employer","Current Employer","Other Referee";
        }
        field(5; Name; Text[150])
        {
        }
        field(6; "Title/Designation"; Text[100])
        {
        }
        field(7; Institution; Text[100])
        {
        }
        field(8; "Phone No."; Text[30])
        {
        }
        field(9; Email; Text[50])
        {
            Editable = false;
        }
        field(10; "Lead HR Officer"; Code[30])
        {
            TableRelation = Resource."No.";
        }
        field(11; "Invited for Detailed Recommend"; Boolean)
        {
        }
        field(12; "Invited On"; DateTime)
        {
        }
        field(13; "Referee Recomm Report ID"; Code[30])
        {
            TableRelation = "Referee Recommendation";
        }
        field(14; "Recommended for Hire"; Boolean)
        {
        }
        field(15; "Vacancy Id"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header";
        }
        field(16; "No. Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Application No.", "Referee Id", "Vacancy Id")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ApplicationReferees: Record "Application Referees";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

