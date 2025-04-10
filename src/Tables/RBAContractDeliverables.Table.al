Table 52193975 "RBA Contract Deliverables"
{

    fields
    {
        field(1;No;Integer)
        {
            AutoIncrement = false;
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"Contract Code";Code[20])
        {
            TableRelation = Contract."Contract No";

            trigger OnValidate()
            begin
                /*
                IF "Conveyance Code" <> xRec."Conveyance Code" THEN BEGIN
                  SalesSetup.GET;
                  NoSeriesMgt.TestManual(SalesSetup."Conveyance Nos");
                  "No. Series" := '';
                END;
                */

            end;
        }
    }

    keys
    {
        key(Key1;No,"Contract Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
          RBADeliverables.Reset;
          RBADeliverables.SetRange(RBADeliverables."Contract Code","Contract Code");
          if RBADeliverables.Find('+') then
           No:=RBADeliverables.No+1;
    end;

    var
        RBADeliverables: Record "RBA Contract Deliverables";
}

