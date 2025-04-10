Table 80227 "Sub Plog Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "PLog No."; Code[30])
        {
            TableRelation = "Performance Diary Log".No;
        }
        field(2; "Initiative No."; Code[30])
        {

            trigger OnValidate()
            begin
                /*IF "Activity Type"="Activity Type"::"Primary Activity" THEN BEGIN
                    StrategicInitiative.RESET;
                    StrategicInitiative.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    StrategicInitiative.SETRANGE("Workplan No.","Personal Scorecard ID");
                    StrategicInitiative.SETRANGE("Initiative No.","Initiative No.");
                    IF StrategicInitiative.FIND('-') THEN BEGIN
                      Description:=StrategicInitiative."Objective/Initiative";
                      "Planned Date":=StrategicInitiative."Start Date";
                      "Target Qty":=StrategicInitiative."Imported Annual Target Qty";
                      "Due Date":=StrategicInitiative."Due Date";
                    END;
                
                    PerformanceDiaryLog.RESET;
                    PerformanceDiaryLog.SETRANGE(No,"PLog No.");
                    IF PerformanceDiaryLog.FINDFIRST THEN BEGIN
                      "Achieved Date":=PerformanceDiaryLog."Document Date";
                      "AWP ID":=PerformanceDiaryLog."AWP ID";
                      "Board PC ID":=PerformanceDiaryLog."Board PC ID";
                      "CEO PC ID":=PerformanceDiaryLog."CEO PC ID";
                      "Functional PC":=PerformanceDiaryLog."Functional PC";
                    END;
                END;
                
                IF "Activity Type"="Activity Type"::"Secondary Activity" THEN BEGIN
                    SecondaryPCObjective.RESET;
                    SecondaryPCObjective.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    SecondaryPCObjective.SETRANGE("Workplan No.","Personal Scorecard ID");
                    SecondaryPCObjective.SETRANGE("Initiative No.","Initiative No.");
                    IF SecondaryPCObjective.FIND('-') THEN BEGIN
                      Description:=SecondaryPCObjective."Objective/Initiative";
                      "Planned Date":=SecondaryPCObjective."Start Date";
                      "Target Qty":=SecondaryPCObjective."Imported Annual Target Qty";
                      "Due Date":=SecondaryPCObjective."Due Date";
                    END;
                
                    PerformanceDiaryLog.RESET;
                    PerformanceDiaryLog.SETRANGE(No,"PLog No.");
                    IF PerformanceDiaryLog.FINDFIRST THEN BEGIN
                      "Achieved Date":=PerformanceDiaryLog."Document Date";
                      "AWP ID":=PerformanceDiaryLog."AWP ID";
                      "Board PC ID":=PerformanceDiaryLog."Board PC ID";
                      "CEO PC ID":=PerformanceDiaryLog."CEO PC ID";
                      "Functional PC":=PerformanceDiaryLog."Functional PC";
                    END;
                END;*/

            end;
        }
        field(3; "Sub Initiative No."; Code[255])
        {
            TableRelation = "Sub PC Objective"."Objective/Initiative" where("Workplan No." = field("Personal Scorecard ID"));
        }
        field(4; Description; Code[255])
        {
        }
        field(5; "Goal ID"; Code[30])
        {
        }
        field(12; "Strategy Plan ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans";
        }
        field(13; "Year Reporting Code"; Code[30])
        {
            TableRelation = "Annual Reporting Codes";
        }
        field(14; "Planned Date"; Date)
        {
        }
        field(15; "Achieved Date"; Date)
        {
        }
        field(16; "Primary Directorate"; Code[100])
        {
            //TableRelation = "Responsibility Center" where (Test=const(1));
        }
        field(17; "Primary Department"; Code[100])
        {
            //TableRelation = "Responsibility Center" where (Test=const(2));
        }
        field(20; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure";
        }
        field(21; "Target Qty"; Decimal)
        {
        }
        field(22; "Achieved Target"; Decimal)
        {
        }
        field(23; "AWP ID"; Code[30])
        {
        }
        field(24; "Board PC ID"; Code[30])
        {
        }
        field(25; "CEO PC ID"; Code[30])
        {
        }
        field(26; "Functional PC"; Code[30])
        {
        }
        field(27; "Employee No."; Code[50])
        {
            TableRelation = Employee."No." where(Status = const(Active));
        }
        field(28; "Personal Scorecard ID"; Code[100])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(29; Comments; Text[255])
        {
        }
        field(30; "Activity Type"; Option)
        {
            OptionCaption = 'Primary Activity,Secondary Activity,JD Activity';
            OptionMembers = "Primary Activity","Secondary Activity","JD Activity";
        }
        field(31; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(32; "Remaining Targets"; Decimal)
        {
        }
        field(33; "Weight %"; Decimal)
        {
        }
        field(34; "Due Date"; Date)
        {
        }
        field(35; Variances; Text[255])
        {
        }
        field(66; "Planning Budget Type"; Option)
        {
            OptionCaption = 'Original,Supplementary';
            OptionMembers = Original,Supplementary;
        }
    }

    keys
    {
        key(Key1; "PLog No.", "Initiative No.", "Sub Initiative No.", "Personal Scorecard ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

