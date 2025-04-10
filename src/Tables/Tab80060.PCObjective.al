
table 80060 "PC Objective"
{
    DrillDownPageID = "Workplan Initiatives";
    LookupPageID = "Workplan Initiatives";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2; "Initiative No."; Code[30])
        {

            trigger OnValidate()
            begin
                if "Initiative Type" = "initiative type"::Activity then begin
                    StrategicInitiative.Reset;
                    StrategicInitiative.SetRange(Code, "Initiative No.");
                    if StrategicInitiative.FindFirst then begin
                        "Objective/Initiative" := StrategicInitiative.Code;
                        "Unit of Measure" := StrategicInitiative."Unit of Measure";
                    end;
                end;
                if "Initiative Type" = "initiative type"::Board then begin
                    BoardActivities.Reset;
                    BoardActivities.SetRange("Board Activity Code", "Initiative No.");
                    if BoardActivities.FindFirst then begin
                        "Objective/Initiative" := BoardActivities."Board Activity Description";
                        "Unit of Measure" := BoardActivities."Unit of Measure";
                    end;
                end;
            end;
        }
        field(3; "Objective/Initiative"; Code[255])
        {
        }
        field(4; "Goal ID"; Code[30])
        {
            TableRelation = "PC Goal Hub"."Goal ID" where("Performance Contract ID" = field("Workplan No."));
        }
        field(5; "Initiative Type"; Option)
        {
            OptionCaption = 'CSP Activity,Project,PC';
            OptionMembers = Activity,Project,Board,PC;
        }
        field(6; "Task Type"; Option)
        {
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(7; Indentation; Decimal)
        {
        }
        field(8; Totaling; Decimal)
        {
        }
        field(9; Progress; Option)
        {
            OptionCaption = 'Not started,In progress,Completed';
            OptionMembers = "Not started","In progress",Completed;
        }
        field(10; "%Complete"; Decimal)
        {
        }
        field(11; "Priority Level"; Option)
        {
            OptionCaption = 'Urgent,Important,Medium,Low';
            OptionMembers = Urgent,Important,Medium,Low;
        }
        field(12; "Strategy Plan ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans";
        }
        field(13; "Year Reporting Code"; Code[30])
        {
            TableRelation = "Annual Reporting Codes";
        }
        field(14; "Start Date"; Date)
        {
        }
        field(15; "Due Date"; Date)
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
        field(18; "Overall Owner"; Code[100])
        {
        }
        field(19; "Outcome Perfomance Indicator"; Code[100])
        {
            TableRelation = "Performance Indicator".KPI;

            trigger OnValidate()
            begin
                if PerformanceIndicator.Get("Outcome Perfomance Indicator") then begin
                    "Unit of Measure" := PerformanceIndicator."Unit of Measure";
                end;
            end;
        }
        field(20; "Unit of Measure"; Code[100])
        {
            TableRelation = "Unit of Measure";
        }
        field(21; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(22; "KPI Type"; Option)
        {
            OptionCaption = 'Lagging,Leading,Not Applicable';
            OptionMembers = Lagging,Leading,"Not Applicable";
        }
        field(23; "Imported Annual Target Qty"; Decimal)
        {
        }
        field(24; "Q1 Target Qty"; Decimal)
        {
        }
        field(25; "Q1 Self-Review Qty"; Decimal)
        {
        }
        field(26; "Q1 ManagerReview Qty"; Decimal)
        {
        }
        field(27; "Q1 Actual Qty"; Decimal)
        {
        }
        field(28; "Q2 Target Qty"; Decimal)
        {
        }
        field(29; "Q2 Self-Review Qty"; Decimal)
        {
        }
        field(30; "Q2 ManagerReview Qty"; Decimal)
        {
        }
        field(31; "Q2 Actual Qty"; Decimal)
        {
        }
        field(32; "Q3 Target Qty"; Decimal)
        {
        }
        field(33; "Q3 Self-Review Qty"; Decimal)
        {
        }
        field(34; "Q3 ManagerReview Qty"; Decimal)
        {
        }
        field(35; "Q3 Actual Qty"; Decimal)
        {
        }
        field(36; "Q4 Target Qty"; Decimal)
        {
        }
        field(37; "Q4 Self-Review Qty"; Decimal)
        {
        }
        field(38; "Q4 ManagerReview Qty"; Decimal)
        {
        }
        field(39; "Q4 Actual Qty"; Decimal)
        {
        }
        field(40; "Global Dimension 1 Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(41; "Global Dimension 2 Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(42; "Planning Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(43; "Goal Template ID"; Code[50])
        {
            TableRelation = "Goal Template";
        }
        field(44; "Individual Achieved Targets"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Year Reporting Code" = field("Year Reporting Code"),
                                                                            "Performance Contract ID" = field("Workplan No."),
                                                                            "Activity ID" = field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(45; "Functional Achieved Targets"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Year Reporting Code" = field("Year Reporting Code"),
                                                                            "Functional PC ID" = field("Workplan No."),
                                                                            "Activity ID" = field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(46; "CEO Achieved Targets"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Year Reporting Code" = field("Year Reporting Code"),
                                                                            "CEO PC ID" = field("Workplan No."),
                                                                            "Activity ID" = field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(47; "Board Achieved Targets"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Year Reporting Code" = field("Year Reporting Code"),
                                                                            "Board PC ID" = field("Workplan No."),
                                                                            "Activity ID" = field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(48; "AnnualWorkplan Achieved Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Year Reporting Code" = field("Year Reporting Code"),
                                                                            "Annual Workplan" = field("Workplan No."),
                                                                            "Activity ID" = field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(49; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(50; "Assigned Weight (%)"; Decimal)
        {
        }
        field(51; "Plog Achieved Targets"; Decimal)
        {
            CalcFormula = sum("Plog Lines"."Achieved Target" where("Personal Scorecard ID" = field("Workplan No."),
                                                                    "Initiative No." = field("Initiative No."),
                                                                    "Achieved Date" = field("Date filter")));
            FieldClass = FlowField;
        }
        field(52; "Date filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(53; "Framework Perspective"; Code[255])
        {
            TableRelation = "Strategy Framework Perspective".Code where("Strategy Framework" = field("Strategy Framework"));
        }
        field(54; "Strategy Framework"; Code[10])
        {
            TableRelation = "Strategy Framework";
        }
        field(55; "Previous Annual Target Qty"; Decimal)
        {
        }
        field(56; "Additional Comments"; Text[250])
        {
        }
        field(57; "Activity Type"; Option)
        {
            OptionMembers = " ",Board,CSP;
        }
        field(58; "Directors Achieved Targets"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Year Reporting Code" = field("Year Reporting Code"),
                                                                            "Directors PC ID" = field("Workplan No."),
                                                                            "Activity ID" = field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(59; "Department Achieved Target"; Decimal)
        {
            CalcFormula = sum("Strategy Sub_Activity Entry".Quantity where("Strategic Plan ID" = field("Strategy Plan ID"),
                                                                            "Year Reporting Code" = field("Year Reporting Code"),
                                                                            "Department/Center PC ID" = field("Workplan No."),
                                                                            "Activity ID" = field("Initiative No.")));
            FieldClass = FlowField;
        }
        field(60; Selected; Boolean)
        {
        }
        field(61; "Primary Directorate Name"; Text[250])
        {
        }
        field(62; "Primary Department Name"; Text[250])
        {
        }
        field(63; "Court Stations"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Court Stations"));
        }
        field(64; Office; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Office));
        }
        field(65; Department; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(66; "PC No."; Code[30])
        {

        }
        field(67; "Combined Key"; Code[100])
        {
        }
        field(68; "Evaluated Targets"; Decimal)
        {

        }

    }

    keys
    {
        key(Key1; "Workplan No.", "Initiative No.", "Goal Template ID", "Strategy Plan ID", "PC No.", EntryNo, "Initiative Type", "Objective/Initiative", "Combined Key", "Goal ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerformanceIndicator: Record "Performance Indicator";
        StrategicInitiative: Record "Strategic Initiative";
        BoardActivities: Record "Board Activities";
        RC: Record "Responsibility Center";
}

