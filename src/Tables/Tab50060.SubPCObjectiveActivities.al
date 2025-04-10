table 50060 "Sub PC Objective Activities"
{
    Caption = 'Sub PC Objective Activities';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2; "Initiative No."; Code[30])
        {
        }

        field(3; "Strategy Plan ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans";
        }

        field(4; "Goal Template ID"; Code[50])
        {
            TableRelation = "Goal Template";
        }
        field(5; "Sub Initiative No."; Code[10])
        {
        }
        field(6; "Entry Number"; Integer)
        {
        }
        field(7; "Sub Activity"; Text[250])
        {

        }
        field(8; "Secondary Entry Number"; Integer)
        {

        }


    }

    keys
    {
        key(Key1; "Workplan No.", "Initiative No.", "Goal Template ID", "Strategy Plan ID", "Sub Initiative No.", "Entry Number", "Secondary Entry Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PCObjective: Record "PC Objective";
        SubPCObjective: Record "Sub PC Objective";
        TotalAssignedweight: Decimal;
        AssignedCoreWeight: Decimal;
        AssignedSecondaryWeight: Decimal;
        TotalActivitiyAssignedWeight: Decimal;

    local procedure FnGetActivityWeight(CorporateStrategicPlan: Code[30]; AnnualWorkPlan: Code[30]; WorkPlanNo: Code[30]; IntiativeNo: Code[30]; GoalTemplateId: Code[30]) Weight: Decimal
    var
        PCObjective: Record "PC Objective";
    begin
        PCObjective.Reset;
        PCObjective.SetRange("Strategy Plan ID", CorporateStrategicPlan);
        PCObjective.SetRange("Workplan No.", WorkPlanNo);
        PCObjective.SetRange("Initiative No.", IntiativeNo);
        PCObjective.SetRange("Goal Template ID", GoalTemplateId);
        if PCObjective.FindSet then begin
            Weight := PCObjective."Assigned Weight (%)";
        end;

        exit(Weight);
    end;

    local procedure FnGetActivityWeightSC(CorporateStrategicPlan: Code[30]; AnnualWorkPlan: Code[30]; WorkPlanNo: Code[30]; IntiativeNo: Code[30]; GoalTemplateId: Code[30]) Weight: Decimal
    var
        ScPCObjective: Record "Secondary PC Objective";
    begin
        ScPCObjective.Reset;
        ScPCObjective.SetRange("Strategy Plan ID", CorporateStrategicPlan);
        ScPCObjective.SetRange("Workplan No.", WorkPlanNo);
        ScPCObjective.SetRange("Initiative No.", IntiativeNo);
        ScPCObjective.SetRange("Goal Template ID", GoalTemplateId);
        if ScPCObjective.FindSet then begin
            Weight := ScPCObjective."Assigned Weight (%)";
        end;

        exit(Weight);
    end;
}


