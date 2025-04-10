
table 56076 "Maintenance Lines"
{

    fields
    {
        field(1; "Document No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Maintenance Area"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Maintenance Lines"."Maintenance Area" where("Document No" = field("Maintenance Schedule"));

            trigger OnValidate()
            begin
                // ICTMaintenanceAreas.RESET;
                // ICTMaintenanceAreas.SETRANGE(Code,"Maintenance Area");
                // IF ICTMaintenanceAreas.FINDSET THEN
                //  Description:=ICTMaintenanceAreas.Description;
                // "Inventory Category":=ICTMaintenanceAreas."Inventory  Category";
            end;
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Inventory Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset subcategory".Code;
        }
        field(5; "Maintenance Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preventive,Corrective';
            OptionMembers = Preventive,Corrective;
        }
        field(6; "Year Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
        }
        field(7; "Maintenance Schedule"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "ICT Inventory No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Maintenance Inventory"."ICT Inventory" where("Document No" = field("Maintenance Schedule"),
                                                                               "Mainatenance Code" = field("Maintenance Area"));

            trigger OnValidate()
            begin
                ICTMaintenanceInventory.Reset;
                ICTMaintenanceInventory.SetRange("Document No", "Maintenance Schedule");
                ICTMaintenanceInventory.SetRange("Mainatenance Code", "Maintenance Area");
                ICTMaintenanceInventory.SetRange("ICT Inventory", "ICT Inventory No.");
                if ICTMaintenanceInventory.FindSet then
                    Description := ICTMaintenanceInventory.Description;
                "Inventory Category" := ICTMaintenanceInventory."ICT Category";
                ICTMaintenanceSchedule.Reset;
                ICTMaintenanceSchedule.SetRange(Code, "Maintenance Schedule");
                if ICTMaintenanceSchedule.FindSet then
                    "Year Code" := ICTMaintenanceSchedule."Year Code";
                ICTInventory.Reset;
                ICTInventory.SetRange(Code, "ICT Inventory No.");
                if ICTInventory.FindSet then
                    Brand := ICTInventory.Brand;
                "Serial No." := ICTInventory."Serial No.";
                "Tag No" := ICTInventory."Tag No";
            end;
        }
        field(9; Brand; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Brands".Code;
        }
        field(10; "Serial No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Tag No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "ICT Sub Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset subcategory".Code where("Asset Category" = field("Inventory Category"));
        }
        field(13; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(14; "Maintenance Period"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Maintenance Periods"."Entry No" where("Maintenance Code" = field("Maintenance Area"),
                                                                    "Document No" = field("Maintenance Schedule"));

            trigger OnValidate()
            begin
                MaintenancePeriods.Reset;
                MaintenancePeriods.SetRange("Entry No", "Maintenance Period");
                if MaintenancePeriods.FindSet then begin
                    Period := MaintenancePeriods.Description;
                    "Period Date" := MaintenancePeriods.Period;
                end;
            end;
        }
        field(15; Period; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Period Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Maintenance Schedule", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTMaintenanceAreas: Record "ICT Maintenance Areas";
        ICTMaintenanceInventory: Record "ICT Maintenance Inventory";
        ICTMaintenanceSchedule: Record "ICT Maintenance Schedule";
        ICTInventory: Record "ICT Inventory";
        MaintenancePeriods: Record "Maintenance Periods";
}

