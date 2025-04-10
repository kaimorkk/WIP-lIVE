
table 80004 "Stakeholder Group"
{
    DrillDownPageID = "Stakeholder Groups";
    LookupPageID = "Stakeholder Groups";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Page ID Link"; Code[10])
        {
            TableRelation = AllObjWithCaption;
        }
        field(4; "No. of Sub-Groups"; Integer)
        {
            CalcFormula = count("Stakeholder Sub-Group" where("Stakeholder Group" = field(Code)));
            FieldClass = FlowField;
        }
        field(5; "Blocked?"; Boolean)
        {
        }
        field(17; "Object Type"; Option)
        {
            Caption = 'Link Page To';
            OptionCaption = ',,,Report,,,,,Page';
            OptionMembers = ,,,"Report",,,,,"Page";
        }
        field(18; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            TableRelation = AllObj."Object ID" where("Object Type" = field("Object Type"));
        }
        field(19; Type; Option)
        {
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
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
}

