table 50133 Ward
{
    Caption = 'Ward';
    DataClassification = ToBeClassified;
    DrillDownPageId = Ward;
    LookupPageId = Ward;

    fields
    {
        field(1; "Sub County"; Code[20])
        {
            Caption = 'Sub County';
            DataClassification = CustomerContent;
            TableRelation = "Sub County".Code;
        }
        field(2; Code; Code[20])
        {
            Caption = 'Ward';
            DataClassification = CustomerContent;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(5; County; Code[20])
        {
            Caption = 'County';
            DataClassification = CustomerContent;
            TableRelation = County.Code;
        }
    }
    keys
    {
        key(PK; "Sub County", Code, County)
        {
            Clustered = true;
        }
    }
}
