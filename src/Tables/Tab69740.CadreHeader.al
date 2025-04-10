
table 69740 "Cadre Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[2000])
        {
        }
        field(3; "Default Position"; Code[20])
        {
            TableRelation = "Cadre Position Lines"."Job ID" where("Cadre Code" = field(Code));
        }
        field(4; "No of Active Employees"; Integer)
        {
        }
        field(7; "Job Grade ID"; Code[30])
        {
            CalcFormula = lookup("Company Positions"."Job Grade ID" where("Position ID" = field("Default Position")));
            FieldClass = FlowField;
            TableRelation = "Salary Scales";
        }
        field(8; "Designation Group"; Code[30])
        {
            CalcFormula = lookup("Company Positions"."Designation Group" where("Position ID" = field("Default Position")));
            FieldClass = FlowField;
            TableRelation = "Designation Groups";
        }
        field(12; Directorate; Code[30])
        {
            CalcFormula = lookup("Company Positions".Directorate where("Position ID" = field("Default Position")));
            FieldClass = FlowField;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                "Blocked?" = const(false));
        }
        field(13; Department; Code[30])
        {
            CalcFormula = lookup("Company Positions".Department where("Position ID" = field("Default Position")));
            FieldClass = FlowField;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                "Blocked?" = const(false));
        }
        field(14; "No. Series"; Code[20])
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
            HumanResourcesSetup.TestField("Cadre  Nos.");
            NoSeriesMgt.InitSeries(HumanResourcesSetup."Cadre  Nos.", xRec.Code, 0D, Code, "No. Series");
        end;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

