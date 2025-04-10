
table 80247 "Innovation Rating Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {

            trigger OnValidate()
            begin
                if "Template ID" <> xRec."Template ID" then begin
                    InnovationSetup.Get;
                    NoSeriesMgt.TestManual(InnovationSetup."Inno Template Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[255])
        {
        }
        field(3; "Innovation Category"; Code[30])
        {
            TableRelation = "Innovation Category".Code;
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; Blocked; Boolean)
        {
        }
        field(6; "No. Series"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Template ID" = '' then begin
            InnovationSetup.Get;
            InnovationSetup.TestField("Inno Template Nos");
            NoSeriesMgt.InitSeries(InnovationSetup."Inno Template Nos", xRec."No. Series", 0D, "Template ID", "No. Series");
        end;
    end;

    var
        InnovationSetup: Record "Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

