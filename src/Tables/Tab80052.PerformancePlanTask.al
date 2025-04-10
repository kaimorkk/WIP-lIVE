
table 80052 "Performance Plan Task"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Performance Mgt Plan ID"; Code[100])
        {
            TableRelation = "Performance Management Plan".No;
        }
        field(2; "Task Code"; Code[100])
        {
        }
        field(3; "Task Category"; Option)
        {
            OptionCaption = 'Corporate Target Setting,Functional Target Setting,Individual Target Setting,Performance Review,Performance Appeal';
            OptionMembers = "Corporate Target Setting","Functional Target Setting","Individual Target Setting","Performance Review","Performance Appeal";
        }
        field(4; Description; Text[255])
        {
        }
        field(5; "Performance Cycle Start Date"; Date)
        {
        }
        field(6; "Performance Cycle End Date"; Date)
        {
        }
        field(7; "Processing Start Date"; Date)
        {
        }
        field(8; "Processing Due Date"; Date)
        {
        }
        field(9; "Published?"; Boolean)
        {
        }
        field(10; "Closed?"; Boolean)
        {
        }
        field(11; "Published By"; Code[100])
        {
        }
        field(12; "Closed By"; Code[100])
        {
        }
        field(13; "No of Evaluations/Appeals"; Integer)
        {
            CalcFormula = count("Perfomance Evaluation" where("Performance Mgt Plan ID" = field("Performance Mgt Plan ID"),
                                                               "Performance Task ID" = field("Task Code")));
            FieldClass = FlowField;
        }
        field(14; "Review Periods"; Code[100])
        {
            TableRelation = if ("Task Category" = const("Performance Review")) "Review Periods".Code where(Closed = const(false));

            trigger OnValidate()
            begin
                ReviewQuarterlyPeriods.Reset;
                ReviewQuarterlyPeriods.SetRange("Review Period Code", "Review Periods");
                if not ReviewQuarterlyPeriods.FindSet then begin
                    repeat
                        Error('Please assign Review Quarterly Periods for Review period %1', "Review Periods");
                    until ReviewQuarterlyPeriods.Next = 0;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Performance Mgt Plan ID", "Task Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ReviewQuarterlyPeriods: Record "Review Quarterly Periods";
}

