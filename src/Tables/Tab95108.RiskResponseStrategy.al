
table 95108 "Risk Response Strategy"
{
    DrillDownPageID = "Risk Response Strategies";
    LookupPageID = "Risk Response Strategies";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Strategy ID"; Code[20])
        {
            Description = 'Risk Response Strategy';
        }
        field(2; "Risk Impact Type"; Option)
        {
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Additional Comments"; Text[250])
        {
        }
        field(5; "No. of Risks Handled"; Integer)
        {
            CalcFormula = count("Risk Management Plan Line" where("Gen. Risk Response Strategy" = field("Strategy ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Strategy ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

