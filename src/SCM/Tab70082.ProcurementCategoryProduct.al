
table 70082 "Procurement Category Product"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Category ID"; Code[30])
        {
        }
        field(2; "Item No"; Code[30])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                ItemCode.Reset;
                ItemCode.SetRange("No.", "Item No");
                if ItemCode.FindSet then begin
                    Description := ItemCode.Description;
                    "Unit of Measure" := ItemCode."Base Unit of Measure";
                end;
            end;
        }
        field(3; Description; Text[30])
        {
            Editable = false;
        }
        field(4; "Unit of Measure"; Code[20])
        {
            Editable = false;
            TableRelation = "Unit of Measure";
        }
    }

    keys
    {
        key(Key1; "Category ID", "Item No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ItemCode: Record Item;
}

