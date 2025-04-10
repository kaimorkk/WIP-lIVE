Table 52193721 "File Types1"
{
    DrillDownPageID = "File Types list";
    LookupPageID = "File Types list";

    fields
    {
        field(1;"Type Code";Code[50])
        {
            NotBlank = false;
        }
        field(2;Description;Text[80])
        {
        }
        field(5;"No. Series";Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(6;Files;Integer)
        {
            CalcFormula = count("File Details1" where ("First Category"=field("Type Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Type Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if "Type Code" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField(Files);
          NoSeriesMgt.InitSeries(SalesSetup.Files,xRec."No. Series",0D,"Type Code","No. Series");
        end;
    end;

    var
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Users: Record "User Setup";
}

