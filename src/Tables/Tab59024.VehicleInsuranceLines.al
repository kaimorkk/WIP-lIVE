
table 59024 "Vehicle Insurance Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Insurance No"; Code[20])
        {
        }
        field(12; "Insurance Type"; Code[10])
        {
            Caption = 'Insurance Type';
            TableRelation = "Insurance Type";
        }
        field(15; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(16; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";
        }
        field(17; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
        }
        field(59000; "FA No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "Fleet Vehicles."."No.";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange("No.", "FA No.");
                if FleetVehicles.FindFirst then begin
                    "Registration No." := FleetVehicles."Registration No.";
                    "Vehicle Description" := FleetVehicles.Description;
                    Make := FleetVehicles.Make;
                    Model := FleetVehicles.Model;
                    Type := FleetVehicles.Type;
                end;
                if FixedAsset.Get("FA No.") then begin
                    "FA Class Code" := FixedAsset."FA Class Code";
                    "FA Location Code" := FixedAsset."FA Location Code";
                    "FA Subclass Code" := FixedAsset."FA Subclass Code";
                end;
            end;
        }
        field(59001; "Registration No."; Code[10])
        {
            NotBlank = true;
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange(FleetVehicles."Registration No.", "Registration No.");
                if FleetVehicles.FindFirst then begin
                    // "Registration No." := FleetVehicles."Registration No.";
                    "Vehicle Description" := FleetVehicles.Description;
                    Make := FleetVehicles.Make;
                    Model := FleetVehicles.Model;
                    "FA No." := FleetVehicles."No.";
                    Type := FleetVehicles.Type;
                    if FixedAsset.Get(FleetVehicles."No.") then begin
                        "FA Class Code" := FixedAsset."FA Class Code";
                        "FA Location Code" := FixedAsset."FA Location Code";
                        "FA Subclass Code" := FixedAsset."FA Subclass Code";
                    end;
                end;
            end;
        }
        field(59002; "Vehicle Description"; Text[30])
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
        field(59004; Type; Option)
        {
            OptionMembers = " ",Vehicle,Machinery;
        }
        field(59005; Make; Code[10])
        {
            TableRelation = "Vehicle Make".Code;
        }
        field(59006; Model; Code[10])
        {
            TableRelation = "Vehicle Model".Code;
        }
        field(59010; "Your Estimated Cost Value(Ksh)"; Decimal)
        {
        }
        field(59011; "Entertainment Equipmemt"; Decimal)
        {
        }
        field(59012; "Windscreen Value"; Decimal)
        {
        }
        field(59013; "Basic Premium Per Vehicle"; Decimal)
        {
        }
        field(59014; "Engine No"; Text[30])
        {
        }
        field(59015; "Chassis Noi"; Text[30])
        {
        }
        field(59016; "Year of Manufacture"; Text[30])
        {
        }
        field(59017; "Seat Capacity"; Text[30])
        {
        }
        field(59018; "Type of Body"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Insurance No", "FA No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CommentLine: Record "Comment Line";
        FASetup: Record "FA Setup";
        Insurance: Record Insurance;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FAMoveEntries: Codeunit "FA MoveEntries";
        DimMgt: Codeunit DimensionManagement;
        FleetVehicles: Record "Fleet Vehicles.";
        FixedAsset: Record "Fixed Asset";
}

