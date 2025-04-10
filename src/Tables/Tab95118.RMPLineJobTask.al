
table 95118 "RMP Line Job Task"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Risk ID"; Integer)
        {
            AutoIncrement = false;

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                    "Risk ID" := RiskManagementPlanLine."Risk ID";
                    "Risk Title" := RiskManagementPlanLine."Risk Title";
                end;
            end;
        }
        field(4; "Job No"; Code[100])
        {
            Caption = 'Budget Code';
            TableRelation = Job;
        }
        field(5; "Job Task No"; Code[50])
        {
            Caption = 'Budget Amount';
            TableRelation = Job;
        }
        field(6; Description; Text[2048])
        {
        }
        field(7; "Risk Title"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID", "Job No", "Job Task No")
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

