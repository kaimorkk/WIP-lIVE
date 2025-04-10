
table 69725 "Referee Recomm Rating"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
        }
        field(3; "Skills and Competency ID"; Integer)
        {
            TableRelation = "Recruitment Req Requirement"."Line No." where("Document No." = field("Vacancy ID"),
                                                                            "Qualification Category" = filter("Skills & Competencies"));

            trigger OnValidate()
            begin
                Requirement.Reset;
                Requirement.SetRange("Document No.", "Vacancy ID");
                Requirement.SetRange("Line No.", "Skills and Competency ID");
                if Requirement.FindFirst then begin
                    "Qualification Code" := Requirement."Qualification Code";
                    Description := Requirement.Description;
                end
            end;
        }
        field(4; "Qualification Code"; Code[30])
        {
            Editable = false;
        }
        field(5; Description; Text[100])
        {
            Editable = false;
        }
        field(6; "Rating of Candidate"; Option)
        {
            OptionCaption = ' ,1-VERY POOR,2-POOR,3-FAIR,4-GOOD,5-EXCELLENT ';
            OptionMembers = " ","1-VERY POOR","2-POOR","3-FAIR","4-GOOD","5-EXCELLENT ";
        }
        field(7; "Additional Comments"; Text[300])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Vacancy ID", "Skills and Competency ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Requirement: Record "Recruitment Req Requirement";
}

