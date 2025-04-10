
table 70003 "Procurement Category Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Fiscal Year"; Code[10])
        {
            TableRelation = "G/L Budget Name";
        }
        field(2; Category; Code[10])
        {
            TableRelation = "Supplier Category";

            trigger OnValidate()
            begin
                if CategoryRec.Get(Category) then begin
                    "Category Name" := CategoryRec.Description;
                end;
            end;
        }
        field(3; "Category Name"; Text[250])
        {
        }
        field(4; "No of Prequalified Suppliers"; Integer)
        {
            CalcFormula = count("Prequalified Suppliers1" where("Fiscal Year" = field("Fiscal Year"),
                                                                 Category = field(Category)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Fiscal Year", Category)
        {
            Clustered = true;
        }
        key(Key2; Category)
        {
        }
    }

    fieldgroups
    {
    }

    var
        CategoryRec: Record "Supplier Category";
}

