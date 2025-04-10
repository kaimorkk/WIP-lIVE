
table 80211 "BR Response Code"
{
    DrillDownPageID = "BR Response Code";
    LookupPageID = "BR Response Code";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Response Type"; Code[30])
        {
            TableRelation = w.Code;

            trigger OnValidate()
            begin
                if BROptionTextResponseType.Get("Response Type") then begin
                    "Response Code" := BROptionTextResponseType.Code;
                    Description := BROptionTextResponseType.Description;
                    "Rating Type" := BROptionTextResponseType."Rating Type";
                end;
            end;
        }
        field(2; "Response Code"; Code[75])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Rating Type"; Option)
        {
            OptionCaption = 'Number,Yes/No,Options Text';
            OptionMembers = Number,"Yes/No","Options Text";
        }
        field(5; "Score (%)"; Decimal)
        {
        }
        field(6; "Code"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Response Type", "Response Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BROptionTextResponseType: Record w;
}

