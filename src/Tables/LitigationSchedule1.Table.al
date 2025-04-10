Table 52193718 "Litigation Schedule1"
{
    DrillDownPageID = "Litigation Schedule";
    LookupPageID = "Litigation Schedule";

    fields
    {
        field(1;"Litigation schedule code";Code[20])
        {

            trigger OnValidate()
            begin
                /*IF "Litigation schedule code" <> "Litigation schedule code" THEN BEGIN
                  SalesSetup.GET;
                  NoSeriesMgt.TestManual(SalesSetup."Litigation Sch. Nos.");
                  "No. Series" := '';
                END;
                 */

            end;
        }
        field(2;"Hearing Date";Date)
        {

            trigger OnValidate()
            begin
                Notification.Get;
                "One Month Notice":=CalcDate(Notification."One Month Notice","Hearing Date");
                "Two Month Notice":=CalcDate(Notification."Tow Months Notice","Hearing Date");
                "Tow Weeks Notice":=CalcDate(Notification."Two Weeks Notice","Hearing Date");
            end;
        }
        field(3;Time;Time)
        {
        }
        field(4;"Litigation Code";Code[50])
        {
            TableRelation = Litigations1;
        }
        field(5;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(6;Venue;Text[100])
        {
        }
        field(7;Details;Text[250])
        {
        }
        field(8;Status;Option)
        {
            OptionCaption = '    ,New,Names Of Witnesses,Priliminaries,Hearing,Part Heard,Adjournment,Judgement/Order,Appeal,Lega Fees Statement,Clossed';
            OptionMembers = "    ",New,"Names Of Witnesses",Priliminaries,Hearing,"Part Heard",Adjournment,"Judgement/Order",Appeal,"Lega Fees Statement",Clossed;
        }
        field(9;Witness;Text[250])
        {
        }
        field(10;Status1;Blob)
        {
        }
        field(11;"One Month Notice";Date)
        {
        }
        field(12;"Two Month Notice";Date)
        {
        }
        field(13;"Tow Weeks Notice";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Litigation schedule code","Litigation Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Litigation schedule code" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("Litigation Sch. Nos.");
          NoSeriesMgt.InitSeries(SalesSetup."Litigation Sch. Nos.",xRec."Litigation schedule code",0D,"Litigation schedule code",
          "No. Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Notification: Record "Notification Dates1";
}

