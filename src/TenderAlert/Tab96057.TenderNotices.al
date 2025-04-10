table 96057 "Tender Notices"
{
    Caption = 'Tender Notices';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Text[100])
        {
            Caption = 'No.';
        }
        field(2; OCID; Text[100])
        {
            Caption = 'OCID';
        }
        field(3; "Tender No."; Text[100])
        {
            Caption = 'Tender No.';
        }
        field(4; Title; Text[250])
        {
            Caption = 'Title';
        }
        field(5; "Procurement Method"; Text[100])
        {
            Caption = 'Procurement Method';
        }
        field(6; "Procurement Category"; Text[100])
        {
            Caption = 'Procurement Category';
        }
        field(7; "Submission Methods"; Text[100])
        {
            Caption = 'Submission Methods';
        }
        field(8; "Opening Venue"; Text[250])
        {
            Caption = 'Opening Venue';
        }
        field(9; "Published Date"; Date)
        {
            Caption = 'Published Date';
        }
        field(10; "Close DateTime"; DateTime)
        {
            Caption = 'Close DateTime';
        }
        field(11; "Tender Fee"; Decimal)
        {
            Caption = 'Tender Fee';
        }
        field(12; "Tender Validity in Days"; Decimal)
        {
            Caption = 'Tender Validity in Days';
        }
        field(13; "Financial Year"; Text[100])
        {
            Caption = 'Financial Year';
        }
        field(14; "Preference & Reserve Scheme"; Text[100])
        {
            Caption = 'Preference & Reserve Scheme';
        }
        field(15; "Public Link"; Text[250])
        {
            Caption = 'Public Link';
        }
        field(16; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Document Date" := Today;
    end;
}
