
table 69405 "Evacuation Event Drill Criteri"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Event ID"; Code[20])
        {
            TableRelation = "Evacuation Event".Code;
        }
        field(2; "Code"; Code[20])
        {
        }
        field(3; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Event ID", "Code")
        {
            Clustered = true;
        }
        ////  key(Key2;'')
        ////  {
        //  //      Enabled = false;
        //  //  }
    }

    fieldgroups
    {
    }
}

