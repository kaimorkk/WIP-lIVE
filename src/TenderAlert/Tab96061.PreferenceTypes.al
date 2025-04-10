table 96061 "Preference Types"
{
    Caption = 'Preference Types';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Preference Types";
    LookupPageId = "Preference Types";
    
    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
