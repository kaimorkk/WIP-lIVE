Table 52193663 "Approval Stages"
{
    // //DrillDownPageID = UnknownPage53531;
    // //LookupPageID = UnknownPage53531;

    fields
    {
        field(1; "Approval Template"; Code[20])
        {
            //TableRelation = "Approval Templates";
        }
        field(2; "Approval Stage"; Code[20])
        {
        }
        // field(3;"Documents Required";Integer)
        // {
        //     CalcFormula = count(Table53521 where (Field1=field("Approval Stage"),
        //                                           Field5=field("Approval Template"),
        //                                           Field8=field("Exit Reason Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(4; "Approval Stage Name"; Text[100])
        {
        }
        field(5; "Exit Reason Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Approval Template", "Approval Stage")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

