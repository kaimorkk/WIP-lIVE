Table 52194043 "Job Families"
{
    DrillDownPageID = "Job Families";
    LookupPageID = "Job Families";

    fields
    {
        field(1;"Category Code";Code[30])
        {
        }
        field(2;Description;Text[80])
        {
            TableRelation = "Grade Identifier Tables";
        }
    }

    keys
    {
        key(Key1;"Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Category Code",Description)
        {
        }
    }
}

