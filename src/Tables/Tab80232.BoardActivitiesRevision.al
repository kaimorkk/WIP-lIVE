
table 80232 "Board Activities Revision"
{
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
        field(3; "Board Activity Description"; Code[100])
        {
            Editable = false;
        }
        field(4; "Activity Code"; Code[50])
        {
            TableRelation = "Board Activities"."Activity Code" where("AWP No" = field("AWP No"));

            trigger OnValidate()
            begin
                BoardActivities.Reset;
                BoardActivities.SetRange("Activity Code", "Activity Code");
                if BoardActivities.Find('-') then begin
                    "Board Activity Code" := BoardActivities."Board Activity Code";
                    "Board Activity Description" := BoardActivities."Board Activity Description";
                    "Activity Description" := BoardActivities."Activity Description";
                    "Unit of Measure" := BoardActivities."Unit of Measure";
                    "WT(%)" := BoardActivities."WT(%)";
                    "Framework Perspective" := BoardActivities."Framework Perspective";
                    Target := BoardActivities.Target;
                    "Strategy Framework" := BoardActivities."Strategy Framework";
                end;
            end;
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
        field(12; "Revision Workplan No"; Code[50])
        {
            TableRelation = "Annual Workplan Revision".No;
        }
        field(13; "New Activity Code"; Code[50])
        {
            TableRelation = "Board Activities"."Activity Code" where("AWP No" = field("AWP No"));

            trigger OnValidate()
            begin
                BoardActivities.Reset;
                BoardActivities.SetRange("Activity Code", "Activity Code");
                if BoardActivities.Find('-') then begin
                    "Board Activity Code" := BoardActivities."Board Activity Code";
                    "Board Activity Description" := BoardActivities."Board Activity Description";
                    "Activity Description" := BoardActivities."Activity Description";
                    "Unit of Measure" := BoardActivities."Unit of Measure";
                    "WT(%)" := BoardActivities."WT(%)";
                    "Framework Perspective" := BoardActivities."Framework Perspective";
                    Target := BoardActivities.Target;
                    "Strategy Framework" := BoardActivities."Strategy Framework";
                end;
            end;
        }
        field(14; "New Activity Description"; Text[100])
        {
        }
        field(15; "New Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure";
        }
        field(16; "New WT(%)"; Decimal)
        {
        }
        field(17; "New Target"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "AWP No", "Board Activity Code", "Activity Code", "Revision Workplan No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BoardSetup: Record "Board Activities Setup";
        BoardActivities: Record "Board Activities";
}

