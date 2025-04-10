Table 52194058 "Service Intervals"
{
    DrillDownPageID = "Service Intervals";
    LookupPageID = "Service Intervals";

    fields
    {
        field(1;"Service Interval Code";Code[20])
        {
        }
        field(2;"Service Interval Description";Text[50])
        {
        }
        field(3;"Asset Class Code";Code[20])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(4;"Service Interval Type";Option)
        {
            OptionCaption = ' ,Mileage,Periodical';
            OptionMembers = " ",Mileage,Periodical;
        }
        field(5;"Service Period";DateFormula)
        {
        }
        field(6;"Service Mileage";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Service Interval Code","Asset Class Code","Service Interval Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

