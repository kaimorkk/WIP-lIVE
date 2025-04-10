Table 52193821 "External Visitors1"
{

    fields
    {
        field(1;"Visit ID";Code[20])
        {
        }
        field(2;"Visitors Name";Text[80])
        {
        }
        field(3;"Planned Date";Date)
        {
        }
        field(4;"No. Series";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Visit ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Visit ID" = '' then begin
          RMSetup.Get;
          RMSetup.TestField(RMSetup."ExVisit Nos");
          NoSeriesMgt.InitSeries(RMSetup."ExVisit Nos",xRec."Visit ID",0D,"Visit ID","No. Series");
        end;
    end;

    var
        RMSetup: Record "Marketing Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

