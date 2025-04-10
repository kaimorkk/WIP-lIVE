Table 52193915 "Disciplinary Cases1"
{
    LookupPageID = "Disciplinary Cases";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[200])
        {
        }
        field(3;Rating;Code[50])
        {
            TableRelation = "Disciplinary Case Ratings1".Code;
        }
        field(4;Comments;Text[200])
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

