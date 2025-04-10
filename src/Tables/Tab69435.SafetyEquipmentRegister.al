
table 69435 "Safety Equipment Register"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Equipment ID"; Code[20])
        {
        }
        field(2; SubType; Option)
        {
            OptionCaption = 'Fixed Asset,Item,Resource';
            OptionMembers = "Fixed Asset",Item,Resource;
        }
        field(3; "SubType No."; Code[20])
        {
            TableRelation = if (SubType = const("Fixed Asset")) "Fixed Asset"."No."
            else
            if (SubType = const(Resource)) Resource."No." where(Type = const(Machine),
                                                                                    Blocked = const(false))
            else
            if (SubType = const(Item)) Item."No.";

            trigger OnValidate()
            begin
                if SubType = Subtype::"Fixed Asset" then begin
                    FixedAssets.Reset;
                    FixedAssets.SetRange("No.", "SubType No.");
                    if FixedAssets.FindSet then
                        Description := FixedAssets.Description;
                    "FA Location Code" := FixedAssets."Location Code";
                    "Maintenance Vendor No." := FixedAssets."Maintenance Vendor No.";
                    "Serial No." := FixedAssets."Serial No.";
                    "Warranty Date" := FixedAssets."Warranty Date";
                    "Next Service Date" := FixedAssets."Next Service Date";
                    Insured := Insured;
                end;

                if SubType = Subtype::Item then begin
                    Items.Reset;
                    Items.SetRange("No.", "SubType No.");
                    if Items.FindSet then
                        Description := Items.Description;
                    Items.CalcFields(Inventory);
                    "Inventory Quantity" := Items.Inventory;
                end;

                if SubType = Subtype::Resource then begin
                    Resources.Reset;
                    Resources.SetRange("No.", "SubType No.");
                    if Resources.FindSet then
                        Description := Resources.Name;
                    //"Fixed Asset/Resource Quantity":=Resources.
                end;
            end;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Safety Equipment Category"; Code[20])
        {
            TableRelation = "HSE Equipment Category".Code;
        }
        field(6; "Safety Notes/Comments"; Text[2048])
        {
        }
        field(7; "FA Location Code"; Code[20])
        {
            TableRelation = "FA Location".Code;
        }
        field(8; "Serial No."; Text[2048])
        {
        }
        field(9; "Next Service Date"; Date)
        {
        }
        field(10; "Inventory Quantity"; Decimal)
        {
        }
        field(110; "Used Quantity"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Incident Equipments"."Used Quantity" where("Equipment ID" = field("Equipment ID")));
        }
        //"Incident Equipments"
        field(11; "Fixed Asset/Resource Quantity"; Integer)
        {
        }
        field(12; "Maintenance Vendor No."; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(13; "Warranty Date"; Date)
        {
        }
        field(14; Insured; Boolean)
        {
        }
        field(15; Lineno; integer)
        {
        }
        field(16; "Document No"; code[50])
        {
        }
        field(70018; "Implementing Unit Code"; Code[50])
        {
            Caption = 'Implementing Unit';
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                if RespC.get("Implementing Unit Code") then
                    "Implementing Unit Name" := RespC.Name;
            end;
        }

        field(70092; "Implementing Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Equipment ID", Lineno)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resources: Record Resource;
        Items: Record Item;
        FixedAssets: Record "Fixed Asset";
}

