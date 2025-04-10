
table 59030 "Vehicle Inspection"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Inspection No."; Code[10])
        {

            trigger OnValidate()
            begin
                if "Inspection No." <> xRec."Inspection No." then
                    NoSeriesMgt.TestManual(FleetManagementSetup."Vehicle Inspection No");
            end;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                /*
                IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
                  "Search Description" := Description;
                IF Description <> xRec.Description THEN BEGIN
                  FADeprBook.SETCURRENTKEY("FA No.");
                  FADeprBook.SETRANGE("FA No.","No.");
                  FADeprBook.MODIFYALL(Description,Description);
                END;
                MODIFY(TRUE);
                */

            end;
        }
        field(3; "Last Inspection Date"; Date)
        {
        }
        field(4; "Last Inspection No."; Code[10])
        {
        }
        field(5; Type; Option)
        {
            Editable = false;
            OptionMembers = " ",Vehicle,Machinery;
        }
        field(6; Make; Code[10])
        {
            TableRelation = "Vehicle Make".Code;
        }
        field(7; Model; Code[10])
        {
            TableRelation = "Vehicle Model".Code;
        }
        field(8; "Registration No."; Code[10])
        {
            NotBlank = true;
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                //"Registration No.":=FA."Serial No.";
                FleetVehicles.Reset;
                FleetVehicles.SetRange("Registration No.", "Registration No.");
                if FleetVehicles.FindFirst then begin
                    Make := FleetVehicles.Make;
                    Model := FleetVehicles.Model;
                    Type := FleetVehicles.Type;
                    Description := FleetVehicles.Description;
                    "Vehicle CC" := FleetVehicles."Vehicle CC";
                    Type := Type::Vehicle;
                end;
            end;
        }
        field(9; "Date of Last Insurance"; Date)
        {
        }
        field(10; "Vehicle CC"; Code[50])
        {
        }
        field(11; "Inspection Status"; Option)
        {
            Editable = false;
            InitValue = "...";
            OptionCaption = 'Passed,Failed,...';
            OptionMembers = Passed,Failed,"...";
        }
        field(12; "Inspection Date"; Date)
        {
        }
        field(13; "Has Speed Governor"; Boolean)
        {
        }
        field(14; Amount; Decimal)
        {
        }
        field(15; "Inspection Center"; Text[100])
        {
        }
        field(16; "No. Series"; Code[10])
        {
        }
        field(17; Posted; Boolean)
        {
        }
        field(18; "Posted By"; Code[50])
        {
        }
        field(19; "Posted On"; DateTime)
        {
        }
        field(20; "Inspection Type"; Option)
        {
            OptionCaption = '...,Commercial Inspection,Disposal,Annual inspection,Purchase';
            OptionMembers = "...","Commercial Inspection",Disposal,"Annual inspection",Purchase;
        }
    }

    keys
    {
        key(Key1; "Inspection No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        FleetManagementSetup.Get;
        if "Inspection No." = '' then
            NoSeriesMgt.InitSeries(FleetManagementSetup."Vehicle Inspection No", xRec."No. Series", 0D, "Inspection No.", "No. Series");
    end;

    var
        FleetManagementSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FleetVehicles: Record "Fleet Vehicles.";
}

