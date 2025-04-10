
table 80023 "Situational Analysis Aspects"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Analysis Model ID"; Code[30])
        {
            TableRelation = "Situational Analysis Model";
        }
        field(2; Perspective; Code[100])
        {
        }
        field(3; Description; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Analysis Model ID", Perspective)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

