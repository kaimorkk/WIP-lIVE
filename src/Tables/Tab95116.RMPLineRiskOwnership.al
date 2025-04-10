
table 95116 "RMP Line Risk Ownership"
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
            Editable = false;

            trigger OnValidate()
            begin
                RiskManagementPlanLines.Reset;
                RiskManagementPlanLines.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLines.FindSet then begin
                    "Risk ID" := RiskManagementPlanLines."Risk ID";
                    "Risk Title" := RiskManagementPlanLines."Risk Title";
                end;
            end;
        }
        field(4; "Responsibility Center ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Responsibility Center ID");
                if ResponsibilityCenter.FindSet then
                    Desciption := ResponsibilityCenter.Name;
            end;
        }
        field(5; Desciption; Text[250])
        {
            Editable = false;
        }
        field(6; "Responsible Officer No."; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Responsible Officer No.");
                if Resource.FindSet then
                    "Responsible Officer Name" := Resource.Name;

            end;
        }
        field(7; "Responsible Officer Name"; Text[70])
        {
            Editable = false;
        }
        field(8; "Risk Title"; Text[70])
        {
            Editable = false;
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID", "Responsibility Center ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
        Resource: Record Resource;
        RiskManagementPlanLines: Record "Risk Management Plan Line";
}

