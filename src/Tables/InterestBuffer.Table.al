Table 52193511 "Interest Buffer"
{
    DrillDownPageID = "Interest Earned";
    LookupPageID = "Interest Earned";

    fields
    {
        field(1;No;Integer)
        {
            AutoIncrement = false;
        }
        field(2;"Account No";Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(3;"Account Type";Code[20])
        {
        }
        field(4;"Interest Date";Date)
        {
        }
        field(5;"Interest Amount";Decimal)
        {
        }
        field(6;"User ID";Code[20])
        {
        }
        field(8;"Account Matured";Boolean)
        {
        }
        field(9;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10;"Late Interest";Boolean)
        {
        }
        field(11;Transferred;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;No,"Account No")
        {
            Clustered = true;
        }
        key(Key2;"Account No",Transferred)
        {
            SumIndexFields = "Interest Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        /*
          IF No = '' THEN BEGIN
          NoSetup.GET(0);
          NoSetup.TESTFIELD(NoSetup."Interest Buffer No");
          NoSeriesMgt.InitSeries(NoSetup."Interest Buffer No",xRec."No. Series",0D,No,"No. Series");
          END;
        */

    end;

    var
        NoSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

