
table 56070 "ICT Maintenance Schedule"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Year Code"; Code[50])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
        }
        field(4; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(5; "Document Date"; Date)
        {
            Editable = false;
        }
        field(6; "No. Series"; Code[10])
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
            ICT.Get;
            ICT.TestField(ICT."ICT Maintenance Schedule Nos.");
            NoSeriesMgt.InitSeries(ICT."ICT Maintenance Schedule Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
        "Document Date" := Today;
        "Created By" := UserId;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ICT: Record "ICT Helpdesk Global Parameters";
}

