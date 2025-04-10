table 50125 "Sub County"
{
    Caption = 'Sub County';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Sub County";
    LookupPageId = "Sub County";

    fields
    {
        field(1; County; Code[20])
        {
            Caption = 'County';
            TableRelation = County.Code;
        }
        field(2; Code; Code[20])
        {
            Caption = 'Sub County';
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; County, Code)
        {
            Clustered = true;
        }
    }
}
