
table 95186 "Audit Template Default Risk"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[20])
        {
        }
        field(2; "Line Risk ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Risk Title"; Text[2048])
        {
        }
        field(4; "Risk Category"; Code[20])
        {
            TableRelation = "Risk Category".Code;
        }
        field(5; "Risk Source ID"; Code[20])
        {
            TableRelation = "Risk Source"."Source ID";
        }
        field(6; "Risk Likelihood Code"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = const("Likelihood Rating"));
        }
        field(7; "Risk Impact Code"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = const("Impact Rating"));
        }
        field(8; "Risk Impact Type"; Option)
        {
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(9; "Risk Register Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(10; "Risk Management Plan ID"; Code[20])
        {
            TableRelation = if ("Risk Register Type" = const(Corporate)) "Risk Management Plan"."Document No" where("Document Type" = const(Corporate));
        }
        field(11; "Risk ID"; Integer)
        {
        }
        field(12; "Gen. Risk Response Strategy"; Code[10])
        {
            Description = 'Gen. Risk Response Strategy';
            TableRelation = if ("Risk Impact Type" = const(Positive)) "Risk Response Strategy"."Strategy ID" where("Risk Impact Type" = const(Positive))
            else
            if ("Risk Impact Type" = const(Negative)) "Risk Response Strategy"."Strategy ID" where("Risk Impact Type" = const(Negative));
        }
        field(13; "No. of Controls"; Integer)
        {
        }
        field(14; "No. of Audit Procedures"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID", "Line Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

