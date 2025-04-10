
table 70091 "Bid Score Requirement"
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
            TableRelation = "Bid Score Criteria Group"."Criteria Group ID" where("Evaluation Type" = field("Evaluation Type"), "Template ID" = field("Template ID"));
        }
        field(4; "Requirement ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Evaluation Requirement"; Text[250])
        {
        }
        field(6; "Bidder Response"; Option)
        {
            OptionCaption = 'Required,Optional,Display Only';
            OptionMembers = Required,Optional,"Display Only";
        }
        field(7; "Rating Type"; Option)
        {
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(8; "Target Value"; Text[50])
        {
        }
        field(9; "Assigned Weight %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(10; "Evaluation Type"; Option)
        {
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation,Vendor Due Diligence';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation","Vendor Due Diligence";
        }
        field(11; "Equipment Type"; Text[50])
        {
        }
        field(12; "Unit of Measure"; Code[30])
        {
        }
        field(13; "Target Qty"; Decimal)
        {
        }
        field(14; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(15; "Performance Indicator/Proof"; Code[150])
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Criteria Group ID", "Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

