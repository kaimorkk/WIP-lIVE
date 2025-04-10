Table 52193742 "Committee Type1"
{
    DrillDownPageID = "Commettee List";
    LookupPageID = "Commettee List";

    fields
    {
        field(1;"Committee Code";Code[20])
        {
        }
        field(2;"Committee Name";Text[100])
        {
        }
        field(3;"Commitee Description";Text[100])
        {
        }
        field(4;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Committee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

          if "Committee Code" ='' then begin
          MarketingSetup.Get();
          MarketingSetup.TestField("Committee Nos");
         NoSeriesMngt.InitSeries(MarketingSetup."Committee Nos",xRec."Committee Code",0D,"Committee Code","No. Series");
          end;
    end;

    var
        MarketingSetup: Record "Marketing Setup";
        NoSeriesMngt: Codeunit NoSeriesManagement;
}

