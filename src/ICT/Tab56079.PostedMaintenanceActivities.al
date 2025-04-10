
table 56079 "Posted Maintenance Activities"
{
    DrillDownPageID = "ICT Maintenance Activities";
    LookupPageID = "ICT Maintenance Activities";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            TableRelation = "Maintenance Activities".Code where("Document No" = field("Maintenance Schedule"),
                                                                 "Maintenance Code" = field("Maintenance Area"));

            trigger OnValidate()
            begin
                // MaintenanceActivities.RESET;
                // MaintenanceActivities.SETRANGE("Document No","Maintenance Schedule");
                // MaintenanceActivities.SETRANGE("Maintenance Code","Maintenance Area");
                // MaintenanceActivities.SETRANGE(Code,Code);
                // IF MaintenanceActivities.FINDSET THEN
                //  Activity:=MaintenanceActivities.Activity;
                // Type:=MaintenanceActivities.Type;
            end;
        }
        field(2; Activity; Text[250])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = 'Preventive,Corrective';
            OptionMembers = Preventive,Corrective;
        }
        field(4; "Document No"; Code[50])
        {
        }
        field(5; "Maintenance Area"; Code[50])
        {

            trigger OnValidate()
            begin
                // ICTMaintenanceAreas.RESET;
                // ICTMaintenanceAreas.SETRANGE(Code,"Maintenance Area");
                // IF ICTMaintenanceAreas.FINDSET THEN
                //  Description:=ICTMaintenanceAreas.Description;
                // "Inventory Category":=ICTMaintenanceAreas."Inventory  Category";
            end;
        }
        field(6; "ICT Inventory No."; Code[50])
        {

            trigger OnValidate()
            begin
                // ICTMaintenanceInventory.RESET;
                // ICTMaintenanceInventory.SETRANGE("Document No","Maintenance Schedule");
                // ICTMaintenanceInventory.SETRANGE("Mainatenance Code","Maintenance Area");
                // ICTMaintenanceInventory.SETRANGE("ICT Inventory","ICT Inventory No.");
                // IF ICTMaintenanceInventory.FINDSET THEN
                //  Description:=ICTMaintenanceInventory.Description;
                // "Inventory Category":=ICTMaintenanceInventory."ICT Category";
                // ICTMaintenanceSchedule.RESET;
                // ICTMaintenanceSchedule.SETRANGE(Code,"Maintenance Schedule");
                // IF ICTMaintenanceSchedule.FINDSET THEN
                //  "Year Code":=ICTMaintenanceSchedule."Year Code";
                // ICTInventory.RESET;
                // ICTInventory.SETRANGE(Code,"ICT Inventory No.");
                // IF ICTInventory.FINDSET THEN
                //  Brand:=ICTInventory.Brand;
                // "Serial No.":=ICTInventory."Serial No.";
                // "Tag No":=ICTInventory."Tag No";
            end;
        }
        field(7; "Maintenance Schedule"; Code[50])
        {
        }
        field(8; Status; Option)
        {
            OptionCaption = 'Done,Not Done,Pending';
            OptionMembers = Done,"Not Done",Pending;
        }
        field(9; Comments; Text[500])
        {
        }
        field(13; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(14; "Maintenance Period"; Integer)
        {

            trigger OnValidate()
            begin
                // MaintenancePeriods.RESET;
                // MaintenancePeriods.SETRANGE("Entry No","Maintenance Period");
                // IF MaintenancePeriods.FINDSET THEN BEGIN
                //  Period:=MaintenancePeriods.Description;
                //  "Period Date":=MaintenancePeriods.Period;
                //  END;
            end;
        }
        field(15; Period; Text[50])
        {
        }
        field(16; "Period Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Activity)
        {
        }
    }

    var
        MaintenanceActivities: Record "Maintenance Activities";
}

