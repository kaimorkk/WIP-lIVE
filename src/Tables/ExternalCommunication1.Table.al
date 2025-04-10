Table 52193741 "External Communication1"
{

    fields
    {
        field(1;"Reference No.";Code[20])
        {
        }
        field(2;Subject;Text[100])
        {
        }
        field(3;Date;Date)
        {
        }
        field(4;Time;Time)
        {
        }
        field(5;"Language Code(Default)";Text[30])
        {
        }
        field(6;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(7;Receipient;Text[30])
        {
        }
        field(8;Attachment;Option)
        {
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
    }

    keys
    {
        key(Key1;"Reference No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

          if "Reference No." ='' then begin
          MarketingSetup.Get();
          MarketingSetup.TestField("ExternalCom Nos");
         NoSeriesMngt.InitSeries(MarketingSetup."ExternalCom Nos",xRec."Reference No.",0D,"Reference No.","No. Series");
          end;
    end;

    var
        MarketingSetup: Record "Marketing Setup";
        NoSeriesMngt: Codeunit NoSeriesManagement;
}

