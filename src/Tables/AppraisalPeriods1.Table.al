Table 52193920 "Appraisal Periods1"
{
    DrillDownPageID = "Appraisal Periods";
    LookupPageID = "Appraisal Periods";

    fields
    {
        field(1;Period;Code[30])
        {
            NotBlank = true;
        }
        field(2;Comments;Text[250])
        {
        }
        field(3;"Start Date";Date)
        {
        }
        field(4;"End Date";Date)
        {
        }
    }

    keys
    {
        key(Key1;Period)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Period,"Start Date","End Date")
        {
        }
    }
}

