
table 69232 "HR Appraisal Eval Areas"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Assign To"; Code[20])
        {
            TableRelation = "ManPower Planning Lines";
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = false;

            trigger OnValidate()
            var
                HRAppEvalAreas: Record "HR Appraisal Eval Areas";
            begin
                HRAppEvalAreas.Reset;
                HRAppEvalAreas.SetRange(HRAppEvalAreas.Code, Code);
                if HRAppEvalAreas.Find('-') then begin
                    Error('Code [%1] already exist, Please use another code', Code);
                end;
            end;
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(4; "Categorize As"; Option)
        {
            OptionCaption = ' ,Employee''s Subordinates,Employee''s Peers,External Sources,Job Specific,Self Evaluation';
            OptionMembers = " ","Employee's Subordinates","Employee's Peers","External Sources","Job Specific","Self Evaluation";
        }
        field(5; "Sub Category"; Option)
        {
            OptionCaption = ' ,Objectives,Core Responsibilities / Duties,Attendance & Punctuality,Communication,Cooperation,Planning & Organization,Quality,Team Work,Sales Skills,Leadership,Performance Coaching';
            OptionMembers = " ",Objectives,"Core Responsibilities / Duties","Attendance & Punctuality",Communication,Cooperation,"Planning & Organization",Quality,"Team Work","Sales Skills",Leadership,"Performance Coaching";
        }
        field(6; Description; Text[250])
        {
            NotBlank = false;
        }
        field(7; "Include in Evaluation Form"; Boolean)
        {
        }
        field(8; "External Source Type"; Option)
        {
            OptionCaption = ' ,Vendor,Customer';
            OptionMembers = " ",Vendor,Customer;
        }
        field(9; "External Source Code"; Code[10])
        {
            TableRelation = if ("External Source Type" = const(Customer)) Customer."No."
            else
            if ("External Source Type" = const(Vendor)) Vendor."No.";
        }
        field(10; "External Source Name"; Text[100])
        {
            FieldClass = Normal;
        }
        field(11; "Assigned To"; Text[100])
        {
            //  CalcFormula = lookup("ManPower Planning Lines"."Task No" where ("Entry No"=field("Assign To")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; Blocked; Boolean)
        {
        }
        field(13; "Appraisal Period"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = filter("Appraisal Period"),
                                                           Closed = const(false));
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

