Table 52193848 "Salary Scales1"
{
    DrillDownPageID = "Salary Scales List";
    LookupPageID = "Salary Scales List";

    fields
    {
        field(1;Scale;Code[10])
        {
        }
        field(2;"Minimum Pointer";Code[10])
        {
        }
        field(3;"Maximum Pointer";Code[10])
        {
        }
        field(4;"Responsibility Allowance";Decimal)
        {
        }
        field(5;"Commuter Allowance";Decimal)
        {
        }
        field(6;"In Patient Limit";Decimal)
        {
        }
        field(7;"Out Patient Limit";Decimal)
        {
        }
        field(8;"Grade Identifier";Code[20])
        {
            TableRelation = "Grade Identifier Tables";
        }
    }

    keys
    {
        key(Key1;Scale)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Scale,"Minimum Pointer","Maximum Pointer")
        {
        }
    }
}

