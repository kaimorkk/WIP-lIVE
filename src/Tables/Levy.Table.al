Table 52193990 Levy
{
    DrillDownPageID = "Levy List";
    LookupPageID = "Levy List";

    fields
    {
        field(1;LevyNo;Code[10])
        {
        }
        field(3;LevyTypeCode;Code[20])
        {
            TableRelation = "Levy Types";
        }
        field(4;Amount;Decimal)
        {
        }
        field(5;DueDate;Date)
        {
        }
        field(6;PostingDate;Date)
        {
        }
        field(7;"AssociatedLevyReference No";Code[20])
        {
        }
        field(8;Date;Date)
        {
        }
        field(9;Name;Text[50])
        {
        }
        field(10;DateFilter;Date)
        {
        }
        field(11;"CustomerNo.";Code[200])
        {
        }
        field(12;"No. Series";Code[10])
        {
        }
        field(13;"Amount Paid";Decimal)
        {
            CalcFormula = -sum("G/L Entry".Amount);
            FieldClass = FlowField;
        }
        field(14;UserID;Text[30])
        {
        }
        field(15;InvoiceNo;Code[20])
        {
        }
        field(16;"Invoice Generated";Boolean)
        {
        }
        field(17;ExpToleranceThreshhold;Decimal)
        {
        }
        field(18;Period;Date)
        {
        }
        field(19;Processed;Boolean)
        {
        }
        field(20;FundValue;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;LevyNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if LevyNo= '' then begin
          SalesSetup.Get;
          SalesSetup.TestField(SalesSetup."Levy Nos");
          NoSeriesMgt.InitSeries(SalesSetup."Levy Nos",xRec."No. Series",0D,LevyNo,"No. Series");
        //"GL Account":=HumanResSetup."Account No (Training)";
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

