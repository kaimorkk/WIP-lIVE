
table 95242 "Audit Plan Line Risk"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Plan ID"; Code[20])
        {
        }
        field(2; "Engagement Line No."; Integer)
        {
        }
        field(3; "Line Risk ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Risk Title"; Text[2048])
        {
            Editable = false;
        }
        field(5; "Risk Category"; Code[20])
        {
            Editable = false;
            TableRelation = "Risk Category".Code;
        }
        field(6; "Risk Source ID"; Code[20])
        {
            Editable = false;
            TableRelation = "Risk Source"."Source ID";
        }
        field(7; "Risk Likelihood Code"; Code[20])
        {
            Editable = false;
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = const("Likelihood Rating"));
        }
        field(8; "Risk Impact Code"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = const("Impact Rating"));
        }
        field(9; "Risk Impact Type"; Option)
        {
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(10; "Risk Register Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Corporate,Functional (CEO''s Office),Functional (Division),Functional (Huduma),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(11; "Risk Management Plan ID"; Code[20])
        {
            TableRelation = if ("Risk Register Type" = const(Corporate)) "Risk Management Plan"."Document No" where("Document Type" = const(Corporate));
        }
        field(12; "Risk ID"; Integer)
        {
            TableRelation = "Risk Management Plan Line"."Risk ID";

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                    "Risk ID" := RiskManagementPlanLine."Risk ID";
                    "Risk Title" := RiskManagementPlanLine."Risk Title";
                    "Risk Category" := RiskManagementPlanLine."Risk Category";
                    "Risk Source ID" := RiskManagementPlanLine."Risk Source ID";
                    "Risk Likelihood Code" := RiskManagementPlanLine."Risk Likelihood Code";
                    "Risk Impact Code" := RiskManagementPlanLine."Risk Impact Code";
                    "Risk Impact Type" := RiskManagementPlanLine."Risk Impact Type";
                    "Gen. Risk Response Strategy" := RiskManagementPlanLine."Gen. Risk Response Strategy";
                end;
            end;
        }
        field(13; "Gen. Risk Response Strategy"; Code[10])
        {
            Description = 'Gen. Risk Response Strategy';
            Editable = false;
            TableRelation = if ("Risk Impact Type" = const(Positive)) "Risk Response Strategy"."Strategy ID" where("Risk Impact Type" = const(Positive))
            else
            if ("Risk Impact Type" = const(Negative)) "Risk Response Strategy"."Strategy ID" where("Risk Impact Type" = const(Negative));
        }
        field(14; "No. of Controls"; Integer)
        {
        }
        field(15; "No. of Audit Procedures"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Audit Plan ID", "Engagement Line No.", "Line Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
}

