table 50432 Village
{
    Caption = 'Village';
    DataClassification = ToBeClassified;
    DrillDownPageId = Village;
    LookupPageId = Village;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Village';
            DataClassification = CustomerContent;
        }
        field(2; Ward; Code[20])
        {
            Caption = 'Ward';
            TableRelation = Ward.Code;
            DataClassification = CustomerContent;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(4; "SUb County"; Code[20])
        {
            Caption = 'Sub County';
            DataClassification = CustomerContent;
            TableRelation = "Sub County".Code;
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
        key(PK; Code, Ward, "SUb County", County)
        {
            Clustered = true;
        }
    }
}
