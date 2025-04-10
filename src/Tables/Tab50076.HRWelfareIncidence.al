table 50076 "HR Welfare Incidence"
{
    Caption = 'HR Welfare Incidence';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Incidence No"; Code[20])
        {
            Caption = 'Incidence No';
            Editable = false;
            trigger OnValidate()
            begin
                if "Incidence No" <> xRec."Incidence No" then begin
                    HumanResSetup.Get();
                    NoSeriesMgt.TestManual(HumanResSetup."Incidences Nos");

                end;
            end;
        }
        field(2; "Incidence Type"; Option)
        {
            Caption = 'Incidence Type';
            OptionMembers = GPA,GLA;
        }
        field(3; Incidence; Code[20])
        {
            TableRelation = "Incident Category".Code where("Incidence Type" = field("Incidence Type"));
            Caption = 'Incidence';
            // TableRelation = "Incident Category";

        }
        field(4; "Incidence Date"; Date)
        {
            Caption = 'Incidence Date';
        }
        field(5; "Incidence Time"; Time)
        {
            Caption = 'Incidence Time';
        }
        field(6; "Affected Employee"; Code[20])
        {
            Caption = 'Affected Employee';
            TableRelation = Employee."No.";
            trigger OnValidate()
            Var
                HREmp: Record Employee;
            begin
                if HREmp.Get("Affected Employee") then
                    "Employee Name" := HREmp.FullName();
                "Duty Station" := HREmp."Current Duty Station";

            end;
        }
        field(7; "Employee Name"; Text[200])
        {
            Caption = 'Employee Name';
        }
        field(8; "Duty Station"; Code[20])
        {
            Caption = 'Duty Station';
            TableRelation = "Duty Station";
        }
        field(9; "Action Taken"; Text[200])
        {
            Caption = 'Action Taken';
        }
        field(10; "Incidence Status"; Option)
        {
            Caption = 'Incidence Status';
            OptionMembers = Open,"Under Review",Closed;
        }
        field(11; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(12; "No of Sick off days"; Integer)
        {
            trigger OnValidate()
            begin
                if SalCard.Get("Affected Employee") then
                    Amount := SalCard."Basic Pay" * "No of Sick off days" * 12 / 364;
            end;

        }
        field(13; "Percentage of Disability"; Decimal)
        {
            trigger OnValidate()
            begin
                if SalCard.Get("Affected Employee") then
                    Amount := SalCard."Basic Pay" * "Percentage of Disability" * 36 / 364;
            end;
        }
        field(14; "Amount"; Decimal)
        {
            trigger OnValidate()
            begin

            end;
        }
        field(15; "Injury Type"; Option)
        {
            OptionMembers = "",Normal,Permanent;
        }

    }
    keys
    {
        key(PK; "Incidence No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "Incidence No" = '' then begin
            HumanResSetup.Get;
            HumanResSetup.TestField(HumanResSetup."Incidences Nos");
            NoSeriesMgt.InitSeries(HumanResSetup."Incidences Nos", xRec."No. Series", 0D, "Incidence No", "No. Series");
        end;

    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalCard: Record "PR Salary Card";
}
