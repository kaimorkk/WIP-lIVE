
table 80214 "BR Template Section"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
        }
        field(2; "Section Code"; Code[100])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Section Completion Instruction"; Text[255])
        {
        }
        field(5; "No. of Questions"; Integer)
        {
            CalcFormula = count("BR Template Line" where("Section ID" = field("Section Code")));
            FieldClass = FlowField;
        }
        field(6; "Total Weight %"; Decimal)
        {
            CalcFormula = sum("BR Template Line"."Assigned Weight %" where("Section ID" = field("Section Code")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

