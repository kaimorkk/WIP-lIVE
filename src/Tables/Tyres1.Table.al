Table 52193723 Tyres1
{
    //DrillDownPageID = UnknownPage51047;
    //LookupPageID = UnknownPage51047;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; "Fitting Type"; Option)
        {
            OptionMembers = Front,Rear,Spare;
        }
        field(3; "Vehicle code"; Code[10])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                FA.Get("Vehicle code");
                "Vehicle Description" := FA.Description + ' ' + FA."Serial No.";
            end;
        }
        field(4; "Fitting Date"; Date)
        {
        }
        field(5; Employee; Code[10])
        {
            TableRelation = Employee;
        }
        field(6; Comments; Text[100])
        {
        }
        field(14; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(15; "Vehicle Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField("Tyre Nos");
            NoSeriesMgt.InitSeries(SalesSetup."Tyre Nos", xRec.Code, 0D, Code, "No. Series");
            //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
        end;
    end;

    var
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
        FA: Record "Fixed Asset";
}

