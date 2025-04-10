
table 70092 "Bid Score Criteria Group"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
        }
        field(3; "Criteria Group ID"; Code[30])
        {
            Description = 'This refers to the Criteria Group applicable in the Template. A simple scoring sheet may have 1 Group of all General criteria, generally adding upto 100%. Some score sheets may be split into different Criteria Groups e.g. Technical proposal at 80% and Financial proposal at 20%';
        }
        field(4; "Evaluation Type"; Option)
        {
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation,Vendor Due Diligence';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation","Vendor Due Diligence";
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Total Weight %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "No of Criteria Croups"; Integer)
        {
            CalcFormula = count("Bid Evaluation Score Entry" where("Bid Scoring Document No." = field("Template ID"),
                                                                    "Criteria Group" = field("Criteria Group ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "No of Scored Criteria Groups"; Integer)
        {
            CalcFormula = count("Bid Evaluation Score Entry" where("Bid Scoring Document No." = field("Template ID"),
                                                                    "Criteria Group" = field("Criteria Group ID"),
                                                                    "Weighted Line Score" = filter(<> 0)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Criteria Group ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

