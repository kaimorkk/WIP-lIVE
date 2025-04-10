
table 69554 "Succession Plan Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(4; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(5; "Created By"; Code[50])
        {
        }
        field(6; "Document Date"; Date)
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(8; "No. Series"; Code[30])
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
        // if Code = '' then begin
        //     HumanResourcesSetup.Get;
        //     HumanResourcesSetup.TestField("Succession Plan Nos");
        //     NoSeriesManagement.InitSeries(HumanResourcesSetup."Succession Plan Nos", xRec."No. Series", 0D, Code, "No. Series");
        // end;
        "Created By" := UserId;
        "Document Date" := Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        CompanyPositions: Record "Company Positions";
}

