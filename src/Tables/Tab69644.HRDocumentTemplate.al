
table 69644 "HR Document Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
        }
        field(2; Description; Text[150])
        {
        }
        field(3; "Effective Date"; Date)
        {
        }
        field(4; Blocked; Boolean)
        {
        }
        field(5; "No. Series"; Code[10])
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
            HumanResourcesSetup.Get;
            // HumanResourcesSetup.TestField("HR Template Nos.");
            // NoSeriesMgt.InitSeries(HumanResourcesSetup."HR Template Nos.", xRec."No. Series", 0D, "Template ID", "No. Series");
        end;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

