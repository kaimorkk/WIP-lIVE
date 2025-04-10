
table 80104 "Board Activities"
{
    DrillDownPageID = "Board Activities";
    LookupPageID = "Board Activities";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "AWP No"; Code[50])
        {
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(2; "Board Activity Code"; Code[50])
        {
            TableRelation = "Board Activities Setup".Code;

            trigger OnValidate()
            begin
                if BoardSetup.Get("Board Activity Code") then begin
                    "Board Activity Description" := BoardSetup.Description;
                end;
            end;
        }
        field(3; "Board Activity Description"; Code[150])
        {
            Editable = false;
        }
        field(4; "Activity Code"; Code[50])
        {
        }
        field(5; "Activity Description"; Text[100])
        {
        }
        field(6; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure";
        }
        field(7; "WT(%)"; Decimal)
        {
        }
        field(8; Target; Decimal)
        {
        }
        field(9; "Achieved Targets"; Decimal)
        {
        }
        field(10; "Framework Perspective"; Code[255])
        {
            TableRelation = "Strategy Framework Perspective".Code where("Strategy Framework" = field("Strategy Framework"));
        }
        field(11; "Strategy Framework"; Code[10])
        {
            TableRelation = "Strategy Framework";
        }
        field(12; "Achieved Target"; Decimal)
        {
        }
        field(13; "Primary Directorate Name"; Text[250])
        {
        }
        field(14; "Primary Department Name"; Text[250])
        {
        }
        field(16; "Primary Directorate"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(17; "Primary Department"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
    }

    keys
    {
        key(Key1; "AWP No", "Board Activity Code", "Activity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BoardSetup: Record "Board Activities Setup";
}

