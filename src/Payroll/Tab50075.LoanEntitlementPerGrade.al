table 52193425 "Loan Entitlement Per Grade"
{
    Caption = 'Loan Entitlement Per Grade';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Loan Code"; Code[20])
        {
            Caption = 'Loan Code';
            TableRelation = "Loan Product Type";
        }
        field(2; "Loan Category"; Enum "Loan Category")
        {
            Caption = 'Loan Category';
        }
        field(3; "Job Grade"; Code[20])
        {
            Caption = 'Job Grade';
            TableRelation = "Salary Scales";
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Amount Entitled"; Decimal)
        {
            Caption = 'Amount Entitled';
        }
    }
    keys
    {
        key(PK; "Loan Code", "Loan Category", "Job Grade")
        {
            Clustered = true;
        }
    }
}
