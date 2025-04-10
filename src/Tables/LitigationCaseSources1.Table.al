Table 52193711 "Litigation Case Sources1"
{
    DrillDownPageID = "Litigation sources list";
    LookupPageID = "Litigation sources list";

    fields
    {
        field(1;"Litigation Source code";Code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                if "Litigation Source code" <> "Litigation Source code" then begin
                  SalesSetup.Get;
                  NoSeriesMgt.TestManual(SalesSetup."Litigation source code");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Litigation Source Description";Text[80])
        {
            NotBlank = true;
        }
        field(5;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(103;"Home Page";Text[80])
        {
            Caption = 'Home Page';
        }
    }

    keys
    {
        key(Key1;"Litigation Source code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Litigation Source code" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("Litigation source code");
          NoSeriesMgt.InitSeries(SalesSetup."Litigation source code",xRec."Litigation Source code",0D,"Litigation Source code",
          "No. Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

