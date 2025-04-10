
table 69146 "Appraisal Grades"
{
    DataClassification = CustomerContent;
    // LookupPageID = UnknownPage69186;

    fields
    {
        field(1; Grade; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Points; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; Grade)
        {
            Clustered = true;
        }
        key(Key2; Points)
        {
        }
    }

    fieldgroups
    {
    }
}

