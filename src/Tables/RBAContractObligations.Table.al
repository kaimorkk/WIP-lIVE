Table 52193976 "RBA Contract Obligations"
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

          RBAObligations.Reset;
          RBAObligations.SetRange(RBAObligations."Contract Code","Contract Code");
          if RBAObligations.Find('+') then
           No:=RBAObligations.No+1;
    end;

    var
        RBAObligations: Record "RBA Contract Obligations";
}

