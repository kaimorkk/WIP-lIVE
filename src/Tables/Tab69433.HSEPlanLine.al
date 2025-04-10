
table 69433 "HSE Plan Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "Hazard ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Hazard Type"; Code[20])
        {
            TableRelation = "Hazard Type".Code;

            trigger OnValidate()
            begin
                HazardTypes.Reset;
                HazardTypes.SetRange(Code, "Hazard Type");
                if HazardTypes.FindSet then
                    Description := HazardTypes.Description;
                "Hazard Category" := HazardTypes."Hazard Category";
            end;
        }
        field(4; Description; Text[430])
        {
        }
        field(5; "Hazard Category"; Option)
        {
            OptionMembers = " ",Physical,Chemical,Biological,Psychosocial,"General Environment";
        }
        field(6; "Dimension Set ID"; Integer)
        {
        }
        field(7; "No. of Planned Hazard Controls"; Integer)
        {
        }
        field(8; "No. of Risk Incidences"; Integer)
        {
        }
        field(9; "Risk Management Plan ID"; Code[20])
        {
            TableRelation = "Risk Management Plan"."Document No";
        }
        field(11; "Risk Likelihood Code"; Code[20])
        {
        }
        field(12; "Risk Impact Code"; Code[20])
        {
        }
        field(13; "Risk Impact Type"; Option)
        {
            OptionMembers = " ",Negative,Positive;
        }
        field(14; "Risk Likelihood Rating ScaleID"; Code[20])
        {
        }
        field(15; "Risk Impact Rating Scale ID"; Code[20])
        {
        }
        field(16; "Overall Risk Rating Scale ID"; Code[20])
        {
        }
        field(17; "Risk Appetite Rating Scale ID"; Code[20])
        {
        }
        field(18; "Risk Likelihood Rating"; Decimal)
        {
        }
        field(19; "Risk Impact Rating"; Decimal)
        {
        }
        field(20; "Overall Risk Rating"; Decimal)
        {
        }
        field(21; "Overall Risk Level Code"; Code[20])
        {
        }
        field(22; "Shortcut Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(23; "Shortcut Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(24; "Risk ID"; Integer)
        {
            TableRelation = "Risk Management Plan Line"."Risk ID" where("Document No" = field("Risk Management Plan ID"));

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Document No", "Risk Management Plan ID");
                RiskManagementPlanLine.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                    "Risk Appetite Rating Scale ID" := RiskManagementPlanLine."Risk Appetite Rating Scale ID";
                    "Risk Impact Code" := RiskManagementPlanLine."Risk Impact Code";
                    "Risk Impact Rating" := RiskManagementPlanLine."Risk Impact Rating";
                    "Risk Impact Rating Scale ID" := RiskManagementPlanLine."Risk Impact Rating Scale ID";
                    "Risk Impact Type" := RiskManagementPlanLine."Risk Impact Type";
                    "Risk Likelihood Code" := RiskManagementPlanLine."Risk Likelihood Code";
                    "Risk Likelihood Rating" := RiskManagementPlanLine."Risk Likelihood Rating";
                    "Risk Likelihood Rating ScaleID" := RiskManagementPlanLine."Risk Likelihood Rate Scale ID";
                    "Overall Risk Level Code" := RiskManagementPlanLine."Overall Risk Level Code";
                    "Overall Risk Rating" := RiskManagementPlanLine."Overal Risk Rating";
                    "Overall Risk Rating Scale ID" := RiskManagementPlanLine."Overall Risk Rating Scale ID";

                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Hazard ID", "Risk Management Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        DimMgt: Codeunit DimensionManagement;
        HazardTypes: Record "Hazard Type";
        RiskManagementPlanLine: Record "Risk Management Plan Line";

    procedure ShowDimensions() IsChanged: Boolean
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2 %3', "Hazard Type", "Plan ID", "Hazard ID"));

        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
        IsChanged := OldDimSetID <> "Dimension Set ID";
    end;
}

