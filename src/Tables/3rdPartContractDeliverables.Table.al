Table 52193978 "3rd Part Contract Deliverables"
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
          VendorDeliverables.Reset;
          VendorDeliverables.SetRange(VendorDeliverables."Contract Code","Contract Code");
          if VendorDeliverables.Find('+') then
           No:=VendorDeliverables.No+1;
    end;

    var
        VendorDeliverables: Record "3rd Part Contract Deliverables";
}

