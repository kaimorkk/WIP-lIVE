
table 95117 "RMP Line Response Action"
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
        field(4; "Action ID"; Integer)
        {
            AutoIncrement = true;

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document Type", "Document Type");
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No", "Document No");
                RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                    "Risk Title" := RiskManagementPlanLine."Risk Title";
                end;
            end;
        }
        field(5; "Activity Description"; Text[400])
        {
        }
        field(6; "Responsible Officer No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Responsible Officer No.");
                if Resource.FindSet then
                    "Responsible Officer Name" := Resource.Name;
            end;
        }
        field(7; "Action Status"; Option)
        {
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(8; "Percentage Complete"; Decimal)
        {
        }
        field(9; "Task Priority"; Option)
        {
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(10; "Planned Start Date"; Date)
        {
        }
        field(11; "Planned Due Date"; Date)
        {
        }
        field(12; "Actual Date Done"; Date)
        {
        }
        field(13; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(14; "Actual End Date"; Date)
        {
        }
        field(15; "Descriptive Status"; Option)
        {
            OptionCaption = ' ,Low,Medium,High';
            OptionMembers = " ",Low,Medium,High;
        }
        field(16; "Risk Title"; Text[400])
        {
            Editable = true;
        }
        field(17; "Responsible Officer Name"; Text[100])
        {
            Editable = false;
        }
        field(18; "Risk Response Action Taken"; Text[400])
        {
        }
        field(19; Timeline; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID", "Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // RiskManagementPlanLine.RESET;
        // RiskManagementPlanLine.SETRANGE(RiskManagementPlanLine."Document Type","Document Type");
        // RiskManagementPlanLine.SETRANGE(RiskManagementPlanLine."Document No","Document No");
        // RiskManagementPlanLine.SETRANGE(RiskManagementPlanLine."Risk ID","Risk ID");
        // IF RiskManagementPlanLine.FINDSET THEN BEGIN
        //  "Risk Title":=RiskManagementPlanLine."Risk Title";
        //  END;

        Validate("Risk ID");
    end;

    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        Resource: Record Resource;
}

