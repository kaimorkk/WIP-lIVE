
table 56054 "ICT Officers Category Mapping"
{
    Caption = 'ICT Officers Category Mapping';
    DataCaptionFields = UserName, "Help Desk Category", "Region Name";
    DrillDownPageID = "ICT Helpdesk Office Mapping";
    LookupPageID = "ICT Helpdesk Office Mapping";

    fields
    {
        field(1; UserName; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(2; "Help Desk Category"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Helpdesk Category";
        }
        field(3; "Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));

            trigger OnValidate()
            begin
                if ObjRC.Get("Region Code") then
                    "Region Name" := ObjRC.Name;
            end;
        }
        field(4; "Region Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "User Feedbback Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Assined Issue Duration"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(7; Assigned; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Employee No"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."Employee No.";
        }
    }

    keys
    {
        key(Key1; UserName, "Help Desk Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; UserName, "Help Desk Category", "Region Name")
        {
        }
    }

    var
        ObjRC: Record "Responsibility Center";
}

