Table 52193720 "vehicle usage1"
{
    //DrillDownPageID = UnknownPage51039;
    //LookupPageID = UnknownPage51039;

    fields
    {
        field(1; "Trip No."; Code[10])
        {
        }
        field(2; "Vehicle ID"; Code[10])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                FA.Get("Vehicle ID");
                "Vehicle description" := FA.Description + ' ' + FA."Serial No.";
            end;
        }
        field(3; SpeedometerStart; Decimal)
        {

            trigger OnValidate()
            begin
                "Total KMS" := SpeedometerEnd - SpeedometerStart;
            end;
        }
        field(4; SpeedometerEnd; Decimal)
        {

            trigger OnValidate()
            begin
                "Total KMS" := SpeedometerEnd - SpeedometerStart;
            end;
        }
        field(5; "Total KMS"; Decimal)
        {
        }
        field(6; "Time IN"; Time)
        {
        }
        field(7; "Time OUT"; Time)
        {
        }
        field(8; "Date IN"; Date)
        {
        }
        field(12; "Purpose of the Journey"; Text[100])
        {
        }
        field(13; Employee; Code[10])
        {
            TableRelation = Employee;
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Date OUT"; Date)
        {
        }
        field(16; "Vehicle description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Trip No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Trip No." = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField("Trip Nos");
            NoSeriesMgt.InitSeries(SalesSetup."Trip Nos", xRec."Trip No.", 0D, "Trip No.", "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
        FA: Record "Fixed Asset";
}

