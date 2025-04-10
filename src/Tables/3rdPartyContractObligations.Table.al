Table 52193977 "3rd Party Contract Obligations"
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
          VendorObligations.Reset;
          VendorObligations.SetRange(VendorObligations."Contract Code","Contract Code");
          if VendorObligations.Find('+') then
           No:=VendorObligations.No+1;
    end;

    var
        VendorObligations: Record "3rd Party Contract Obligations";
}

