
table 69400 "Health & Safety Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Organization Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Primary Purpose"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "OSH Policy No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "No. of OSH Mgt. Plans"; Integer)
        {
            CalcFormula = count("HSE Plan");
            Description = 'No. of OSH Mgt. Plans';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "No. of Safe Work Permit Apps"; Integer)
        {
            CalcFormula = count("Safe Work Permit Header" where("Document Type" = filter("Safe Work Permit Application")));
            Description = 'No. of Safe Work Permit Apps';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "No. of Safe Work Compl Reports"; Integer)
        {
            CalcFormula = count("Safe Work Permit Header" where("Document Type" = filter("Safe Work Completion Report")));
            Description = 'No. of Safe Work Compl Reports';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "No. of Emergency Drill Reports"; Integer)
        {
            CalcFormula = count("Emergency Drill Log");
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "No. of Risk Incident Logs"; Integer)
        {
            CalcFormula = count("Risk Incident Log");
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "No. of OSH Trainings"; Integer)
        {
            Editable = false;
        }
        field(12; "No. of OSH Meetings"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "No. of OSH Inspection Reports"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "No. of OSH Imp. Status Reports"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of OSH Imp. Status Reports';
            Editable = false;
        }
        field(15; "OSH Management Plan Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(16; "Safe Work Permit Apps Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Safe Work Permit Apps Nos.';
            TableRelation = "No. Series";
        }
        field(17; "Safe Work Compln Report Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Safe Work Compln Report Nos.';
            TableRelation = "No. Series";
        }
        field(18; "Emergency Drill Report Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(19; "Risk Incident Report Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(20; "OSH Training Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(21; "OSH Meeting Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(22; "OSH Inspection Report Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(23; "OSH Impl. Status Report Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'OSH Impl. Status Report Nos.';
            TableRelation = "No. Series";
        }
        field(24; "Risk Incident Follow-up Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(25; "Implementation Status Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

