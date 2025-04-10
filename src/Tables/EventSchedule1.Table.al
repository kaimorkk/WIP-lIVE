Table 52193817 "Event Schedule1"
{

    fields
    {
        field(1; "Venue Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Venue Date" = 0D then
                    Error('The date must not be blank');
            end;
        }
        field(2; "Venue Code"; Code[10])
        {
            TableRelation = "Event Venues1";

            trigger OnValidate()
            begin

                venue.Get("Venue Code");
                "Venue description" := venue."Venue Description";
            end;
        }
        field(3; "Timing Code"; Code[10])
        {
            // //TableRelation = Table59114;
        }
        field(4; "Event Code"; Code[10])
        {
            TableRelation = Campaign;

            trigger OnValidate()
            begin
                if Events.Get("Event Code") then
                    xRec."Event Description" := Events.Description;
            end;
        }
        field(5; "Venue description"; Text[30])
        {
        }
        field(6; "Event Description"; Text[30])
        {
        }
        field(7; "Date filter"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Venue Date", "Venue Code", "Timing Code", "Event Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        venue: Record "Event Venues1";
        Events: Record Campaign;
}

