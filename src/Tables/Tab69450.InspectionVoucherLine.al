
table 69450 "Inspection Voucher Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Inspection Type"; Option)
        {
            OptionMembers = " ","OSH Inspection","Project Supervision";
        }
        field(2; "Template ID"; Code[20])
        {
            TableRelation = "Inspection Voucher"."Drill ID";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Category Code"; Code[20])
        {
            TableRelation = "Inspection Template Category"."Category Code";
        }
        field(6; "Requirement Type"; Option)
        {
            OptionMembers = " ",Mandatory,Optional;
        }
        field(7; "Response Type"; Code[20])
        {
            TableRelation = "Inspection Response Type".Code;
        }
        field(8; "Response Code"; Code[50])
        {
            TableRelation = "Inspection Response Code"."Response Code" where("Response Type" = field("Response Type"));

            trigger OnValidate()
            begin
                InspectionResponseCode.Reset;
                InspectionResponseCode.SetRange("Response Type", "Response Type");
                InspectionResponseCode.SetRange("Response Code", "Response Code");
                if InspectionResponseCode.FindSet then
                    "Response Description" := InspectionResponseCode.Description;
                Score := InspectionResponseCode."Score %";
            end;
        }
        field(9; Score; Decimal)
        {
        }
        field(10; "Response Description"; Code[250])
        {
        }
    }

    keys
    {
        key(Key1; "Inspection Type", "Template ID", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        InspectionResponseCode: Record "Inspection Response Code";
}

