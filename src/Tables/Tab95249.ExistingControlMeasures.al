
table 95249 "Existing Control Measures"
{
    DrillDownPageID = "Risk Management Plan Lines";
    LookupPageID = "Risk Management Plan Lines";

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Risk ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                // RiskManagementPlanLines.RESET;
                // RiskManagementPlanLines.SETRANGE("Risk ID", "Risk ID");
                // IF RiskManagementPlanLines.FINDSET THEN BEGIN
                //  "Risk ID":= RiskManagementPlanLines."Risk ID";
                //  "Risk Title" := RiskManagementPlanLines."Risk Title";
                //  END;
                RiskManagementPlanLines.Reset;
                RiskManagementPlanLines.SetRange(RiskManagementPlanLines."Risk ID", "Risk ID");
                if RiskManagementPlanLines.FindSet then begin
                    "Risk ID" := RiskManagementPlanLines."Risk ID";
                    "Risk Title" := RiskManagementPlanLines."Risk Title";
                    "Document No" := RiskManagementPlanLines."Document No";
                end;
            end;
        }
        field(5; "Risk Title"; Text[2048])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Existing Control Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //"Date Raised":=TODAY;
        //"Risk Status":="Risk Status"::Open;
        //"Date Raised":=TODAY;

        // RiskManagementPlan.RESET;
        // RiskManagementPlan.SETRANGE("Document No","Document No");
        // RiskManagementPlan.SETRANGE("Document Type","Document Type");
        // IF RiskManagementPlan.FINDSET THEN BEGIN
        //  "Risk Appetite Rating Scale ID":=RiskManagementPlan."Risk Appetite Rating Scale ID";
        //  "Risk Likelihood Rate Scale ID":=RiskManagementPlan."Risk Likelihood Rate Scale ID";
        //   "Overall Risk Rating Scale ID":=RiskManagementPlan."Overall Risk Rating Scale ID";
        //   "Risk Impact Rating Scale ID":=RiskManagementPlan."Risk Impact Rating Scale ID";
        //  END;
    end;

    var
        RiskManagementPlanLines: Record "Risk Management Plan Line";
}

