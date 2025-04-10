Table 52193698 "Document Management1"
{
    DrillDownPageID = "Document management listing";
    LookupPageID = "Document management listing";

    fields
    {
        field(1;"Folio No.";Code[10])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                /*IF "Folio No." <> "Folio No." THEN BEGIN
                  SalesSetup.GET;
                  NoSeriesMgt.TestManual(SalesSetup.Mail);
                 "No. Series" := '';
                END;
                 */

            end;
        }
        field(2;Description;Text[100])
        {
        }
        field(3;Category;Code[10])
        {
            TableRelation = "Document Types1";
        }
        field(4;"Date Received";Date)
        {
        }
        field(5;"Time Received";Time)
        {
        }
        field(6;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(7;File;Code[20])
        {
            TableRelation = "File Details1";
        }
        field(8;Volume;Code[10])
        {
            TableRelation = "File Details1".Volume;
        }
        field(9;"Available In Registry?";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Folio No.",File,Volume)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*IF "Folio No." = '' THEN BEGIN
          SalesSetup.GET;
          SalesSetup.TESTFIELD(Mail);
          NoSeriesMgt.InitSeries(SalesSetup.Mail,xRec."Folio No.",0D,"Folio No.","No. Series");
        END;
        */

    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Files: Record "File Details1";
}

