
table 95205 "Audit Project Procedure Risk"
{
    DrillDownPageID = "Audit Project Procedure Risks";
    LookupPageID = "Audit Project Procedure Risks";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
        }
        field(2; "Business Risk ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Audit Procedure ID"; Integer)
        {
        }
        field(4; "Risk Register Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(5; "Risk Management Plan ID"; Code[20])
        {
        }
        field(6; "Original Risk ID"; Integer)
        {
        }
        field(7; "Risk Title"; Text[2048])
        {
        }
        field(8; "Risk Category"; Code[20])
        {
        }
        field(9; "Risk Source ID"; Code[20])
        {
        }
        field(10; "Risk Likelihood Code"; Code[20])
        {
        }
        field(11; "Risk Impact Code"; Code[20])
        {
        }
        field(12; "Risk Impact Type"; Option)
        {
            Description = 'Risk Likelihood Rate Scale ID';
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(13; "Risk Likelihood Rate Scale ID"; Code[20])
        {
        }
        field(14; "Risk Impact Rating Scale ID"; Code[20])
        {
        }
        field(15; "Overall Risk Rating Scale ID"; Code[20])
        {
        }
        field(16; "Risk Appetite Rating Scale ID"; Code[20])
        {
        }
        field(17; "Risk Likelihood Rating"; Decimal)
        {
        }
        field(18; "Risk Impact Rating"; Decimal)
        {
        }
        field(19; "Overall Risk Rating"; Decimal)
        {
        }
        field(20; "Overall Risk Level Code"; Code[20])
        {
        }
        field(21; "No. of Controls"; Integer)
        {
            CalcFormula = count("Audit Proj  Procedure Control" where("Engagement ID" = field("Engagement ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22; "Audit Objective ID"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Business Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

