
table 59002 "Department Vehicle Allocation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vehicle No"; Code[20])
        {
        }
        field(2; Department; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal.Code, Department);
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                if DimVal.Find('-') then
                    "Department Name" := DimVal.Name;
            end;
        }
        field(3; "Department Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Vehicle No", Department)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimVal: Record "Dimension Value";
}

