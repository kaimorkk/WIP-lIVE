
table 70215 "Bid Evaluation Criteria Group"
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
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation";
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Total Weight %"; Decimal)
        {
            CalcFormula = sum("Bid Evaluation Score Entry"."Weighted Line Score" where(Code = field("Document No"),
                                                                                        "Criteria Group" = field("Criteria Group ID")));
            FieldClass = FlowField;
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "Document No"; Code[20])
        {
            TableRelation = "Bid Evaluation Register".Code;
        }
        field(8; "No of Scored Criteria Groups"; Integer)
        {
            CalcFormula = count("Bid Evaluation Score Entry" where("Bid Scoring Document No." = field("Template ID"),
                                                                    "Criteria Group" = field("Criteria Group ID"),
                                                                    "Evaluation Results" = filter(Pass | Fail),
                                                                    Code = field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "No of Criteria Croups"; Integer)
        {
            CalcFormula = count("Bid Evaluation Score Entry" where("Bid Scoring Document No." = field("Template ID"),
                                                                    "Criteria Group" = field("Criteria Group ID"),
                                                                    Code = field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Criteria Group ID", "Document No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

