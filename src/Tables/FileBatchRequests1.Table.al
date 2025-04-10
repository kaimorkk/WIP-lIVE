Table 52193730 "File Batch Requests1"
{

    fields
    {
        field(1;"Request No";Code[20])
        {
            TableRelation = "File Requests1";
        }
        field(2;"File No.";Code[20])
        {
            TableRelation = "File Details1"."File Code";

            trigger OnValidate()
            begin
                   FD.SetCurrentkey(FD."File Code");
                    FD.Get("File No.");
                   "File Name":=FD."File Description";
                   Modify;

                //IF
            end;
        }
        field(3;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(4;"File Name";Text[250])
        {
        }
        field(5;"Issued?";Boolean)
        {
        }
        field(6;Volume;Code[10])
        {
            TableRelation = "File Details1".Volume;
        }
        field(7;"SF No";Code[30])
        {
        }
    }

    keys
    {
        key(Key1;"Request No","File No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Request No"= '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("File Issue No");
          NoSeriesMgt.InitSeries(SalesSetup."File Issue No",xRec."Request No",0D,"Request No","No. Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FD: Record "File Details1";
}

