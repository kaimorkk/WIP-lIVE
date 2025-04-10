
table 56071 "ICT Maintenance Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[10])
        {
        }
        field(2; "Maintenance Area"; Code[50])
        {
            TableRelation = "ICT Maintenance Areas".Code;

            trigger OnValidate()
            begin
                ICTMaintenanceAreas.Reset;
                ICTMaintenanceAreas.SetRange(Code, "Maintenance Area");
                if ICTMaintenanceAreas.FindSet then
                    Description := ICTMaintenanceAreas.Description;
                "Inventory Category" := ICTMaintenanceAreas."Inventory  Category";
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Inventory Category"; Code[50])
        {
            TableRelation = "ICT Asset subcategory".Code;
        }
        field(5; "Maintenance Type"; Option)
        {
            OptionCaption = 'Preventive,Corrective';
            OptionMembers = Preventive,Corrective;
        }
        field(6; "Year Code"; Code[50])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
        }
        field(7; "No. of Planned Periods"; Integer)
        {
            CalcFormula = count("Maintenance Periods" where("Document No" = field("Document No"),
                                                             "Maintenance Code" = field("Maintenance Area")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; Quantity; Integer)
        {
            CalcFormula = count("ICT Maintenance Inventory" where("Document No" = field("Document No"),
                                                                   "Mainatenance Code" = field("Maintenance Area")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Document No", "Maintenance Area")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTMaintenanceAreas: Record "ICT Maintenance Areas";
}

