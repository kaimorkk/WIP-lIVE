
table 69551 "Succession Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions"."Position ID" where(Blocked = const(false));

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Position ID", "Position ID");
                if CompanyPositions.FindSet then
                    Description := CompanyPositions."Job Title" + ' Succession Template';
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Created By"; Code[30])
        {
        }
        field(5; "Document Date"; Date)
        {
        }
        field(6; Blocked; Boolean)
        {
        }
        field(7; "No. Series"; Code[30])
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
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Succession Template Nos");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Succession Template Nos", xRec."No. Series", 0D, Code, "No. Series");
        end;
        "Created By" := UserId;
        "Document Date" := Today;

    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        CompanyPositions: Record "Company Positions";
}

