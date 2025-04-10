Table 52193442 "SMS Batches"
{

    fields
    {
        field(1;"Batch No";Code[20])
        {
        }
        field(2;Description;Text[250])
        {
        }
        field(3;Status;Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(4;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(5;"No of Valid SMS";Integer)
        {
            CalcFormula = count(SMS where ("Batch No"=field("Batch No"),
                                           Sent=const(true)));
            FieldClass = FlowField;
        }
        field(6;"No of Invalid SMS";Integer)
        {
            CalcFormula = count(SMS where ("Batch No"=field("Batch No"),
                                           PHONENO=filter('+234'|'+2340')));
            FieldClass = FlowField;
        }
        field(7;"SMS Vendor";Code[20])
        {
            TableRelation = "SMS Setup";
        }
        field(8;"SMS Count";Integer)
        {
            CalcFormula = count(SMS where ("Batch No"=field("Batch No")));
            FieldClass = FlowField;
        }
        field(9;"Assigned User";Code[50])
        {
            TableRelation = "User Setup";
        }
        field(10;Sent;Boolean)
        {
            CalcFormula = lookup(SMS.Sent where ("Batch No"=field("Batch No")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Batch No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

