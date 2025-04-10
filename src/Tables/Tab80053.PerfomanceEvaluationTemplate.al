Table 80053 "Perfomance Evaluation Template"
{
    DrillDownPageID = "Perfomance Evaluation Temps";
    LookupPageID = "Perfomance Evaluation Temps";

    fields
    {
        field(1; "Code"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."PET Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "General Instructions"; Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Global?"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Primary Responsibility Center"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(6; "Evaluation Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Standard Appraisal/Supervisor Score Only,Self-Appraisal with Supervisor Score,360-Degree/Group Appraisal';
            OptionMembers = "Standard Appraisal/Supervisor Score Only","Self-Appraisal with Supervisor Score","360-Degree/Group Appraisal";
        }
        field(7; "Performance Rating Model"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Performance Rating Scale"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Rating Scale".Code;
        }
        field(9; "Proficiency Rating Scale"; Code[50])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "Competency Proficiency Scale".Code;
        }
        field(10; "Total Score Model"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Effective Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Default Competency A_Template"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Competency Per Template".Code;
        }
        field(14; "General A_Questionnaire"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Appraisal Questionnaire Temp".Code where("Template Category" = const("General Assessment"));
        }
        field(15; "Peer Reviewer FB_Questionnaire"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Appraisal Questionnaire Temp".Code where("Template Category" = const("360-Degree Peer Review"));
        }
        field(16; "Total Allocated Weight (%)"; Decimal)
        {
            CalcFormula = sum("Performance Evaluation Weight"."Total Weight (%)" where("Per_Evaluation Template ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(17; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            SPMSetup.Get;
            SPMSetup.TestField("PET Nos");
            NoSeriesMgt.InitSeries(SPMSetup."PET Nos", xRec."No. Series", 0D, Code, "No. Series");
        end
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

