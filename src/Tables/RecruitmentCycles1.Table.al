Table 52194055 "Recruitment Cycles1"
{
    DrillDownPageID = "Recruitment Cycles";
    LookupPageID = "Recruitment Cycles";

    fields
    {
        field(1;"Cycle Code";Code[30])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Starting Date";Date)
        {
        }
        field(4;"Ending Date";Date)
        {
        }
        field(5;"Recruitment Agent";Code[30])
        {
            TableRelation = Vendor;
        }
    }

    keys
    {
        key(Key1;"Cycle Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Cycle Code",Description,"Starting Date","Ending Date","Recruitment Agent")
        {
        }
    }
}

