table 50097 "Appraisal Award Types"
{
    Caption = 'Appraisal Award Types';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}
