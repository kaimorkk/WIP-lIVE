
table 95175 "Compliance Framework Section"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Framework ID"; Code[20])
        {
        }
        field(2; "Section Type"; Option)
        {
            OptionCaption = ' ,Overview,Implication';
            OptionMembers = " ",Overview,Implication;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "No. of Comments"; Integer)
        {
            CalcFormula = count("Compliance Section Comment" where("Framework ID" = field("Framework ID"),
                                                                    "Section Type" = field("Section Type")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Framework ID", "Section Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

