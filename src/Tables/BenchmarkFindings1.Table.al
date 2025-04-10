Table 52193736 "Bench mark Findings1"
{

    fields
    {
        field(1;"Activity No";Code[10])
        {
            NotBlank = true;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(3;Findings;Text[100])
        {
        }
        field(5;"No. Series";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Activity No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         /*  IF "Line No" =  THEN BEGIN
          SalesSetup.GET;
          SalesSetup.TESTFIELD("Bench Mark No.");
          NoSeriesMgt.InitSeries(SalesSetup."Bench Mark No.",xRec."Line No",0D,"Line No","No. Series");
          END;
        
          IF BenchMark.GET("Line No") THEN
         "Line No":=BenchMark."Activity No";
                  */

    end;

    var
        BenchMark: Record "Bench Mark1";
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

