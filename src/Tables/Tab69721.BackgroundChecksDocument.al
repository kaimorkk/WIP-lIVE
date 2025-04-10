
table 69721 "Background Checks Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            TableRelation = "Background Checks Header";
        }
        field(2; "Clearance Document Type"; Code[30])
        {
            TableRelation = "HR Document Type" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                HRDocumentType.Reset;
                HRDocumentType.SetRange(Code, "Clearance Document Type");
                if HRDocumentType.FindSet then begin
                    Description := HRDocumentType.Description;
                end
            end;
        }
        field(3; Description; Text[400])
        {
        }
        field(4; "External Document No."; Code[30])
        {
        }
        field(5; "Clearing Agency"; Text[100])
        {
        }
        field(6; "Clearing Status"; Option)
        {
            OptionCaption = ' ,Red Flag,Clean Record';
            OptionMembers = " ","Red Flag","Clean Record";
        }
        field(7; "Additional Comments"; Text[300])
        {
        }
        field(8; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));
        }
        field(9; "Application No."; Code[30])
        {
            TableRelation = "Job Applications";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Clearance Document Type", "Application No.")
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

