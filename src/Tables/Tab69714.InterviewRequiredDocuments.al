
table 69714 "Interview Required Documents"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Interview Invitation,Candidate Shortlisting';
            OptionMembers = "Interview Invitation","Candidate Shortlisting";
        }
        field(2; "Document No."; Code[30])
        {
        }
        field(3; "HR Document Type"; Code[30])
        {
            TableRelation = "HR Document Type";

            trigger OnValidate()
            begin
                HRDocumentType.Reset;
                HRDocumentType.SetRange(Code, "HR Document Type");
                if HRDocumentType.FindSet then begin
                    Description := HRDocumentType.Description;
                end;
            end;
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "HR Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRDocumentType: Record "HR Document Type";
}

