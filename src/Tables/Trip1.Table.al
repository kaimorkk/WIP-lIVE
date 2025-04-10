Table 52193945 Trip1
{
    DrillDownPageID = "Trip Listing";
    LookupPageID = "Trip Listing";

    fields
    {
        field(1;"Trip No.";Code[20])
        {
        }
        field(2;Type;Option)
        {
            OptionMembers = "Local",Overseas;
        }
        field(3;"Planned Departure date";Date)
        {
        }
        field(4;"Planned Return Date";Date)
        {
        }
        field(5;Country;Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(6;"Trip Creation Date";Date)
        {
        }
        field(7;"Trip Creation Time";Time)
        {
        }
        field(8;"Created By";Code[10])
        {
        }
        field(9;Status;Option)
        {
            OptionMembers = Open,"Approval Request",Approved;
        }
        field(10;"Distance (Km)";Decimal)
        {
        }
        field(11;"Mode of Transport Desired";Code[10])
        {
        }
        field(12;Destination;Text[30])
        {
        }
        field(13;City;Code[10])
        {
            TableRelation = "Post Code";
        }
    }

    keys
    {
        key(Key1;"Trip No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

