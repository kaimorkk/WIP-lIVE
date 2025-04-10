
table 95102 "Risk Source"
{
    DrillDownPageID = "Risk Sources";
    LookupPageID = "Risk Sources";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Source ID"; Code[20])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "No. Of Risk Categories"; Integer)
        {
            CalcFormula = count("Risk Category" where("Risk Source ID" = field("Source ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "No. Of Risks"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Risk Source ID" = field("Source ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Source ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

