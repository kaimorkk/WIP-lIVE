
table 69675 "Candidate Shortlist Score Guid"
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
        field(3; "Requirement ID"; Integer)
        {
        }
        field(4; "Score Code"; Code[30])
        {
            TableRelation = "Shortlisting Score Code";

            trigger OnValidate()
            begin
                ShortlistingScore.Reset;
                ShortlistingScore.SetRange(Code, "Score Code");
                if ShortlistingScore.FindFirst then begin
                    Description := ShortlistingScore.Description;
                    Points := ShortlistingScore.Points;
                end
            end;
        }
        field(5; Description; Text[350])
        {
        }
        field(6; Points; Decimal)
        {
        }
        field(7; "Requirement Name"; Text[300])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Requirement ID", "Document No.", "Score Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PostCode: Record "Post Code";
        JobApplications: Record "Job Applications";
        ShortlistingScore: Record "Shortlisting Score Code";
}

