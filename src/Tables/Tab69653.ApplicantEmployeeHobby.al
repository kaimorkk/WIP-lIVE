
table 69653 "Applicant_Employee Hobby"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Employee,Job Applicant';
            OptionMembers = Employee,"Job Applicant";
        }
        field(2; "No."; Code[30])
        {
        }
        field(3; "Hobby Type"; Code[30])
        {
            TableRelation = "Hobby Type" where("Hobby Categgory" = field("Hobby Category"));

            trigger OnValidate()
            begin
                if HobbyType.Get("Hobby Type") then begin
                    "Hobby Category" := HobbyType."Hobby Categgory";
                    Description := HobbyType.Description;
                end
            end;
        }
        field(4; "Hobby Category"; Option)
        {
            OptionCaption = 'Travel/Sports/Adventure,Games,Arts & Creatives,Food & Cooking,Collecting,Others';
            OptionMembers = "Travel/Sports/Adventure",Games,"Arts & Creatives","Food & Cooking",Collecting,Others;
        }
        field(5; Description; Text[150])
        {
        }
        field(6; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Candidate No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HobbyType: Record "Hobby Type";
}

